package tn.cnss.cooperation.debit.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class GenerateDebitRequest {
    private Long cooperantId;
    private String numAffiliation;
    private String nomCooperant;
    private String adresse;
    private String matricule;
    private Integer trimestre;
    private Integer annee;
    private BigDecimal salaire;
    private BigDecimal montantCotisation;
    private String dateDebut;
    private String email;
    private String pdfBase64;
}
