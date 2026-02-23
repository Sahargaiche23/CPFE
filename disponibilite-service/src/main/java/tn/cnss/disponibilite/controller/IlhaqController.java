package tn.cnss.disponibilite.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.entity.Ilhaq;
import tn.cnss.disponibilite.service.IlhaqService;

import java.util.List;

@RestController
@RequestMapping("/api/disponibilite/ilhaq")
public class IlhaqController {

    private final IlhaqService service;

    public IlhaqController(IlhaqService service) {
        this.service = service;
    }

    @GetMapping("/agent/{agentId}")
    public List<Ilhaq> findByAgent(@PathVariable Long agentId) {
        return service.findByAgent(agentId);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ilhaq> findById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody Ilhaq ilhaq) {
        try {
            return ResponseEntity.ok(service.save(ilhaq));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(java.util.Map.of("error", e.getMessage()));
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Ilhaq ilhaq) {
        try {
            ilhaq.setId(id);
            return ResponseEntity.ok(service.save(ilhaq));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(java.util.Map.of("error", e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
