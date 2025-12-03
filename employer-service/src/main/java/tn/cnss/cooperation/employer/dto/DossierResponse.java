package tn.cnss.cooperation.employer.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class DossierResponse {
    private Long id;
    private Long matricule;
    private Integer cle;
    private String numAffiliation;
    private String nomPrenom;
    private String regime;
    private String typeCooperation;
    private LocalDate dateEffet;
    private LocalDate dateAssujettissement;
    private LocalDate dateDepotCnss;
    private String paysDetachement;
    private LocalDate periodeDebut;
    private LocalDate periodeFin;
    private Boolean actif;
    private String message;
}
