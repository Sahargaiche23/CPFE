package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.disponibilite.entity.TauxCotisation;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface TauxCotisationRepository extends JpaRepository<TauxCotisation, Long> {

    @Query("SELECT t FROM TauxCotisation t WHERE t.dateDebut <= :date AND (t.dateFin IS NULL OR t.dateFin >= :date)")
    List<TauxCotisation> findByDate(@Param("date") LocalDate date);

    default Optional<TauxCotisation> findApplicable(LocalDate date) {
        List<TauxCotisation> list = findByDate(date);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }
}
