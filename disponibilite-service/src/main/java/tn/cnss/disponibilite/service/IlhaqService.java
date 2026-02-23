package tn.cnss.disponibilite.service;

import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.entity.Ilhaq;
import tn.cnss.disponibilite.repository.IlhaqRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class IlhaqService {

    private final IlhaqRepository repository;

    public IlhaqService(IlhaqRepository repository) {
        this.repository = repository;
    }

    public List<Ilhaq> findByAgent(Long agentId) {
        return repository.findByAgentPublicId(agentId);
    }

    public List<Ilhaq> findByInstitution(Long institutionId) {
        return repository.findByInstitutionId(institutionId);
    }

    public Optional<Ilhaq> findById(Long id) {
        return repository.findById(id);
    }

    public List<Ilhaq> findActiveByAgentAndDate(Long agentId, LocalDate date) {
        return repository.findActiveByAgentAndDate(agentId, date);
    }

    public Ilhaq save(Ilhaq ilhaq) {
        // Valider: dateFin > dateDebut
        if (ilhaq.getDateFin() != null && !ilhaq.getDateFin().isAfter(ilhaq.getDateDebut())) {
            throw new RuntimeException("La date de fin doit être postérieure à la date de début");
        }
        // Vérifier chevauchement
        List<Ilhaq> existing = repository.findByAgentPublicId(ilhaq.getAgentPublic().getId());
        for (Ilhaq ex : existing) {
            if (ilhaq.getId() != null && ilhaq.getId().equals(ex.getId())) continue;
            if (datesOverlap(ilhaq.getDateDebut(), ilhaq.getDateFin(), ex.getDateDebut(), ex.getDateFin())) {
                throw new RuntimeException("Les dates d'ilhaq ne doivent pas se chevaucher");
            }
        }
        return repository.save(ilhaq);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    private boolean datesOverlap(LocalDate s1, LocalDate e1, LocalDate s2, LocalDate e2) {
        LocalDate end1 = e1 != null ? e1 : LocalDate.of(9999, 12, 31);
        LocalDate end2 = e2 != null ? e2 : LocalDate.of(9999, 12, 31);
        return !s1.isAfter(end2) && !s2.isAfter(end1);
    }
}
