package tn.cnss.disponibilite.controller;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.entity.Salaire;
import tn.cnss.disponibilite.service.SalaireService;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/disponibilite/salaires")
public class SalaireController {

    private final SalaireService service;

    public SalaireController(SalaireService service) {
        this.service = service;
    }

    @GetMapping("/agent/{agentId}")
    public List<Salaire> findByAgent(@PathVariable Long agentId) {
        return service.findByAgent(agentId);
    }

    @GetMapping("/applicable")
    public ResponseEntity<Salaire> findApplicable(
            @RequestParam Long agentId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        return service.findSalaireApplicable(agentId, date)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Salaire create(@RequestBody Salaire salaire) {
        return service.save(salaire);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Salaire> update(@PathVariable Long id, @RequestBody Salaire salaire) {
        try {
            return ResponseEntity.ok(service.update(id, salaire));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
