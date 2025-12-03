package tn.cnss.cooperation.debit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.cnss.cooperation.debit.entity.Debit;
import java.util.List;
import java.util.Optional;

public interface DebitRepository extends JpaRepository<Debit, Long> {
    Optional<Debit> findByNumAffiliationAndTrimestre(String numAffiliation, String trimestre);
    List<Debit> findByNumAffiliation(String numAffiliation);
    List<Debit> findByPaye(Boolean paye);
}
