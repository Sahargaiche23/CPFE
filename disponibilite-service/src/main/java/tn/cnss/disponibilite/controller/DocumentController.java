package tn.cnss.disponibilite.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.disponibilite.entity.DocumentGed;
import tn.cnss.disponibilite.service.DocumentGedService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/disponibilite/documents")
public class DocumentController {

    private final DocumentGedService service;

    public DocumentController(DocumentGedService service) {
        this.service = service;
    }

    @GetMapping("/agent/{agentId}")
    public List<DocumentGed> findByAgent(@PathVariable Long agentId) {
        return service.findByAgent(agentId);
    }

    @PostMapping("/upload")
    public ResponseEntity<?> upload(@RequestParam Long agentId,
                                    @RequestParam String typeDocument,
                                    @RequestParam("file") MultipartFile file) {
        try {
            DocumentGed doc = service.upload(agentId, typeDocument, file);
            return ResponseEntity.ok(doc);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @GetMapping("/{id}/download")
    public ResponseEntity<byte[]> download(@PathVariable Long id) throws IOException {
        DocumentGed doc = service.findById(id)
                .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        byte[] data = service.download(id);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + doc.getNomFichier() + "\"")
                .contentType(MediaType.parseMediaType(doc.getContentType() != null ? doc.getContentType() : "application/octet-stream"))
                .body(data);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        try {
            service.delete(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
