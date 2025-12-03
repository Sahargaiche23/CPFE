package tn.cnss.cooperation.salary.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.salary.entity.SalaireEtranger;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface SalaireEtrangerRepository extends JpaRepository<SalaireEtranger, Long> {
    
    List<SalaireEtranger> findByMatricule(Long matricule);
    
    @Query("SELECT s FROM SalaireEtranger s WHERE s.matricule = :matricule " +
           "AND s.salaireDate >= :dateDebut AND s.salaireDate <= :dateFin " +
           "ORDER BY s.salaireDate DESC")
    List<SalaireEtranger> findByMatriculeAndPeriode(
            @Param("matricule") Long matricule,
            @Param("dateDebut") LocalDate dateDebut,
            @Param("dateFin") LocalDate dateFin);
    
    @Query("SELECT s FROM SalaireEtranger s WHERE s.matricule = :matricule " +
           "ORDER BY s.salaireDate DESC")
    Optional<SalaireEtranger> findLastSalaryByMatricule(@Param("matricule") Long matricule);
}
