package tn.cnss.cooperation.salary.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalaryConversionResponse {
    private Long id;
    private Long matricule;
    private Integer cle;
    
    // Salaire en devise
    private BigDecimal salaireDevise;
    private String devise;
    
    // Taux de change
    private BigDecimal tauxChange;
    private LocalDate dateCoursDevise;
    
    // Salaire converti en TND
    private BigDecimal salaireTND;
    
    // Salaire trimestriel (x3)
    private BigDecimal salaireTrimestriel;
    
    // Dernier salaire tunisien
    private BigDecimal dernierSalaireTN;
    
    // Régime recommandé basé sur comparaison
    private String regimeRecommande;
    
    private String message;
}
