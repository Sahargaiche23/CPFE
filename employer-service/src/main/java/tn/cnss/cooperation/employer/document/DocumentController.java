package tn.cnss.cooperation.employer.document;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/documents")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*")
public class DocumentController {
    
    private final DocumentService documentService;
    
    @PostMapping("/upload")
    public ResponseEntity<Map<String, Object>> uploadDocuments(
            @RequestParam("email") String email,
            @RequestParam(value = "identite", required = false) MultipartFile[] identite,
            @RequestParam(value = "contrat", required = false) MultipartFile[] contrat,
            @RequestParam(value = "diplome", required = false) MultipartFile[] diplome,
            @RequestParam(value = "attestation", required = false) MultipartFile[] attestation,
            @RequestParam(value = "atct", required = false) MultipartFile[] atct,
            @RequestParam(value = "autres", required = false) MultipartFile[] autres) {
        
        log.info("Upload documents for: {}", email);
        Map<String, Object> response = new HashMap<>();
        int totalUploaded = 0;
        
        try {
            if (identite != null && identite.length > 0) {
                documentService.uploadDocuments(email, "identite", identite);
                totalUploaded += identite.length;
            }
            if (contrat != null && contrat.length > 0) {
                documentService.uploadDocuments(email, "contrat", contrat);
                totalUploaded += contrat.length;
            }
            if (diplome != null && diplome.length > 0) {
                documentService.uploadDocuments(email, "diplome", diplome);
                totalUploaded += diplome.length;
            }
            if (attestation != null && attestation.length > 0) {
                documentService.uploadDocuments(email, "attestation", attestation);
                totalUploaded += attestation.length;
            }
            if (atct != null && atct.length > 0) {
                documentService.uploadDocuments(email, "atct", atct);
                totalUploaded += atct.length;
            }
            if (autres != null && autres.length > 0) {
                documentService.uploadDocuments(email, "autres", autres);
                totalUploaded += autres.length;
            }
            
            response.put("success", true);
            response.put("message", totalUploaded + " document(s) téléchargé(s) avec succès");
            response.put("totalUploaded", totalUploaded);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Error uploading documents: {}", e.getMessage());
            response.put("success", false);
            response.put("message", "Erreur lors de l'upload: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @GetMapping("/pending")
    public ResponseEntity<List<Document>> getPendingDocuments() {
        return ResponseEntity.ok(documentService.getPendingDocuments());
    }
    
    @GetMapping("/all")
    public ResponseEntity<List<Document>> getAllDocuments() {
        return ResponseEntity.ok(documentService.getAllDocuments());
    }
    
    @GetMapping("/cooperant/{email}")
    public ResponseEntity<List<Document>> getDocumentsByEmail(@PathVariable String email) {
        return ResponseEntity.ok(documentService.getDocumentsByEmail(email));
    }
    
    @GetMapping("/cooperant/id/{cooperantId}")
    public ResponseEntity<List<Document>> getDocumentsByCooperantId(@PathVariable Long cooperantId) {
        return ResponseEntity.ok(documentService.getDocumentsByCooperantId(cooperantId));
    }
    
    @GetMapping("/{id}/download")
    public ResponseEntity<byte[]> downloadDocument(@PathVariable Long id) {
        try {
            byte[] content = documentService.getDocumentContent(id);
            return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(content);
        } catch (IOException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @PutMapping("/{id}/valider")
    public ResponseEntity<Document> validerDocument(@PathVariable Long id) {
        return ResponseEntity.ok(documentService.validerDocument(id));
    }
    
    @PutMapping("/{id}/rejeter")
    public ResponseEntity<Document> rejeterDocument(@PathVariable Long id) {
        return ResponseEntity.ok(documentService.rejeterDocument(id));
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDocument(@PathVariable Long id) {
        try {
            documentService.deleteDocument(id);
            return ResponseEntity.ok().build();
        } catch (IOException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
