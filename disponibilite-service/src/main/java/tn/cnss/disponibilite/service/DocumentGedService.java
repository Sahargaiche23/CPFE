package tn.cnss.disponibilite.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.disponibilite.entity.AgentPublic;
import tn.cnss.disponibilite.entity.DocumentGed;
import tn.cnss.disponibilite.repository.AgentPublicRepository;
import tn.cnss.disponibilite.repository.DocumentGedRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class DocumentGedService {

    private final DocumentGedRepository repository;
    private final AgentPublicRepository agentRepository;

    @Value("${documents.upload.path:/tmp/cnss-disponibilite-docs}")
    private String uploadPath;

    public DocumentGedService(DocumentGedRepository repository, AgentPublicRepository agentRepository) {
        this.repository = repository;
        this.agentRepository = agentRepository;
    }

    public List<DocumentGed> findByAgent(Long agentId) {
        return repository.findByAgentPublicId(agentId);
    }

    public Optional<DocumentGed> findById(Long id) {
        return repository.findById(id);
    }

    public DocumentGed upload(Long agentId, String typeDocument, MultipartFile file) throws IOException {
        AgentPublic agent = agentRepository.findById(agentId)
                .orElseThrow(() -> new RuntimeException("Agent non trouvé: " + agentId));

        Path uploadDir = Paths.get(uploadPath, String.valueOf(agentId));
        Files.createDirectories(uploadDir);

        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
        Path filePath = uploadDir.resolve(filename);
        Files.write(filePath, file.getBytes());

        DocumentGed doc = new DocumentGed();
        doc.setAgentPublic(agent);
        doc.setTypeDocument(DocumentGed.TypeDocument.valueOf(typeDocument));
        doc.setNomFichier(file.getOriginalFilename());
        doc.setCheminFichier(filePath.toString());
        doc.setContentType(file.getContentType());
        doc.setTaille(file.getSize());

        return repository.save(doc);
    }

    public byte[] download(Long id) throws IOException {
        DocumentGed doc = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Document non trouvé: " + id));
        return Files.readAllBytes(Paths.get(doc.getCheminFichier()));
    }

    public void delete(Long id) throws IOException {
        DocumentGed doc = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Document non trouvé: " + id));
        Path path = Paths.get(doc.getCheminFichier());
        if (Files.exists(path)) Files.delete(path);
        repository.deleteById(id);
    }
}
