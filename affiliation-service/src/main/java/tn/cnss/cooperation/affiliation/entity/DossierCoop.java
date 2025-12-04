package tn.cnss.cooperation.affiliation.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Entité JPA pour la table DOSSIER_COP
 * Représente un dossier de coopération technique
 */
@Entity
@Table(name = "DOSSIER_COP", schema = "COPT")
@Data
public class DossierCoop {
    
    // === Clé Primaire ===
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dossier_seq")
    @SequenceGenerator(name = "dossier_seq", sequenceName = "COPT.DOSSIER_COP_SEQ", allocationSize = 1)
    @Column(name = "DCO_ID", nullable = false)
    private Long dcoId;
    
    @Column(name = "EMP_MAT", nullable = false)
    private Long empMat;  // Matricule employeur
    
    @Column(name = "EMP_CLE")
    private Integer empCle;  // Clé employeur
    
    @Column(name = "DCO_DTDEB", nullable = false)
    private LocalDate dcoDateDebut;  // Date début
    
    // === Informations Assuré ===
    @Column(name = "ASS_MAT", nullable = false)
    private Long assureMat;  // Matricule assuré
    
    @Column(name = "ASS_CLE", nullable = false)
    private Integer assureCle;  // Clé assuré
    
    @Column(name = "ASS_NOM", length = 100)
    private String assNom;  // Nom de l'assuré
    
    @Column(name = "ASS_PRENOM", length = 100)
    private String assPrenom;  // Prénom de l'assuré
    
    // === Informations Détachement ===
    @Column(name = "PAY_COD", nullable = false)
    private Integer paysCode;  // Code pays de détachement
    
    @Column(name = "DCO_DTFIN")
    private LocalDate dcoDateFin;  // Date fin (optionnelle pour CDI)
    
    @Column(name = "DCO_SALAIRE", precision = 15, scale = 3)
    private BigDecimal dcoSalaire;  // Salaire en TND
    
    // === Informations Affiliation ===
    @Column(name = "DCO_NUMAFF")
    private Long dcoNumAffiliation;  // Numéro d'affiliation CNSS
    
    @Column(name = "DCO_CLEAFF")
    private Integer dcoClefAffiliation;  // Clé affiliation
    
    // === Régime Complémentaire ===
    @Column(name = "DCO_NUMREGCPL")
    private Long dcoNumRegimeComplementaire;
    
    @Column(name = "DCO_CLLEREGCPL")
    private Integer dcoClefRegimeComplementaire;
    
    // === Statut Salaire ===
    @Column(name = "DCO_SALID", length = 1)
    private String dcoSalaireId;  // 'V' = Validé, 'P' = Pending
    
    // === Méthodes Utilitaires ===
    
    /**
     * Génère le numéro complet d'affiliation au format : NUMAFF-CLE
     */
    public String getAffiliationComplete() {
        if (dcoNumAffiliation != null && dcoClefAffiliation != null) {
            return String.format("%d-%02d", dcoNumAffiliation, dcoClefAffiliation);
        }
        return null;
    }
    
    /**
     * Génère le matricule complet employeur au format : MAT-CLE
     */
    public String getEmployeurMatriculeComplet() {
        return String.format("%d-%02d", empMat, empCle);
    }
    
    /**
     * Génère le matricule complet assuré au format : MAT-CLE
     */
    public String getAssureMatriculeComplet() {
        return String.format("%d-%02d", assureMat, assureCle);
    }
    
    /**
     * Vérifie si le dossier est actif (pas de date fin ou date fin dans le futur)
     */
    public boolean isActif() {
        return dcoDateFin == null || dcoDateFin.isAfter(LocalDate.now());
    }
    
    /**
     * Vérifie si le salaire est validé
     */
    public boolean isSalaireValide() {
        return "V".equals(dcoSalaireId);
    }
    
    /**
     * Retourne le nom complet de l'assuré
     */
    public String getNomComplet() {
        if (assNom != null && assPrenom != null) {
            return assNom + " " + assPrenom;
        } else if (assNom != null) {
            return assNom;
        }
        return null;
    }
}
