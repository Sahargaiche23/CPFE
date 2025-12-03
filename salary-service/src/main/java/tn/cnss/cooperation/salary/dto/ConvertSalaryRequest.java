package tn.cnss.cooperation.salary.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Requête de conversion salaire
 * Paramètres multiples (pas juste ID)
 */
@Data
public class ConvertSalaryRequest {
    
    @NotNull(message = "Le matricule est obligatoire")
    private Long matricule;
    
    private Integer cle;
    
    // Dernier salaire tunisien (trimestre complet)
    @Positive(message = "Le dernier salaire tunisien doit être positif")
    private BigDecimal dernierSalaireTN;
    
    // Nouveau salaire à l'étranger (mensuel)
    @NotNull(message = "Le salaire étranger est obligatoire")
    @Positive(message = "Le salaire étranger doit être positif")
    private BigDecimal nouveauSalaireEtranger;
    
    // Code devise (EUR, USD, CAD, etc.)
    @NotNull(message = "La devise est obligatoire")
    private String devise;
    
    // Date de détachement (pour récupérer le cours BCT du 1er jour)
    @NotNull(message = "La date de détachement est obligatoire")
    private LocalDate dateDetachement;
    
    // Taux de change manuel (optionnel, sinon récupéré de BCT)
    private BigDecimal tauxChangeManuel;
}
