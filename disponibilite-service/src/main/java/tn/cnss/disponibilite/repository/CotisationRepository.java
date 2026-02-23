package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.Cotisation;

import java.util.List;
import java.util.Optional;

@Repository
public interface CotisationRepository extends JpaRepository<Cotisation, Long> {
    List<Cotisation> findByAgentPublicId(Long agentPublicId);
    List<Cotisation> findByInstitutionId(Long institutionId);
    List<Cotisation> findByAnnee(Integer annee);
    List<Cotisation> findByAnneeAndTrimestre(Integer annee, Integer trimestre);
    List<Cotisation> findByInstitutionIdAndAnnee(Long institutionId, Integer annee);
    Optional<Cotisation> findByAgentPublicIdAndTrimestreAndAnnee(Long agentPublicId, Integer trimestre, Integer annee);
    List<Cotisation> findByStatut(Cotisation.StatutCotisation statut);
}
