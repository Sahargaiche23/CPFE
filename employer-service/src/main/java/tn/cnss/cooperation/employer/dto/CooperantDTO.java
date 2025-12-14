package tn.cnss.cooperation.employer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * DTO pour le Coopérant
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CooperantDTO {
    
    private Long id;
    private Long matricule;
    private Integer cle;
    
    // Informations personnelles - Français
    private String nomFr;
    private String prenomFr;
    private String adresseFr;
    private String codePostal;
    private String localiteFr;
    private String lieuNaissanceFr;
    
    // Informations personnelles - Arabe
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
    private String email;
    
    // Pièce d'identité
    private String typePieceIdentite;
    private String numPieceIdentite;
    
    // Nationalité
    private String nationalite;
    
    // Régime
    private String codeRegime;
    private String libelleRegime;
    
    // Fichiers
    private String fichierDossier;
    private String fichierIdentite;
    private String fichierAutre;
    
    // Affiliation
    private String numAffiliation;
    private String cleAffiliation;
    
    // Validation
    private String statutValidation;
    private LocalDateTime dateValidation;
    private Long validePar;
    private String motifRejet;
    
    // Audit
    private Boolean actif;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    // Champs calculés
    private String matriculeComplet;
    private String nomCompletFr;
    private String nomCompletAr;
}
