package tn.cnss.cooperation.notification.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class EmailRequest {
    private String numAffiliation;
    private String email;
    private BigDecimal montantCotisation;
    private String rib;
}
