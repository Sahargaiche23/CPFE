package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.Institution;

import java.util.List;
import java.util.Optional;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution, Long> {
    Optional<Institution> findByNumAffiliationAndBrancheSociale(String numAffiliation, String brancheSociale);
    List<Institution> findByNumAffiliation(String numAffiliation);
    List<Institution> findByRaisonSocialeContainingIgnoreCase(String raisonSociale);
    List<Institution> findByActifTrue();
}
