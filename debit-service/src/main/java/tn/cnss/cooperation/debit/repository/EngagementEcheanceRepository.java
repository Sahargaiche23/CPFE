package tn.cnss.cooperation.debit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.debit.entity.EngagementEcheance;
import tn.cnss.cooperation.debit.entity.EngagementEcheanceId;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface EngagementEcheanceRepository extends JpaRepository<EngagementEcheance, EngagementEcheanceId> {
    
    /**
     * Trouve toutes les échéances d'un engagement
     */
    List<EngagementEcheance> findByEngNumAndEmpMatAndEmpCleAndDcoDateDebut(
        Long engNum, Long empMat, Integer empCle, LocalDate dcoDateDebut);
    
    /**
     * Trouve toutes les échéances d'un engagement
     */
    List<EngagementEcheance> findByEngNum(Long engNum);
    
    /**
     * Trouve la première échéance par engNum (pour édition)
     */
    @Query("SELECT e FROM EngagementEcheance e WHERE e.engNum = :engNum ORDER BY e.enoNumEng ASC")
    List<EngagementEcheance> findFirstByEngNum(@Param("engNum") Long engNum);
    
    /**
     * Supprime toutes les échéances d'un engagement
     */
    void deleteByEngNum(Long engNum);
    
    /**
     * Trouve les échéances non payées
     */
    List<EngagementEcheance> findByEnoSituation(Integer situation);
    
    /**
     * Trouve les échéances d'une période
     */
    @Query("SELECT e FROM EngagementEcheance e WHERE e.enoDateEcheance BETWEEN :dateDebut AND :dateFin")
    List<EngagementEcheance> findEcheancesByPeriode(@Param("dateDebut") LocalDate dateDebut,
                                                      @Param("dateFin") LocalDate dateFin);
    
    /**
     * Trouve les échéances d'un trimestre spécifique
     */
    @Query("SELECT e FROM EngagementEcheance e WHERE " +
           "EXTRACT(YEAR FROM e.enoDateEcheance) = :annee AND " +
           "EXTRACT(MONTH FROM e.enoDateEcheance) BETWEEN :moisDebut AND :moisFin")
    List<EngagementEcheance> findEcheancesByTrimestre(@Param("annee") int annee,
                                                        @Param("moisDebut") int moisDebut,
                                                        @Param("moisFin") int moisFin);
    
    /**
     * Trouve les échéances en retard (non payées et date dépassée)
     */
    @Query("SELECT e FROM EngagementEcheance e WHERE e.enoSituation = 1 AND e.enoDateEcheance < :dateRef")
    List<EngagementEcheance> findEcheancesEnRetard(@Param("dateRef") LocalDate dateRef);
    
    /**
     * Calcule le total des montants dus pour un engagement
     */
    @Query("SELECT COALESCE(SUM(e.enoMontantEcheance), 0) FROM EngagementEcheance e " +
           "WHERE e.engNum = :engNum AND e.enoSituation = 1")
    BigDecimal calculerMontantDuEngagement(@Param("engNum") Long engNum);
    
    /**
     * Trouve les échéances d'un employeur pour une période
     */
    @Query("SELECT e FROM EngagementEcheance e WHERE e.empMat = :empMat AND e.empCle = :empCle " +
           "AND e.enoDateEcheance BETWEEN :dateDebut AND :dateFin")
    List<EngagementEcheance> findEcheancesEmployeurPeriode(@Param("empMat") Long empMat,
                                                             @Param("empCle") Integer empCle,
                                                             @Param("dateDebut") LocalDate dateDebut,
                                                             @Param("dateFin") LocalDate dateFin);
    
    /**
     * Compte les échéances payées d'un engagement
     */
    @Query("SELECT COUNT(e) FROM EngagementEcheance e WHERE e.engNum = :engNum AND e.enoSituation = 2")
    long countEcheancesPayees(@Param("engNum") Long engNum);
}
