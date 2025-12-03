package tn.cnss.cooperation.regime.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RegimeResponse {
    private String regime; // 500 ou 510
    private String typeCooperation; // TTE ou Coop Technique
    private String raison;
    private Boolean paysConventionne;
    private Boolean eligibleTTE;
    private Boolean eligibleCoopTech;
}
