package tn.cnss.cooperation.debit.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.debit.dto.GenerateDebitRequest;
import tn.cnss.cooperation.debit.entity.Debit;
import tn.cnss.cooperation.debit.entity.EngagementEcheance;
import tn.cnss.cooperation.debit.repository.DebitRepository;
import tn.cnss.cooperation.debit.repository.EngagementEcheanceRepository;
import tn.cnss.cooperation.debit.service.DebitGenerationService;
import tn.cnss.cooperation.debit.service.DebitService;

import java.util.List;

@RestController
@RequestMapping("/debits")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
@Slf4j
public class DebitController {
    
    private final EngagementEcheanceRepository echeanceRepository;
    private final DebitGenerationService debitGenerationService;
    private final DebitService debitService;
    private final DebitRepository debitRepository;
    
    @GetMapping
    public ResponseEntity<List<Debit>> getAll() {
        // Retourner les débits de la nouvelle table Debit (coopérants)
        return ResponseEntity.ok(debitRepository.findAll());
    }
    
    @GetMapping("/legacy")
    public ResponseEntity<List<EngagementEcheance>> getAllLegacy() {
        // Ancien endpoint pour les EngagementEcheance (employeurs)
        return ResponseEntity.ok(echeanceRepository.findAll());
    }
    
    @PostMapping("/generate")
    public ResponseEntity<?> generate(@RequestBody GenerateDebitRequest request) {
        log.info("Génération débit coopérant: {}, T{}/{}", 
                request.getNumAffiliation(), request.getTrimestre(), request.getAnnee());
        
        // Utiliser le nouveau service pour générer le débit avec envoi email
        Debit debit = debitService.generateDebit(request);
        if (debit != null) {
            return ResponseEntity.ok(debit);
        }
        return ResponseEntity.badRequest().body("Erreur lors de la génération du débit");
    }
    
    @GetMapping("/trimestre/{trimestre}/{annee}")
    public ResponseEntity<List<EngagementEcheance>> getByTrimestre(
            @PathVariable int trimestre,
            @PathVariable int annee) {
        
        int moisDebut = (trimestre - 1) * 3 + 1;
        int moisFin = moisDebut + 2;
        
        List<EngagementEcheance> echeances = echeanceRepository.findEcheancesByTrimestre(
            annee, moisDebut, moisFin
        );
        return ResponseEntity.ok(echeances);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Debit> getById(@PathVariable Long id) {
        // Chercher dans la table Debit (coopérants)
        return debitRepository.findById(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/legacy/{engNum}")
    public ResponseEntity<EngagementEcheance> getLegacyById(@PathVariable Long engNum) {
        List<EngagementEcheance> echeances = echeanceRepository.findByEngNum(engNum);
        if (echeances.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(echeances.get(0));
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Debit> update(@PathVariable Long id, @RequestBody Debit debit) {
        return debitRepository.findById(id)
            .map(existing -> {
                existing.setNumAffiliation(debit.getNumAffiliation());
                existing.setMontantCotisation(debit.getMontantCotisation());
                existing.setTrimestre(debit.getTrimestre());
                existing.setAnnee(debit.getAnnee());
                existing.setPaye(debit.getPaye());
                return ResponseEntity.ok(debitRepository.save(existing));
            })
            .orElse(ResponseEntity.notFound().build());
    }
    
    @PutMapping("/legacy/{engNum}")
    public ResponseEntity<EngagementEcheance> updateLegacy(@PathVariable Long engNum, @RequestBody EngagementEcheance debit) {
        List<EngagementEcheance> echeances = echeanceRepository.findByEngNum(engNum);
        if (echeances.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        EngagementEcheance existing = echeances.get(0);
        existing.setEnoMontantEcheance(debit.getEnoMontantEcheance());
        existing.setEnoSituation(debit.getEnoSituation());
        return ResponseEntity.ok(echeanceRepository.save(existing));
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        // Supprimer depuis la table Debit (coopérants)
        if (debitRepository.existsById(id)) {
            debitRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
    
    @DeleteMapping("/legacy/{engNum}")
    public ResponseEntity<Void> deleteLegacy(@PathVariable Long engNum) {
        // Ancien endpoint pour EngagementEcheance
        List<EngagementEcheance> echeances = echeanceRepository.findByEngNum(engNum);
        if (echeances.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        echeanceRepository.deleteAll(echeances);
        return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Debit Service is running");
    }
}

