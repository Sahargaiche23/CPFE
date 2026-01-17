package tn.cnss.cooperation.debit.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class UpdateDebitRequest {
    private Long id;
    private String numAffiliation;
    private String nomCooperant;
    private String adresse;
    private String matricule;
    private String trimestre;
    private Integer annee;
    private LocalDate dateEffet;
    private BigDecimal salaire;
    private BigDecimal montantCotisation;
    private Boolean paye;
    private String cotisationsJson;
    private String email;
    private String pdfBase64;
}
