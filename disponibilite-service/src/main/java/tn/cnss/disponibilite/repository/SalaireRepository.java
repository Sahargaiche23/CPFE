package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.Salaire;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface SalaireRepository extends JpaRepository<Salaire, Long> {
    List<Salaire> findByAgentPublicIdOrderByDateEffetDesc(Long agentPublicId);

    @Query("SELECT s FROM Salaire s WHERE s.agentPublic.id = :agentId AND s.dateEffet <= :date ORDER BY s.dateEffet DESC")
    List<Salaire> findApplicable(@Param("agentId") Long agentId, @Param("date") LocalDate date);

    default Optional<Salaire> findSalaireApplicable(Long agentId, LocalDate date) {
        List<Salaire> list = findApplicable(agentId, date);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }
}
