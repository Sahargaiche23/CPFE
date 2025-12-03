package tn.cnss.cooperation.employer.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.employer.dto.CreateDossierRequest;
import tn.cnss.cooperation.employer.dto.DossierResponse;
import tn.cnss.cooperation.employer.entity.DossierCoop;
import tn.cnss.cooperation.employer.repository.DossierCoopRepository;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployerService {
    
    private final DossierCoopRepository dossierCoopRepository;
    
    /**
     * Créer un nouveau dossier de coopération technique
     * Étape 1 du cahier des charges:
     * - Attribution numéro employeur régime 500 ou 510
     * - Date effet max 1 an avant date dépôt CNSS
     * - Génération périodes antérieures avec taux rachat automatique
     */
    @Transactional
    public DossierResponse createDossier(CreateDossierRequest request) {
        log.info("Création dossier pour matricule: {}, régime: {}", 
                request.getMatricule(), request.getRegime());
        
        // Validation: date effet max 1 an avant date dépôt
        validateDateEffet(request.getDateEffet(), request.getDateDepotCnss());
        
        // Vérifier si dossier existe déjà
        if (dossierCoopRepository.existsByMatriculeAndRegimeAndDateEffet(
                request.getMatricule(), request.getRegime(), request.getDateEffet())) {
            throw new RuntimeException("Un dossier existe déjà pour ce matricule, régime et date effet");
        }
        
        // Créer le dossier
        DossierCoop dossier = new DossierCoop();
        dossier.setMatricule(request.getMatricule());
        dossier.setCle(request.getCle());
        dossier.setRegime(request.getRegime());
        dossier.setDateEffet(request.getDateEffet());
        dossier.setDateDepotCnss(request.getDateDepotCnss());
        dossier.setDateNaissance(request.getDateNaissance());
        dossier.setNomPrenom(request.getNomPrenom());
        dossier.setPaysDetachement(request.getPaysDetachement());
        dossier.setPeriodeDebut(request.getPeriodeDebut());
        dossier.setPeriodeFin(request.getPeriodeFin());
        dossier.setMatriculeEntreprise(request.getMatriculeEntreprise());
        
        // Générer numéro affiliation (format: REGIME + MATRICULE + CLE)
        String numAffiliation = generateNumAffiliation(request.getRegime(), 
                request.getMatricule(), request.getCle());
        dossier.setNumAffiliation(numAffiliation);
        
        // Date assujettissement (peut être différente de date effet)
        dossier.setDateAssujettissement(request.getDateEffet());
        
        dossier = dossierCoopRepository.save(dossier);
        
        log.info("Dossier créé avec succès - ID: {}, NumAffiliation: {}", 
                dossier.getId(), dossier.getNumAffiliation());
        
        return mapToResponse(dossier, "Dossier créé avec succès");
    }
    
    /**
     * Validation: Date effet doit être au maximum 1 an avant date dépôt CNSS
     */
    private void validateDateEffet(LocalDate dateEffet, LocalDate dateDepotCnss) {
        long daysBetween = ChronoUnit.DAYS.between(dateEffet, dateDepotCnss);
        if (daysBetween > 365) {
            throw new RuntimeException(
                    "La date d'effet ne peut pas être antérieure de plus d'un an à la date de dépôt CNSS");
        }
        if (daysBetween < 0) {
            throw new RuntimeException(
                    "La date d'effet ne peut pas être postérieure à la date de dépôt CNSS");
        }
    }
    
    /**
     * Générer numéro affiliation
     * Format: REGIME + MATRICULE + CLE
     */
    private String generateNumAffiliation(String regime, Long matricule, Integer cle) {
        return String.format("%s%08d%02d", regime, matricule, cle != null ? cle : 0);
    }
    
    /**
     * Rechercher un dossier par plusieurs paramètres (pas juste ID)
     */
    public DossierResponse getDossier(Long matricule, String regime, LocalDate dateEffet) {
        DossierCoop dossier = dossierCoopRepository.findByMatriculeAndRegime(matricule, regime)
                .stream()
                .filter(d -> d.getDateEffet().equals(dateEffet))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Dossier non trouvé"));
        
        return mapToResponse(dossier, null);
    }
    
    /**
     * Rechercher par numéro affiliation
     */
    public DossierResponse getDossierByNumAffiliation(String numAffiliation) {
        DossierCoop dossier = dossierCoopRepository.findByNumAffiliation(numAffiliation)
                .orElseThrow(() -> new RuntimeException("Dossier non trouvé"));
        
        return mapToResponse(dossier, null);
    }
    
    private DossierResponse mapToResponse(DossierCoop dossier, String message) {
        DossierResponse response = new DossierResponse();
        response.setId(dossier.getId());
        response.setMatricule(dossier.getMatricule());
        response.setCle(dossier.getCle());
        response.setNumAffiliation(dossier.getNumAffiliation());
        response.setNomPrenom(dossier.getNomPrenom());
        response.setRegime(dossier.getRegime());
        response.setTypeCooperation(dossier.getTypeCooperation());
        response.setDateEffet(dossier.getDateEffet());
        response.setDateAssujettissement(dossier.getDateAssujettissement());
        response.setDateDepotCnss(dossier.getDateDepotCnss());
        response.setPaysDetachement(dossier.getPaysDetachement());
        response.setPeriodeDebut(dossier.getPeriodeDebut());
        response.setPeriodeFin(dossier.getPeriodeFin());
        response.setActif(dossier.getActif());
        response.setMessage(message);
        return response;
    }
}
