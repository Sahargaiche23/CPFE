package tn.cnss.cooperation.employer.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.employer.entity.DemandeCooperant;
import tn.cnss.cooperation.employer.service.DemandeCooperantService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/demandes")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*")
public class DemandeCooperantController {

    private final DemandeCooperantService demandeService;

    // ===== LECTURE =====

    @GetMapping
    public ResponseEntity<List<DemandeCooperant>> findAll() {
        return ResponseEntity.ok(demandeService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DemandeCooperant> findById(@PathVariable Long id) {
        return ResponseEntity.ok(demandeService.findById(id));
    }

    @GetMapping("/cooperant/{cooperantId}")
    public ResponseEntity<List<DemandeCooperant>> findByCooperant(@PathVariable Long cooperantId) {
        return ResponseEntity.ok(demandeService.findByCooperant(cooperantId));
    }

    @GetMapping("/statut/{statut}")
    public ResponseEntity<List<DemandeCooperant>> findByStatut(@PathVariable String statut) {
        return ResponseEntity.ok(demandeService.findByStatut(statut));
    }

    @GetMapping("/type/{type}")
    public ResponseEntity<List<DemandeCooperant>> findByType(@PathVariable String type) {
        return ResponseEntity.ok(demandeService.findByType(type));
    }

    @GetMapping("/pending")
    public ResponseEntity<List<DemandeCooperant>> findPending(
            @RequestParam(required = false) String type) {
        if (type != null && !type.isEmpty()) {
            return ResponseEntity.ok(demandeService.findPendingByType(type));
        }
        return ResponseEntity.ok(demandeService.findPending());
    }

    @GetMapping("/stats")
    public ResponseEntity<Map<String, Object>> getStats() {
        return ResponseEntity.ok(demandeService.getStats());
    }

    // ===== CREATION PAR TYPE =====

    @PostMapping("/actualisation-salaire")
    public ResponseEntity<DemandeCooperant> creerActualisationSalaire(@RequestBody Map<String, Object> request) {
        Long cooperantId = Long.valueOf(request.get("cooperantId").toString());
        BigDecimal nouveauSalaire = new BigDecimal(request.get("nouveauSalaire").toString());
        String dateEffet = request.get("dateEffet") != null ? request.get("dateEffet").toString() : null;
        String motif = request.get("motif") != null ? request.get("motif").toString() : null;

        DemandeCooperant demande = demandeService.creerDemandeActualisationSalaire(
                cooperantId, nouveauSalaire, dateEffet, motif);
        return ResponseEntity.ok(demande);
    }

    @PostMapping("/sortie-regime-maladie")
    public ResponseEntity<DemandeCooperant> creerSortieRegimeMaladie(@RequestBody Map<String, Object> request) {
        Long cooperantId = Long.valueOf(request.get("cooperantId").toString());
        String regimeConcerne = request.get("regimeConcerne") != null ? request.get("regimeConcerne").toString() : null;
        String motif = request.get("motif") != null ? request.get("motif").toString() : null;
        BigDecimal impact = request.get("impactCotisation") != null 
                ? new BigDecimal(request.get("impactCotisation").toString()) : BigDecimal.ZERO;

        DemandeCooperant demande = demandeService.creerDemandeSortieRegimeMaladie(
                cooperantId, regimeConcerne, motif, impact);
        return ResponseEntity.ok(demande);
    }

    @PostMapping("/annulation-assurance")
    public ResponseEntity<DemandeCooperant> creerAnnulationAssurance(@RequestBody Map<String, Object> request) {
        Long cooperantId = Long.valueOf(request.get("cooperantId").toString());
        String motif = request.get("motif") != null ? request.get("motif").toString() : null;
        BigDecimal impact = request.get("impactCotisation") != null 
                ? new BigDecimal(request.get("impactCotisation").toString()) : BigDecimal.ZERO;

        DemandeCooperant demande = demandeService.creerDemandeAnnulationAssurance(
                cooperantId, motif, impact);
        return ResponseEntity.ok(demande);
    }

    @PostMapping("/rachat")
    public ResponseEntity<DemandeCooperant> creerDemandeRachat(@RequestBody Map<String, Object> request) {
        Long cooperantId = Long.valueOf(request.get("cooperantId").toString());
        Long debitId = request.get("debitId") != null ? Long.valueOf(request.get("debitId").toString()) : null;
        String trimestreDebit = request.get("trimestreDebit") != null ? request.get("trimestreDebit").toString() : null;
        BigDecimal montantOriginal = new BigDecimal(request.get("montantOriginal").toString());

        DemandeCooperant demande = demandeService.creerDemandeRachat(
                cooperantId, debitId, trimestreDebit, montantOriginal);
        return ResponseEntity.ok(demande);
    }

    // ===== VALIDATION / REJET =====

    @PostMapping("/{id}/valider")
    public ResponseEntity<DemandeCooperant> valider(
            @PathVariable Long id,
            @RequestParam(defaultValue = "1") Long agentId,
            @RequestParam(required = false) String commentaire) {
        return ResponseEntity.ok(demandeService.valider(id, agentId, commentaire));
    }

    @PostMapping("/{id}/rejeter")
    public ResponseEntity<DemandeCooperant> rejeter(
            @PathVariable Long id,
            @RequestParam(defaultValue = "1") Long agentId,
            @RequestParam String motif) {
        return ResponseEntity.ok(demandeService.rejeter(id, agentId, motif));
    }

    // ===== SUPPRESSION =====

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        demandeService.findById(id); // Vérifie l'existence
        demandeService.delete(id);
        log.info("DELETE /api/demandes/{}", id);
        return ResponseEntity.noContent().build();
    }
}
