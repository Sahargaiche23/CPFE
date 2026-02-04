package tn.cnss.cooperation.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class DossierATCTRequest {

    // Informations Personnelles
    private String numSecuSociale;
    private String nomFr;
    private String prenomFr;
    private String nomAr;
    private String prenomAr;
    private LocalDate dateNaissance;
    private String lieuNaissanceFr;
    private String sexe;
    private String nationalite;
    private String numCin;
    private String numPasseport;

    // Adresse Tunisie
    private String adresseTunisie;
    private String codePostalTunisie;
    private String villeTunisie;

    // Adresse Étranger
    private String adresseEtranger;
    private String codePostalEtranger;
    private String villeEtranger;
    private String paysEtranger;
    private Integer paysCode;

    // Contact
    private String telephone;
    private String email;

    // Établissement d'Origine
    private String etablissementOrigine;
    private Long matriculeEmployeur;
    private Integer cleEmployeur;

    // Mission à l'Étranger
    private String organismeEtranger;
    private String missionPoste;

    // Période de Détachement
    private LocalDate dateDebutDetachement;
    private LocalDate dateFinDetachement;
    private LocalDate dateRenouvellement;

    // Salaires
    private BigDecimal salaireTunisie;
    private BigDecimal salaireEtranger;
    private String deviseEtranger;
    private BigDecimal salaireConvertiTnd;

    // Mode de Paiement
    private String modePaiement;
    private Boolean paiementAnticipe;

    // Régime
    private String codeRegime;

    // Options Assurance
    private Boolean assuranceMaladie;
    private Boolean capitalDeces;
    private LocalDate dateEffetAssurance;
}
