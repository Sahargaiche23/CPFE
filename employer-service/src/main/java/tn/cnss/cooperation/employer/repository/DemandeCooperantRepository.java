package tn.cnss.cooperation.employer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.employer.entity.DemandeCooperant;

import java.util.List;

@Repository
public interface DemandeCooperantRepository extends JpaRepository<DemandeCooperant, Long> {

    List<DemandeCooperant> findByCooperantIdOrderByCreatedAtDesc(Long cooperantId);

    List<DemandeCooperant> findByStatutOrderByCreatedAtDesc(String statut);

    List<DemandeCooperant> findByTypeDemandeOrderByCreatedAtDesc(String typeDemande);

    List<DemandeCooperant> findByCooperantIdAndTypeDemande(Long cooperantId, String typeDemande);

    List<DemandeCooperant> findByStatutAndTypeDemandeOrderByCreatedAtDesc(String statut, String typeDemande);

    @Query("SELECT d FROM DemandeCooperant d ORDER BY d.createdAt DESC")
    List<DemandeCooperant> findAllOrderByCreatedAtDesc();

    @Query("SELECT d FROM DemandeCooperant d WHERE d.numAffiliation = :numAff ORDER BY d.createdAt DESC")
    List<DemandeCooperant> findByNumAffiliation(@Param("numAff") String numAffiliation);
}
