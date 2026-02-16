package tn.cnss.cooperation.employer.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Entité DemandeCooperant - Demandes déposées par les coopérants
 * Types: ACTUALISATION_SALAIRE, SORTIE_REGIME_MALADIE, ANNULATION_ASSURANCE, RACHAT_LOI105
 */
@Entity
@Table(name = "DEMANDE_COOPERANT", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DemandeCooperant {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demande_seq")
    @SequenceGenerator(name = "demande_seq", sequenceName = "DEMANDE_COOPERANT_SEQ", allocationSize = 1)
    @Column(name = "DEM_ID")
    private Long id;

    @Column(name = "COOPERANT_ID", nullable = false)
    private Long cooperantId;

    @Column(name = "NUM_AFFILIATION", length = 20)
    private String numAffiliation;

    @Column(name = "NOM_COOPERANT", length = 200)
    private String nomCooperant;

    @Column(name = "MATRICULE", length = 30)
    private String matricule;

    @Column(name = "EMAIL", length = 100)
    private String email;

    // ACTUALISATION_SALAIRE, SORTIE_REGIME_MALADIE, ANNULATION_ASSURANCE, RACHAT_LOI105
    @Column(name = "TYPE_DEMANDE", length = 50, nullable = false)
    private String typeDemande;

    // EN_ATTENTE, VALIDEE, REJETEE, EN_COURS
    @Column(name = "STATUT", length = 20)
    private String statut = "EN_ATTENTE";

    // ===== ACTUALISATION SALAIRE =====
    @Column(name = "ANCIEN_SALAIRE", precision = 15, scale = 3)
    private BigDecimal ancienSalaire;

    @Column(name = "NOUVEAU_SALAIRE", precision = 15, scale = 3)
    private BigDecimal nouveauSalaire;

    @Column(name = "DATE_EFFET_SALAIRE")
    private LocalDate dateEffetSalaire;

    // ===== SORTIE REGIME MALADIE / ANNULATION ASSURANCE =====
    @Column(name = "MOTIF", length = 1000)
    private String motif;

    @Column(name = "REGIME_CONCERNE", length = 50)
    private String regimeConcerne; // Code régime à annuler/sortir

    @Column(name = "IMPACT_COTISATION", precision = 15, scale = 3)
    private BigDecimal impactCotisation; // Réduction cotisation calculée

    // ===== RACHAT LOI 105 =====
    @Column(name = "DEBIT_ID")
    private Long debitId; // Référence au débit concerné

    @Column(name = "TRIMESTRE_DEBIT", length = 20)
    private String trimestreDebit;

    @Column(name = "MONTANT_ORIGINAL", precision = 15, scale = 3)
    private BigDecimal montantOriginal;

    @Column(name = "TAUX_RACHAT", precision = 5, scale = 2)
    private BigDecimal tauxRachat; // 95%

    @Column(name = "MONTANT_RACHAT", precision = 15, scale = 3)
    private BigDecimal montantRachat; // montantOriginal * 95%

    @Column(name = "REDUCTION", precision = 15, scale = 3)
    private BigDecimal reduction; // montantOriginal * 5%

    // ===== VALIDATION =====
    @Column(name = "VALIDE_PAR")
    private Long validePar;

    @Column(name = "DATE_VALIDATION")
    private LocalDateTime dateValidation;

    @Column(name = "MOTIF_REJET", length = 500)
    private String motifRejet;

    @Column(name = "COMMENTAIRE", length = 1000)
    private String commentaire;

    // ===== DOCUMENT JOINT =====
    @Column(name = "FICHIER_JUSTIFICATIF", length = 500)
    private String fichierJustificatif;

    // ===== AUDIT =====
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (statut == null) statut = "EN_ATTENTE";
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
