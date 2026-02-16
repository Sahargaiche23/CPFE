package tn.cnss.cooperation.employer.affiliation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.employer.entity.Cooperant;
import tn.cnss.cooperation.employer.repository.CooperantRepository;
import tn.cnss.cooperation.employer.atct.DossierATCTRepository;
import tn.cnss.cooperation.employer.atct.DossierATCT;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/api/affiliations")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*")
public class AffiliationController {
    
    private final CooperantRepository cooperantRepository;
    private final DossierATCTRepository dossierATCTRepository;
    
    @PostMapping("/create-from-atct")
    public ResponseEntity<Map<String, Object>> createFromATCT(@RequestBody Map<String, Object> request) {
        String email = (String) request.get("email");
        String codeRegime = (String) request.get("codeRegime");
        String adresse = (String) request.get("adresse");
        Object salaireObj = request.get("salaire");
        String dateEffetStr = (String) request.get("dateEffetAffiliation");
        String reqNumAffiliation = (String) request.get("numAffiliation");
        String reqCleAffiliation = (String) request.get("cleAffiliation");
        
        // Récupérer les vraies données du dossier ATCT
        DossierATCT dossierATCT = dossierATCTRepository.findByEmailAndActifTrue(email).orElse(null);
        
        log.info("Création affiliation pour email: {} avec régime: {}", email, codeRegime);
        
        // Chercher ou créer le coopérant
        Cooperant cooperant = cooperantRepository.findByEmail(email)
            .orElseGet(() -> {
                Cooperant newCoop = new Cooperant();
                Long nextMat = Objects.requireNonNullElse(cooperantRepository.getNextMatricule(), 1L);
                newCoop.setMatricule(nextMat);
                newCoop.setCle(calculateCle(nextMat));
                newCoop.setEmail(email);
                newCoop.setActif(true);
                newCoop.setCreatedAt(LocalDateTime.now());
                return newCoop;
            });
        
        // S'assurer que le coopérant est actif
        cooperant.setActif(true);
        
        // Mettre à jour avec les vraies données du dossier ATCT
        if (dossierATCT != null) {
            cooperant.setNomFr(dossierATCT.getNomFr());
            cooperant.setPrenomFr(dossierATCT.getPrenomFr());
            cooperant.setNomAr(dossierATCT.getNomAr());
            cooperant.setPrenomAr(dossierATCT.getPrenomAr());
            cooperant.setDateNaissance(dossierATCT.getDateNaissance());
            cooperant.setTelephone(dossierATCT.getTelephone());
            cooperant.setNumPieceIdentite(dossierATCT.getNumSecuSociale());
            if (dossierATCT.getAdresseTunisie() != null) {
                cooperant.setAdresseFr(dossierATCT.getAdresseTunisie());
            }
        }
        if (adresse != null && !adresse.isEmpty()) {
            cooperant.setAdresseFr(adresse);
        }
        
        // Mettre à jour le régime et les infos d'affiliation
        cooperant.setCodeRegime(codeRegime != null ? codeRegime : "500");
        cooperant.setStatutValidation("VALIDE");
        cooperant.setDateValidation(LocalDateTime.now());
        
        // Utiliser le numéro d'affiliation envoyé par le frontend, sinon générer
        String numAffiliation = (reqNumAffiliation != null && !reqNumAffiliation.isEmpty())
            ? reqNumAffiliation
            : String.format("%08d", cooperant.getMatricule());
        String cleAffiliation = (reqCleAffiliation != null && !reqCleAffiliation.isEmpty())
            ? reqCleAffiliation
            : (codeRegime != null ? codeRegime.substring(0, 2) : "50");
        cooperant.setNumAffiliation(numAffiliation);
        cooperant.setCleAffiliation(cleAffiliation);
        
        // Salaire
        if (salaireObj != null) {
            if (salaireObj instanceof Number) {
                cooperant.setSalaire(new BigDecimal(salaireObj.toString()));
            }
        }
        
        // Date effet
        if (dateEffetStr != null && !dateEffetStr.isEmpty()) {
            cooperant.setDateEffetAffiliation(LocalDate.parse(dateEffetStr));
        } else {
            cooperant.setDateEffetAffiliation(LocalDate.now());
        }
        
        cooperant.setUpdatedAt(LocalDateTime.now());
        
        Cooperant saved = cooperantRepository.save(cooperant);
        
        // Mettre à jour le dossier ATCT pour marquer qu'il a une affiliation
        dossierATCTRepository.findByEmailAndActifTrue(email).ifPresent(dossier -> {
            dossier.setAffiliationId(saved.getId());
            dossier.setNumAffiliation(saved.getCleAffiliation() + "-" + saved.getNumAffiliation());
            dossier.setStatut("AFFILIE");
            dossierATCTRepository.save(dossier);
            log.info("Dossier ATCT {} lié à l'affiliation {}", dossier.getId(), saved.getId());
        });
        
        log.info("Affiliation créée: {}-{} pour {}", saved.getCleAffiliation(), saved.getNumAffiliation(), email);
        
        return ResponseEntity.ok(Map.of(
            "success", true,
            "numAffiliation", saved.getCleAffiliation() + "-" + saved.getNumAffiliation(),
            "matricule", saved.getMatricule() + "-" + saved.getCle(),
            "regime", saved.getCodeRegime()
        ));
    }
    
    private Integer calculateCle(Long matricule) {
        long sum = 0;
        long temp = matricule;
        int position = 1;
        while (temp > 0) {
            long digit = temp % 10;
            sum += digit * position;
            temp /= 10;
            position++;
        }
        return (int) (sum % 97);
    }
}
