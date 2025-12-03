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
     * - Comparaison avec dernier salaire tunisien
     */
    @Transactional
    public SalaryConversionResponse convertSalary(ConvertSalaryRequest request) {
        log.info("Conversion salaire pour matricule: {}, devise: {}, montant: {}", 
                request.getMatricule(), request.getDevise(), request.getNouveauSalaireEtranger());
        
        // Récupérer taux de change BCT du 1er jour de détachement
        BigDecimal tauxChange = request.getTauxChangeManuel() != null 
                ? request.getTauxChangeManuel()
                : exchangeRateService.getExchangeRate(request.getDevise(), request.getDateDetachement());
        
        log.info("Taux de change {} du {}: {}", request.getDevise(), 
                request.getDateDetachement(), tauxChange);
        
        // Conversion en TND (Dinar Tunisien)
        BigDecimal salaireTND = request.getNouveauSalaireEtranger()
                .multiply(tauxChange)
                .setScale(3, RoundingMode.HALF_UP);
        
        // Salaire trimestriel (x3 mois)
        BigDecimal salaireTrimestriel = salaireTND.multiply(BigDecimal.valueOf(3))
                .setScale(3, RoundingMode.HALF_UP);
        
        // Sauvegarder dans la base
        SalaireEtranger salaire = new SalaireEtranger();
        salaire.setMatricule(request.getMatricule());
        salaire.setCle(request.getCle());
        salaire.setDateDebut(request.getDateDetachement());
        salaire.setSalaireDate(request.getDateDetachement());
        salaire.setSalaireDevise(request.getNouveauSalaireEtranger());
        salaire.setDevise(request.getDevise());
        salaire.setTauxChange(tauxChange);
        salaire.setSalaireTND(salaireTND);
        salaire.setSalaireTrimestriel(salaireTrimestriel);
        
        salaire = salaireEtrangerRepository.save(salaire);
        
        log.info("Salaire converti: {} {} = {} TND (trimestre: {} TND)", 
                request.getNouveauSalaireEtranger(), request.getDevise(), 
                salaireTND, salaireTrimestriel);
        
        // Construire la réponse
        SalaryConversionResponse response = new SalaryConversionResponse();
        response.setId(salaire.getId());
        response.setMatricule(salaire.getMatricule());
        response.setCle(salaire.getCle());
        response.setSalaireDevise(request.getNouveauSalaireEtranger());
        response.setDevise(request.getDevise());
        response.setTauxChange(tauxChange);
        response.setDateCoursDevise(request.getDateDetachement());
        response.setSalaireTND(salaireTND);
        response.setSalaireTrimestriel(salaireTrimestriel);
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
     * Récupérer dernier salaire d'un assuré
     */
    public SalaryConversionResponse getLastSalary(Long matricule) {
        SalaireEtranger salaire = salaireEtrangerRepository.findLastSalaryByMatricule(matricule)
                .orElseThrow(() -> new RuntimeException("Aucun salaire trouvé pour ce matricule"));
        
        return mapToResponse(salaire);
    }
    
    private SalaryConversionResponse mapToResponse(SalaireEtranger salaire) {
        SalaryConversionResponse response = new SalaryConversionResponse();
        response.setId(salaire.getId());
        response.setMatricule(salaire.getMatricule());
        response.setCle(salaire.getCle());
        response.setSalaireDevise(salaire.getSalaireDevise());
        response.setDevise(salaire.getDevise());
        response.setTauxChange(salaire.getTauxChange());
        response.setDateCoursDevise(salaire.getSalaireDate());
        response.setSalaireTND(salaire.getSalaireTND());
        response.setSalaireTrimestriel(salaire.getSalaireTrimestriel());
        return response;
    }
}
