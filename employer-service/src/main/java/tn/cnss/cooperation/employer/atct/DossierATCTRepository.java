package tn.cnss.cooperation.employer.atct;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DossierATCTRepository extends JpaRepository<DossierATCT, Long> {

    List<DossierATCT> findByStatutAndActifTrue(String statut);
    
    List<DossierATCT> findByActifTrueOrderByDateCreationDesc();
    
    Optional<DossierATCT> findByEmailAndActifTrue(String email);
    
    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.statut = 'EN_ATTENTE' ORDER BY d.dateCreation DESC")
    List<DossierATCT> findEnAttente();
    
    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.statut = 'VALIDE' AND d.documentsDeposes = true AND d.affiliationId IS NULL")
    List<DossierATCT> findPourAffiliation();
    
    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND " +
           "(LOWER(d.nomFr) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(d.prenomFr) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(d.email) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "d.numSecuSociale LIKE CONCAT('%', :query, '%'))")
    List<DossierATCT> search(String query);
    
    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true")
    long countTotal();
    
    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true AND d.statut = 'EN_ATTENTE'")
    long countEnAttente();
    
    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true AND d.statut = 'VALIDE'")
    long countValides();
    
    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true AND d.statut = 'REJETE'")
    long countRejetes();

    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true AND d.statut = 'RECLAMATION'")
    long countReclamations();
}
