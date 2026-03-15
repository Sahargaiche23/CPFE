package tn.cnss.cooperation.file.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.cooperation.file.entity.GedDocument;
import tn.cnss.cooperation.file.repository.GedDocumentRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class GedService {
    
    private final GedDocumentRepository documentRepository;
    
    @Value("${ged.upload.path:/opt/cnss/ged}")
    private String uploadPath;
    
    public List<GedDocument> getAllDocuments() {
        return documentRepository.findAllByOrderByDateCreationDesc();
    }
    
    public List<GedDocument> searchDocuments(String search, String categorie) {
        if (search != null && !search.isEmpty() && categorie != null && !categorie.isEmpty()) {
            return documentRepository.searchByCategorieAndTerm(categorie, search);
        } else if (search != null && !search.isEmpty()) {
            return documentRepository.searchByTitreOrNom(search);
        } else if (categorie != null && !categorie.isEmpty()) {
            return documentRepository.findByCategorie(categorie);
        }
        return getAllDocuments();
    }
    
    public Optional<GedDocument> getById(Long id) {
        return documentRepository.findById(id);
    }
    
    public GedDocument uploadDocument(MultipartFile file, String titre, String description, 
                                       String categorie, List<String> tags, String creePar) throws IOException {
        Path uploadDir = Paths.get(uploadPath);
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
        
        String originalFilename = file.getOriginalFilename();
        String extension = "";
        if (originalFilename != null && originalFilename.contains(".")) {
            extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        }
        String uniqueFilename = UUID.randomUUID().toString() + extension;
        Path filePath = uploadDir.resolve(uniqueFilename);
        
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        
        GedDocument document = GedDocument.builder()
                .titre(titre != null && !titre.isEmpty() ? titre : originalFilename)
                .description(description)
                .fichierNom(originalFilename)
                .fichierType(file.getContentType())
                .fichierTaille(file.getSize())
                .cheminFichier(filePath.toString())
                .categorie(categorie != null ? categorie : "AUTRE")
                .tags(tags != null ? tags : List.of())
                .creePar(creePar != null ? creePar : "system")
                .build();
        
        log.info("Document uploadé: {} par {}", document.getTitre(), creePar);
        return documentRepository.save(document);
    }
    
    public void deleteDocument(Long id) throws IOException {
        Optional<GedDocument> docOpt = documentRepository.findById(id);
        if (docOpt.isPresent()) {
            GedDocument doc = docOpt.get();
            Path filePath = Paths.get(doc.getCheminFichier());
            if (Files.exists(filePath)) {
                Files.delete(filePath);
            }
            documentRepository.delete(doc);
            log.info("Document supprimé: {}", doc.getTitre());
        }
    }
    
    public GedDocument updateDocument(Long id, String titre, String description, String categorie, List<String> tags) {
        GedDocument doc = documentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        
        if (titre != null) doc.setTitre(titre);
        if (description != null) doc.setDescription(description);
        if (categorie != null) doc.setCategorie(categorie);
        if (tags != null) doc.setTags(tags);
        
        return documentRepository.save(doc);
    }
    
    public byte[] downloadDocument(Long id) throws IOException {
        GedDocument doc = documentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Document non trouvé"));
        Path filePath = Paths.get(doc.getCheminFichier());
        return Files.readAllBytes(filePath);
    }
    
    public GedDocument save(GedDocument doc) {
        return documentRepository.save(doc);
    }
    
    public List<GedDocument> getChildren(Long parentId) {
        return documentRepository.findByParentId(parentId);
    }
    
    public GedDocument createFolder(String titre, String description, String categorie, List<String> tags, String creePar) {
        GedDocument folder = GedDocument.builder()
                .titre(titre)
                .description(description)
                .fichierNom(titre)
                .fichierType("folder")
                .fichierTaille(0L)
                .cheminFichier("folder")
                .categorie(categorie != null ? categorie : "AUTRE")
                .tags(tags != null ? tags : List.of())
                .creePar(creePar != null ? creePar : "system")
                .build();
        log.info("Dossier créé: {} par {}", titre, creePar);
        return documentRepository.save(folder);
    }
    
    public Long getTotalSize() {
        Long size = documentRepository.getTotalSize();
        return size != null ? size : 0L;
    }
    
    public List<Object[]> getCountByCategorie() {
        return documentRepository.countByCategorie();
    }

    public long countRootDocuments() {
        return documentRepository.countRootDocuments();
    }
}
