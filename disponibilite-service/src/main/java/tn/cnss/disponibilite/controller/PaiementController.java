package tn.cnss.disponibilite.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.dto.PaiementRequest;
import tn.cnss.disponibilite.entity.Paiement;
import tn.cnss.disponibilite.service.PaiementService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/disponibilite/paiements")
public class PaiementController {

    private final PaiementService service;

    public PaiementController(PaiementService service) {
        this.service = service;
    }

    @GetMapping
    public List<Paiement> findAll() {
        return service.findAll();
    }

    @GetMapping("/cotisation/{cotisationId}")
    public List<Paiement> findByCotisation(@PathVariable Long cotisationId) {
        return service.findByCotisation(cotisationId);
    }

    @GetMapping("/agent/{agentId}")
    public List<Paiement> findByAgent(@PathVariable Long agentId) {
        return service.findByAgent(agentId);
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody PaiementRequest request) {
        try {
            Paiement paiement = service.enregistrer(request);
            return ResponseEntity.ok(paiement);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Paiement> findById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
