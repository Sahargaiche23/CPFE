package tn.cnss.cooperation.debit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.cnss.cooperation.debit.entity.Debit;
import java.util.List;
import java.util.Optional;

public interface DebitRepository extends JpaRepository<Debit, Long> {
    Optional<Debit> findByNumAffiliationAndTrimestre(String numAffiliation, String trimestre);
    List<Debit> findByNumAffiliation(String numAffiliation);
    List<Debit> findByPaye(Boolean paye);
    List<Debit> findByCooperantId(Long cooperantId);
    List<Debit> findByCooperantIdAndPaye(Long cooperantId, Boolean paye);
    boolean existsByCooperantIdAndTrimestre(Long cooperantId, String trimestre);
    
    @org.springframework.data.jpa.repository.Query("SELECT d FROM Debit d WHERE d.paye = false AND d.rappelEnvoye = false")
    List<Debit> findUnpaidWithoutReminder();
    
    @org.springframework.data.jpa.repository.Query("SELECT d FROM Debit d WHERE d.cooperantId = :cooperantId AND d.paye = false ORDER BY d.annee, d.trimestre")
    List<Debit> findUnpaidByCooperant(@org.springframework.data.repository.query.Param("cooperantId") Long cooperantId);
}
