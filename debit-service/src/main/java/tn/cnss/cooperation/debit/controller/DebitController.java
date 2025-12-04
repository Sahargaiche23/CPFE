package tn.cnss.cooperation.debit.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.debit.entity.EngagementEcheance;
import tn.cnss.cooperation.debit.repository.EngagementEcheanceRepository;
import tn.cnss.cooperation.debit.service.DebitGenerationService;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/debits")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
@Slf4j
public class DebitController {
    
    private final EngagementEcheanceRepository echeanceRepository;
    private final DebitGenerationService debitService;
    
    @GetMapping
    public ResponseEntity<List<EngagementEcheance>> getAll() {
        return ResponseEntity.ok(echeanceRepository.findAll());
    }
    
    @PostMapping("/generate")
    public ResponseEntity<List<EngagementEcheance>> generate(@RequestBody GenerateDebitRequest request) {
        log.info("Génération débit: T{}/{}", request.getTrimestre(), request.getAnnee());
        
        if (request.getEmpMat() != null && request.getEmpCle() != null) {
            List<EngagementEcheance> debits = debitService.genererDebitEmployeur(
                request.getEmpMat(), 
                request.getEmpCle(), 
                request.getTrimestre(), 
                request.getAnnee()
            );
            return ResponseEntity.ok(debits);
        }
        
        List<EngagementEcheance> debits = debitService.genererDebitTrimestre(
            request.getTrimestre(), 
            request.getAnnee()
        );
        return ResponseEntity.ok(debits);
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
    
    @GetMapping("/{engNum}")
    public ResponseEntity<EngagementEcheance> getById(@PathVariable Long engNum) {
        List<EngagementEcheance> echeances = echeanceRepository.findByEngNum(engNum);
        if (echeances.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(echeances.get(0));
    }
    
    @PutMapping("/{engNum}")
    public ResponseEntity<EngagementEcheance> update(@PathVariable Long engNum, @RequestBody EngagementEcheance debit) {
        List<EngagementEcheance> echeances = echeanceRepository.findByEngNum(engNum);
        if (echeances.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        EngagementEcheance existing = echeances.get(0);
        // Mettre à jour les champs modifiables
        existing.setEnoMontantEcheance(debit.getEnoMontantEcheance());
        existing.setEnoSituation(debit.getEnoSituation());
        return ResponseEntity.ok(echeanceRepository.save(existing));
    }
    
    @DeleteMapping("/{engNum}")
    public ResponseEntity<Void> delete(@PathVariable Long engNum) {
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

class GenerateDebitRequest {
    private Long empMat;
    private Integer empCle;
    private int trimestre;
    private int annee;
    
    public Long getEmpMat() { return empMat; }
    public void setEmpMat(Long empMat) { this.empMat = empMat; }
    public Integer getEmpCle() { return empCle; }
    public void setEmpCle(Integer empCle) { this.empCle = empCle; }
    public int getTrimestre() { return trimestre; }
    public void setTrimestre(int trimestre) { this.trimestre = trimestre; }
    public int getAnnee() { return annee; }
    public void setAnnee(int annee) { this.annee = annee; }
}
