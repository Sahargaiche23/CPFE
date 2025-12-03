package tn.cnss.cooperation.employer.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Table DOSSIER_COP
 * Basée sur les images fournies - Écran "Saisie Dossier"
 */
@Entity
@Table(name = "DOSSIER_COP", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DossierCoop {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dossier_seq")
    @SequenceGenerator(name = "dossier_seq", sequenceName = "DOSSIER_COP_SEQ", allocationSize = 1)
    @Column(name = "DCO_ID")
    private Long id;
    
    // Matricule assuré
    @Column(name = "EMP_MAT", nullable = false)
    private Long matricule;
    
    @Column(name = "EMP_CLE")
    private Integer cle;
    
    // Numéro affiliation
    @Column(name = "NUM_AFFILIATION", length = 20)
    private String numAffiliation;
    
    // Nom et prénom
    @Column(name = "NOM_PRENOM", length = 255)
    private String nomPrenom;
    
    // Situation (statut)
    @Column(name = "SITUATION", length = 20)
    private String situation;
    
    // Date effet
    @Column(name = "DATE_EFFET")
    private LocalDate dateEffet;
    
    // Date assujettissement (différent de date effet!)
    @Column(name = "DATE_ASSUJETTISSEMENT")
    private LocalDate dateAssujettissement;
    
    // Date de naissance
    @Column(name = "DATE_NAISSANCE")
    private LocalDate dateNaissance;
    
    // Date de dépôt CNSS
    @Column(name = "DATE_DEPOT_CNSS")
    private LocalDate dateDepotCnss;
    
    // Entreprise employeur
    @Column(name = "MATRICULE_ENTREPRISE", length = 20)
    private String matriculeEntreprise;
    
    @Column(name = "CODE_REGIME_COOP", length = 10)
    private String codeRegimeCoop;
    
    // Dossier - Période de détachement
    @Column(name = "PAYS_DETACHEMENT", length = 100)
    private String paysDetachement;
    
    @Column(name = "PERIODE_DEBUT")
    private LocalDate periodeDebut;
    
    @Column(name = "PERIODE_FIN")
    private LocalDate periodeFin;
    
    // Salaire au trimestre
    @Column(name = "SALAIRE_TRIMESTRE", precision = 15, scale = 3)
    private BigDecimal salaireTrimestre;
    
    // Régime: 500 ou 510
    @Column(name = "REGIME", length = 10)
    private String regime;
    
    // TTE ou Coopération Technique
    @Column(name = "TYPE_COOPERATION", length = 50)
    private String typeCooperation;
    
    // Actif
    @Column(name = "ACTIF")
    private Boolean actif = true;
    
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;
    
    @Column(name = "CREATED_BY")
    private Long createdBy;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        actif = true;
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
