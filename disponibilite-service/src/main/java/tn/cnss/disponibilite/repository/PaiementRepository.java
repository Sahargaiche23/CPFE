package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.Paiement;

import java.util.List;

@Repository
public interface PaiementRepository extends JpaRepository<Paiement, Long> {
    List<Paiement> findByCotisationId(Long cotisationId);

    @Query("SELECT p FROM Paiement p WHERE p.cotisation.agentPublic.id = :agentId ORDER BY p.datePaiement DESC")
    List<Paiement> findByAgentPublicId(@Param("agentId") Long agentId);

    @Query("SELECT p FROM Paiement p WHERE p.cotisation.institution.id = :instId ORDER BY p.datePaiement DESC")
    List<Paiement> findByInstitutionId(@Param("instId") Long instId);
}
