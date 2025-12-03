package tn.cnss.cooperation.payment.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class AddPaymentRequest {
    private String numAffiliation;
    private String trimestre;
    private BigDecimal montant;
    private String modePaiement;
    private Boolean paiementPartiel;
}
