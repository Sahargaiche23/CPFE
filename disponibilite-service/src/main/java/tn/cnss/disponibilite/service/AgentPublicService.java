package tn.cnss.disponibilite.service;

import jakarta.persistence.EntityManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.disponibilite.entity.AgentPublic;
import tn.cnss.disponibilite.repository.AgentPublicRepository;

import java.util.List;
import java.util.Optional;

@Service
public class AgentPublicService {

    private final AgentPublicRepository repository;
    private final EntityManager entityManager;

    public AgentPublicService(AgentPublicRepository repository, EntityManager entityManager) {
        this.repository = repository;
        this.entityManager = entityManager;
    }

    public List<AgentPublic> findAll() {
        return repository.findAll();
    }

    public Optional<AgentPublic> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<AgentPublic> findByNumInscription(String numInscription) {
        return repository.findByNumInscription(numInscription);
    }

    public List<AgentPublic> findByInstitution(Long institutionId) {
        return repository.findByInstitutionId(institutionId);
    }

    public List<AgentPublic> search(String query) {
        return repository.findByNomFrContainingIgnoreCaseOrPrenomFrContainingIgnoreCase(query, query);
    }

    public AgentPublic save(AgentPublic agent) {
        // Vérifier unicité du numInscription
        if (agent.getNumInscription() != null) {
            repository.findByNumInscription(agent.getNumInscription()).ifPresent(existing -> {
                if (!existing.getId().equals(agent.getId())) {
                    throw new RuntimeException("Numéro d'inscription déjà utilisé: " + agent.getNumInscription());
                }
            });
        }
        return repository.save(agent);
    }

    @Transactional
    public AgentPublic update(Long id, AgentPublic updated) {
        return repository.findById(id).map(agent -> {
            agent.setNumInscription(updated.getNumInscription());
            agent.setCodeExploitation(updated.getCodeExploitation());
            agent.setNom(updated.getNom());
            agent.setPrenom(updated.getPrenom());
            agent.setNomFr(updated.getNomFr());
            agent.setPrenomFr(updated.getPrenomFr());
            agent.setDateNaissance(updated.getDateNaissance());
            agent.setCin(updated.getCin());
            agent.setAdresse(updated.getAdresse());
            agent.setEmail(updated.getEmail());
            agent.setTelephone(updated.getTelephone());
            agent.setInstitution(updated.getInstitution());
            agent.setDateDebutIlhaq(updated.getDateDebutIlhaq());
            agent.setDateFinIlhaq(updated.getDateFinIlhaq());
            agent.setActif(updated.getActif());
            repository.saveAndFlush(agent);
            // Clear persistence context and re-fetch to load full institution
            entityManager.clear();
            return repository.findById(id).orElse(agent);
        }).orElseThrow(() -> new RuntimeException("Agent public not found: " + id));
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
