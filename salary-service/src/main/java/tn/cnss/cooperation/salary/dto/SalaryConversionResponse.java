package tn.cnss.cooperation.salary.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Réponse de conversion salaire
 * Contient le salaire converti en TND et les calculs associés
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalaryConversionResponse {
    
    // === Identification ===
    private Long empMat;
    private Integer empCle;
    private String matriculeComplet;  // Format: "MAT-CLE"
    
    // === Salaire source ===
    private BigDecimal salaireDevise;
    private String devise;
    
    // === Conversion ===
    private BigDecimal tauxChange;
    private LocalDate dateCoursDevise;
    
    // === Salaire converti ===
    private BigDecimal salaireMensuelTND;      // Salaire mensuel en TND
    private BigDecimal salaireTrimestrielTND;  // Salaire trimestriel (x3)
    
    // === Comparaison ===
    private BigDecimal dernierSalaireTN;
    
    // === Recommandation ===
    private String regimeRecommande;  // "500" ou "510"
    
    // === Message ===
    private String message;
}
