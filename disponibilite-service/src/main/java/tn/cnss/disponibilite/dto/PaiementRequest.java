package tn.cnss.disponibilite.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class PaiementRequest {
    private Long cotisationId;
    private BigDecimal montantPaye;
    private String codePaiement; // 137 ou 138
    private String typePaiement; // VIREMENT, CHEQUE, ESPECES
    private String referencePaiement;
    private LocalDate datePaiement;
}
