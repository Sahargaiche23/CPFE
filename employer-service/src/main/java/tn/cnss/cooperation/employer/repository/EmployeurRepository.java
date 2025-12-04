package tn.cnss.cooperation.employer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.employer.entity.Employeur;
import tn.cnss.cooperation.employer.entity.EmployeurId;

import java.util.List;

@Repository
public interface EmployeurRepository extends JpaRepository<Employeur, EmployeurId> {
    
    List<Employeur> findByRegime(String regime);
    
    List<Employeur> findByStatut(String statut);
    
    List<Employeur> findByPays(String pays);
    
    @Query("SELECT e FROM Employeur e WHERE " +
           "LOWER(e.nomCommercial) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "LOWER(e.raisonSociale) LIKE LOWER(CONCAT('%', :search, '%'))")
    List<Employeur> search(@Param("search") String search);
    
    // Compter les affiliations via une requête native
    @Query(value = "SELECT COUNT(*) FROM COPT.DOSSIER_COP WHERE EMP_MAT = :empMat AND EMP_CLE = :empCle", nativeQuery = true)
    Long countAffiliations(@Param("empMat") Long empMat, @Param("empCle") Integer empCle);
    
    // Trouver le matricule max pour auto-génération
    @Query("SELECT MAX(e.empMat) FROM Employeur e")
    Long findMaxEmpMat();
}
