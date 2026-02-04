package tn.cnss.cooperation.employer.document;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class DocumentService {
    
    private final DocumentRepository documentRepository;
    
    @Value("${documents.upload.path:/tmp/cnss-documents}")
    private String uploadPath;
    
    public List<Document> uploadDocuments(String email, String typeDocument, MultipartFile[] files) {
        List<Document> savedDocuments = new ArrayList<>();
        
        try {
            Path uploadDir = Paths.get(uploadPath, email, typeDocument);
            Files.createDirectories(uploadDir);
            
            for (MultipartFile file : files) {
                if (file.isEmpty()) continue;
                
                String originalFilename = file.getOriginalFilename();
                String extension = getFileExtension(originalFilename);
                String newFilename = UUID.randomUUID().toString() + "." + extension;
                
                Path filePath = uploadDir.resolve(newFilename);
                Files.copy(file.getInputStream(), filePath);
                
                Document document = Document.builder()
                    .nomFichier(newFilename)
                    .nomOriginal(originalFilename)
                    .typeDocument(typeDocument)
                    .mimeType(file.getContentType())
                    .tailleFichier(file.getSize())
                    .cheminStockage(filePath.toString())
                    .emailCooperant(email)
                    .dateUpload(LocalDateTime.now())
                    .statut(Document.StatutDocument.EN_ATTENTE)
                    .build();
                
                savedDocuments.add(documentRepository.save(document));
                log.info("Document uploaded: {} for {}", originalFilename, email);
            }
        } catch (IOException e) {
            log.error("Error uploading documents: {}", e.getMessage());
            throw new RuntimeException("Erreur lors de l'upload des documents", e);
        }
        
        return savedDocuments;
    }
    
    public List<Document> getDocumentsByEmail(String email) {
        return documentRepository.findByEmailCooperant(email);
    }
    
    public List<Document> getDocumentsByCooperantId(Long cooperantId) {
        return documentRepository.findByCooperantId(cooperantId);
    }
    
    public List<Document> getPendingDocuments() {
        return documentRepository.findByStatut(Document.StatutDocument.EN_ATTENTE);
    }
    
    public List<Document> getAllDocuments() {
        return documentRepository.findAll();
    }
    
    public Document validerDocument(Long documentId) {
        Document doc = documentRepository.findById(documentId)
            .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        doc.setStatut(Document.StatutDocument.VALIDE);
        return documentRepository.save(doc);
    }
    
    public Document rejeterDocument(Long documentId) {
        Document doc = documentRepository.findById(documentId)
            .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        doc.setStatut(Document.StatutDocument.REJETE);
        return documentRepository.save(doc);
    }
    
    public byte[] getDocumentContent(Long documentId) throws IOException {
        Document doc = documentRepository.findById(documentId)
            .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        return Files.readAllBytes(Paths.get(doc.getCheminStockage()));
    }
    
    public void deleteDocument(Long documentId) throws IOException {
        Document doc = documentRepository.findById(documentId)
            .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        Files.deleteIfExists(Paths.get(doc.getCheminStockage()));
        documentRepository.delete(doc);
    }
    
    private String getFileExtension(String filename) {
        if (filename == null || !filename.contains(".")) {
            return "bin";
        }
        return filename.substring(filename.lastIndexOf(".") + 1);
    }
}
