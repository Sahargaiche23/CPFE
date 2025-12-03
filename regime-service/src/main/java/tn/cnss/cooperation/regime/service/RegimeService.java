package tn.cnss.cooperation.regime.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.regime.dto.DetermineRegimeRequest;
import tn.cnss.cooperation.regime.dto.RegimeResponse;

import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class RegimeService {
    
    // Pays ayant convention avec la Tunisie
    private static final List<String> PAYS_CONVENTIONNES = Arrays.asList(
            "France", "Belgique", "Maroc", "Algérie", "Libye"
    );
    
    public RegimeResponse determineRegime(DetermineRegimeRequest request) {
        log.info("Détermination régime pour pays: {}", request.getPays());
        
        boolean paysConventionne = PAYS_CONVENTIONNES.contains(request.getPays());
        boolean societePublique = request.getSocietePublique() != null && request.getSocietePublique();
        
        // TTE et Coop Technique pour pays SANS convention
        boolean eligibleCoopTech = !paysConventionne && societePublique;
        boolean eligibleTTE = !paysConventionne;
        
        // Déterminer régime basé sur salaire
        String regime;
        String raison;
        
        if (request.getNouveauSalaireTND().compareTo(request.getDernierSalaire()) > 0) {
            regime = "510";
            raison = "Salaire étranger supérieur au dernier salaire tunisien";
        } else {
            regime = "500";
            raison = "Salaire étranger inférieur ou égal au dernier salaire tunisien";
        }
        
        String typeCooperation = eligibleCoopTech ? "Coopération Technique" : "TTE";
        
        return new RegimeResponse(regime, typeCooperation, raison, 
                paysConventionne, eligibleTTE, eligibleCoopTech);
    }
}
