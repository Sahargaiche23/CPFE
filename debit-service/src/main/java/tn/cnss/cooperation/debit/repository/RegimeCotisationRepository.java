package tn.cnss.cooperation.debit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.debit.entity.RegimeCotisation;

import java.util.List;
import java.util.Optional;

@Repository
public interface RegimeCotisationRepository extends JpaRepository<RegimeCotisation, Long> {
    
    List<RegimeCotisation> findByActifTrueOrderByOrdreAsc();
    
    Optional<RegimeCotisation> findByCode(String code);
    
    boolean existsByCode(String code);
}
