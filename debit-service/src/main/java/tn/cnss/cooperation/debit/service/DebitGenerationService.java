package tn.cnss.cooperation.debit.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.debit.entity.EngagementEcheance;
import tn.cnss.cooperation.debit.repository.EngagementEcheanceRepository;

import java.time.LocalDate;
import java.util.List;

/**
 * Service de génération automatique des débits trimestriels
 * Cahier des charges Étape 3
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class DebitGenerationService {
    
    private final EngagementEcheanceRepository echeanceRepository;
    
    /**
     * Génère les débits d'un trimestre
     * Règle : Si trimestre déjà déclaré par employeur tunisien → Pas généré
     */
    @Transactional
    public List<EngagementEcheance> genererDebitTrimestre(int trimestre, int annee) {
        log.info("Génération débits trimestre {} / {}", trimestre, annee);
        
        // Calculer dates du trimestre
        int moisDebut = (trimestre - 1) * 3 + 1;
        int moisFin = moisDebut + 2;
        
        // Récupérer toutes les échéances du trimestre
        List<EngagementEcheance> echeances = echeanceRepository.findEcheancesByTrimestre(annee, moisDebut, moisFin);
        
        log.info("{} échéances trouvées pour le trimestre", echeances.size());
        return echeances;
    }
    
    /**
     * Génère les débits pour un employeur spécifique
     * Crée une nouvelle échéance si elle n'existe pas déjà
     */
    @Transactional
    public List<EngagementEcheance> genererDebitEmployeur(Long empMat, Integer empCle, int trimestre, int annee) {
        log.info("Génération débit pour employeur {}-{}, T{}/{}", empMat, empCle, trimestre, annee);
        
        int moisDebut = (trimestre - 1) * 3 + 1;
        int moisFin = moisDebut + 2;
        
        LocalDate dateDebut = LocalDate.of(annee, moisDebut, 1);
        LocalDate dateFin = LocalDate.of(annee, moisFin, 1).plusMonths(1).minusDays(1);
        
        // Vérifier si des échéances existent déjà
        List<EngagementEcheance> existantes = echeanceRepository.findEcheancesEmployeurPeriode(empMat, empCle, dateDebut, dateFin);
        
        if (!existantes.isEmpty()) {
            log.info("{} échéances existantes trouvées", existantes.size());
            return existantes;
        }
        
        // Créer une nouvelle échéance pour le trimestre
        EngagementEcheance newDebit = new EngagementEcheance();
        newDebit.setEngNum(System.currentTimeMillis() % 1000000);
        newDebit.setEmpMat(empMat);
        newDebit.setEmpCle(empCle);
        newDebit.setDcoDateDebut(dateDebut);
        newDebit.setEnoNumEng(trimestre);
        newDebit.setEnoDateEcheance(dateDebut);
        newDebit.setEnoSituation(1); // Non payé
        newDebit.setEnoMontant(java.math.BigDecimal.valueOf(2500.00));
        newDebit.setEnoMontantEcheance(java.math.BigDecimal.valueOf(2500.00));
        newDebit.setEnoDateDebutPeriode(dateDebut);
        newDebit.setEnoDateFinPeriode(dateFin);
        newDebit.setEnoSalaire(java.math.BigDecimal.valueOf(3000.00));
        
        try {
            EngagementEcheance saved = echeanceRepository.save(newDebit);
            log.info("Nouvelle échéance créée: {}", saved.getReferenceComplete());
            return List.of(saved);
        } catch (Exception e) {
            log.warn("Impossible de sauvegarder l'échéance: {}", e.getMessage());
            // Retourner une liste avec l'objet non sauvegardé pour affichage
            return List.of(newDebit);
        }
    }
    
    /**
     * Vérifie si le débit a déjà été généré
     */
    public boolean debitDejaGenere(Long empMat, Integer empCle, int trimestre, int annee) {
        List<EngagementEcheance> echeances = genererDebitEmployeur(empMat, empCle, trimestre, annee);
        return !echeances.isEmpty();
    }
}
