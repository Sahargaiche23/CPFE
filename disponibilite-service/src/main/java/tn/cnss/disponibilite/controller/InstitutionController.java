package tn.cnss.disponibilite.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.entity.Institution;
import tn.cnss.disponibilite.service.InstitutionService;

import java.util.List;

@RestController
@RequestMapping("/api/disponibilite/institutions")
public class InstitutionController {

    private final InstitutionService service;

    public InstitutionController(InstitutionService service) {
        this.service = service;
    }

    @GetMapping
    public List<Institution> findAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Institution> findById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/search")
    public ResponseEntity<?> search(
            @RequestParam(required = false) String numAffiliation,
            @RequestParam(required = false) String branche,
            @RequestParam(required = false) String q) {
        if (numAffiliation != null && !numAffiliation.isEmpty()) {
            if (branche != null && !branche.isEmpty()) {
                return service.findByAffiliation(numAffiliation, branche)
                        .map(i -> ResponseEntity.ok(List.of(i)))
                        .orElse(ResponseEntity.ok(List.of()));
            }
            return ResponseEntity.ok(service.findByNumAffiliation(numAffiliation));
        }
        if (q != null) {
            return ResponseEntity.ok(service.search(q));
        }
        return ResponseEntity.ok(service.findAll());
    }

    @PostMapping
    public Institution create(@RequestBody Institution institution) {
        return service.save(institution);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Institution> update(@PathVariable Long id, @RequestBody Institution institution) {
        try {
            return ResponseEntity.ok(service.update(id, institution));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
