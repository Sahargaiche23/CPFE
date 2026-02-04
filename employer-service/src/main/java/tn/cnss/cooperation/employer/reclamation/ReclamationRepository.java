package tn.cnss.cooperation.employer.reclamation;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReclamationRepository extends JpaRepository<Reclamation, Long> {
    List<Reclamation> findByEmailCooperantOrderByDateCreationDesc(String email);
    List<Reclamation> findByStatutOrderByDateCreationDesc(String statut);
    List<Reclamation> findByEmailCooperantAndStatut(String email, String statut);
}
