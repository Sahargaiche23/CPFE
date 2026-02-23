package tn.cnss.disponibilite.service;

import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.entity.TauxCotisation;
import tn.cnss.disponibilite.repository.TauxCotisationRepository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@Service
public class TauxCotisationService {

    private final TauxCotisationRepository repository;

    public TauxCotisationService(TauxCotisationRepository repository) {
        this.repository = repository;
    }

    @PostConstruct
    public void initDefaultTaux() {
        if (repository.count() == 0) {
            // Historique des taux selon la Loi 16/2003
            saveTaux("2007-07-01", "2008-06-30", "16.57", "7.75", null, null);
            saveTaux("2008-07-01", "2009-06-30", "16.57", "8.25", null, null);
            saveTaux("2009-07-01", "2010-06-30", "16.57", "8.75", null, null);
            saveTaux("2010-07-01", "2011-06-30", "16.57", "9.18", null, null);
            saveTaux("2011-07-01", null, "17.07", "9.68", null, null);
        }
    }

    private void saveTaux(String debut, String fin, String t137, String t138, String t197, String t198) {
        TauxCotisation t = new TauxCotisation();
        t.setDateDebut(LocalDate.parse(debut));
        t.setDateFin(fin != null ? LocalDate.parse(fin) : null);
        t.setTauxCode137(new BigDecimal(t137));
        t.setTauxCode138(new BigDecimal(t138));
        t.setTauxCode197(t197 != null ? new BigDecimal(t197) : null);
        t.setTauxCode198(t198 != null ? new BigDecimal(t198) : null);
        repository.save(t);
    }

    public Optional<TauxCotisation> getTauxApplicable(LocalDate date) {
        return repository.findApplicable(date);
    }

    public java.util.List<TauxCotisation> getAll() {
        return repository.findAll();
    }
}
