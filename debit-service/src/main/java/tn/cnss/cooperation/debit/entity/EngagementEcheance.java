package tn.cnss.cooperation.debit.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Entité JPA pour la table ENG_COP
 * Représente une échéance mensuelle d'un engagement
 */
@Entity
@Table(name = "ENG_COP", schema = "COPT")
@IdClass(EngagementEcheanceId.class)
@Data
public class EngagementEcheance {
    
    // === Clé Primaire Composée ===
    @Id
    @Column(name = "ENG_NUM", nullable = false)
    private Long engNum;
    
    @Id
    @Column(name = "EMP_MAT", nullable = false)
    private Long empMat;
    
    @Id
    @Column(name = "EMP_CLE", nullable = false)
    private Integer empCle;
    
    @Id
    @Column(name = "DCO_DTDEB", nullable = false)
    private LocalDate dcoDateDebut;
    
    @Id
    @Column(name = "ENO_NUMENG", nullable = false)
    private Integer enoNumEng;  // Numéro de l'échéance (1 à 36 mois)
    
    @Id
    @Column(name = "ENO_DTECH", nullable = false)
    private LocalDate enoDateEcheance;  // Date de l'échéance
    
    // === Informations Échéance ===
    @Column(name = "ENO_SITENG")
    private Integer enoSituation;  // 1 = Non payé, 2 = Payé
    
    @Column(name = "ENO_MNT", precision = 15, scale = 3)
    private BigDecimal enoMontant;  // Montant total de l'engagement
    
    @Column(name = "ENO_MNTECH", precision = 15, scale = 3)
    private BigDecimal enoMontantEcheance;  // Montant de cette échéance
    
    @Column(name = "ENO_DTPAYECH")
    private LocalDate enoDatePaiementEcheance;  // Date de paiement effective
    
    // === Période Couverte ===
    @Column(name = "ENO_DTDEB")
    private LocalDate enoDateDebutPeriode;  // Début de la période couverte
    
    @Column(name = "ENO_DTFIN")
    private LocalDate enoDateFinPeriode;  // Fin de la période couverte
    
    // === Informations Salariales ===
    @Column(name = "ENO_SALAIRE", precision = 15, scale = 3)
    private BigDecimal enoSalaire;  // Salaire de référence
    
    @Column(name = "ENO_MNTPAY", precision = 15, scale = 3)
    private BigDecimal enoMontantPaye;  // Montant effectivement payé
    
    // === Méthodes Utilitaires ===
    
    /**
     * Génère la référence complète de l'échéance
     * Format: ENG-{engNum}/ECH-{numEch}
     */
    public String getReferenceComplete() {
        return String.format("ENG-%06d/ECH-%02d", engNum, enoNumEng);
    }
    
    /**
     * Vérifie si l'échéance est payée
     */
    public boolean isPayee() {
        return enoSituation != null && enoSituation == 2;
    }
    
    /**
     * Vérifie si l'échéance est en retard
     */
    public boolean isEnRetard() {
        return !isPayee() && enoDateEcheance != null && enoDateEcheance.isBefore(LocalDate.now());
    }
    
    /**
     * Marque l'échéance comme payée
     */
    public void marquerPayee(BigDecimal montantPaye) {
        this.enoSituation = 2;
        this.enoMontantPaye = montantPaye;
        this.enoDatePaiementEcheance = LocalDate.now();
    }
    
    /**
     * Calcule le solde restant (montant - montant payé)
     */
    public BigDecimal getSoldeRestant() {
        if (enoMontantEcheance == null) {
            return BigDecimal.ZERO;
        }
        BigDecimal paye = enoMontantPaye != null ? enoMontantPaye : BigDecimal.ZERO;
        return enoMontantEcheance.subtract(paye);
    }
    
    /**
     * Vérifie si l'échéance est dans le trimestre spécifié
     */
    public boolean isDansTrimestre(int trimestre, int annee) {
        if (enoDateEcheance == null) {
            return false;
        }
        int mois = enoDateEcheance.getMonthValue();
        int anneeEch = enoDateEcheance.getYear();
        
        if (anneeEch != annee) {
            return false;
        }
        
        switch (trimestre) {
            case 1: return mois >= 1 && mois <= 3;   // Q1: Jan-Mar
            case 2: return mois >= 4 && mois <= 6;   // Q2: Apr-Jun
            case 3: return mois >= 7 && mois <= 9;   // Q3: Jul-Sep
            case 4: return mois >= 10 && mois <= 12; // Q4: Oct-Dec
            default: return false;
        }
    }
}
