package tn.cnss.cooperation.employer.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tn.cnss.cooperation.employer.entity.Cooperant;
import tn.cnss.cooperation.employer.entity.DemandeCooperant;
import tn.cnss.cooperation.employer.repository.CooperantRepository;
import tn.cnss.cooperation.employer.repository.DemandeCooperantRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class DemandeCooperantService {

    private final DemandeCooperantRepository demandeRepository;
    private final CooperantRepository cooperantRepository;
    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${notification.service.url:http://host.docker.internal:8087}")
    private String notificationServiceUrl;

    // ===== CRUD =====

    public List<DemandeCooperant> findAll() {
        return demandeRepository.findAllOrderByCreatedAtDesc();
    }

    public DemandeCooperant findById(Long id) {
        return demandeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Demande non trouvée: " + id));
    }

    public List<DemandeCooperant> findByCooperant(Long cooperantId) {
        return demandeRepository.findByCooperantIdOrderByCreatedAtDesc(cooperantId);
    }

    public List<DemandeCooperant> findByStatut(String statut) {
        return demandeRepository.findByStatutOrderByCreatedAtDesc(statut);
    }

    public List<DemandeCooperant> findByType(String type) {
        return demandeRepository.findByTypeDemandeOrderByCreatedAtDesc(type);
    }

    public List<DemandeCooperant> findPending() {
        return demandeRepository.findByStatutOrderByCreatedAtDesc("EN_ATTENTE");
    }

    public List<DemandeCooperant> findPendingByType(String type) {
        return demandeRepository.findByStatutAndTypeDemandeOrderByCreatedAtDesc("EN_ATTENTE", type);
    }

    @Transactional
    public void delete(Long id) {
        demandeRepository.deleteById(id);
    }

    // ===== DEMANDE ACTUALISATION SALAIRE =====

    @Transactional
    public DemandeCooperant creerDemandeActualisationSalaire(Long cooperantId, BigDecimal nouveauSalaire, 
                                                              String dateEffet, String motif) {
        Cooperant cooperant = cooperantRepository.findById(cooperantId)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + cooperantId));

        DemandeCooperant demande = new DemandeCooperant();
        demande.setCooperantId(cooperantId);
        demande.setNumAffiliation(cooperant.getNumAffiliation());
        demande.setNomCooperant(cooperant.getNomCompletFr());
        demande.setMatricule(cooperant.getMatriculeComplet());
        demande.setEmail(cooperant.getEmail());
        demande.setTypeDemande("ACTUALISATION_SALAIRE");
        demande.setAncienSalaire(cooperant.getSalaire());
        demande.setNouveauSalaire(nouveauSalaire);
        demande.setMotif(motif);

        if (dateEffet != null && !dateEffet.isEmpty()) {
            demande.setDateEffetSalaire(java.time.LocalDate.parse(dateEffet));
        }

        demande = demandeRepository.save(demande);
        log.info("Demande actualisation salaire créée #{} pour coopérant {}", demande.getId(), cooperantId);
        return demande;
    }

    // ===== DEMANDE SORTIE REGIME MALADIE =====

    @Transactional
    public DemandeCooperant creerDemandeSortieRegimeMaladie(Long cooperantId, String regimeConcerne, 
                                                             String motif, BigDecimal impactCotisation) {
        Cooperant cooperant = cooperantRepository.findById(cooperantId)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + cooperantId));

        DemandeCooperant demande = new DemandeCooperant();
        demande.setCooperantId(cooperantId);
        demande.setNumAffiliation(cooperant.getNumAffiliation());
        demande.setNomCooperant(cooperant.getNomCompletFr());
        demande.setMatricule(cooperant.getMatriculeComplet());
        demande.setEmail(cooperant.getEmail());
        demande.setTypeDemande("SORTIE_REGIME_MALADIE");
        demande.setRegimeConcerne(regimeConcerne);
        demande.setMotif(motif);
        demande.setImpactCotisation(impactCotisation);

        demande = demandeRepository.save(demande);
        log.info("Demande sortie régime maladie créée #{} pour coopérant {}", demande.getId(), cooperantId);
        return demande;
    }

    // ===== DEMANDE ANNULATION ASSURANCE MALADIE + CAPITAL DECES =====

    @Transactional
    public DemandeCooperant creerDemandeAnnulationAssurance(Long cooperantId, String motif, 
                                                             BigDecimal impactCotisation) {
        Cooperant cooperant = cooperantRepository.findById(cooperantId)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + cooperantId));

        DemandeCooperant demande = new DemandeCooperant();
        demande.setCooperantId(cooperantId);
        demande.setNumAffiliation(cooperant.getNumAffiliation());
        demande.setNomCooperant(cooperant.getNomCompletFr());
        demande.setMatricule(cooperant.getMatriculeComplet());
        demande.setEmail(cooperant.getEmail());
        demande.setTypeDemande("ANNULATION_ASSURANCE");
        demande.setMotif(motif);
        demande.setImpactCotisation(impactCotisation);

        demande = demandeRepository.save(demande);
        log.info("Demande annulation assurance créée #{} pour coopérant {}", demande.getId(), cooperantId);
        return demande;
    }

    // ===== DEMANDE RACHAT LOI 105 =====

    @Transactional
    public DemandeCooperant creerDemandeRachat(Long cooperantId, Long debitId, String trimestreDebit,
                                                BigDecimal montantOriginal) {
        Cooperant cooperant = cooperantRepository.findById(cooperantId)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + cooperantId));

        BigDecimal tauxRachat = new BigDecimal("0.95");
        BigDecimal montantRachat = montantOriginal.multiply(tauxRachat).setScale(3, RoundingMode.HALF_UP);
        BigDecimal reduction = montantOriginal.subtract(montantRachat).setScale(3, RoundingMode.HALF_UP);

        DemandeCooperant demande = new DemandeCooperant();
        demande.setCooperantId(cooperantId);
        demande.setNumAffiliation(cooperant.getNumAffiliation());
        demande.setNomCooperant(cooperant.getNomCompletFr());
        demande.setMatricule(cooperant.getMatriculeComplet());
        demande.setEmail(cooperant.getEmail());
        demande.setTypeDemande("RACHAT_LOI105");
        demande.setDebitId(debitId);
        demande.setTrimestreDebit(trimestreDebit);
        demande.setMontantOriginal(montantOriginal);
        demande.setTauxRachat(new BigDecimal("95.00"));
        demande.setMontantRachat(montantRachat);
        demande.setReduction(reduction);

        demande = demandeRepository.save(demande);
        log.info("Demande rachat Loi 105 créée #{} pour coopérant {} - débit {} - montant rachat {}", 
                demande.getId(), cooperantId, debitId, montantRachat);
        return demande;
    }

    // ===== VALIDATION / REJET =====

    @Transactional
    public DemandeCooperant valider(Long demandeId, Long agentId, String commentaire) {
        DemandeCooperant demande = findById(demandeId);
        demande.setStatut("VALIDEE");
        demande.setValidePar(agentId);
        demande.setDateValidation(LocalDateTime.now());
        demande.setCommentaire(commentaire);
        demande = demandeRepository.save(demande);

        // Appliquer les effets selon le type
        appliquerEffetsValidation(demande);

        // Notification email
        sendNotificationEmail(demande, "validée");

        log.info("Demande #{} validée par agent {}", demandeId, agentId);
        return demande;
    }

    @Transactional
    public DemandeCooperant rejeter(Long demandeId, Long agentId, String motifRejet) {
        DemandeCooperant demande = findById(demandeId);
        demande.setStatut("REJETEE");
        demande.setValidePar(agentId);
        demande.setDateValidation(LocalDateTime.now());
        demande.setMotifRejet(motifRejet);
        demande = demandeRepository.save(demande);

        sendNotificationEmail(demande, "rejetée");

        log.info("Demande #{} rejetée par agent {}", demandeId, agentId);
        return demande;
    }

    // ===== APPLIQUER EFFETS VALIDATION =====

    private void appliquerEffetsValidation(DemandeCooperant demande) {
        switch (demande.getTypeDemande()) {
            case "ACTUALISATION_SALAIRE" -> {
                // Mettre à jour le salaire du coopérant
                Cooperant cooperant = cooperantRepository.findById(demande.getCooperantId()).orElse(null);
                if (cooperant != null && demande.getNouveauSalaire() != null) {
                    cooperant.setSalaire(demande.getNouveauSalaire());
                    cooperantRepository.save(cooperant);
                    log.info("Salaire coopérant {} mis à jour: {} -> {}", 
                            cooperant.getId(), demande.getAncienSalaire(), demande.getNouveauSalaire());
                }
            }
            case "SORTIE_REGIME_MALADIE", "ANNULATION_ASSURANCE" -> {
                log.info("Demande {} validée - impact cotisation: {}", 
                        demande.getTypeDemande(), demande.getImpactCotisation());
            }
            case "RACHAT_LOI105" -> {
                log.info("Rachat Loi 105 validé - débit {} - montant rachat: {} (réduction: {})", 
                        demande.getDebitId(), demande.getMontantRachat(), demande.getReduction());
            }
            default -> log.warn("Type demande inconnu: {}", demande.getTypeDemande());
        }
    }

    // ===== NOTIFICATION EMAIL =====

    private void sendNotificationEmail(DemandeCooperant demande, String action) {
        if (demande.getEmail() == null || demande.getEmail().isEmpty()) return;
        try {
            String typeLabel = switch (demande.getTypeDemande()) {
                case "ACTUALISATION_SALAIRE" -> "Actualisation Salaire";
                case "SORTIE_REGIME_MALADIE" -> "Sortie Régime Maladie";
                case "ANNULATION_ASSURANCE" -> "Annulation Assurance Maladie & Capital Décès";
                case "RACHAT_LOI105" -> "Rachat Loi 105";
                default -> demande.getTypeDemande();
            };

            Map<String, String> emailReq = new HashMap<>();
            emailReq.put("to", demande.getEmail());
            emailReq.put("subject", "CNSS - Demande " + typeLabel + " " + action);
            emailReq.put("content", String.format(
                "Bonjour %s,\n\nVotre demande de %s (N° %d) a été %s.\n\n%s\n\nCordialement,\nCNSS - Caisse Nationale de Sécurité Sociale",
                demande.getNomCooperant(), typeLabel, demande.getId(), action,
                "REJETEE".equals(demande.getStatut()) && demande.getMotifRejet() != null 
                    ? "Motif: " + demande.getMotifRejet() : ""
            ));

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            restTemplate.postForEntity(notificationServiceUrl + "/notification/email",
                    new HttpEntity<>(emailReq, headers), String.class);
            log.info("Email notification demande #{} envoyé à {}", demande.getId(), demande.getEmail());
        } catch (Exception e) {
            log.warn("Erreur envoi email demande #{}: {}", demande.getId(), e.getMessage());
        }
    }

    // ===== STATISTIQUES =====

    public Map<String, Object> getStats() {
        List<DemandeCooperant> all = demandeRepository.findAll();
        long total = all.size();
        long enAttente = all.stream().filter(d -> "EN_ATTENTE".equals(d.getStatut())).count();
        long validees = all.stream().filter(d -> "VALIDEE".equals(d.getStatut())).count();
        long rejetees = all.stream().filter(d -> "REJETEE".equals(d.getStatut())).count();

        Map<String, Long> parType = new HashMap<>();
        parType.put("ACTUALISATION_SALAIRE", all.stream().filter(d -> "ACTUALISATION_SALAIRE".equals(d.getTypeDemande())).count());
        parType.put("SORTIE_REGIME_MALADIE", all.stream().filter(d -> "SORTIE_REGIME_MALADIE".equals(d.getTypeDemande())).count());
        parType.put("ANNULATION_ASSURANCE", all.stream().filter(d -> "ANNULATION_ASSURANCE".equals(d.getTypeDemande())).count());
        parType.put("RACHAT_LOI105", all.stream().filter(d -> "RACHAT_LOI105".equals(d.getTypeDemande())).count());

        Map<String, Object> stats = new HashMap<>();
        stats.put("total", total);
        stats.put("enAttente", enAttente);
        stats.put("validees", validees);
        stats.put("rejetees", rejetees);
        stats.put("parType", parType);
        return stats;
    }
}
