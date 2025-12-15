package tn.cnss.cooperation.notification.dto;

import lombok.Data;

@Data
public class DebitEmailRequest {
    private String to;
    private String subject;
    private String numAffiliation;
    private String matricule;
    private String nomCooperant;
    private String adresse;
    private int trimestre;
    private int annee;
    private double salaire;
    private double montantTotal;
}
