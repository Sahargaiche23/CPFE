package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.DocumentGed;

import java.util.List;

@Repository
public interface DocumentGedRepository extends JpaRepository<DocumentGed, Long> {
    List<DocumentGed> findByAgentPublicId(Long agentPublicId);
    List<DocumentGed> findByAgentPublicIdAndTypeDocument(Long agentPublicId, DocumentGed.TypeDocument typeDocument);
}
