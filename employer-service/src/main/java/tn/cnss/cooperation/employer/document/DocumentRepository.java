package tn.cnss.cooperation.employer.document;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Long> {
    
    List<Document> findByEmailCooperant(String email);
    
    List<Document> findByCooperantId(Long cooperantId);
    
    List<Document> findByTypeDocument(String typeDocument);
    
    List<Document> findByStatut(Document.StatutDocument statut);
    
    List<Document> findByEmailCooperantAndTypeDocument(String email, String typeDocument);
}
