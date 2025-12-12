package tn.cnss.cooperation.employer.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * Request DTO pour créer/modifier un Coopérant
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateCooperantRequest {
    
    // Informations personnelles - Français (obligatoires)
    @NotBlank(message = "Le nom en français est obligatoire")
    private String nomFr;
    
    @NotBlank(message = "Le prénom en français est obligatoire")
    private String prenomFr;
    
    @NotBlank(message = "L'adresse en français est obligatoire")
    private String adresseFr;
    
    private String codePostal;
    
    private String localiteFr;
    
    private String lieuNaissanceFr;
    
    // Informations personnelles - Arabe (optionnelles)
    private String nomAr;
    private String prenomAr;
    private String adresseAr;
    private String localiteAr;
    private String lieuNaissanceAr;
    
    // Date de naissance
    private LocalDate dateNaissance;
    
    // Contact
    private String telephone;
    private String fax;
    
    @Email(message = "Format email invalide")
    private String email;
    
    // Pièce d'identité
    @NotBlank(message = "Le type de pièce d'identité est obligatoire")
    private String typePieceIdentite;
    
    @NotBlank(message = "Le numéro de pièce d'identité est obligatoire")
    private String numPieceIdentite;
    
    // Nationalité
    private String nationalite;
    
    // Régime - 500, 510, 515
    @NotBlank(message = "Le code régime est obligatoire")
    @Pattern(regexp = "^(500|510|515)$", message = "Code régime invalide (500, 510 ou 515)")
    private String codeRegime;
}
