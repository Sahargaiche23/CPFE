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
        boolean forceRecalcul = Boolean.TRUE.equals(request.getForceRecalcul());

        switch (request.getMode()) {
            case TOUTES:
                // Get all agents with dateDebutIlhaq set
                agents = agentPublicRepository.findAll().stream()
                        .filter(a -> a.getDateDebutIlhaq() != null)
                        .toList();
                break;
            case INSTITUTION:
                if (request.getInstitutionId() == null)
                    throw new RuntimeException("institutionId requis pour le mode INSTITUTION");
                agents = agentPublicRepository.findByInstitutionId(request.getInstitutionId());
                break;
            case AGENT:
                // Support search by numInscription
                if (request.getNumInscription() != null && !request.getNumInscription().isEmpty()) {
                    agents = agentPublicRepository.findByNumInscription(request.getNumInscription())
                            .map(List::of).orElse(List.of());
                } else if (request.getAgentPublicId() != null) {
                    agents = agentPublicRepository.findById(request.getAgentPublicId())
                            .map(List::of).orElse(List.of());
                } else {
                    throw new RuntimeException("agentPublicId ou numInscription requis pour le mode AGENT");
                }
                break;
            default:
                throw new RuntimeException("Mode de génération inconnu");
        }

        for (AgentPublic agent : agents) {
            try {
                Cotisation c = genererPourAgent(agent, request.getTrimestre(), request.getAnnee(), forceRecalcul);
                if (c != null) generated.add(c);
            } catch (Exception e) {
                // Log and continue with next agent
                System.err.println("Erreur génération cotisation agent " + agent.getNumInscription() + ": " + e.getMessage());
            }
        }
        return generated;
    }

    private Cotisation genererPourAgent(AgentPublic agent, int trimestre, int annee, boolean forceRecalcul) {
        // Vérifier si cotisation existe déjà
        Optional<Cotisation> existing = cotisationRepository
                .findByAgentPublicIdAndTrimestreAndAnnee(agent.getId(), trimestre, annee);
        if (existing.isPresent()) {
            if (forceRecalcul) {
                // Supprimer l'ancienne et recalculer
                cotisationRepository.delete(existing.get());
            } else {
                return null; // Pas de duplication
            }
        }

        // Déterminer début du trimestre
        LocalDate debutTrimestre = getDebutTrimestre(trimestre, annee);
        LocalDate finTrimestre = getFinTrimestre(trimestre, annee);

        // Vérifier si agent a une période d'ilhaq couvrant le trimestre (using agent dates)
        LocalDate dateDebutIlhaq = agent.getDateDebutIlhaq();
        LocalDate dateFinIlhaq = agent.getDateFinIlhaq();
        
        if (dateDebutIlhaq == null) return null; // Pas de date ilhaq
        if (dateDebutIlhaq.isAfter(finTrimestre)) return null; // Ilhaq commence après le trimestre
        if (dateFinIlhaq != null && dateFinIlhaq.isBefore(debutTrimestre)) return null; // Ilhaq terminé avant

        // Récupérer le salaire applicable (utiliser fin du trimestre pour trouver le salaire)
        Optional<Salaire> salaireOpt = salaireRepository.findSalaireApplicable(agent.getId(), finTrimestre);
        if (salaireOpt.isEmpty()) {
            // Fallback: get the latest salaire for the agent (regardless of date)
            List<Salaire> allSalaires = salaireRepository.findByAgentPublicIdOrderByDateEffetDesc(agent.getId());
            if (!allSalaires.isEmpty()) {
                salaireOpt = Optional.of(allSalaires.get(0));
            }
        }
        BigDecimal salaireMensuel;
        if (salaireOpt.isEmpty()) {
            // Skip agent if no salaire found at all
            System.err.println("Aucun salaire pour agent " + agent.getNumInscription() + ", ignoré");
            return null;
        } else {
            salaireMensuel = salaireOpt.get().getSalaireMensuel();
        }

        // Récupérer les taux applicables
        Optional<TauxCotisation> tauxOpt = tauxService.getTauxApplicable(debutTrimestre);
        BigDecimal taux137, taux138, taux197, taux198;
        if (tauxOpt.isEmpty()) {
            // Use default rates from Law 16/2003
            taux137 = new BigDecimal("17.07");
            taux138 = new BigDecimal("9.68");
            taux197 = BigDecimal.ZERO;
            taux198 = BigDecimal.ZERO;
        } else {
            TauxCotisation taux = tauxOpt.get();
            taux137 = taux.getTauxCode137();
            taux138 = taux.getTauxCode138();
            taux197 = taux.getTauxCode197() != null ? taux.getTauxCode197() : BigDecimal.ZERO;
            taux198 = taux.getTauxCode198() != null ? taux.getTauxCode198() : BigDecimal.ZERO;
        }

        BigDecimal trois = new BigDecimal("3");
        BigDecimal cent = new BigDecimal("100");

        // Calcul: salaire × 3 × taux / 100
        BigDecimal montant137 = salaireMensuel.multiply(trois).multiply(taux137).divide(cent, 3, RoundingMode.HALF_UP);
        BigDecimal montant138 = salaireMensuel.multiply(trois).multiply(taux138).divide(cent, 3, RoundingMode.HALF_UP);
        BigDecimal montant197 = salaireMensuel.multiply(trois).multiply(taux197).divide(cent, 3, RoundingMode.HALF_UP);
        BigDecimal montant198 = salaireMensuel.multiply(trois).multiply(taux198).divide(cent, 3, RoundingMode.HALF_UP);

        BigDecimal total = montant137.add(montant138).add(montant197).add(montant198);

        Cotisation cotisation = new Cotisation();
        cotisation.setAgentPublic(agent);
        cotisation.setInstitution(agent.getInstitution());
        cotisation.setIlhaq(null); // Will use agent dates instead
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
