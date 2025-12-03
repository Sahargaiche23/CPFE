package tn.cnss.cooperation.regime.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class DetermineRegimeRequest {
    private BigDecimal dernierSalaire;
    private BigDecimal nouveauSalaireTND;
    private String pays;
    private Boolean societePublique;
    private String dateDetachement;
}
