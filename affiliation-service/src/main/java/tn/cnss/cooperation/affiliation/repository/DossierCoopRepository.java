package tn.cnss.cooperation.affiliation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.affiliation.entity.DossierCoop;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface DossierCoopRepository extends JpaRepository<DossierCoop, Long> {
    
    /**
     * Trouve tous les dossiers d'un employeur
     */
    List<DossierCoop> findByEmpMatAndEmpCle(Long empMat, Integer empCle);
    
    /**
     * Trouve tous les dossiers d'un assuré
     */
    List<DossierCoop> findByAssureMatAndAssureCle(Long assureMat, Integer assureCle);
    
    /**
     * Trouve un dossier par numéro d'affiliation
     */
    Optional<DossierCoop> findByDcoNumAffiliationAndDcoClefAffiliation(Long numAff, Integer cleAff);
    
    /**
     * Trouve tous les dossiers actifs (sans date fin ou date fin > aujourd'hui)
     */
    @Query("SELECT d FROM DossierCoop d WHERE d.dcoDateFin IS NULL OR d.dcoDateFin > :date")
    List<DossierCoop> findDossiersActifs(@Param("date") LocalDate date);
    
    /**
     * Trouve tous les dossiers d'un pays spécifique
     */
    List<DossierCoop> findByPaysCode(Integer paysCode);
    
    /**
     * Trouve tous les dossiers avec salaire validé
     */
    List<DossierCoop> findByDcoSalaireId(String salaireId);
    
    /**
     * Compte le nombre de dossiers actifs pour un employeur
     */
    @Query("SELECT COUNT(d) FROM DossierCoop d WHERE d.empMat = :empMat AND d.empCle = :empCle " +
           "AND (d.dcoDateFin IS NULL OR d.dcoDateFin > :date)")
    long countDossiersActifsEmployeur(@Param("empMat") Long empMat, 
                                       @Param("empCle") Integer empCle,
                                       @Param("date") LocalDate date);
    
    /**
     * Trouve les dossiers commencés dans une période donnée
     */
    @Query("SELECT d FROM DossierCoop d WHERE d.dcoDateDebut BETWEEN :dateDebut AND :dateFin")
    List<DossierCoop> findDossiersParPeriode(@Param("dateDebut") LocalDate dateDebut,
                                               @Param("dateFin") LocalDate dateFin);
    
    /**
     * Vérifie si un dossier existe déjà pour un assuré et un employeur
     */
    boolean existsByEmpMatAndEmpCleAndAssureMatAndAssureCleAndDcoDateDebutAfter(
        Long empMat, Integer empCle, Long assureMat, Integer assureCle, LocalDate dateDebut);
}
