package tn.cnss.cooperation.employer.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "EMPLOYEUR", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
@IdClass(EmployeurId.class)
public class Employeur {
    
    @Id
    @Column(name = "EMP_MAT", nullable = false)
    private Long empMat;
    
    @Id
    @Column(name = "EMP_CLE", nullable = false)
    private Integer empCle;
    
    @Column(name = "NOM_COMMERCIAL", length = 200)
    private String nomCommercial;
    
    @Column(name = "RAISON_SOCIALE", length = 200)
    private String raisonSociale;
    
    @Column(name = "REGIME", length = 10)
    private String regime;
    
    @Column(name = "PAYS", length = 100)
    private String pays;
    
    @Column(name = "ADRESSE", length = 500)
    private String adresse;
    
    @Column(name = "TELEPHONE", length = 50)
    private String telephone;
    
    @Column(name = "EMAIL", length = 100)
    private String email;
    
    @Column(name = "STATUT", length = 20)
    private String statut;
    
    @Column(name = "DATE_CREATION")
    private java.time.LocalDate dateCreation;
    
    // Méthode helper pour affichage
    @Transient
    public String getMatriculeComplet() {
        return empMat + "-" + empCle;
    }
    
    // ID virtuel pour le frontend
    @Transient
    public String getId() {
        return empMat + "-" + empCle;
    }
}
