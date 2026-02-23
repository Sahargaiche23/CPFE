package tn.cnss.disponibilite.service;

import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.dto.CotisationGenerationRequest;
import tn.cnss.disponibilite.entity.*;
import tn.cnss.disponibilite.repository.AgentPublicRepository;
import tn.cnss.disponibilite.repository.CotisationRepository;
import tn.cnss.disponibilite.repository.IlhaqRepository;
import tn.cnss.disponibilite.repository.SalaireRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CotisationService {

    private final CotisationRepository cotisationRepository;
    private final AgentPublicRepository agentPublicRepository;
    private final IlhaqRepository ilhaqRepository;
    private final SalaireRepository salaireRepository;
    private final TauxCotisationService tauxService;

    public CotisationService(CotisationRepository cotisationRepository,
                             AgentPublicRepository agentPublicRepository,
                             IlhaqRepository ilhaqRepository,
                             SalaireRepository salaireRepository,
                             TauxCotisationService tauxService) {
        this.cotisationRepository = cotisationRepository;
        this.agentPublicRepository = agentPublicRepository;
        this.ilhaqRepository = ilhaqRepository;
        this.salaireRepository = salaireRepository;
        this.tauxService = tauxService;
    }

    public List<Cotisation> findAll() {
        return cotisationRepository.findAll();
    }

    public Optional<Cotisation> findById(Long id) {
        return cotisationRepository.findById(id);
    }

    public List<Cotisation> findByAgent(Long agentId) {
        return cotisationRepository.findByAgentPublicId(agentId);
    }

    public List<Cotisation> findByInstitution(Long institutionId) {
        return cotisationRepository.findByInstitutionId(institutionId);
    }

    public List<Cotisation> findByAnnee(Integer annee) {
        return cotisationRepository.findByAnnee(annee);
    }

    public List<Cotisation> findByInstitutionAndAnnee(Long institutionId, Integer annee) {
        return cotisationRepository.findByInstitutionIdAndAnnee(institutionId, annee);
    }

    /**
     * Génère les cotisations trimestrielles selon le mode choisi.
     * Modes: TOUTES (toutes institutions), INSTITUTION (une institution), AGENT (un agent)
     */
    public List<Cotisation> generer(CotisationGenerationRequest request) {
        List<Cotisation> generated = new ArrayList<>();
        List<AgentPublic> agents;

        switch (request.getMode()) {
            case TOUTES:
                agents = agentPublicRepository.findByActifTrue();
                break;
            case INSTITUTION:
                if (request.getInstitutionId() == null)
                    throw new RuntimeException("institutionId requis pour le mode INSTITUTION");
                agents = agentPublicRepository.findByInstitutionId(request.getInstitutionId());
                break;
            case AGENT:
                if (request.getAgentPublicId() == null)
                    throw new RuntimeException("agentPublicId requis pour le mode AGENT");
                agents = agentPublicRepository.findById(request.getAgentPublicId())
                        .map(List::of).orElse(List.of());
                break;
            default:
                throw new RuntimeException("Mode de génération inconnu");
        }

        for (AgentPublic agent : agents) {
            try {
                Cotisation c = genererPourAgent(agent, request.getTrimestre(), request.getAnnee());
                if (c != null) generated.add(c);
            } catch (Exception e) {
                // Log and continue with next agent
                System.err.println("Erreur génération cotisation agent " + agent.getNumInscription() + ": " + e.getMessage());
            }
        }
        return generated;
    }

    private Cotisation genererPourAgent(AgentPublic agent, int trimestre, int annee) {
        // Vérifier si cotisation existe déjà
        Optional<Cotisation> existing = cotisationRepository
                .findByAgentPublicIdAndTrimestreAndAnnee(agent.getId(), trimestre, annee);
        if (existing.isPresent()) return null; // Pas de duplication

        // Déterminer début du trimestre
        LocalDate debutTrimestre = getDebutTrimestre(trimestre, annee);
        LocalDate finTrimestre = getFinTrimestre(trimestre, annee);

        // Vérifier ilhaq actif couvrant le trimestre
        List<Ilhaq> ilhaqs = ilhaqRepository.findActiveByAgentAndDate(agent.getId(), debutTrimestre);
        if (ilhaqs.isEmpty()) return null; // Pas d'ilhaq couvrant ce trimestre
        Ilhaq ilhaq = ilhaqs.get(0);

        // Récupérer le salaire applicable
        Optional<Salaire> salaireOpt = salaireRepository.findSalaireApplicable(agent.getId(), debutTrimestre);
        if (salaireOpt.isEmpty()) {
            throw new RuntimeException("Aucun salaire trouvé pour l'agent " + agent.getNumInscription());
        }
        BigDecimal salaireMensuel = salaireOpt.get().getSalaireMensuel();

        // Récupérer les taux applicables
        TauxCotisation taux = tauxService.getTauxApplicable(debutTrimestre)
                .orElseThrow(() -> new RuntimeException("Aucun taux trouvé pour la période"));

        BigDecimal trois = new BigDecimal("3");
        BigDecimal cent = new BigDecimal("100");

        // Calcul: salaire × 3 × taux / 100
        BigDecimal montant137 = salaireMensuel.multiply(trois)
                .multiply(taux.getTauxCode137()).divide(cent, 3, RoundingMode.HALF_UP);
        BigDecimal montant138 = salaireMensuel.multiply(trois)
                .multiply(taux.getTauxCode138()).divide(cent, 3, RoundingMode.HALF_UP);

        BigDecimal montant197 = BigDecimal.ZERO;
        BigDecimal montant198 = BigDecimal.ZERO;
        if (taux.getTauxCode197() != null) {
            montant197 = salaireMensuel.multiply(trois)
                    .multiply(taux.getTauxCode197()).divide(cent, 3, RoundingMode.HALF_UP);
        }
        if (taux.getTauxCode198() != null) {
            montant198 = salaireMensuel.multiply(trois)
                    .multiply(taux.getTauxCode198()).divide(cent, 3, RoundingMode.HALF_UP);
        }

        BigDecimal total = montant137.add(montant138).add(montant197).add(montant198);

        Cotisation cotisation = new Cotisation();
        cotisation.setAgentPublic(agent);
        cotisation.setInstitution(ilhaq.getInstitution());
        cotisation.setIlhaq(ilhaq);
        cotisation.setTrimestre(trimestre);
        cotisation.setAnnee(annee);
        cotisation.setSalaireMensuelApplique(salaireMensuel);
        cotisation.setMontantCode137(montant137);
        cotisation.setMontantCode138(montant138);
        cotisation.setMontantCode197(montant197);
        cotisation.setMontantCode198(montant198);
        cotisation.setMontantTotal(total);
        cotisation.setStatut(Cotisation.StatutCotisation.EN_ATTENTE);

        return cotisationRepository.save(cotisation);
    }

    private LocalDate getDebutTrimestre(int trimestre, int annee) {
        return switch (trimestre) {
            case 1 -> LocalDate.of(annee, 1, 1);
            case 2 -> LocalDate.of(annee, 4, 1);
            case 3 -> LocalDate.of(annee, 7, 1);
            case 4 -> LocalDate.of(annee, 10, 1);
            default -> throw new RuntimeException("Trimestre invalide: " + trimestre);
        };
    }

    private LocalDate getFinTrimestre(int trimestre, int annee) {
        return switch (trimestre) {
            case 1 -> LocalDate.of(annee, 3, 31);
            case 2 -> LocalDate.of(annee, 6, 30);
            case 3 -> LocalDate.of(annee, 9, 30);
            case 4 -> LocalDate.of(annee, 12, 31);
            default -> throw new RuntimeException("Trimestre invalide: " + trimestre);
        };
    }
}
