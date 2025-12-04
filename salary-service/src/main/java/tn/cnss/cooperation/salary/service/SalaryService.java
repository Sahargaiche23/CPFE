package tn.cnss.cooperation.salary.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.salary.dto.ConvertSalaryRequest;
import tn.cnss.cooperation.salary.dto.SalaryConversionResponse;
import tn.cnss.cooperation.salary.entity.SalaireEtranger;
import tn.cnss.cooperation.salary.repository.SalaireEtrangerRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class SalaryService {
    
    private final SalaireEtrangerRepository salaireEtrangerRepository;
    private final ExchangeRateService exchangeRateService;
    
    /**
     * Convertir le salaire étranger en TND
     * Étape 2 du cahier des charges:
     * - Conversion devise → dinar tunisien à la date du détachement
     * - Calcul salaire trimestriel
     * - Sauvegarde dans SALAIRE_ETRANGER
     */
    @Transactional
    public SalaryConversionResponse convertSalary(ConvertSalaryRequest request) {
        log.info("Conversion salaire - EmpMat: {}-{}, devise: {}, montant: {}", 
                request.getEmpMat(), request.getEmpCle(), request.getDevise(), request.getMontantDevise());
        
        // Récupérer taux de change BCT du 1er jour de détachement
        BigDecimal tauxChange = request.getTauxChangeManuel() != null 
                ? request.getTauxChangeManuel()
                : exchangeRateService.getExchangeRate(request.getDevise(), request.getDateDetachement());
        
        log.info("Taux de change {} du {}: {}", request.getDevise(), 
                request.getDateDetachement(), tauxChange);
        
        // Conversion en TND (Dinar Tunisien)
        BigDecimal salaireTND = request.getMontantDevise()
                .multiply(tauxChange)
                .setScale(3, RoundingMode.HALF_UP);
        
        // Salaire trimestriel (x3 mois)
        BigDecimal salaireTrimestriel = salaireTND.multiply(BigDecimal.valueOf(3))
                .setScale(3, RoundingMode.HALF_UP);
        
        // Sauvegarder dans SALAIRE_ETRANGER
        SalaireEtranger salaire = new SalaireEtranger();
        salaire.setEmpMat(request.getEmpMat());
        salaire.setEmpCle(request.getEmpCle());
        salaire.setDcoDateDebut(request.getDateDetachement());
        salaire.setSleDate(request.getDateDetachement());
        salaire.setSleSalaire(salaireTND);  // Salaire mensuel en TND
        salaire.setSleAgent(request.getAgentId());
        
        salaire = salaireEtrangerRepository.save(salaire);
        
        log.info("Salaire converti et sauvegardé: {} {} = {} TND (trimestre: {} TND)", 
                request.getMontantDevise(), request.getDevise(), 
                salaireTND, salaireTrimestriel);
        
        // Construire la réponse
        SalaryConversionResponse response = new SalaryConversionResponse();
        response.setEmpMat(salaire.getEmpMat());
        response.setEmpCle(salaire.getEmpCle());
        response.setMatriculeComplet(salaire.getEmployeurMatriculeComplet());
        response.setSalaireDevise(request.getMontantDevise());
        response.setDevise(request.getDevise());
        response.setTauxChange(tauxChange);
        response.setDateCoursDevise(request.getDateDetachement());
        response.setSalaireMensuelTND(salaireTND);
        response.setSalaireTrimestrielTND(salaireTrimestriel);
        response.setDernierSalaireTN(request.getDernierSalaireTN());
        
        // Déterminer régime recommandé basé sur comparaison
        if (request.getDernierSalaireTN() != null) {
            String regimeRecommande = determineRegime(request.getDernierSalaireTN(), salaireTrimestriel);
            response.setRegimeRecommande(regimeRecommande);
        }
        
        response.setMessage("Conversion effectuée avec succès");
        
        return response;
    }
    
    /**
     * Déterminer le régime basé sur la comparaison des salaires
     * Logique métier à confirmer avec les spécifications CNSS
     */
    private String determineRegime(BigDecimal dernierSalaireTN, BigDecimal salaireTrimestriel) {
        // Si salaire étranger > salaire tunisien → Régime 510
        // Sinon → Régime 500
        // (Logique simplifiée, à adapter selon règles CNSS)
        if (salaireTrimestriel.compareTo(dernierSalaireTN) > 0) {
            return "510";
        } else {
            return "500";
        }
    }
    
    /**
     * Récupérer dernier salaire d'un dossier (pour affichage/historique)
     */
    public SalaireEtranger getLastSalary(Long empMat, Integer empCle, LocalDate dcoDateDebut) {
        return salaireEtrangerRepository
                .findFirstByEmpMatAndEmpCleAndDcoDateDebutOrderBySleDateDesc(empMat, empCle, dcoDateDebut)
                .orElseThrow(() -> new RuntimeException("Aucun salaire trouvé pour ce dossier"));
    }
    
    /**
     * Récupérer tous les salaires d'un dossier
     */
    public List<SalaireEtranger> getSalariesByDossier(Long empMat, Integer empCle, LocalDate dcoDateDebut) {
        return salaireEtrangerRepository.findByEmpMatAndEmpCleAndDcoDateDebut(empMat, empCle, dcoDateDebut);
    }
}
