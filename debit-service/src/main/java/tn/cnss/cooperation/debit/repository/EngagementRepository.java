package tn.cnss.cooperation.debit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.debit.entity.Engagement;
import tn.cnss.cooperation.debit.entity.EngagementId;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface EngagementRepository extends JpaRepository<Engagement, EngagementId> {
    
    /**
     * Trouve tous les engagements d'un employeur
     */
    List<Engagement> findByEmpMatAndEmpCle(Long empMat, Integer empCle);
    
    /**
     * Trouve tous les engagements d'un dossier
     */
    List<Engagement> findByEmpMatAndEmpCleAndDcoDateDebut(Long empMat, Integer empCle, LocalDate dcoDateDebut);
    
    /**
     * Trouve tous les engagements en cours
     */
    List<Engagement> findByEngSituation(Integer situation);
    
    /**
     * Trouve tous les engagements non validés
     */
    List<Engagement> findByFlgValid(Integer valid);
    
    /**
     * Trouve le dernier numéro d'engagement
     */
    @Query("SELECT MAX(e.engNum) FROM Engagement e")
    Optional<Long> findMaxEngagementNumber();
    
    /**
     * Compte les engagements d'un employeur par situation
     */
    @Query("SELECT COUNT(e) FROM Engagement e WHERE e.empMat = :empMat AND e.empCle = :empCle AND e.engSituation = :situation")
    long countByEmployeurAndSituation(@Param("empMat") Long empMat, 
                                      @Param("empCle") Integer empCle,
                                      @Param("situation") Integer situation);
    
    /**
     * Trouve les engagements en cours d'un employeur
     */
    @Query("SELECT e FROM Engagement e WHERE e.empMat = :empMat AND e.empCle = :empCle AND e.engSituation = 1")
    List<Engagement> findEngagementsEnCoursEmployeur(@Param("empMat") Long empMat, @Param("empCle") Integer empCle);
    
    /**
     * Vérifie si un engagement existe pour un dossier
     */
    boolean existsByEmpMatAndEmpCleAndDcoDateDebut(Long empMat, Integer empCle, LocalDate dcoDateDebut);
}
