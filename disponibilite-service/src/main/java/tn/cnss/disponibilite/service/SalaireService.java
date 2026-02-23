package tn.cnss.disponibilite.service;

import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.entity.Salaire;
import tn.cnss.disponibilite.repository.SalaireRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class SalaireService {

    private final SalaireRepository repository;

    public SalaireService(SalaireRepository repository) {
        this.repository = repository;
    }

    public List<Salaire> findByAgent(Long agentId) {
        return repository.findByAgentPublicIdOrderByDateEffetDesc(agentId);
    }

    public Optional<Salaire> findSalaireApplicable(Long agentId, LocalDate date) {
        return repository.findSalaireApplicable(agentId, date);
    }

    public Salaire save(Salaire salaire) {
        return repository.save(salaire);
    }

    public Optional<Salaire> findById(Long id) {
        return repository.findById(id);
    }

    public Salaire update(Long id, Salaire updated) {
        return repository.findById(id).map(s -> {
            s.setSalaireMensuel(updated.getSalaireMensuel());
            s.setDateEffet(updated.getDateEffet());
            return repository.save(s);
        }).orElseThrow(() -> new RuntimeException("Salaire not found: " + id));
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
