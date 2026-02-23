package tn.cnss.disponibilite.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.entity.AgentPublic;
import tn.cnss.disponibilite.service.AgentPublicService;

import java.util.List;

@RestController
@RequestMapping("/api/disponibilite/agents")
public class AgentPublicController {

    private final AgentPublicService service;

    public AgentPublicController(AgentPublicService service) {
        this.service = service;
    }

    @GetMapping
    public List<AgentPublic> findAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<AgentPublic> findById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/search")
    public ResponseEntity<?> search(@RequestParam(required = false) String numInscription,
                                    @RequestParam(required = false) String q) {
        if (numInscription != null) {
            return service.findByNumInscription(numInscription)
                    .map(a -> ResponseEntity.ok(List.of(a)))
                    .orElse(ResponseEntity.ok(List.of()));
        }
        if (q != null) {
            return ResponseEntity.ok(service.search(q));
        }
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/institution/{institutionId}")
    public List<AgentPublic> findByInstitution(@PathVariable Long institutionId) {
        return service.findByInstitution(institutionId);
    }

    @PostMapping
    public ResponseEntity<AgentPublic> create(@RequestBody AgentPublic agent) {
        try {
            return ResponseEntity.ok(service.save(agent));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<AgentPublic> update(@PathVariable Long id, @RequestBody AgentPublic agent) {
        try {
            return ResponseEntity.ok(service.update(id, agent));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        try {
            service.delete(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
