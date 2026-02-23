package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.AgentPublic;

import java.util.List;
import java.util.Optional;

@Repository
public interface AgentPublicRepository extends JpaRepository<AgentPublic, Long> {
    Optional<AgentPublic> findByNumInscription(String numInscription);
    List<AgentPublic> findByInstitutionId(Long institutionId);
    List<AgentPublic> findByNomFrContainingIgnoreCaseOrPrenomFrContainingIgnoreCase(String nom, String prenom);
    List<AgentPublic> findByActifTrue();
}
