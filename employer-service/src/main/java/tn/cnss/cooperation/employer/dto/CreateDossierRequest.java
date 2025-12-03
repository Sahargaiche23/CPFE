package tn.cnss.cooperation.employer.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDate;

@Data
public class CreateDossierRequest {
    
    @NotNull(message = "Le matricule est obligatoire")
    private Long matricule;
    
    private Integer cle;
    
    @NotNull(message = "Le régime est obligatoire (500 ou 510)")
    private String regime;
    
    @NotNull(message = "La date de dépôt CNSS est obligatoire")
    private LocalDate dateDepotCnss;
    
    @NotNull(message = "La date d'effet est obligatoire")
    private LocalDate dateEffet;
    
    private LocalDate dateNaissance;
    
    private String nomPrenom;
    
    private String paysDetachement;
    
    private LocalDate periodeDebut;
    
    private LocalDate periodeFin;
    
    private String matriculeEntreprise;
    
    // Taux de rachat pour périodes antérieures
    private Boolean calculerPeriodesAnterieures = true;
}
