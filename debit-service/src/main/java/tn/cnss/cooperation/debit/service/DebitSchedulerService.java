package tn.cnss.cooperation.debit.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tn.cnss.cooperation.debit.entity.Debit;
import tn.cnss.cooperation.debit.repository.DebitRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class DebitSchedulerService {

    private final DebitRepository debitRepository;
    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${employer.service.url:http://employer-service:8081}")
    private String employerServiceUrl;

    @Value("${notification.service.url:http://notification-service:8087}")
    private String notificationServiceUrl;

    // ========== SCHEDULER: Auto génération trimestrielle ==========
    // 1er jour de chaque trimestre à 00:01 (01/01, 01/04, 01/07, 01/10)
    @Scheduled(cron = "0 1 0 1 1,4,7,10 ?")
    public void autoGenerateQuarterlyDebits() {
        int quarter = getCurrentQuarter();
        int year = LocalDate.now().getYear();
        log.info("===== AUTO GÉNÉRATION DÉBITS T{}/{} =====", quarter, year);
        generateAllDebits(quarter, year);
    }

    // ========== SCHEDULER: Rappel 2T impayés (15 de chaque mois) ==========
    @Scheduled(cron = "0 0 8 15 * ?")
    public void sendUnpaidReminders() {
        log.info("===== ENVOI RAPPELS IMPAYÉS =====");
        List<Debit> unpaid = debitRepository.findUnpaidWithoutReminder();
        int sent = 0;
        for (Debit d : unpaid) {
            if (d.getDateDepot() != null && d.getDateDepot().plusMonths(6).isBefore(LocalDate.now())) {
                sendReminderEmail(d);
                d.setRappelEnvoye(true);
                debitRepository.save(d);
                sent++;
            }
        }
        log.info("{} rappels envoyés sur {} impayés", sent, unpaid.size());
    }

    // ========== SCHEDULER: Mailing semestriel (1er jan + 1er jul) ==========
    @Scheduled(cron = "0 0 9 1 1,7 ?")
    public void sendSemiAnnualMailing() {
        log.info("===== MAILING SEMESTRIEL =====");
        List<Debit> allUnpaid = debitRepository.findByPaye(false);
        Map<Long, List<Debit>> byCooperant = new HashMap<>();
        for (Debit d : allUnpaid) {
            if (d.getCooperantId() != null) {
                byCooperant.computeIfAbsent(d.getCooperantId(), k -> new ArrayList<>()).add(d);
            }
        }
        int sent = 0;
        for (List<Debit> debits : byCooperant.values()) {
            if (!debits.isEmpty() && debits.get(0).getEmail() != null) {
                sendRecapEmail(debits);
                sent++;
            }
        }
        log.info("{} mailings semestriels envoyés", sent);
    }

    // ========== Méthode publique pour trigger manuel ==========
    @Transactional
    public Map<String, Object> generateAllDebits(int trimestre, int annee) {
        List<Map<String, Object>> cooperants = fetchActiveCooperants();
        log.info("{} coopérants actifs trouvés", cooperants.size());

        int generated = 0, skipped = 0, errors = 0;
        List<Long> generatedIds = new ArrayList<>();

        for (Map<String, Object> coop : cooperants) {
            try {
                Debit debit = generateDebitForCooperant(coop, trimestre, annee);
                if (debit != null) {
                    generated++;
                    generatedIds.add(debit.getId());
                } else {
                    skipped++;
                }
            } catch (Exception e) {
                errors++;
                log.error("Erreur pour coopérant {}: {}", coop.get("id"), e.getMessage());
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("trimestre", "T" + trimestre + "-" + annee);
        result.put("generated", generated);
        result.put("skipped", skipped);
        result.put("errors", errors);
        result.put("generatedIds", generatedIds);
        log.info("Résultat: {} créés, {} ignorés, {} erreurs", generated, skipped, errors);
        return result;
    }

    @Transactional
    public Debit generateDebitForCooperant(Map<String, Object> coop, int trimestre, int annee) {
        Long cooperantId = toLong(coop.get("id"));
        String numAff = str(coop.get("numAffiliation"));
        String cleAff = str(coop.get("cleAffiliation"));

        // 1. Vérifier affilié
        if (numAff.isEmpty()) {
            return null;
        }

        String fullAff = cleAff + "-" + numAff;
        String trimestreStr = "T" + trimestre + "-" + annee;

        // 2. Doublon?
        if (debitRepository.existsByCooperantIdAndTrimestre(cooperantId, trimestreStr)) {
            log.debug("Débit déjà existant pour {} T{}-{}", cooperantId, trimestre, annee);
            return null;
        }

        // 3. Retour 1 an: vérifier date d'affiliation
        String dateEffetStr = str(coop.get("dateEffetAffiliation"));
        if (!dateEffetStr.isEmpty()) {
            try {
                LocalDate dateEffet = LocalDate.parse(dateEffetStr);
                if (dateEffet.plusYears(1).isBefore(LocalDate.now())) {
                    log.debug("Coopérant {} hors période 1 an, ignoré", cooperantId);
                    return null;
                }
            } catch (Exception ignored) {}
        }

        // 4. Calculer montant
        BigDecimal salaire = toBigDecimal(coop.get("salaire"));
        BigDecimal taux = new BigDecimal("0.2575");
        BigDecimal montant = salaire.multiply(taux).setScale(3, RoundingMode.HALF_UP);

        String nom = str(coop.get("nomCompletFr"));
        if (nom.isEmpty()) {
            nom = str(coop.get("prenomFr")) + " " + str(coop.get("nomFr"));
        }

        // 5. Créer le débit
        Debit debit = new Debit();
        debit.setCooperantId(cooperantId);
        debit.setNumAffiliation(fullAff);
        debit.setNomCooperant(nom.trim());
        debit.setMatricule(str(coop.get("matriculeComplet")));
        debit.setAdresse(str(coop.get("adresseFr")));
        debit.setEmail(str(coop.get("email")));
        debit.setTrimestre(trimestreStr);
        debit.setAnnee(annee);
        debit.setSalaire(salaire);
        debit.setMontantCotisation(montant);
        debit.setDateEffet(dateEffetStr.isEmpty() ? LocalDate.now() : LocalDate.parse(dateEffetStr));
        debit.setPaye(false);
        debit.setAutoGenerated(true);
        debit.setDateDepot(LocalDate.now());
        debit.setDateLimite(LocalDate.now().plusMonths(1).withDayOfMonth(15));
        debit.setRappelEnvoye(false);
        debit.setCreatedAt(LocalDateTime.now());

        debit = debitRepository.save(debit);
        log.info("Débit auto créé ID={} pour {} - {}", debit.getId(), fullAff, trimestreStr);

        // 6. Envoyer mailing avis de paiement
        if (!debit.getEmail().isEmpty()) {
            sendDebitNotificationEmail(debit);
        }

        return debit;
    }

    /**
     * Mode "Toutes": Génère les débits pour tous les trimestres impayés d'un coopérant
     * Retour 1 an à partir de la date de dépôt (dateEffetAffiliation)
     */
    @Transactional
    public Map<String, Object> generateAllUnpaidForCooperant(Map<String, Object> cooperantData) {
        Long cooperantId = toLong(cooperantData.get("cooperantId"));
        String dateDepotStr = str(cooperantData.get("dateDebut"));
        BigDecimal salaire = toBigDecimal(cooperantData.get("salaire"));
        String numAffiliation = str(cooperantData.get("numAffiliation"));
        String nomCooperant = str(cooperantData.get("nomCooperant"));
        String matricule = str(cooperantData.get("matricule"));
        String adresse = str(cooperantData.get("adresse"));
        String email = str(cooperantData.get("email"));
        String cotisationsJson = str(cooperantData.get("cotisationsJson"));
        BigDecimal montantCotisation = toBigDecimal(cooperantData.get("montantCotisation"));

        // Déterminer la période: exactement 4 trimestres à partir de la date de dépôt
        LocalDate dateDepot;
        try {
            dateDepot = LocalDate.parse(dateDepotStr);
        } catch (Exception e) {
            dateDepot = LocalDate.now();
        }

        // Calculer le trimestre de départ
        int startQuarter = (dateDepot.getMonthValue() - 1) / 3 + 1;
        int startYear = dateDepot.getYear();

        int generated = 0;
        int skipped = 0;
        List<Long> generatedIds = new ArrayList<>();
        List<String> generatedTrimestres = new ArrayList<>();

        // Générer exactement 4 trimestres (1 an = 4 trimestres)
        int currentQ = startQuarter;
        int currentY = startYear;
        for (int i = 0; i < 4; i++) {
            String trimestreStr = "T" + currentQ + "-" + currentY;

            // Vérifier doublon
            if (!debitRepository.existsByCooperantIdAndTrimestre(cooperantId, trimestreStr)) {
                Debit debit = new Debit();
                debit.setCooperantId(cooperantId);
                debit.setNumAffiliation(numAffiliation);
                debit.setNomCooperant(nomCooperant);
                debit.setMatricule(matricule);
                debit.setAdresse(adresse);
                debit.setEmail(email);
                debit.setTrimestre(trimestreStr);
                debit.setAnnee(currentY);
                debit.setSalaire(salaire);
                debit.setMontantCotisation(montantCotisation.compareTo(BigDecimal.ZERO) > 0 ? montantCotisation :
                        salaire.multiply(new BigDecimal("0.2575")).setScale(3, RoundingMode.HALF_UP));
                debit.setDateEffet(dateDepot);
                debit.setPaye(false);
                debit.setAutoGenerated(false);
                debit.setDateDepot(LocalDate.now());
                debit.setDateLimite(LocalDate.now().plusMonths(1).withDayOfMonth(15));
                debit.setRappelEnvoye(false);
                debit.setCotisationsJson(cotisationsJson.isEmpty() ? null : cotisationsJson);
                debit.setCreatedAt(LocalDateTime.now());

                debit = debitRepository.save(debit);
                generated++;
                generatedIds.add(debit.getId());
                generatedTrimestres.add(trimestreStr);
                log.info("Débit créé {} pour {} - {}", debit.getId(), numAffiliation, trimestreStr);
            } else {
                skipped++;
            }

            // Avancer au trimestre suivant
            currentQ++;
            if (currentQ > 4) {
                currentQ = 1;
                currentY++;
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("generated", generated);
        result.put("skipped", skipped);
        result.put("generatedIds", generatedIds);
        result.put("trimestres", generatedTrimestres);
        return result;
    }

    // ========== Helpers ==========

    @SuppressWarnings("unchecked")
    private List<Map<String, Object>> fetchActiveCooperants() {
        try {
            @SuppressWarnings("rawtypes")
            ResponseEntity<List> response = restTemplate.getForEntity(
                    employerServiceUrl + "/api/cooperants", List.class);
            List<Map<String, Object>> all = response.getBody();
            if (all == null) return Collections.emptyList();
            // Filtrer: actif + affilié
            List<Map<String, Object>> result = new ArrayList<>();
            for (Map<String, Object> c : all) {
                Boolean actif = (Boolean) c.get("actif");
                String numAff = str(c.get("numAffiliation"));
                if (Boolean.TRUE.equals(actif) && !numAff.isEmpty()) {
                    result.add(c);
                }
            }
            return result;
        } catch (Exception e) {
            log.error("Erreur fetch coopérants: {}", e.getMessage());
            return Collections.emptyList();
        }
    }

    private void sendDebitEmailWithPdf(Debit debit, int trimestre, int annee) {
        try {
            Map<String, Object> emailRequest = new HashMap<>();
            emailRequest.put("to", debit.getEmail());
            emailRequest.put("subject", "CNSS - Avis de Débit T" + trimestre + "/" + annee);
            emailRequest.put("numAffiliation", debit.getNumAffiliation());
            emailRequest.put("matricule", debit.getMatricule() != null ? debit.getMatricule() : "");
            emailRequest.put("nomCooperant", debit.getNomCooperant() != null ? debit.getNomCooperant() : "");
            emailRequest.put("adresse", debit.getAdresse() != null ? debit.getAdresse() : "");
            emailRequest.put("trimestre", trimestre);
            emailRequest.put("annee", annee);
            emailRequest.put("salaire", debit.getSalaire() != null ? debit.getSalaire().doubleValue() : 0.0);
            emailRequest.put("montantTotal", debit.getMontantCotisation() != null ? debit.getMontantCotisation().doubleValue() : 0.0);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            restTemplate.postForEntity(
                    notificationServiceUrl + "/notification/debit-email",
                    new HttpEntity<>(emailRequest, headers), String.class);
            log.info("Email PDF avis envoyé à {} pour T{}-{}", debit.getEmail(), trimestre, annee);
        } catch (Exception e) {
            log.warn("Erreur email PDF pour {} T{}-{}: {}", debit.getEmail(), trimestre, annee, e.getMessage());
        }
    }

    private void sendDebitNotificationEmail(Debit debit) {
        try {
            Map<String, Object> email = new HashMap<>();
            email.put("to", debit.getEmail());
            email.put("subject", "CNSS - Avis de Débit " + debit.getTrimestre());
            email.put("content", buildDebitEmailHtml(debit));

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            restTemplate.postForEntity(
                    notificationServiceUrl + "/notification/email",
                    new HttpEntity<>(email, headers), String.class);
            log.info("Email avis envoyé à {}", debit.getEmail());
        } catch (Exception e) {
            log.warn("Erreur email avis pour {}: {}", debit.getEmail(), e.getMessage());
        }
    }

    private void sendReminderEmail(Debit debit) {
        try {
            Map<String, Object> email = new HashMap<>();
            email.put("to", debit.getEmail());
            email.put("subject", "CNSS - RAPPEL Débit Impayé " + debit.getTrimestre());
            email.put("content", String.format(
                "<html dir='rtl'><body style='font-family:Arial;'>" +
                "<h2 style='color:#8B0000;'>تذكير بدفع المساهمات</h2>" +
                "<p>السيد(ة) <strong>%s</strong>,</p>" +
                "<p>نذكركم بأن مبلغ <strong>%.3f د.ت</strong> للفترة %s لا يزال غير مسدد.</p>" +
                "<p>يرجى تسديد المبلغ في أقرب وقت.</p>" +
                "<hr><p>الصندوق الوطني للضمان الاجتماعي</p></body></html>",
                debit.getNomCooperant(), debit.getMontantCotisation(), debit.getTrimestre()));

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            restTemplate.postForEntity(
                    notificationServiceUrl + "/notification/email",
                    new HttpEntity<>(email, headers), String.class);
        } catch (Exception e) {
            log.warn("Erreur rappel pour {}: {}", debit.getEmail(), e.getMessage());
        }
    }

    private void sendRecapEmail(List<Debit> debits) {
        Debit first = debits.get(0);
        try {
            BigDecimal total = debits.stream()
                    .map(d -> d.getMontantCotisation() != null ? d.getMontantCotisation() : BigDecimal.ZERO)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            StringBuilder rows = new StringBuilder();
            for (Debit d : debits) {
                rows.append(String.format("<tr><td>%s</td><td>%.3f</td><td>%s</td></tr>",
                        d.getTrimestre(), d.getMontantCotisation(), d.getDateLimite()));
            }

            String html = String.format(
                "<html dir='rtl'><body style='font-family:Arial;'>" +
                "<h2 style='color:#8B0000;'>كشف المساهمات غير المسددة</h2>" +
                "<p>السيد(ة) <strong>%s</strong>,</p>" +
                "<p>فيما يلي كشف بالمساهمات غير المسددة:</p>" +
                "<table border='1' cellpadding='5' style='border-collapse:collapse;'>" +
                "<tr><th>الفترة</th><th>المبلغ</th><th>تاريخ الأقصى</th></tr>" +
                "%s" +
                "<tr><th>المجموع</th><th colspan='2'>%.3f د.ت</th></tr>" +
                "</table>" +
                "<hr><p>الصندوق الوطني للضمان الاجتماعي</p></body></html>",
                first.getNomCooperant(), rows.toString(), total);

            Map<String, Object> email = new HashMap<>();
            email.put("to", first.getEmail());
            email.put("subject", "CNSS - Récapitulatif débits impayés");
            email.put("content", html);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            restTemplate.postForEntity(
                    notificationServiceUrl + "/notification/email",
                    new HttpEntity<>(email, headers), String.class);
            log.info("Email récap envoyé à {}", first.getEmail());
        } catch (Exception e) {
            log.warn("Erreur recap pour {}: {}", first.getEmail(), e.getMessage());
        }
    }

    private String buildDebitEmailHtml(Debit debit) {
        BigDecimal salaire = debit.getSalaire() != null ? debit.getSalaire() : BigDecimal.ZERO;
        BigDecimal retraite = salaire.multiply(new BigDecimal("0.135")).setScale(3, RoundingMode.HALF_UP);
        BigDecimal complementaire = salaire.multiply(new BigDecimal("0.735"))
                .multiply(new BigDecimal("0.09")).setScale(3, RoundingMode.HALF_UP);

        return String.format(
            "<html dir='rtl'><body style='font-family:Arial;'>" +
            "<h2 style='color:#8B0000;'>الصندوق الوطني للضمان الاجتماعي</h2>" +
            "<h3>Caisse Nationale de Sécurité Sociale</h3><hr>" +
            "<p>السيد(ة) <strong>%s</strong>,</p>" +
            "<p><strong>رقم الإنخراط:</strong> %s</p>" +
            "<p><strong>رقم التسجيل:</strong> %s</p>" +
            "<p>إعلام بدفع المساهمات للفترة <strong>%s</strong></p>" +
            "<table border='1' cellpadding='5' style='border-collapse:collapse;width:100%%;'>" +
            "<tr><th>النظام</th><th>النسبة</th><th>قاعدة الاحتساب</th><th>المبلغ</th></tr>" +
            "<tr><td>جرايات الشيخوخة</td><td>13.5%%</td><td>%.3f</td><td>%.3f</td></tr>" +
            "<tr><td>النظام التكميلي</td><td>9%%</td><td>%.3f</td><td>%.3f</td></tr>" +
            "<tr><th colspan='3'>المجموع</th><th>%.3f</th></tr></table>" +
            "<p><strong>تاريخ الدفع الأقصى:</strong> %s</p>" +
            "<hr><p>الصندوق الوطني للضمان الاجتماعي</p></body></html>",
            debit.getNomCooperant(), debit.getNumAffiliation(), debit.getMatricule(),
            debit.getTrimestre(),
            salaire, retraite,
            salaire.multiply(new BigDecimal("0.735")).setScale(3, RoundingMode.HALF_UP), complementaire,
            debit.getMontantCotisation(),
            debit.getDateLimite());
    }

    private int getCurrentQuarter() {
        return (LocalDate.now().getMonthValue() - 1) / 3 + 1;
    }

    private Long toLong(Object o) {
        if (o == null) return 0L;
        if (o instanceof Number) return ((Number) o).longValue();
        try { return Long.parseLong(o.toString()); } catch (Exception e) { return 0L; }
    }

    private BigDecimal toBigDecimal(Object o) {
        if (o == null) return BigDecimal.ZERO;
        if (o instanceof Number) return new BigDecimal(o.toString());
        try { return new BigDecimal(o.toString()); } catch (Exception e) { return BigDecimal.ZERO; }
    }

    private String str(Object o) {
        return o != null ? o.toString() : "";
    }
}
