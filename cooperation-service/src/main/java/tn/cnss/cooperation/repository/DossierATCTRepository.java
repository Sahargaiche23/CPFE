package tn.cnss.cooperation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.entity.DossierATCT;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface DossierATCTRepository extends JpaRepository<DossierATCT, Long> {

    List<DossierATCT> findByActifTrueOrderByDateCreationDesc();

    List<DossierATCT> findByStatutAndActifTrueOrderByDateCreationDesc(String statut);

    List<DossierATCT> findByStatutInAndActifTrueOrderByDateCreationDesc(List<String> statuts);

    Optional<DossierATCT> findByEmailAndActifTrue(String email);

    Optional<DossierATCT> findByNumSecuSocialeAndActifTrue(String numSecuSociale);

    List<DossierATCT> findByCodeRegimeAndActifTrueOrderByDateCreationDesc(String codeRegime);

    List<DossierATCT> findByValidePar(Long agentId);

    List<DossierATCT> findByCreePar(Long agentId);

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.statut = 'EN_ATTENTE' ORDER BY d.dateCreation ASC")
    List<DossierATCT> findDossiersEnAttente();

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.statut = 'VALIDE' AND d.emailEnvoye = false")
    List<DossierATCT> findDossiersValidesNonNotifies();

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.statut = 'VALIDE' AND d.documentsDeposes = true AND d.affiliationId IS NULL")
    List<DossierATCT> findDossiersPourAffiliation();

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND " +
           "(LOWER(d.nomFr) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(d.prenomFr) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "d.email LIKE CONCAT('%', :query, '%') OR " +
           "d.numSecuSociale LIKE CONCAT('%', :query, '%'))")
    List<DossierATCT> searchDossiers(@Param("query") String query);

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.paysCode = :paysCode")
    List<DossierATCT> findByPaysDetachement(@Param("paysCode") Integer paysCode);

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND " +
           "d.dateDebutDetachement >= :dateDebut AND d.dateDebutDetachement <= :dateFin")
    List<DossierATCT> findByPeriodeDetachement(@Param("dateDebut") LocalDate dateDebut, 
                                                @Param("dateFin") LocalDate dateFin);

    @Query("SELECT COUNT(d) FROM DossierATCT d WHERE d.actif = true AND d.statut = :statut")
    Long countByStatut(@Param("statut") String statut);

    @Query("SELECT d.statut, COUNT(d) FROM DossierATCT d WHERE d.actif = true GROUP BY d.statut")
    List<Object[]> getStatsByStatut();

    @Query("SELECT d.codeRegime, COUNT(d) FROM DossierATCT d WHERE d.actif = true GROUP BY d.codeRegime")
    List<Object[]> getStatsByRegime();

    @Query("SELECT d FROM DossierATCT d WHERE d.actif = true AND d.matriculeEmployeur = :matricule AND d.cleEmployeur = :cle")
    List<DossierATCT> findByEmployeur(@Param("matricule") Long matricule, @Param("cle") Integer cle);
}
