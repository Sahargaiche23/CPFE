package tn.cnss.cooperation.salary.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Requête de conversion salaire étranger en TND
 * Correspond à la table SALAIRE_ETRANGER
 */
@Data
public class ConvertSalaryRequest {
    
    // === Clé composée ===
    @NotNull(message = "Le matricule employeur est obligatoire")
    private Long empMat;
    
    @NotNull(message = "La clé employeur est obligatoire")
    private Integer empCle;
    
    @NotNull(message = "La date début dossier est obligatoire")
    private LocalDate dcoDateDebut;
    
    // === Salaire ===
    @NotNull(message = "Le montant en devise est obligatoire")
    @Positive(message = "Le montant doit être positif")
    private BigDecimal montantDevise;
    
    @NotNull(message = "La devise est obligatoire")
    private String devise;  // EUR, USD, CAD, etc.
    
    // === Conversion ===
    @NotNull(message = "La date de détachement est obligatoire")
    private LocalDate dateDetachement;
    
    private BigDecimal tauxChangeManuel;  // Si null, récupéré de BCT
    
    // === Comparaison (optionnel) ===
    private BigDecimal dernierSalaireTN;  // Pour déterminer régime recommandé
    
    // === Audit ===
    private Long agentId;  // ID de l'agent qui fait la conversion
}
