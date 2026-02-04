package tn.cnss.cooperation.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.dto.DossierATCTRequest;
import tn.cnss.cooperation.dto.DossierATCTResponse;
import tn.cnss.cooperation.entity.DossierATCT;
import tn.cnss.cooperation.repository.DossierATCTRepository;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class DossierATCTService {

    private final DossierATCTRepository repository;
    private final EmailNotificationService emailService;

    private static final String CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    public List<DossierATCTResponse> findAll() {
        return repository.findByActifTrueOrderByDateCreationDesc()
                .stream()
                .map(DossierATCTResponse::fromEntity)
                .collect(Collectors.toList());
    }

    public DossierATCTResponse findById(Long id) {
        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));
        return DossierATCTResponse.fromEntity(dossier);
    }

    public List<DossierATCTResponse> findByStatut(String statut) {
        return repository.findByStatutAndActifTrueOrderByDateCreationDesc(statut)
                .stream()
                .map(DossierATCTResponse::fromEntity)
                .collect(Collectors.toList());
    }

    public List<DossierATCTResponse> findEnAttente() {
        return repository.findDossiersEnAttente()
                .stream()
                .map(DossierATCTResponse::fromEntity)
                .collect(Collectors.toList());
    }

    public List<DossierATCTResponse> findPourAffiliation() {
        return repository.findDossiersPourAffiliation()
                .stream()
                .map(DossierATCTResponse::fromEntity)
                .collect(Collectors.toList());
    }

    public List<DossierATCTResponse> search(String query) {
        return repository.searchDossiers(query)
                .stream()
                .map(DossierATCTResponse::fromEntity)
                .collect(Collectors.toList());
    }

    public DossierATCTResponse create(DossierATCTRequest request, Long agentId) {
        log.info("Création dossier ATCT par agent: {}", agentId);

        DossierATCT dossier = new DossierATCT();
        mapRequestToEntity(request, dossier);
        dossier.setCreePar(agentId);
        dossier.setStatut("EN_ATTENTE");

        DossierATCT saved = repository.save(dossier);
        log.info("Dossier ATCT créé avec ID: {}", saved.getId());

        return DossierATCTResponse.fromEntity(saved);
    }

    public DossierATCTResponse update(Long id, DossierATCTRequest request, Long agentId) {
        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));

        mapRequestToEntity(request, dossier);
        dossier.setModifiePar(agentId);

        DossierATCT saved = repository.save(dossier);
        return DossierATCTResponse.fromEntity(saved);
    }

    public DossierATCTResponse valider(Long id, Long agentId) {
        log.info("Validation dossier ATCT {} par agent {}", id, agentId);

        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));

        if (!"EN_ATTENTE".equals(dossier.getStatut())) {
            throw new RuntimeException("Le dossier n'est pas en attente de validation");
        }

        dossier.setStatut("VALIDE");
        dossier.setDateValidation(LocalDateTime.now());
        dossier.setValidePar(agentId);

        // Générer mot de passe temporaire et créer compte
        String tempPassword = generateTempPassword();
        dossier.setMotDePasseTemp(tempPassword);
        dossier.setCompteCree(true);

        DossierATCT saved = repository.save(dossier);

        // Envoyer email avec identifiants
        sendInscriptionEmail(saved, tempPassword);

        log.info("Dossier ATCT {} validé, email envoyé à {}", id, dossier.getEmail());

        return DossierATCTResponse.fromEntity(saved);
    }

    public DossierATCTResponse rejeter(Long id, Long agentId, String motif) {
        log.info("Rejet dossier ATCT {} par agent {} - Motif: {}", id, agentId, motif);

        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));

        dossier.setStatut("REJETE");
        dossier.setDateValidation(LocalDateTime.now());
        dossier.setValidePar(agentId);
        dossier.setMotifRejet(motif);

        DossierATCT saved = repository.save(dossier);

        // Envoyer email de rejet
        sendRejetEmail(saved, motif);

        return DossierATCTResponse.fromEntity(saved);
    }

    public DossierATCTResponse marquerDocumentsDeposes(Long id) {
        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));

        dossier.setDocumentsDeposes(true);
        dossier.setDateDepotDocuments(LocalDateTime.now());

        DossierATCT saved = repository.save(dossier);
        log.info("Documents déposés pour dossier ATCT {}", id);

        return DossierATCTResponse.fromEntity(saved);
    }

    public DossierATCTResponse lierAffiliation(Long id, Long affiliationId, String numAffiliation) {
        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));

        dossier.setAffiliationId(affiliationId);
        dossier.setNumAffiliation(numAffiliation);
        dossier.setStatut("AFFILIE");

        DossierATCT saved = repository.save(dossier);
        log.info("Dossier ATCT {} lié à affiliation {}", id, numAffiliation);

        // Envoyer email de confirmation affiliation
        sendAffiliationEmail(saved);

        return DossierATCTResponse.fromEntity(saved);
    }

    public void delete(Long id) {
        DossierATCT dossier = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));
        dossier.setActif(false);
        repository.save(dossier);
        log.info("Dossier ATCT {} désactivé", id);
    }

    public Map<String, Long> getStatistiques() {
        Map<String, Long> stats = new HashMap<>();

        List<Object[]> statsByStatut = repository.getStatsByStatut();
        for (Object[] row : statsByStatut) {
            stats.put("statut_" + row[0], (Long) row[1]);
        }

        List<Object[]> statsByRegime = repository.getStatsByRegime();
        for (Object[] row : statsByRegime) {
            stats.put("regime_" + row[0], (Long) row[1]);
        }

        stats.put("total", repository.count());
        stats.put("en_attente", repository.countByStatut("EN_ATTENTE"));
        stats.put("valides", repository.countByStatut("VALIDE"));
        stats.put("rejetes", repository.countByStatut("REJETE"));

        return stats;
    }

    // === Méthodes privées ===

    private void mapRequestToEntity(DossierATCTRequest request, DossierATCT entity) {
        entity.setNumSecuSociale(request.getNumSecuSociale());
        entity.setNomFr(request.getNomFr());
        entity.setPrenomFr(request.getPrenomFr());
        entity.setNomAr(request.getNomAr());
        entity.setPrenomAr(request.getPrenomAr());
        entity.setDateNaissance(request.getDateNaissance());
        entity.setLieuNaissanceFr(request.getLieuNaissanceFr());
        entity.setSexe(request.getSexe());
        entity.setNationalite(request.getNationalite());
        entity.setNumCin(request.getNumCin());
        entity.setNumPasseport(request.getNumPasseport());

        entity.setAdresseTunisie(request.getAdresseTunisie());
        entity.setCodePostalTunisie(request.getCodePostalTunisie());
        entity.setVilleTunisie(request.getVilleTunisie());

        entity.setAdresseEtranger(request.getAdresseEtranger());
        entity.setCodePostalEtranger(request.getCodePostalEtranger());
        entity.setVilleEtranger(request.getVilleEtranger());
        entity.setPaysEtranger(request.getPaysEtranger());
        entity.setPaysCode(request.getPaysCode());

        entity.setTelephone(request.getTelephone());
        entity.setEmail(request.getEmail());

        entity.setEtablissementOrigine(request.getEtablissementOrigine());
        entity.setMatriculeEmployeur(request.getMatriculeEmployeur());
        entity.setCleEmployeur(request.getCleEmployeur());

        entity.setOrganismeEtranger(request.getOrganismeEtranger());
        entity.setMissionPoste(request.getMissionPoste());

        entity.setDateDebutDetachement(request.getDateDebutDetachement());
        entity.setDateFinDetachement(request.getDateFinDetachement());
        entity.setDateRenouvellement(request.getDateRenouvellement());

        entity.setSalaireTunisie(request.getSalaireTunisie());
        entity.setSalaireEtranger(request.getSalaireEtranger());
        entity.setDeviseEtranger(request.getDeviseEtranger());
        entity.setSalaireConvertiTnd(request.getSalaireConvertiTnd());

        entity.setModePaiement(request.getModePaiement());
        entity.setPaiementAnticipe(request.getPaiementAnticipe());

        entity.setCodeRegime(request.getCodeRegime());

        entity.setAssuranceMaladie(request.getAssuranceMaladie());
        entity.setCapitalDeces(request.getCapitalDeces());
        entity.setDateEffetAssurance(request.getDateEffetAssurance());
    }

    private String generateTempPassword() {
        StringBuilder sb = new StringBuilder(12);
        for (int i = 0; i < 12; i++) {
            sb.append(CHARS.charAt(RANDOM.nextInt(CHARS.length())));
        }
        return sb.toString();
    }

    private void sendInscriptionEmail(DossierATCT dossier, String tempPassword) {
        try {
            String subject = "CNSS - Confirmation d'inscription Coopération Technique";
            String body = buildInscriptionEmailBody(dossier, tempPassword);
            
            emailService.sendEmail(dossier.getEmail(), subject, body);
            
            dossier.setEmailEnvoye(true);
            dossier.setDateEnvoiEmail(LocalDateTime.now());
            repository.save(dossier);
            
            log.info("Email d'inscription envoyé à {}", dossier.getEmail());
        } catch (Exception e) {
            log.error("Erreur envoi email inscription: {}", e.getMessage());
        }
    }

    private void sendRejetEmail(DossierATCT dossier, String motif) {
        try {
            String subject = "CNSS - Dossier Coopération Technique - Rejet";
            String body = String.format(
                "Madame/Monsieur %s,\n\n" +
                "Nous avons le regret de vous informer que votre dossier de coopération technique a été rejeté.\n\n" +
                "Motif du rejet: %s\n\n" +
                "Pour plus d'informations, veuillez contacter votre bureau régional CNSS.\n\n" +
                "Cordialement,\n" +
                "CNSS - Caisse Nationale de Sécurité Sociale",
                dossier.getNomCompletFr(), motif
            );
            
            emailService.sendEmail(dossier.getEmail(), subject, body);
            log.info("Email de rejet envoyé à {}", dossier.getEmail());
        } catch (Exception e) {
            log.error("Erreur envoi email rejet: {}", e.getMessage());
        }
    }

    private void sendAffiliationEmail(DossierATCT dossier) {
        try {
            String subject = "CNSS - Confirmation d'affiliation Coopération Technique";
            String body = String.format(
                "Madame/Monsieur %s,\n\n" +
                "Nous avons le plaisir de vous informer que votre affiliation au régime de coopération technique a été finalisée.\n\n" +
                "Votre numéro d'affiliation: %s\n\n" +
                "Vous recevrez prochainement votre premier avis de paiement.\n\n" +
                "Cordialement,\n" +
                "CNSS - Caisse Nationale de Sécurité Sociale",
                dossier.getNomCompletFr(), dossier.getNumAffiliation()
            );
            
            emailService.sendEmail(dossier.getEmail(), subject, body);
            log.info("Email d'affiliation envoyé à {}", dossier.getEmail());
        } catch (Exception e) {
            log.error("Erreur envoi email affiliation: {}", e.getMessage());
        }
    }

    private String buildInscriptionEmailBody(DossierATCT dossier, String tempPassword) {
        return String.format(
            "Madame/Monsieur %s,\n\n" +
            "Nous avons le plaisir de vous informer que votre inscription au régime de Coopération Technique a été validée.\n\n" +
            "═══════════════════════════════════════════\n" +
            "VOS IDENTIFIANTS DE CONNEXION\n" +
            "═══════════════════════════════════════════\n" +
            "Email: %s\n" +
            "Mot de passe temporaire: %s\n\n" +
            "═══════════════════════════════════════════\n\n" +
            "Connectez-vous sur: https://cnss.tn/cooperant/login\n\n" +
            "IMPORTANT: Vous devrez changer votre mot de passe lors de votre première connexion.\n\n" +
            "Une fois connecté, vous pourrez:\n" +
            "- Déposer vos documents pour finaliser votre inscription CNSS\n" +
            "- Consulter vos avis de paiement\n" +
            "- Suivre vos cotisations\n" +
            "- Effectuer vos demandes en ligne\n\n" +
            "Pour toute question, contactez votre bureau régional CNSS.\n\n" +
            "Cordialement,\n" +
            "CNSS - Caisse Nationale de Sécurité Sociale\n" +
            "═══════════════════════════════════════════",
            dossier.getNomCompletFr(),
            dossier.getEmail(),
            tempPassword
        );
    }
}
