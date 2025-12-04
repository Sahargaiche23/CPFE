package tn.cnss.cooperation.debit.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.debit.entity.Engagement;
import tn.cnss.cooperation.debit.entity.EngagementEcheance;
import tn.cnss.cooperation.debit.entity.EngagementId;
import tn.cnss.cooperation.debit.repository.EngagementEcheanceRepository;
import tn.cnss.cooperation.debit.repository.EngagementRepository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Service de gestion des engagements
 * Un engagement = débit trimestriel avec échéances mensuelles
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class EngagementService {
    
    private final EngagementRepository engagementRepository;
    private final EngagementEcheanceRepository echeanceRepository;
    
    /**
     * Créer un nouvel engagement
     */
    @Transactional
    public Engagement creerEngagement(Long empMat, Integer empCle, LocalDate dcoDateDebut, BigDecimal salaire) {
        log.info("Création engagement pour {}-{}", empMat, empCle);
        
        // Générer numéro d'engagement
        Long engNum = engagementRepository.findMaxEngagementNumber().orElse(0L) + 1;
        
        Engagement engagement = new Engagement();
        engagement.setEngNum(engNum);
        engagement.setEmpMat(empMat);
        engagement.setEmpCle(empCle);
        engagement.setDcoDateDebut(dcoDateDebut);
        engagement.setSalaire(salaire);
        engagement.setEngSituation(1); // En cours
        engagement.setFlgValid(0); // Non validé
        
        return engagementRepository.save(engagement);
    }
    
    /**
     * Générer les échéances mensuelles (jusqu'à 36 mois)
     */
    @Transactional
    public List<EngagementEcheance> genererEcheances(EngagementId engagementId, int nombreMois, BigDecimal montantMensuel) {
        log.info("Génération de {} échéances pour engagement {}", nombreMois, engagementId.getEngNum());
        
        List<EngagementEcheance> echeances = new ArrayList<>();
        LocalDate dateDebut = engagementId.getDcoDateDebut();
        
        for (int i = 1; i <= nombreMois; i++) {
            EngagementEcheance echeance = new EngagementEcheance();
            echeance.setEngNum(engagementId.getEngNum());
            echeance.setEmpMat(engagementId.getEmpMat());
            echeance.setEmpCle(engagementId.getEmpCle());
            echeance.setDcoDateDebut(engagementId.getDcoDateDebut());
            echeance.setEnoNumEng(i);
            echeance.setEnoDateEcheance(dateDebut.plusMonths(i));
            echeance.setEnoSituation(1); // Non payé
            echeance.setEnoMontantEcheance(montantMensuel);
            echeance.setEnoSalaire(montantMensuel);
            echeance.setEnoDateDebutPeriode(dateDebut.plusMonths(i - 1));
            echeance.setEnoDateFinPeriode(dateDebut.plusMonths(i).minusDays(1));
            
            echeances.add(echeance);
        }
        
        return echeanceRepository.saveAll(echeances);
    }
    
    /**
     * Clôturer un engagement
     */
    @Transactional
    public void cloturerEngagement(EngagementId engagementId) {
        Engagement engagement = engagementRepository.findById(engagementId)
                .orElseThrow(() -> new RuntimeException("Engagement non trouvé"));
        engagement.cloturer();
        engagementRepository.save(engagement);
        log.info("Engagement {} clôturé", engagementId.getEngNum());
    }
    
    /**
     * Valider un engagement (après paiement complet)
     */
    @Transactional
    public void validerEngagement(EngagementId engagementId) {
        Engagement engagement = engagementRepository.findById(engagementId)
                .orElseThrow(() -> new RuntimeException("Engagement non trouvé"));
        engagement.valider();
        engagementRepository.save(engagement);
        log.info("Engagement {} validé", engagementId.getEngNum());
    }
}
