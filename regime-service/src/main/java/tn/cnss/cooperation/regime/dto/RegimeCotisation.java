package tn.cnss.cooperation.regime.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegimeCotisation {
    private Long id;
    private String code;
    private String nomAr;
    private String nomFr;
    private Double taux;
    private String baseCalcul;
    private Double coefficientBase;
    private Boolean actif;
    private Integer ordre;
}
