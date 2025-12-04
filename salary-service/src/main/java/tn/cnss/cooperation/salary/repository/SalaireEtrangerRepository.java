package tn.cnss.cooperation.salary.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.salary.entity.SalaireEtranger;
import tn.cnss.cooperation.salary.entity.SalaireEtrangerId;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Repository pour la table SALAIRE_ETRANGER
 * Clé composée : (EMP_MAT, EMP_CLE, DCO_DTDEB, SLE_DATE)
 */
@Repository
public interface SalaireEtrangerRepository extends JpaRepository<SalaireEtranger, SalaireEtrangerId> {
    
    /**
     * Trouve tous les salaires d'un dossier
     */
    List<SalaireEtranger> findByEmpMatAndEmpCleAndDcoDateDebut(Long empMat, Integer empCle, LocalDate dcoDateDebut);
    
    /**
     * Trouve le dernier salaire d'un dossier (ordre décroissant par date)
     */
    Optional<SalaireEtranger> findFirstByEmpMatAndEmpCleAndDcoDateDebutOrderBySleDateDesc(
            Long empMat, Integer empCle, LocalDate dcoDateDebut);
    
    /**
     * Trouve tous les salaires d'un employeur
     */
    List<SalaireEtranger> findByEmpMatAndEmpCle(Long empMat, Integer empCle);
    
    /**
     * Trouve les salaires d'un dossier dans une période
     */
    @Query("SELECT s FROM SalaireEtranger s WHERE s.empMat = :empMat AND s.empCle = :empCle " +
           "AND s.dcoDateDebut = :dcoDateDebut AND s.sleDate BETWEEN :dateDebut AND :dateFin " +
           "ORDER BY s.sleDate DESC")
    List<SalaireEtranger> findByDossierAndPeriode(
            @Param("empMat") Long empMat,
            @Param("empCle") Integer empCle,
            @Param("dcoDateDebut") LocalDate dcoDateDebut,
            @Param("dateDebut") LocalDate dateDebut,
            @Param("dateFin") LocalDate dateFin);
    
    /**
     * Vérifie si un salaire existe pour une date spécifique
     */
    boolean existsByEmpMatAndEmpCleAndDcoDateDebutAndSleDate(
            Long empMat, Integer empCle, LocalDate dcoDateDebut, LocalDate sleDate);
}
