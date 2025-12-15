package tn.cnss.cooperation.regime.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.regime.dto.DetermineRegimeRequest;
import tn.cnss.cooperation.regime.dto.RegimeResponse;
import tn.cnss.cooperation.regime.dto.RegimeCotisation;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

@Service
@Slf4j
public class RegimeService {
    
    // Pays ayant convention avec la Tunisie
    private static final List<String> PAYS_CONVENTIONNES = Arrays.asList(
            "France", "Belgique", "Maroc", "Algérie", "Libye"
    );
    
    // Stockage en mémoire des régimes de cotisation
    private final Map<Long, RegimeCotisation> regimesStore = new ConcurrentHashMap<>();
    private final AtomicLong idGenerator = new AtomicLong(1);
    
    public List<RegimeCotisation> getAllActiveRegimes() {
        if (regimesStore.isEmpty()) {
            initDefaultRegimes();
        }
        return regimesStore.values().stream()
                .filter(r -> r.getActif() != null && r.getActif())
                .sorted(Comparator.comparing(RegimeCotisation::getOrdre))
                .collect(Collectors.toList());
    }
    
    public List<RegimeCotisation> getAllRegimes() {
        if (regimesStore.isEmpty()) {
            initDefaultRegimes();
        }
        return regimesStore.values().stream()
                .sorted(Comparator.comparing(RegimeCotisation::getOrdre))
                .collect(Collectors.toList());
    }
    
    public RegimeCotisation getById(Long id) {
        return regimesStore.get(id);
    }
    
    public RegimeCotisation create(RegimeCotisation regime) {
        Long id = idGenerator.getAndIncrement();
        regime.setId(id);
        regimesStore.put(id, regime);
        return regime;
    }
    
    public RegimeCotisation update(Long id, RegimeCotisation regime) {
        regime.setId(id);
        regimesStore.put(id, regime);
        return regime;
    }
    
    public void delete(Long id) {
        regimesStore.remove(id);
    }
    
    public void initDefaultRegimes() {
        regimesStore.clear();
        idGenerator.set(1);
        
        create(RegimeCotisation.builder()
                .code("133").nomAr("جرايات الشيخوخة و العجز و الباقين على قيد الحياة")
                .nomFr("Pensions de vieillesse").taux(13.5).baseCalcul("SALAIRE")
                .coefficientBase(1.0).actif(true).ordre(1).build());
        
        create(RegimeCotisation.builder()
                .code("0").nomAr("التأمينات الاجتماعية")
                .nomFr("Assurances sociales").taux(0.0).baseCalcul("SALAIRE")
                .coefficientBase(1.0).actif(true).ordre(2).build());
        
        create(RegimeCotisation.builder()
                .code("91").nomAr("النظام التكميلي للجرايات")
                .nomFr("Régime complémentaire").taux(9.0).baseCalcul("SALAIRE_PLAFONNE")
                .coefficientBase(0.735).actif(true).ordre(3).build());
        
        create(RegimeCotisation.builder()
                .code("134").nomAr("لا يوجد تغطية تأمين صحي من قبل CNAM")
                .nomFr("Pas de couverture CNAM").taux(2.0).baseCalcul("SALAIRE")
                .coefficientBase(1.0).actif(true).ordre(4).build());
        
        log.info("Régimes de cotisation initialisés: {} régimes", regimesStore.size());
    }
    
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
