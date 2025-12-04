package tn.cnss.cooperation.affiliation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.affiliation.entity.DossierCoop;
import tn.cnss.cooperation.affiliation.repository.DossierCoopRepository;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/affiliations")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class AffiliationController {
    
    private final DossierCoopRepository dossierRepository;
    
    @GetMapping
    public ResponseEntity<List<DossierCoop>> getAll(
            @RequestParam(required = false) String statut,
            @RequestParam(required = false) String regime) {
        
        if (statut != null && statut.equals("Actif")) {
            return ResponseEntity.ok(dossierRepository.findDossiersActifs(LocalDate.now()));
        }
        return ResponseEntity.ok(dossierRepository.findAll());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<DossierCoop> getById(@PathVariable Long id) {
        return dossierRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/employer/{empMat}/{empCle}")
    public ResponseEntity<List<DossierCoop>> getByEmployer(
            @PathVariable Long empMat,
            @PathVariable Integer empCle) {
        return ResponseEntity.ok(dossierRepository.findByEmpMatAndEmpCle(empMat, empCle));
    }
    
    @PostMapping
    public ResponseEntity<DossierCoop> create(@RequestBody DossierCoop dossier) {
        return ResponseEntity.ok(dossierRepository.save(dossier));
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<DossierCoop> update(@PathVariable Long id, @RequestBody DossierCoop dossier) {
        return dossierRepository.findById(id)
                .map(existing -> {
                    dossier.setDcoId(id);
                    return ResponseEntity.ok(dossierRepository.save(dossier));
                })
                .orElse(ResponseEntity.notFound().build());
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        dossierRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/{id}/pdf")
    public ResponseEntity<byte[]> downloadPdf(@PathVariable Long id) {
        DossierCoop dossier = dossierRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier non trouvé"));
        
        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=attestation_" + id + ".pdf")
                .contentType(org.springframework.http.MediaType.APPLICATION_PDF)
                .body(new byte[0]); // Temporaire
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Affiliation Service is running");
    }
}
