package tn.cnss.disponibilite.service;

import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.entity.Institution;
import tn.cnss.disponibilite.repository.InstitutionRepository;

import java.util.List;
import java.util.Optional;

@Service
public class InstitutionService {

    private final InstitutionRepository repository;

    public InstitutionService(InstitutionRepository repository) {
        this.repository = repository;
    }

    public List<Institution> findAll() {
        return repository.findAll();
    }

    public Optional<Institution> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<Institution> findByAffiliation(String numAffiliation, String branche) {
        return repository.findByNumAffiliationAndBrancheSociale(numAffiliation, branche);
    }

    public List<Institution> findByNumAffiliation(String numAffiliation) {
        return repository.findByNumAffiliation(numAffiliation);
    }

    public List<Institution> search(String query) {
        return repository.findByRaisonSocialeContainingIgnoreCase(query);
    }

    public Institution save(Institution institution) {
        return repository.save(institution);
    }

    public Institution update(Long id, Institution updated) {
        return repository.findById(id).map(inst -> {
            inst.setNumAffiliation(updated.getNumAffiliation());
            inst.setBrancheSociale(updated.getBrancheSociale());
            inst.setRaisonSociale(updated.getRaisonSociale());
            inst.setAdresse(updated.getAdresse());
            inst.setTelephone(updated.getTelephone());
            inst.setEmail(updated.getEmail());
            inst.setGouvernorat(updated.getGouvernorat());
            inst.setActif(updated.getActif());
            return repository.save(inst);
        }).orElseThrow(() -> new RuntimeException("Institution not found: " + id));
    }
}
