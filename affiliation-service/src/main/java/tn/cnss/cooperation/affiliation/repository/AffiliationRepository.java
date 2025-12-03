package tn.cnss.cooperation.affiliation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.cnss.cooperation.affiliation.entity.Affiliation;
import java.util.Optional;

public interface AffiliationRepository extends JpaRepository<Affiliation, Long> {
    Optional<Affiliation> findByNumAffiliation(String numAffiliation);
}
