package tn.cnss.cooperation.file.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.cooperation.file.entity.GedDocument;
import tn.cnss.cooperation.file.service.GedService;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@RestController
@RequestMapping("/ged")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class GedController {
    
    private final GedService gedService;
    private final ObjectMapper objectMapper = new ObjectMapper();
    
    @GetMapping("/documents")
    public ResponseEntity<List<GedDocument>> getDocuments(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String categorie) {
        return ResponseEntity.ok(gedService.searchDocuments(search, categorie));
    }
    
    @GetMapping("/documents/{id}")
    public ResponseEntity<GedDocument> getDocument(@PathVariable Long id) {
        return gedService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/documents/{id}/children")
    public ResponseEntity<List<GedDocument>> getChildren(@PathVariable Long id) {
        return ResponseEntity.ok(gedService.getChildren(id));
    }
    
    @PostMapping("/documents/create-folder")
    public ResponseEntity<GedDocument> createFolder(
            @RequestParam("titre") String titre,
            @RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "categorie", required = false, defaultValue = "AUTRE") String categorie,
            @RequestParam(value = "tags", required = false) String tagsJson,
            @RequestHeader(value = "X-User", required = false, defaultValue = "system") String user) {
        try {
            List<String> tags = null;
            if (tagsJson != null && !tagsJson.isEmpty()) {
                tags = objectMapper.readValue(tagsJson, new TypeReference<List<String>>() {});
            }
            GedDocument folder = gedService.createFolder(titre, description, categorie, tags, user);
            return ResponseEntity.ok(folder);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    
    @PostMapping("/documents/upload")
    public ResponseEntity<GedDocument> uploadDocument(
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "titre", required = false) String titre,
            @RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "categorie", required = false, defaultValue = "AUTRE") String categorie,
            @RequestParam(value = "tags", required = false) String tagsJson,
            @RequestParam(value = "parentId", required = false) Long parentId,
            @RequestHeader(value = "X-User", required = false, defaultValue = "system") String user) {
        try {
            List<String> tags = null;
            if (tagsJson != null && !tagsJson.isEmpty()) {
                tags = objectMapper.readValue(tagsJson, new TypeReference<List<String>>() {});
            }
            GedDocument doc = gedService.uploadDocument(file, titre, description, categorie, tags, user);
            if (parentId != null) {
                doc.setParentId(parentId);
                doc = gedService.save(doc);
            }
            return ResponseEntity.ok(doc);
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    
    @PutMapping("/documents/{id}")
    public ResponseEntity<GedDocument> updateDocument(
            @PathVariable Long id,
            @RequestBody Map<String, Object> updates) {
        String titre = (String) updates.get("titre");
        String description = (String) updates.get("description");
        String categorie = (String) updates.get("categorie");
        @SuppressWarnings("unchecked")
        List<String> tags = (List<String>) updates.get("tags");
        
        GedDocument doc = gedService.updateDocument(id, titre, description, categorie, tags);
        return ResponseEntity.ok(doc);
    }
    
    @DeleteMapping("/documents/{id}")
    public ResponseEntity<Void> deleteDocument(@PathVariable Long id) {
        try {
            gedService.deleteDocument(id);
            return ResponseEntity.ok().build();
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    
    @GetMapping("/documents/{id}/download")
    public ResponseEntity<byte[]> downloadDocument(@PathVariable Long id) {
        try {
            GedDocument doc = gedService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Document non trouvé"));
            byte[] content = gedService.downloadDocument(id);
            
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(doc.getFichierType()))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + doc.getFichierNom() + "\"")
                    .body(content);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @GetMapping("/documents/{id}/download-zip")
    public ResponseEntity<byte[]> downloadDocumentAsZip(@PathVariable Long id) {
        try {
            GedDocument doc = gedService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Document non trouvé"));
            byte[] content = gedService.downloadDocument(id);
            
            // Créer le ZIP
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try (ZipOutputStream zos = new ZipOutputStream(baos)) {
                ZipEntry entry = new ZipEntry(doc.getFichierNom());
                zos.putNextEntry(entry);
                zos.write(content);
                zos.closeEntry();
            }
            
            String zipFileName = doc.getFichierNom().replaceAll("\\.[^.]+$", "") + ".zip";
            
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + zipFileName + "\"")
                    .body(baos.toByteArray());
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @GetMapping("/documents/{id}/export-pdf")
    public ResponseEntity<byte[]> exportDocumentAsPdf(
            @PathVariable Long id,
            @RequestParam(defaultValue = "true") boolean metadata,
            @RequestParam(defaultValue = "true") boolean comments,
            @RequestParam(defaultValue = "10") int margin) {
        try {
            GedDocument doc = gedService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Document non trouvé"));
            
            // Si le document est déjà un PDF, le retourner directement
            if (doc.getFichierType() != null && doc.getFichierType().contains("pdf")) {
                byte[] content = gedService.downloadDocument(id);
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_PDF)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + doc.getFichierNom() + "\"")
                        .body(content);
            }
            
            // Créer un PDF avec PDFBox
            byte[] fileContent = gedService.downloadDocument(id);
            byte[] pdfContent = createPdfFromDocument(doc, fileContent, metadata, margin);
            String pdfFileName = doc.getFichierNom().replaceAll("\\.[^.]+$", "") + ".pdf";
            
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + pdfFileName + "\"")
                    .body(pdfContent);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }
    
    private byte[] createPdfFromDocument(GedDocument doc, byte[] fileContent, boolean includeMetadata, int margin) throws IOException {
        try (PDDocument pdfDoc = new PDDocument()) {
            PDPage page = new PDPage(PDRectangle.A4);
            pdfDoc.addPage(page);
            
            float pageWidth = page.getMediaBox().getWidth();
            float pageHeight = page.getMediaBox().getHeight();
            float marginPt = margin * 2.83465f; // mm to points
            
            try (PDPageContentStream contentStream = new PDPageContentStream(pdfDoc, page)) {
                float yPosition = pageHeight - marginPt;
                
                // Titre du document
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 18);
                contentStream.newLineAtOffset(marginPt, yPosition);
                contentStream.showText(doc.getTitre() != null ? doc.getTitre() : doc.getFichierNom());
                contentStream.endText();
                yPosition -= 30;
                
                // Métadonnées si demandé
                if (includeMetadata) {
                    contentStream.beginText();
                    contentStream.setFont(PDType1Font.HELVETICA, 10);
                    contentStream.newLineAtOffset(marginPt, yPosition);
                    contentStream.showText("Fichier: " + doc.getFichierNom());
                    contentStream.endText();
                    yPosition -= 15;
                    
                    contentStream.beginText();
                    contentStream.setFont(PDType1Font.HELVETICA, 10);
                    contentStream.newLineAtOffset(marginPt, yPosition);
                    contentStream.showText("Categorie: " + (doc.getCategorie() != null ? doc.getCategorie() : "N/A"));
                    contentStream.endText();
                    yPosition -= 15;
                    
                    contentStream.beginText();
                    contentStream.setFont(PDType1Font.HELVETICA, 10);
                    contentStream.newLineAtOffset(marginPt, yPosition);
                    contentStream.showText("Taille: " + formatFileSize(doc.getFichierTaille()));
                    contentStream.endText();
                    yPosition -= 15;
                    
                    if (doc.getDescription() != null && !doc.getDescription().isEmpty()) {
                        contentStream.beginText();
                        contentStream.setFont(PDType1Font.HELVETICA, 10);
                        contentStream.newLineAtOffset(marginPt, yPosition);
                        contentStream.showText("Description: " + doc.getDescription());
                        contentStream.endText();
                        yPosition -= 15;
                    }
                    
                    yPosition -= 20;
                }
                
                // Si c'est une image, l'intégrer dans le PDF
                if (doc.getFichierType() != null && doc.getFichierType().startsWith("image/")) {
                    try {
                        PDImageXObject image = PDImageXObject.createFromByteArray(pdfDoc, fileContent, doc.getFichierNom());
                        float imgWidth = image.getWidth();
                        float imgHeight = image.getHeight();
                        
                        // Calculer les dimensions pour tenir dans la page
                        float maxWidth = pageWidth - 2 * marginPt;
                        float maxHeight = yPosition - marginPt;
                        
                        float scale = Math.min(maxWidth / imgWidth, maxHeight / imgHeight);
                        if (scale > 1) scale = 1; // Ne pas agrandir
                        
                        float scaledWidth = imgWidth * scale;
                        float scaledHeight = imgHeight * scale;
                        
                        contentStream.drawImage(image, marginPt, yPosition - scaledHeight, scaledWidth, scaledHeight);
                    } catch (Exception e) {
                        // Si l'image ne peut pas être chargée, afficher un message
                        contentStream.beginText();
                        contentStream.setFont(PDType1Font.HELVETICA_OBLIQUE, 12);
                        contentStream.newLineAtOffset(marginPt, yPosition - 20);
                        contentStream.showText("[Image non disponible]");
                        contentStream.endText();
                    }
                } else {
                    // Pour les autres types de fichiers
                    contentStream.beginText();
                    contentStream.setFont(PDType1Font.HELVETICA_OBLIQUE, 12);
                    contentStream.newLineAtOffset(marginPt, yPosition - 20);
                    contentStream.showText("[Contenu du fichier: " + doc.getFichierType() + "]");
                    contentStream.endText();
                }
            }
            
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            pdfDoc.save(baos);
            return baos.toByteArray();
        }
    }
    
    private String formatFileSize(Long size) {
        if (size == null) return "N/A";
        if (size < 1024) return size + " B";
        if (size < 1024 * 1024) return String.format("%.1f KB", size / 1024.0);
        return String.format("%.1f MB", size / (1024.0 * 1024));
    }
    
    @GetMapping("/stats")
    public ResponseEntity<Map<String, Object>> getStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalDocuments", gedService.countRootDocuments());
        stats.put("totalTaille", gedService.getTotalSize());
        
        Map<String, Long> parCategorie = new HashMap<>();
        for (Object[] row : gedService.getCountByCategorie()) {
            parCategorie.put((String) row[0], (Long) row[1]);
        }
        stats.put("parCategorie", parCategorie);
        
        return ResponseEntity.ok(stats);
    }
    
    @GetMapping("/tags")
    public ResponseEntity<List<Map<String, Object>>> getTags() {
        List<Map<String, Object>> tags = List.of(
            Map.of("id", 1, "nom", "Important", "couleur", "red"),
            Map.of("id", 2, "nom", "Urgent", "couleur", "orange"),
            Map.of("id", 3, "nom", "Archivé", "couleur", "gray"),
            Map.of("id", 4, "nom", "Validé", "couleur", "green")
        );
        return ResponseEntity.ok(tags);
    }
    
    @GetMapping("/activites")
    public ResponseEntity<List<Map<String, Object>>> getActivites(@RequestParam(defaultValue = "10") int limit) {
        // Pour l'instant, retourne une liste vide - à implémenter avec une vraie table d'activités
        return ResponseEntity.ok(List.of());
    }
    
    // ==================== AI EXTRACTION ENDPOINTS ====================
    
    @Value("${ai.extraction.url:http://localhost:8090}")
    private String aiExtractionUrl;
    
    /**
     * Extrait les données d'un document GED existant via le service IA
     */
    @PostMapping("/documents/{id}/extract")
    public ResponseEntity<Map<String, Object>> extractFromDocument(
            @PathVariable Long id,
            @RequestParam(value = "documentType", required = false) String documentType) {
        try {
            GedDocument doc = gedService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Document non trouvé"));
            
            // Ne pas extraire depuis les dossiers
            if ("folder".equals(doc.getFichierType())) {
                return ResponseEntity.badRequest().body(Map.of(
                    "success", false,
                    "error", "Impossible d'extraire les données d'un dossier"
                ));
            }
            
            byte[] fileContent = gedService.downloadDocument(id);
            
            // Appeler le service Python AI
            RestTemplate restTemplate = new RestTemplate();
            
            MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
            ByteArrayResource fileResource = new ByteArrayResource(fileContent) {
                @Override
                public String getFilename() {
                    return doc.getFichierNom();
                }
            };
            body.add("file", fileResource);
            if (documentType != null && !documentType.isEmpty()) {
                body.add("document_type", documentType);
            }
            // Pass GED tags/title as hint for AI auto-detection fallback
            String hint = deriveHintFromDocument(doc);
            if (hint != null) {
                body.add("hint", hint);
            }
            body.add("lang", "fra+ara");
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);
            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);
            
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.postForObject(
                    aiExtractionUrl + "/extract", requestEntity, Map.class);
            
            if (result != null) {
                result.put("document_id", id);
                result.put("document_titre", doc.getTitre());
                result.put("document_fichier", doc.getFichierNom());
            }
            
            return ResponseEntity.ok(result != null ? result : Map.of("success", false, "error", "Pas de réponse du service IA"));
            
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(Map.of(
                "success", false,
                "error", "Erreur extraction IA: " + e.getMessage(),
                "document_id", id
            ));
        }
    }
    
    /**
     * Extrait les données d'un fichier uploadé directement (sans le stocker dans la GED)
     */
    @PostMapping("/extract-file")
    public ResponseEntity<Map<String, Object>> extractFromUploadedFile(
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "documentType", required = false) String documentType) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            
            MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
            ByteArrayResource fileResource = new ByteArrayResource(file.getBytes()) {
                @Override
                public String getFilename() {
                    return file.getOriginalFilename();
                }
            };
            body.add("file", fileResource);
            if (documentType != null && !documentType.isEmpty()) {
                body.add("document_type", documentType);
            }
            body.add("lang", "fra+ara");
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);
            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);
            
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.postForObject(
                    aiExtractionUrl + "/extract", requestEntity, Map.class);
            
            return ResponseEntity.ok(result != null ? result : Map.of("success", false, "error", "Pas de réponse du service IA"));
            
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(Map.of(
                "success", false,
                "error", "Erreur extraction IA: " + e.getMessage()
            ));
        }
    }
    
    /**
     * Vérifie la santé du service AI extraction
     */
    @GetMapping("/ai/health")
    public ResponseEntity<Map<String, Object>> aiHealthCheck() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.getForObject(aiExtractionUrl + "/health", Map.class);
            return ResponseEntity.ok(result != null ? result : Map.of("status", "unknown"));
        } catch (Exception e) {
            return ResponseEntity.ok(Map.of(
                "status", "unavailable",
                "error", e.getMessage()
            ));
        }
    }
    
    /**
     * Retourne les types de documents supportés par le service AI
     */
    /**
     * Derive an AI document type hint from the GED document's tags and title
     */
    private String deriveHintFromDocument(GedDocument doc) {
        String titre = (doc.getTitre() != null ? doc.getTitre() : "").toLowerCase();
        String tagsStr = (doc.getTags() != null ? String.join(" ", doc.getTags()) : "").toLowerCase();
        String combined = titre + " " + tagsStr;
        
        if (combined.contains("decision") || combined.contains("décision") || combined.contains("decision-affectation")) {
            return "decision_affectation";
        } else if (combined.contains("contrat")) {
            return "contrat";
        } else if (combined.contains("attestation-affiliation") || (combined.contains("attestation") && combined.contains("affiliation"))) {
            return "attestation_affiliation";
        } else if (combined.contains("attestation") || combined.contains("salaire") || combined.contains("attestation-salaire")) {
            return "attestation_salaire";
        } else if (combined.contains("cin") || combined.contains("identite") || combined.contains("identité")) {
            return "cin";
        }
        return null;
    }
    
    @GetMapping("/ai/document-types")
    public ResponseEntity<Map<String, Object>> getAiDocumentTypes() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.getForObject(aiExtractionUrl + "/document-types", Map.class);
            return ResponseEntity.ok(result != null ? result : Map.of());
        } catch (Exception e) {
            return ResponseEntity.ok(Map.of(
                "error", "Service AI non disponible: " + e.getMessage()
            ));
        }
    }
}
