package tn.cnss.cooperation.employer.atct;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DOSSIER_ATCT", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DossierATCT {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "atct_seq")
    @SequenceGenerator(name = "atct_seq", sequenceName = "COPT.DOSSIER_ATCT_SEQ", allocationSize = 1)
    @Column(name = "ATCT_ID")
    private Long id;

    @Column(name = "NUM_SECU_SOCIALE", length = 20)
    private String numSecuSociale;

    @Column(name = "NOM_FR", length = 100, nullable = false)
    private String nomFr;

    @Column(name = "PRENOM_FR", length = 100, nullable = false)
    private String prenomFr;

    @Column(name = "NOM_AR", length = 100)
    private String nomAr;

    @Column(name = "PRENOM_AR", length = 100)
    private String prenomAr;

    @Column(name = "DATE_NAISSANCE")
    private LocalDate dateNaissance;

    @Column(name = "LIEU_NAISSANCE_FR", length = 100)
    private String lieuNaissanceFr;

    @Column(name = "SEXE", length = 1)
    private String sexe;

    @Column(name = "NATIONALITE", length = 50)
    private String nationalite;

    @Column(name = "NUM_CIN", length = 20)
    private String numCin;

    @Column(name = "NUM_PASSEPORT", length = 50)
    private String numPasseport;

    @Column(name = "ADRESSE_TUNISIE", length = 255)
    private String adresseTunisie;

    @Column(name = "CODE_POSTAL_TUNISIE", length = 10)
    private String codePostalTunisie;

    @Column(name = "VILLE_TUNISIE", length = 100)
    private String villeTunisie;

    @Column(name = "ADRESSE_ETRANGER", length = 255)
    private String adresseEtranger;

    @Column(name = "CODE_POSTAL_ETRANGER", length = 20)
    private String codePostalEtranger;

    @Column(name = "VILLE_ETRANGER", length = 100)
    private String villeEtranger;

    @Column(name = "PAYS_ETRANGER", length = 100)
    private String paysEtranger;

    @Column(name = "PAYS_CODE")
    private Integer paysCode;

    @Column(name = "TELEPHONE", length = 20)
    private String telephone;

    @Column(name = "EMAIL", length = 100)
    private String email;

    @Column(name = "ETABLISSEMENT_ORIGINE", length = 200)
    private String etablissementOrigine;

    @Column(name = "MATRICULE_EMPLOYEUR")
    private Long matriculeEmployeur;

    @Column(name = "CLE_EMPLOYEUR")
    private Integer cleEmployeur;

    @Column(name = "ORGANISME_ETRANGER", length = 200)
    private String organismeEtranger;

    @Column(name = "MISSION_POSTE", length = 200)
    private String missionPoste;

    @Column(name = "DATE_DEBUT_DETACHEMENT", nullable = false)
    private LocalDate dateDebutDetachement;

    @Column(name = "DATE_FIN_DETACHEMENT")
    private LocalDate dateFinDetachement;

    @Column(name = "DATE_RENOUVELLEMENT")
    private LocalDate dateRenouvellement;

    @Column(name = "SALAIRE_TUNISIE", precision = 15, scale = 3)
    private BigDecimal salaireTunisie;

    @Column(name = "SALAIRE_ETRANGER", precision = 15, scale = 3)
    private BigDecimal salaireEtranger;

    @Column(name = "DEVISE_ETRANGER", length = 10)
    private String deviseEtranger;

    @Column(name = "SALAIRE_CONVERTI_TND", precision = 15, scale = 3)
    private BigDecimal salaireConvertiTnd;

    @Column(name = "MODE_PAIEMENT", length = 20)
    private String modePaiement;

    @Column(name = "PAIEMENT_ANTICIPE")
    private Boolean paiementAnticipe;

    @Column(name = "CODE_REGIME", length = 10)
    private String codeRegime;

    @Column(name = "ASSURANCE_MALADIE")
    private Boolean assuranceMaladie;

    @Column(name = "CAPITAL_DECES")
    private Boolean capitalDeces;

    @Column(name = "DATE_EFFET_ASSURANCE")
    private LocalDate dateEffetAssurance;

    @Column(name = "STATUT", length = 20)
    private String statut;

    @Column(name = "DATE_VALIDATION")
    private LocalDateTime dateValidation;

    @Column(name = "VALIDE_PAR")
    private Long validePar;

    @Column(name = "MOTIF_REJET", length = 500)
    private String motifRejet;

    @Column(name = "COMPTE_CREE")
    private Boolean compteCree;

    @Column(name = "MOT_PASSE_TEMP", length = 100)
    private String motDePasseTemp;

    @Column(name = "DATE_ENVOI_EMAIL")
    private LocalDateTime dateEnvoiEmail;

    @Column(name = "EMAIL_ENVOYE")
    private Boolean emailEnvoye;

    @Column(name = "AFFILIATION_ID")
    private Long affiliationId;

    @Column(name = "NUM_AFFILIATION", length = 20)
    private String numAffiliation;

    @Column(name = "DOCUMENTS_DEPOSES")
    private Boolean documentsDeposes;

    @Column(name = "DATE_DEPOT_DOCUMENTS")
    private LocalDateTime dateDepotDocuments;

    @Column(name = "CREE_PAR")
    private Long creePar;

    @Column(name = "DATE_CREATION")
    private LocalDateTime dateCreation;

    @Column(name = "MODIFIE_PAR")
    private Long modifiePar;

    @Column(name = "DATE_MODIFICATION")
    private LocalDateTime dateModification;

    @Column(name = "ACTIF")
    private Boolean actif;

    @PrePersist
    public void prePersist() {
        this.dateCreation = LocalDateTime.now();
        this.actif = true;
        this.statut = "EN_ATTENTE";
        this.compteCree = false;
        this.emailEnvoye = false;
        this.documentsDeposes = false;
    }

    @PreUpdate
    public void preUpdate() {
        this.dateModification = LocalDateTime.now();
    }

    public String getNomCompletFr() {
        return prenomFr + " " + nomFr;
    }

    public String getNomCompletAr() {
        if (nomAr != null && prenomAr != null) {
            return prenomAr + " " + nomAr;
        }
        return null;
    }

    public String getMatriculeEmployeurComplet() {
        if (matriculeEmployeur != null && cleEmployeur != null) {
            return String.format("%d-%02d", matriculeEmployeur, cleEmployeur);
        }
        return null;
    }
}
