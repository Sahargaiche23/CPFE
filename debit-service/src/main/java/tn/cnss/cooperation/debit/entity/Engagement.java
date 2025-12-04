package tn.cnss.cooperation.debit.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Entité JPA pour la table ENGAGEMNT
 * Représente un engagement de cotisation pour un trimestre
 */
@Entity
@Table(name = "ENGAGEMNT", schema = "COPT")
@IdClass(EngagementId.class)
@Data
public class Engagement {
    
    // === Clé Primaire Composée ===
    @Id
    @Column(name = "ENG_NUM", nullable = false)
    private Long engNum;  // Numéro d'engagement (séquence)
    
    @Id
    @Column(name = "EMP_MAT", nullable = false)
    private Long empMat;  // Matricule employeur
    
    @Id
    @Column(name = "EMP_CLE", nullable = false)
    private Integer empCle;  // Clé employeur
    
    @Id
    @Column(name = "DCO_DTDEB", nullable = false)
    private LocalDate dcoDateDebut;  // Date début dossier
    
    // === Données Engagement ===
    @Column(name = "ENG_SIT", nullable = false)
    private Integer engSituation = 1;  // 1 = En cours, 2 = Clôturé
    
    @Column(name = "FLG_VALID", nullable = false)
    private Integer flgValid = 0;  // 0 = Non validé, 1 = Validé
    
    @Column(name = "SALAIRE", nullable = false, precision = 15, scale = 3)
    private BigDecimal salaire;  // Salaire de base pour calcul cotisations
    
    // === Méthodes Utilitaires ===
    
    /**
     * Génère le matricule complet employeur
     */
    public String getEmployeurMatriculeComplet() {
        return String.format("%d-%02d", empMat, empCle);
    }
    
    /**
     * Vérifie si l'engagement est en cours
     */
    public boolean isEnCours() {
        return engSituation != null && engSituation == 1;
    }
    
    /**
     * Vérifie si l'engagement est clôturé
     */
    public boolean isCloture() {
        return engSituation != null && engSituation == 2;
    }
    
    /**
     * Vérifie si l'engagement est validé
     */
    public boolean isValide() {
        return flgValid != null && flgValid == 1;
    }
    
    /**
     * Clôturer l'engagement
     */
    public void cloturer() {
        this.engSituation = 2;
    }
    
    /**
     * Valider l'engagement
     */
    public void valider() {
        this.flgValid = 1;
    }
}
