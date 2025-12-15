package tn.cnss.cooperation.debit.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.debit.entity.RegimeCotisation;
import tn.cnss.cooperation.debit.repository.RegimeCotisationRepository;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/regimes")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
@Slf4j
public class RegimeCotisationController {
    
    private final RegimeCotisationRepository regimeRepository;
    
    @GetMapping
    public ResponseEntity<List<RegimeCotisation>> getAll() {
        return ResponseEntity.ok(regimeRepository.findByActifTrueOrderByOrdreAsc());
    }
    
    @GetMapping("/all")
    public ResponseEntity<List<RegimeCotisation>> getAllIncludingInactive() {
        return ResponseEntity.ok(regimeRepository.findAll());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<RegimeCotisation> getById(@PathVariable Long id) {
        return regimeRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<?> create(@RequestBody RegimeCotisation regime) {
        if (regimeRepository.existsByCode(regime.getCode())) {
            return ResponseEntity.badRequest().body("Un régime avec ce code existe déjà");
        }
        log.info("Création régime cotisation: {} - {}", regime.getCode(), regime.getNomAr());
        RegimeCotisation saved = regimeRepository.save(regime);
        return ResponseEntity.ok(saved);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody RegimeCotisation regime) {
        return regimeRepository.findById(id)
                .map(existing -> {
                    existing.setCode(regime.getCode());
                    existing.setNomAr(regime.getNomAr());
                    existing.setNomFr(regime.getNomFr());
                    existing.setTaux(regime.getTaux());
                    existing.setBaseCalcul(regime.getBaseCalcul());
                    existing.setCoefficientBase(regime.getCoefficientBase());
                    existing.setActif(regime.getActif());
                    existing.setOrdre(regime.getOrdre());
                    log.info("Mise à jour régime cotisation: {} - {}", regime.getCode(), regime.getNomAr());
                    return ResponseEntity.ok(regimeRepository.save(existing));
                })
                .orElse(ResponseEntity.notFound().build());
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        if (regimeRepository.existsById(id)) {
            regimeRepository.deleteById(id);
            log.info("Suppression régime cotisation ID: {}", id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
    
    @PostMapping("/init")
    public ResponseEntity<String> initDefaultRegimes() {
        // Initialiser les régimes par défaut si la table est vide
        if (regimeRepository.count() == 0) {
            RegimeCotisation regime1 = new RegimeCotisation();
            regime1.setCode("133");
            regime1.setNomAr("جرايات الشيخوخة والعجز والباقين على قيد الحياة");
            regime1.setNomFr("Pensions de vieillesse, d'invalidité et de survivants");
            regime1.setTaux(new BigDecimal("13.5"));
            regime1.setBaseCalcul("SALAIRE");
            regime1.setCoefficientBase(new BigDecimal("1.0"));
            regime1.setActif(true);
            regime1.setOrdre(1);
            regimeRepository.save(regime1);
            
            RegimeCotisation regime2 = new RegimeCotisation();
            regime2.setCode("0");
            regime2.setNomAr("التأمينات الاجتماعية");
            regime2.setNomFr("Assurances sociales");
            regime2.setTaux(new BigDecimal("0"));
            regime2.setBaseCalcul("SALAIRE");
            regime2.setCoefficientBase(new BigDecimal("1.0"));
            regime2.setActif(true);
            regime2.setOrdre(2);
            regimeRepository.save(regime2);
            
            RegimeCotisation regime3 = new RegimeCotisation();
            regime3.setCode("91");
            regime3.setNomAr("النظام التكميلي للجرايات");
            regime3.setNomFr("Régime complémentaire des pensions");
            regime3.setTaux(new BigDecimal("9"));
            regime3.setBaseCalcul("SALAIRE_PLAFONNE");
            regime3.setCoefficientBase(new BigDecimal("0.735"));
            regime3.setActif(true);
            regime3.setOrdre(3);
            regimeRepository.save(regime3);
            
            log.info("Régimes de cotisation par défaut initialisés");
            return ResponseEntity.ok("Régimes initialisés avec succès");
        }
        return ResponseEntity.ok("Les régimes existent déjà");
    }
}
