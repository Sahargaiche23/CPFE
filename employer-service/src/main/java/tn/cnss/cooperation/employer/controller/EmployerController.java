package tn.cnss.cooperation.employer.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.employer.dto.CreateDossierRequest;
import tn.cnss.cooperation.employer.dto.DossierResponse;
import tn.cnss.cooperation.employer.service.EmployerService;

import java.time.LocalDate;

/**
 * Controller Employer Service
 * Endpoints avec paramètres multiples (pas seulement ID)
 */
@RestController
@RequestMapping("/employer")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class EmployerController {
    
    private final EmployerService employerService;
    
    /**
     * Créer un nouveau dossier
     * POST /employer/create
     */
    @PostMapping("/create")
    public ResponseEntity<DossierResponse> createDossier(
            @Valid @RequestBody CreateDossierRequest request) {
        DossierResponse response = employerService.createDossier(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    
    /**
     * Recherche dossier par paramètres multiples
     * GET /employer?matricule=XXX&regime=500&dateEffet=2024-01-01
     */
    @GetMapping
    public ResponseEntity<DossierResponse> getDossier(
            @RequestParam Long matricule,
            @RequestParam String regime,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateEffet) {
        DossierResponse response = employerService.getDossier(matricule, regime, dateEffet);
        return ResponseEntity.ok(response);
    }
    
    /**
     * Recherche par numéro affiliation
     * GET /employer/affiliation/{numAffiliation}
     */
    @GetMapping("/affiliation/{numAffiliation}")
    public ResponseEntity<DossierResponse> getDossierByNumAffiliation(
            @PathVariable String numAffiliation) {
        DossierResponse response = employerService.getDossierByNumAffiliation(numAffiliation);
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Employer Service is running");
    }
}
