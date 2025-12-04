package tn.cnss.cooperation.employer.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmployeurDTO {
    private String id;  // Format: "empMat-empCle"
    private Long empMat;
    private Integer empCle;
    private String nomCommercial;
    private String raisonSociale;
    private String regime;
    private String pays;
    private String adresse;
    private String telephone;
    private String email;
    private String statut;
    private String dateCreation;
    private Long affiliations;
    private String matriculeComplet;
}
