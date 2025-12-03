package tn.cnss.cooperation.affiliation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.affiliation.dto.CreateAffiliationRequest;
import tn.cnss.cooperation.affiliation.entity.Affiliation;
import tn.cnss.cooperation.affiliation.service.AffiliationService;

@RestController
@RequestMapping("/affiliation")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class AffiliationController {
    
    private final AffiliationService affiliationService;
    
    @PostMapping("/create")
    public ResponseEntity<Affiliation> createAffiliation(@RequestBody CreateAffiliationRequest request) {
        return ResponseEntity.ok(affiliationService.createAffiliation(request));
    }
    
    @GetMapping("/{numAffiliation}")
    public ResponseEntity<Affiliation> getAffiliation(@PathVariable String numAffiliation) {
        return ResponseEntity.ok(affiliationService.getByNumAffiliation(numAffiliation));
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Affiliation Service is running");
    }
}
