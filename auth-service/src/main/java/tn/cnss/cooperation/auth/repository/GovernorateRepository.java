package tn.cnss.cooperation.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.auth.entity.Governorate;

import java.util.List;

@Repository
public interface GovernorateRepository extends JpaRepository<Governorate, Integer> {
    
    List<Governorate> findAllByOrderByNameAsc();
    
    List<Governorate> findByRegionOrderByNameAsc(String region);
}
