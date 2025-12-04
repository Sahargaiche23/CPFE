package tn.cnss.cooperation.employer.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.employer.dto.EmployeurDTO;
import tn.cnss.cooperation.employer.service.EmployeurService;

import java.util.List;

@RestController
@RequestMapping("/employers")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
@Slf4j
public class EmployeurController {
    
    private final EmployeurService employeurService;
    
    @GetMapping
    public ResponseEntity<List<EmployeurDTO>> getAll(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String regime,
            @RequestParam(required = false) String statut) {
        
        log.info("GET /employers - search={}, regime={}, statut={}", search, regime, statut);
        
        List<EmployeurDTO> employers;
        
        if (search != null && !search.isEmpty()) {
            employers = employeurService.searchByName(search);
        } else if (regime != null && !regime.isEmpty()) {
            employers = employeurService.filterByRegime(regime);
        } else if (statut != null && !statut.isEmpty()) {
            employers = employeurService.filterByStatut(statut);
        } else {
            employers = employeurService.getAll();
        }
        
        log.info("Retour de {} employeurs", employers.size());
        return ResponseEntity.ok(employers);
    }
    
    @GetMapping("/{empMat}/{empCle}")
    public ResponseEntity<EmployeurDTO> getById(
            @PathVariable Long empMat,
            @PathVariable Integer empCle) {
        
        log.info("GET /api/employers/{}/{}", empMat, empCle);
        EmployeurDTO employeur = employeurService.getById(empMat, empCle);
        return ResponseEntity.ok(employeur);
    }
    
    @PostMapping
    public ResponseEntity<EmployeurDTO> create(@RequestBody EmployeurDTO dto) {
        log.info("POST /api/employers - {}", dto.getNomCommercial());
        EmployeurDTO created = employeurService.create(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }
    
    @PutMapping("/{empMat}/{empCle}")
    public ResponseEntity<EmployeurDTO> update(
            @PathVariable Long empMat,
            @PathVariable Integer empCle,
            @RequestBody EmployeurDTO dto) {
        
        log.info("PUT /api/employers/{}/{}", empMat, empCle);
        EmployeurDTO updated = employeurService.update(empMat, empCle, dto);
        return ResponseEntity.ok(updated);
    }
    
    @DeleteMapping("/{empMat}/{empCle}")
    public ResponseEntity<Void> delete(
            @PathVariable Long empMat,
            @PathVariable Integer empCle) {
        
        log.info("DELETE /api/employers/{}/{}", empMat, empCle);
        employeurService.delete(empMat, empCle);
        return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Employer Service is running");
    }
}
