package tn.cnss.cooperation.notification.dto;

import lombok.Data;

@Data
public class AtctRappelRequest {
    private String to;
    private String subject;
    private String content;
    
    // Infos du dossier ATCT
    private String nomComplet;
    private String nomCompletAr;
    private String numSecuSociale;
    private String adresseTunisie;
    private String codePostalTunisie;
    private String villeTunisie;
    private String adresseEtranger;
    private String villeEtranger;
    private String paysEtranger;
    private String email;
    private String etablissementOrigine;
    private String organismeEtranger;
    private String dateDebutDetachement;
    private String dateFinDetachement;
    private String modePaiement;
    private Boolean assuranceMaladie;
}
