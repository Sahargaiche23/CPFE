package tn.cnss.cooperation.salary.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Service de calcul des cotisations CNSS
 * Taux selon avis de paiement (voir images)
 */
@Service
@Slf4j
public class CotisationService {
    
    // Taux de cotisation (%)
    private static final BigDecimal TAUX_RETRAITE = new BigDecimal("13.5");
    private static final BigDecimal TAUX_AS = new BigDecimal("0");
    private static final BigDecimal TAUX_RCR = new BigDecimal("9");
    private static final BigDecimal TAUX_GLOBAL = new BigDecimal("13.5");
    
    /**
     * Calcule toutes les cotisations pour un salaire donné
     */
    public CotisationDetails calculerCotisations(BigDecimal salaireTND) {
        log.debug("Calcul cotisations pour salaire: {} TND", salaireTND);
        
        CotisationDetails details = new CotisationDetails();
        details.setSalaireBrut(salaireTND);
        details.setTauxRetraite(TAUX_RETRAITE);
        details.setTauxAS(TAUX_AS);
        details.setTauxRCR(TAUX_RCR);
        details.setTauxGlobal(TAUX_GLOBAL);
        
        // Montant retraite
        BigDecimal montantRetraite = salaireTND
                .multiply(TAUX_RETRAITE)
                .divide(new BigDecimal("100"), 3, RoundingMode.HALF_UP);
        details.setMontantRetraite(montantRetraite);
        
        // Montant AS (0)
        details.setMontantAS(BigDecimal.ZERO);
        
        // Montant RCR
        BigDecimal montantRCR = salaireTND
                .multiply(TAUX_RCR)
                .divide(new BigDecimal("100"), 3, RoundingMode.HALF_UP);
        details.setMontantRCR(montantRCR);
        
        // Montant global (= montant à payer)
        BigDecimal montantGlobal = salaireTND
                .multiply(TAUX_GLOBAL)
                .divide(new BigDecimal("100"), 3, RoundingMode.HALF_UP);
        details.setMontantGlobal(montantGlobal);
        details.setMontantAPayer(montantGlobal);
        
        log.info("Cotisations calculées - Salaire: {} TND, Montant à payer: {} TND", 
                salaireTND, montantGlobal);
        
        return details;
    }
    
    /**
     * Classe pour les détails de cotisation
     */
    public static class CotisationDetails {
        private BigDecimal salaireBrut;
        private BigDecimal tauxRetraite;
        private BigDecimal tauxAS;
        private BigDecimal tauxRCR;
        private BigDecimal tauxGlobal;
        private BigDecimal montantRetraite;
        private BigDecimal montantAS;
        private BigDecimal montantRCR;
        private BigDecimal montantGlobal;
        private BigDecimal montantAPayer;
        
        // Getters et Setters
        public BigDecimal getSalaireBrut() { return salaireBrut; }
        public void setSalaireBrut(BigDecimal salaireBrut) { this.salaireBrut = salaireBrut; }
        
        public BigDecimal getTauxRetraite() { return tauxRetraite; }
        public void setTauxRetraite(BigDecimal tauxRetraite) { this.tauxRetraite = tauxRetraite; }
        
        public BigDecimal getTauxAS() { return tauxAS; }
        public void setTauxAS(BigDecimal tauxAS) { this.tauxAS = tauxAS; }
        
        public BigDecimal getTauxRCR() { return tauxRCR; }
        public void setTauxRCR(BigDecimal tauxRCR) { this.tauxRCR = tauxRCR; }
        
        public BigDecimal getTauxGlobal() { return tauxGlobal; }
        public void setTauxGlobal(BigDecimal tauxGlobal) { this.tauxGlobal = tauxGlobal; }
        
        public BigDecimal getMontantRetraite() { return montantRetraite; }
        public void setMontantRetraite(BigDecimal montantRetraite) { this.montantRetraite = montantRetraite; }
        
        public BigDecimal getMontantAS() { return montantAS; }
        public void setMontantAS(BigDecimal montantAS) { this.montantAS = montantAS; }
        
        public BigDecimal getMontantRCR() { return montantRCR; }
        public void setMontantRCR(BigDecimal montantRCR) { this.montantRCR = montantRCR; }
        
        public BigDecimal getMontantGlobal() { return montantGlobal; }
        public void setMontantGlobal(BigDecimal montantGlobal) { this.montantGlobal = montantGlobal; }
        
        public BigDecimal getMontantAPayer() { return montantAPayer; }
        public void setMontantAPayer(BigDecimal montantAPayer) { this.montantAPayer = montantAPayer; }
    }
}
