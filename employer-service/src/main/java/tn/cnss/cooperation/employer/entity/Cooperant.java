package tn.cnss.cooperation.employer.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Entité Cooperant - Personne coopérante
 * Remplace le concept d'Employeur par une personne physique
 */
@Entity
@Table(name = "COOPERANT", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cooperant {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cooperant_seq")
    @SequenceGenerator(name = "cooperant_seq", sequenceName = "COOPERANT_SEQ", allocationSize = 1)
    @Column(name = "COP_ID")
    private Long id;
    
    // Matricule coopérant
    @Column(name = "COP_MAT", unique = true)
    private Long matricule;
    
    @Column(name = "COP_CLE")
    private Integer cle;
    
    // ===== INFORMATIONS PERSONNELLES - FRANÇAIS =====
    @Column(name = "NOM_FR", length = 100)
    private String nomFr;
    
    @Column(name = "PRENOM_FR", length = 100)
    private String prenomFr;
    
    @Column(name = "ADRESSE_FR", length = 500)
    private String adresseFr;
    
    @Column(name = "CODE_POSTAL", length = 10)
    private String codePostal;
    
    @Column(name = "LOCALITE_FR", length = 100)
    private String localiteFr;
    
    @Column(name = "LIEU_NAISSANCE_FR", length = 100)
    private String lieuNaissanceFr;
    
    // ===== INFORMATIONS PERSONNELLES - ARABE =====
    @Column(name = "NOM_AR", length = 100)
    private String nomAr;
    
    @Column(name = "PRENOM_AR", length = 100)
    private String prenomAr;
    
    @Column(name = "ADRESSE_AR", length = 500)
    private String adresseAr;
    
    @Column(name = "LOCALITE_AR", length = 100)
    private String localiteAr;
    
    @Column(name = "LIEU_NAISSANCE_AR", length = 100)
    private String lieuNaissanceAr;
    
    // ===== DATE DE NAISSANCE =====
    @Column(name = "DATE_NAISSANCE")
    private LocalDate dateNaissance;
    
    // ===== CONTACT =====
    @Column(name = "TELEPHONE", length = 20)
    private String telephone;
    
    @Column(name = "FAX", length = 20)
    private String fax;
    
    @Column(name = "EMAIL", length = 100)
    private String email;
    
    // ===== PIÈCE D'IDENTITÉ =====
    @Column(name = "TYPE_PIECE_IDENTITE", length = 50)
    private String typePieceIdentite; // CIN, Passeport, Carte Séjour
    
    @Column(name = "NUM_PIECE_IDENTITE", length = 50)
    private String numPieceIdentite;
    
    // ===== NATIONALITÉ =====
    @Column(name = "NATIONALITE", length = 100)
    private String nationalite;
    
    // ===== TYPE DE RÉGIME =====
    // 500 = Coopérant Général
    // 510 = Coopérant Agricole Amélioré
    // 515 = Régime Agricole
    @Column(name = "CODE_REGIME", length = 10)
    private String codeRegime;
    
    // ===== FICHIERS JOINTS (chemins stockés) =====
    @Column(name = "FICHIER_DOSSIER", length = 500)
    private String fichierDossier; // Chemin vers PDF/Word/Image
    
    @Column(name = "FICHIER_IDENTITE", length = 500)
    private String fichierIdentite;
    
    @Column(name = "FICHIER_AUTRE", length = 500)
    private String fichierAutre;
    
    // ===== AFFILIATION =====
    @Column(name = "NUM_AFFILIATION", length = 20)
    private String numAffiliation;
    
    @Column(name = "CLE_AFFILIATION", length = 10)
    private String cleAffiliation;
    
    // ===== VALIDATION =====
    @Column(name = "STATUT_VALIDATION", length = 20)
    private String statutValidation; // EN_ATTENTE, VALIDE, REJETE
    
    @Column(name = "DATE_VALIDATION")
    private LocalDateTime dateValidation;
    
    @Column(name = "VALIDE_PAR")
    private Long validePar; // ID de l'agent qui a validé
    
    @Column(name = "MOTIF_REJET", length = 500)
    private String motifRejet;
    
    // ===== AUDIT =====
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
        if (statutValidation == null) {
            statutValidation = "EN_ATTENTE";
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
    
    // Méthodes helper
    @Transient
    public String getMatriculeComplet() {
        // Format: XX-YYYYYYYY (codeRegime 2 chiffres - matricule 8 chiffres)
        String regime = codeRegime != null ? codeRegime.substring(0, Math.min(2, codeRegime.length())) : "00";
        if (regime.length() < 2) regime = "0" + regime;
        String mat = String.format("%08d", matricule != null ? matricule : 0);
        return regime + "-" + mat;
    }
    
    @Transient
    public String getNomCompletFr() {
        return (prenomFr != null ? prenomFr : "") + " " + (nomFr != null ? nomFr : "");
    }
    
    @Transient
    public String getNomCompletAr() {
        return (prenomAr != null ? prenomAr : "") + " " + (nomAr != null ? nomAr : "");
    }
    
    @Transient
    public String getLibelleRegime() {
        if (codeRegime == null) return "";
        return switch (codeRegime) {
            case "500" -> "Coopérant Général";
            case "510" -> "Coopérant Agricole Amélioré";
            case "515" -> "Régime Agricole";
            default -> codeRegime;
        };
    }
}
