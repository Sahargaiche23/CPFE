package tn.cnss.cooperation.employer.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.cooperation.employer.dto.CooperantDTO;
import tn.cnss.cooperation.employer.dto.CreateCooperantRequest;
import tn.cnss.cooperation.employer.service.CooperantService;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

/**
 * Controller REST pour les Coopérants
 */
@RestController
@RequestMapping("/api/cooperants")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*")
public class CooperantController {
    
    private final CooperantService cooperantService;
    
    /**
     * Liste tous les coopérants actifs
     */
    @GetMapping
    public ResponseEntity<List<CooperantDTO>> findAll() {
        log.info("GET /api/cooperants - Liste tous les coopérants");
        return ResponseEntity.ok(cooperantService.findAll());
    }
    
    /**
     * Récupérer un coopérant par ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<CooperantDTO> findById(@PathVariable Long id) {
        log.info("GET /api/cooperants/{} - Détail coopérant", id);
        return ResponseEntity.ok(cooperantService.findById(id));
    }
    
    /**
     * Récupérer un coopérant par matricule
     */
    @GetMapping("/matricule/{matricule}/{cle}")
    public ResponseEntity<CooperantDTO> findByMatricule(
            @PathVariable Long matricule,
            @PathVariable Integer cle) {
        log.info("GET /api/cooperants/matricule/{}/{} - Recherche par matricule", matricule, cle);
        return ResponseEntity.ok(cooperantService.findByMatricule(matricule, cle));
    }
    
    /**
     * Créer un nouveau coopérant
     */
    @PostMapping
    public ResponseEntity<CooperantDTO> create(@Valid @RequestBody CreateCooperantRequest request) {
        log.info("POST /api/cooperants - Création coopérant: {} {}", request.getPrenomFr(), request.getNomFr());
        CooperantDTO created = cooperantService.create(request);
        return ResponseEntity.ok(created);
    }
    
    /**
     * Mettre à jour un coopérant
     */
    @PutMapping("/{id}")
    public ResponseEntity<CooperantDTO> update(
            @PathVariable Long id,
            @Valid @RequestBody CreateCooperantRequest request) {
        log.info("PUT /api/cooperants/{} - Mise à jour coopérant", id);
        return ResponseEntity.ok(cooperantService.update(id, request));
    }
    
    /**
     * Mise à jour partielle (affiliation)
     */
    @PatchMapping("/{id}")
    public ResponseEntity<CooperantDTO> patchAffiliation(
            @PathVariable Long id,
            @RequestBody Map<String, String> updates) {
        log.info("PATCH /api/cooperants/{} - Mise à jour affiliation", id);
        return ResponseEntity.ok(cooperantService.updateAffiliation(id, updates));
    }
    
    /**
     * Supprimer (désactiver) un coopérant
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        log.info("DELETE /api/cooperants/{} - Suppression coopérant", id);
        cooperantService.delete(id);
        return ResponseEntity.noContent().build();
    }
    
    /**
     * Supprimer un coopérant par email
     */
    @DeleteMapping("/by-email/{email}")
    public ResponseEntity<Void> deleteByEmail(@PathVariable String email) {
        log.info("DELETE /api/cooperants/by-email/{} - Suppression coopérant par email", email);
        cooperantService.deleteByEmail(email);
        return ResponseEntity.noContent().build();
    }
    
    /**
     * Recherche par nom ou matricule
     */
    @GetMapping("/search")
    public ResponseEntity<List<CooperantDTO>> search(@RequestParam String q) {
        log.info("GET /api/cooperants/search?q={} - Recherche", q);
        return ResponseEntity.ok(cooperantService.search(q));
    }
    
    /**
     * Liste par régime
     */
    @GetMapping("/regime/{codeRegime}")
    public ResponseEntity<List<CooperantDTO>> findByRegime(@PathVariable String codeRegime) {
        log.info("GET /api/cooperants/regime/{} - Liste par régime", codeRegime);
        return ResponseEntity.ok(cooperantService.findByRegime(codeRegime));
    }
    
    // ===== ENDPOINTS VALIDATION (AGENT) =====
    
