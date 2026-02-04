package tn.cnss.cooperation.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.dto.DossierATCTRequest;
import tn.cnss.cooperation.dto.DossierATCTResponse;
import tn.cnss.cooperation.service.DossierATCTService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/atct")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*")
public class DossierATCTController {

    private final DossierATCTService service;

    @GetMapping
    public ResponseEntity<List<DossierATCTResponse>> findAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DossierATCTResponse> findById(@PathVariable Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/statut/{statut}")
    public ResponseEntity<List<DossierATCTResponse>> findByStatut(@PathVariable String statut) {
        return ResponseEntity.ok(service.findByStatut(statut));
    }

    @GetMapping("/en-attente")
    public ResponseEntity<List<DossierATCTResponse>> findEnAttente() {
        return ResponseEntity.ok(service.findEnAttente());
    }

    @GetMapping("/pour-affiliation")
    public ResponseEntity<List<DossierATCTResponse>> findPourAffiliation() {
        return ResponseEntity.ok(service.findPourAffiliation());
    }

    @GetMapping("/search")
    public ResponseEntity<List<DossierATCTResponse>> search(@RequestParam String q) {
        return ResponseEntity.ok(service.search(q));
    }

    @GetMapping("/stats")
    public ResponseEntity<Map<String, Long>> getStatistiques() {
        return ResponseEntity.ok(service.getStatistiques());
    }

    @PostMapping
    public ResponseEntity<DossierATCTResponse> create(
            @RequestBody DossierATCTRequest request,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        log.info("Création dossier ATCT - Agent: {}", agentId);
        DossierATCTResponse response = service.create(request, agentId);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<DossierATCTResponse> update(
            @PathVariable Long id,
            @RequestBody DossierATCTRequest request,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        log.info("Mise à jour dossier ATCT {} - Agent: {}", id, agentId);
        return ResponseEntity.ok(service.update(id, request, agentId));
    }

    @PostMapping("/{id}/valider")
    public ResponseEntity<DossierATCTResponse> valider(
            @PathVariable Long id,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        log.info("Validation dossier ATCT {} - Agent: {}", id, agentId);
        return ResponseEntity.ok(service.valider(id, agentId));
    }

    @PostMapping("/{id}/rejeter")
    public ResponseEntity<DossierATCTResponse> rejeter(
            @PathVariable Long id,
            @RequestParam String motif,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        log.info("Rejet dossier ATCT {} - Agent: {} - Motif: {}", id, agentId, motif);
        return ResponseEntity.ok(service.rejeter(id, agentId, motif));
    }

    @PostMapping("/{id}/documents-deposes")
    public ResponseEntity<DossierATCTResponse> marquerDocumentsDeposes(@PathVariable Long id) {
        log.info("Marquage documents déposés - Dossier: {}", id);
        return ResponseEntity.ok(service.marquerDocumentsDeposes(id));
    }

    @PostMapping("/{id}/lier-affiliation")
    public ResponseEntity<DossierATCTResponse> lierAffiliation(
            @PathVariable Long id,
            @RequestParam Long affiliationId,
            @RequestParam String numAffiliation) {
        log.info("Liaison affiliation - Dossier: {} -> Affiliation: {}", id, numAffiliation);
        return ResponseEntity.ok(service.lierAffiliation(id, affiliationId, numAffiliation));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        log.info("Suppression dossier ATCT: {}", id);
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<Map<String, String>> handleException(RuntimeException e) {
        log.error("Erreur: {}", e.getMessage());
        return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
    }
}
