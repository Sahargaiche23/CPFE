package tn.cnss.cooperation.employer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.employer.entity.DossierCoop;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface DossierCoopRepository extends JpaRepository<DossierCoop, Long> {
    
    Optional<DossierCoop> findByNumAffiliation(String numAffiliation);
    
    List<DossierCoop> findByMatricule(Long matricule);
    
    List<DossierCoop> findByMatriculeAndRegime(Long matricule, String regime);
    
    @Query("SELECT d FROM DossierCoop d WHERE d.matricule = :matricule " +
           "AND d.regime = :regime AND d.dateEffet >= :annee AND d.actif = true")
    List<DossierCoop> findByMatriculeAndRegimeAndAnnee(
            @Param("matricule") Long matricule,
            @Param("regime") String regime,
            @Param("annee") LocalDate annee);
    
    @Query("SELECT d FROM DossierCoop d WHERE d.paysDetachement = :pays AND d.actif = true")
    List<DossierCoop> findByPaysDetachement(@Param("pays") String pays);
    
    boolean existsByMatriculeAndRegimeAndDateEffet(Long matricule, String regime, LocalDate dateEffet);
}