    /**
     * Liste des coopérants en attente de validation
     */
    @GetMapping("/pending")
    public ResponseEntity<List<CooperantDTO>> findPendingValidation() {
        log.info("GET /api/cooperants/pending - Liste en attente de validation");
        return ResponseEntity.ok(cooperantService.findPendingValidation());
    }
    
    /**
     * Valider un coopérant
     */
    @PostMapping("/{id}/valider")
    public ResponseEntity<CooperantDTO> valider(
            @PathVariable Long id,
            @RequestParam Long agentId) {
        log.info("POST /api/cooperants/{}/valider par agent {}", id, agentId);
        return ResponseEntity.ok(cooperantService.valider(id, agentId));
    }
    
    /**
     * Rejeter un coopérant
     */
    @PostMapping("/{id}/rejeter")
    public ResponseEntity<CooperantDTO> rejeter(
            @PathVariable Long id,
            @RequestParam Long agentId,
            @RequestParam String motif) {
        log.info("POST /api/cooperants/{}/rejeter par agent {}, motif: {}", id, agentId, motif);
        return ResponseEntity.ok(cooperantService.rejeter(id, agentId, motif));
    }
    
    // ===== ENDPOINTS FICHIERS =====
    
    /**
     * Upload de fichier (dossier, identité, autre)
     */
    @PostMapping(value = "/{id}/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Map<String, String>> uploadFile(
            @PathVariable Long id,
            @RequestParam("file") MultipartFile file,
            @RequestParam("type") String typeFile) throws IOException {
        log.info("POST /api/cooperants/{}/upload - Type: {}, Fichier: {}", id, typeFile, file.getOriginalFilename());
        
        // Vérifier le type de fichier
        String contentType = file.getContentType();
        if (contentType == null || (!contentType.startsWith("image/") 
                && !contentType.equals("application/pdf")
                && !contentType.equals("application/msword")
                && !contentType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Type de fichier non autorisé. Acceptés: PDF, Word, Images"));
        }
        
        // Vérifier la taille (max 10MB)
        if (file.getSize() > 10 * 1024 * 1024) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Fichier trop volumineux (max 10MB)"));
        }
        
        String path = cooperantService.uploadFile(id, file, typeFile);
        return ResponseEntity.ok(Map.of("path", path, "message", "Fichier uploadé avec succès"));
    }
    
    // ===== STATISTIQUES =====
    
    /**
     * Télécharger un fichier coopérant
     */
    @GetMapping("/{id}/files/{filename}")
    public ResponseEntity<Resource> downloadFile(
            @PathVariable Long id,
            @PathVariable String filename) {
        log.info("GET /api/cooperants/{}/files/{} - Téléchargement", id, filename);
        try {
            Path filePath = Paths.get("/opt/cnss/uploads/cooperants", id.toString(), filename);
            Resource resource = new UrlResource(filePath.toUri());
            
            if (resource.exists() && resource.isReadable()) {
                String contentType = determineContentType(filename);
                return ResponseEntity.ok()
                        .contentType(MediaType.parseMediaType(contentType))
                        .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + filename + "\"")
                        .body(resource);
            } else {
                log.warn("Fichier non trouvé: {}", filePath);
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            log.error("Erreur téléchargement fichier: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }
    
    private String determineContentType(String filename) {
        String lower = filename.toLowerCase();
        if (lower.endsWith(".pdf")) return "application/pdf";
        if (lower.endsWith(".png")) return "image/png";
        if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) return "image/jpeg";
        if (lower.endsWith(".doc")) return "application/msword";
        if (lower.endsWith(".docx")) return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        return "application/octet-stream";
    }
    
    // ===== STATISTIQUES =====
    
    /**
     * Statistiques par régime
     */
    @GetMapping("/stats/regime")
    public ResponseEntity<Map<String, Long>> getStatsByRegime() {
        log.info("GET /api/cooperants/stats/regime");
        return ResponseEntity.ok(cooperantService.getStatsByRegime());
    }
    
    /**
     * Statistiques par statut de validation
     */
    @GetMapping("/stats/validation")
    public ResponseEntity<Map<String, Long>> getStatsByValidation() {
        log.info("GET /api/cooperants/stats/validation");
        return ResponseEntity.ok(cooperantService.getStatsByValidation());
    }
}
