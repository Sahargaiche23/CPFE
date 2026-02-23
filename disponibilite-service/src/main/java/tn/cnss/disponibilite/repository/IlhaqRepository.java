package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.Ilhaq;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface IlhaqRepository extends JpaRepository<Ilhaq, Long> {
    List<Ilhaq> findByAgentPublicId(Long agentPublicId);
    List<Ilhaq> findByInstitutionId(Long institutionId);
    List<Ilhaq> findByAgentPublicIdAndActifTrue(Long agentPublicId);

    @Query("SELECT i FROM Ilhaq i WHERE i.agentPublic.id = :agentId AND i.dateDebut <= :date AND (i.dateFin IS NULL OR i.dateFin >= :date)")
    List<Ilhaq> findActiveByAgentAndDate(@Param("agentId") Long agentId, @Param("date") LocalDate date);
}
