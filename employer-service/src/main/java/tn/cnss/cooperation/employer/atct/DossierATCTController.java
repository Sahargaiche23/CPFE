package tn.cnss.cooperation.employer.atct;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/atct")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class DossierATCTController {

    private final DossierATCTService service;

    @GetMapping
    public ResponseEntity<List<DossierATCT>> getAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DossierATCT> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/statut/{statut}")
    public ResponseEntity<List<DossierATCT>> getByStatut(@PathVariable String statut) {
        return ResponseEntity.ok(service.findByStatut(statut));
    }

    @GetMapping("/en-attente")
    public ResponseEntity<List<DossierATCT>> getEnAttente() {
        return ResponseEntity.ok(service.findEnAttente());
    }

    @GetMapping("/pour-affiliation")
    public ResponseEntity<List<DossierATCT>> getPourAffiliation() {
        return ResponseEntity.ok(service.findPourAffiliation());
    }

    @GetMapping("/search")
    public ResponseEntity<List<DossierATCT>> search(@RequestParam("q") String query) {
        return ResponseEntity.ok(service.search(query));
    }

    @GetMapping("/stats")
    public ResponseEntity<Map<String, Long>> getStats() {
        return ResponseEntity.ok(service.getStats());
    }

    @PostMapping
    public ResponseEntity<DossierATCT> create(
            @RequestBody DossierATCT dossier,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        return ResponseEntity.ok(service.create(dossier, agentId));
    }

    @PutMapping("/{id}")
    public ResponseEntity<DossierATCT> update(
            @PathVariable Long id,
            @RequestBody DossierATCT dossier,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        return ResponseEntity.ok(service.update(id, dossier, agentId));
    }

    @PostMapping("/{id}/valider")
    public ResponseEntity<DossierATCT> valider(
            @PathVariable Long id,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        return ResponseEntity.ok(service.valider(id, agentId));
    }

    @PostMapping("/{id}/rejeter")
    public ResponseEntity<DossierATCT> rejeter(
            @PathVariable Long id,
            @RequestParam String motif,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        return ResponseEntity.ok(service.rejeter(id, motif, agentId));
    }

    @PostMapping("/{id}/reclamation")
    public ResponseEntity<DossierATCT> reclamation(
            @PathVariable Long id,
            @RequestParam String motif,
            @RequestHeader(value = "X-Agent-Id", defaultValue = "1") Long agentId) {
        return ResponseEntity.ok(service.reclamation(id, motif, agentId));
    }

    @PostMapping("/{id}/documents-deposes")
    public ResponseEntity<DossierATCT> marquerDocumentsDeposes(@PathVariable Long id) {
        return ResponseEntity.ok(service.marquerDocumentsDeposes(id));
    }

    @PostMapping("/{id}/lier-affiliation")
    public ResponseEntity<DossierATCT> lierAffiliation(
            @PathVariable Long id,
            @RequestParam Long affiliationId,
            @RequestParam String numAffiliation) {
        return ResponseEntity.ok(service.lierAffiliation(id, affiliationId, numAffiliation));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{id}/envoyer-email")
    public ResponseEntity<DossierATCT> envoyerEmail(@PathVariable Long id) {
        return ResponseEntity.ok(service.envoyerEmail(id));
    }

    @PostMapping("/{id}/rappel")
    public ResponseEntity<DossierATCT> envoyerRappel(@PathVariable Long id) {
        return ResponseEntity.ok(service.envoyerRappel(id));
    }

    @PostMapping("/{id}/rappel-pdf")
    public ResponseEntity<DossierATCT> envoyerRappelAvecPdf(
            @PathVariable Long id,
            @RequestBody Map<String, String> body) {
        String pdfBase64 = body.get("pdfBase64");
        return ResponseEntity.ok(service.envoyerRappelAvecPdf(id, pdfBase64));
    }
}
