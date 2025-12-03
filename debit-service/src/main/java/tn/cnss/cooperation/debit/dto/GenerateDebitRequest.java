package tn.cnss.cooperation.debit.dto;

import lombok.Data;
import java.time.LocalDate;

@Data
public class GenerateDebitRequest {
    private String numAffiliation;
    private String trimestre;
    private LocalDate dateEffet;
    private Boolean trimestreDejaDeclare;
}
