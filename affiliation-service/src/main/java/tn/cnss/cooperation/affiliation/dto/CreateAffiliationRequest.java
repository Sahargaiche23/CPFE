package tn.cnss.cooperation.affiliation.dto;

import lombok.Data;
import java.time.LocalDate;

@Data
public class CreateAffiliationRequest {
    private Long matricule;
    private Integer cle;
    private String numEmployeur;
    private String regime;
    private LocalDate dateEffet;
    private LocalDate dateAssujettissement;
}
