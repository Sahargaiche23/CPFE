package tn.cnss.cooperation.employer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.employer.entity.Cooperant;

import java.util.List;
import java.util.Optional;

/**
 * Repository pour les Coopérants
 */
@Repository
public interface CooperantRepository extends JpaRepository<Cooperant, Long> {
    
    // Recherche par matricule complet
    Optional<Cooperant> findByMatriculeAndCle(Long matricule, Integer cle);
    
    // Recherche par numéro pièce d'identité
    Optional<Cooperant> findByNumPieceIdentite(String numPieceIdentite);
    
    // Recherche par email
    Optional<Cooperant> findByEmail(String email);
    
    // Liste des coopérants actifs
    List<Cooperant> findByActifTrue();
    
    // Liste par régime
    List<Cooperant> findByCodeRegimeAndActifTrue(String codeRegime);
    
    // Liste par statut de validation
    List<Cooperant> findByStatutValidationAndActifTrue(String statutValidation);
    
    // Liste en attente de validation
    @Query("SELECT c FROM Cooperant c WHERE c.statutValidation = 'EN_ATTENTE' AND c.actif = true ORDER BY c.createdAt DESC")
    List<Cooperant> findPendingValidation();
    
    // Recherche par nom (FR ou AR)
    @Query("SELECT c FROM Cooperant c WHERE c.actif = true AND " +
           "(LOWER(c.nomFr) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "LOWER(c.prenomFr) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
           "c.nomAr LIKE CONCAT('%', :search, '%') OR " +
           "c.prenomAr LIKE CONCAT('%', :search, '%') OR " +
           "CAST(c.matricule AS string) LIKE CONCAT('%', :search, '%'))")
    List<Cooperant> searchByName(@Param("search") String search);
    
    // Prochain matricule disponible
    @Query("SELECT COALESCE(MAX(c.matricule), 0) + 1 FROM Cooperant c")
    Long getNextMatricule();
    
    // Compter par régime
    @Query("SELECT c.codeRegime, COUNT(c) FROM Cooperant c WHERE c.actif = true GROUP BY c.codeRegime")
    List<Object[]> countByRegime();
    
    // Compter par statut validation
    @Query("SELECT c.statutValidation, COUNT(c) FROM Cooperant c WHERE c.actif = true GROUP BY c.statutValidation")
    List<Object[]> countByStatutValidation();
}
