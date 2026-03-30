package tn.cnss.disponibilite.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.dto.CotisationGenerationRequest;
import tn.cnss.disponibilite.entity.Cotisation;
import tn.cnss.disponibilite.service.CotisationService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/disponibilite/cotisations")
public class CotisationController {

    private final CotisationService service;

    public CotisationController(CotisationService service) {
        this.service = service;
    }

    @GetMapping
    public List<Cotisation> findAll(@RequestParam(required = false) Integer annee,
                                    @RequestParam(required = false) Integer trimestre) {
        if (annee != null && trimestre != null) {
            return service.findAll().stream()
                    .filter(c -> c.getAnnee().equals(annee) && c.getTrimestre().equals(trimestre))
                    .toList();
        }
        if (annee != null) return service.findByAnnee(annee);
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cotisation> findById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/agent/{agentId}")
    public List<Cotisation> findByAgent(@PathVariable Long agentId) {
        return service.findByAgent(agentId);
    }

    @GetMapping("/institution/{instId}")
    public List<Cotisation> findByInstitution(@PathVariable Long instId,
                                               @RequestParam(required = false) Integer annee) {
        if (annee != null) return service.findByInstitutionAndAnnee(instId, annee);
        return service.findByInstitution(instId);
    }

    @PostMapping("/generer")
    public ResponseEntity<?> generer(@RequestBody CotisationGenerationRequest request) {
        try {
            Map<String, Object> result = service.generer(request);
            return ResponseEntity.ok(result);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}
