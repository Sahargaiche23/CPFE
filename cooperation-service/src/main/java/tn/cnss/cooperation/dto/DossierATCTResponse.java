package tn.cnss.cooperation.dto;

import lombok.Data;
import tn.cnss.cooperation.entity.DossierATCT;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class DossierATCTResponse {

    private Long id;

    // Informations Personnelles
    private String numSecuSociale;
    private String nomFr;
    private String prenomFr;
    private String nomAr;
    private String prenomAr;
    private String nomCompletFr;
    private String nomCompletAr;
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
    private String matriculeEmployeurComplet;

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

    // Statut
    private String statut;
    private LocalDateTime dateValidation;
    private Long validePar;
    private String motifRejet;

    // Compte
    private Boolean compteCree;
    private Boolean emailEnvoye;
    private LocalDateTime dateEnvoiEmail;

    // Affiliation
    private Long affiliationId;
    private String numAffiliation;

    // Documents
    private Boolean documentsDeposes;
    private LocalDateTime dateDepotDocuments;

    // Audit
    private Long creePar;
    private LocalDateTime dateCreation;
    private LocalDateTime dateModification;
    private Boolean actif;

    public static DossierATCTResponse fromEntity(DossierATCT entity) {
        DossierATCTResponse response = new DossierATCTResponse();
        
        response.setId(entity.getId());
        response.setNumSecuSociale(entity.getNumSecuSociale());
        response.setNomFr(entity.getNomFr());
        response.setPrenomFr(entity.getPrenomFr());
        response.setNomAr(entity.getNomAr());
        response.setPrenomAr(entity.getPrenomAr());
        response.setNomCompletFr(entity.getNomCompletFr());
        response.setNomCompletAr(entity.getNomCompletAr());
        response.setDateNaissance(entity.getDateNaissance());
        response.setLieuNaissanceFr(entity.getLieuNaissanceFr());
        response.setSexe(entity.getSexe());
        response.setNationalite(entity.getNationalite());
        response.setNumCin(entity.getNumCin());
        response.setNumPasseport(entity.getNumPasseport());

        response.setAdresseTunisie(entity.getAdresseTunisie());
        response.setCodePostalTunisie(entity.getCodePostalTunisie());
        response.setVilleTunisie(entity.getVilleTunisie());

        response.setAdresseEtranger(entity.getAdresseEtranger());
        response.setCodePostalEtranger(entity.getCodePostalEtranger());
        response.setVilleEtranger(entity.getVilleEtranger());
        response.setPaysEtranger(entity.getPaysEtranger());
        response.setPaysCode(entity.getPaysCode());

        response.setTelephone(entity.getTelephone());
        response.setEmail(entity.getEmail());

        response.setEtablissementOrigine(entity.getEtablissementOrigine());
        response.setMatriculeEmployeur(entity.getMatriculeEmployeur());
        response.setCleEmployeur(entity.getCleEmployeur());
        response.setMatriculeEmployeurComplet(entity.getMatriculeEmployeurComplet());

        response.setOrganismeEtranger(entity.getOrganismeEtranger());
        response.setMissionPoste(entity.getMissionPoste());

        response.setDateDebutDetachement(entity.getDateDebutDetachement());
        response.setDateFinDetachement(entity.getDateFinDetachement());
        response.setDateRenouvellement(entity.getDateRenouvellement());

        response.setSalaireTunisie(entity.getSalaireTunisie());
        response.setSalaireEtranger(entity.getSalaireEtranger());
        response.setDeviseEtranger(entity.getDeviseEtranger());
        response.setSalaireConvertiTnd(entity.getSalaireConvertiTnd());

        response.setModePaiement(entity.getModePaiement());
        response.setPaiementAnticipe(entity.getPaiementAnticipe());

        response.setCodeRegime(entity.getCodeRegime());

        response.setAssuranceMaladie(entity.getAssuranceMaladie());
        response.setCapitalDeces(entity.getCapitalDeces());
        response.setDateEffetAssurance(entity.getDateEffetAssurance());

        response.setStatut(entity.getStatut());
        response.setDateValidation(entity.getDateValidation());
        response.setValidePar(entity.getValidePar());
        response.setMotifRejet(entity.getMotifRejet());

        response.setCompteCree(entity.getCompteCree());
        response.setEmailEnvoye(entity.getEmailEnvoye());
        response.setDateEnvoiEmail(entity.getDateEnvoiEmail());

        response.setAffiliationId(entity.getAffiliationId());
        response.setNumAffiliation(entity.getNumAffiliation());

        response.setDocumentsDeposes(entity.getDocumentsDeposes());
        response.setDateDepotDocuments(entity.getDateDepotDocuments());

        response.setCreePar(entity.getCreePar());
        response.setDateCreation(entity.getDateCreation());
        response.setDateModification(entity.getDateModification());
        response.setActif(entity.getActif());

        return response;
    }
}
