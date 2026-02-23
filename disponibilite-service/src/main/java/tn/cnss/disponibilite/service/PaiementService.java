package tn.cnss.disponibilite.service;

import org.springframework.stereotype.Service;
import tn.cnss.disponibilite.dto.PaiementRequest;
import tn.cnss.disponibilite.entity.Cotisation;
import tn.cnss.disponibilite.entity.Paiement;
import tn.cnss.disponibilite.repository.CotisationRepository;
import tn.cnss.disponibilite.repository.PaiementRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class PaiementService {

    private final PaiementRepository paiementRepository;
    private final CotisationRepository cotisationRepository;

    public PaiementService(PaiementRepository paiementRepository, CotisationRepository cotisationRepository) {
        this.paiementRepository = paiementRepository;
        this.cotisationRepository = cotisationRepository;
    }

    public List<Paiement> findAll() {
        return paiementRepository.findAll();
    }

    public List<Paiement> findByCotisation(Long cotisationId) {
        return paiementRepository.findByCotisationId(cotisationId);
    }

    public List<Paiement> findByAgent(Long agentId) {
        return paiementRepository.findByAgentPublicId(agentId);
    }

    public List<Paiement> findByInstitution(Long instId) {
        return paiementRepository.findByInstitutionId(instId);
    }

    public Paiement enregistrer(PaiementRequest request) {
        Cotisation cotisation = cotisationRepository.findById(request.getCotisationId())
                .orElseThrow(() -> new RuntimeException("Cotisation non trouvée: " + request.getCotisationId()));

        // Calculer le montant restant dû pour ce code
        BigDecimal montantDu;
        if ("137".equals(request.getCodePaiement())) {
            montantDu = cotisation.getMontantCode137();
        } else if ("138".equals(request.getCodePaiement())) {
            montantDu = cotisation.getMontantCode138();
        } else {
            montantDu = cotisation.getMontantTotal();
        }

        // Calculer total déjà payé pour ce code
        List<Paiement> paiementsExistants = paiementRepository.findByCotisationId(cotisation.getId());
        BigDecimal dejaPaye = paiementsExistants.stream()
                .filter(p -> request.getCodePaiement().equals(p.getCodePaiement()))
                .map(Paiement::getMontantPaye)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal restant = montantDu.subtract(dejaPaye);
        if (request.getMontantPaye().compareTo(restant) > 0) {
            throw new RuntimeException("Le montant payé (" + request.getMontantPaye() +
                    ") dépasse le restant dû (" + restant + ") pour le code " + request.getCodePaiement());
        }

        Paiement paiement = new Paiement();
        paiement.setCotisation(cotisation);
        paiement.setMontantPaye(request.getMontantPaye());
        paiement.setCodePaiement(request.getCodePaiement());
        paiement.setTypePaiement(Paiement.TypePaiement.valueOf(request.getTypePaiement()));
        paiement.setReferencePaiement(request.getReferencePaiement());
        paiement.setDatePaiement(request.getDatePaiement());

        Paiement saved = paiementRepository.save(paiement);

        // Mettre à jour le statut de la cotisation
        updateStatutCotisation(cotisation);

        return saved;
    }

    public Optional<Paiement> findById(Long id) {
        return paiementRepository.findById(id);
    }

    private void updateStatutCotisation(Cotisation cotisation) {
        List<Paiement> allPaiements = paiementRepository.findByCotisationId(cotisation.getId());
        BigDecimal totalPaye = allPaiements.stream()
                .map(Paiement::getMontantPaye)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        if (totalPaye.compareTo(cotisation.getMontantTotal()) >= 0) {
            cotisation.setStatut(Cotisation.StatutCotisation.PAYE);
        } else if (totalPaye.compareTo(BigDecimal.ZERO) > 0) {
            cotisation.setStatut(Cotisation.StatutCotisation.PARTIELLEMENT_PAYE);
        }
        cotisationRepository.save(cotisation);
    }
}
