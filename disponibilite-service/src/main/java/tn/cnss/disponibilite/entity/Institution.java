package tn.cnss.disponibilite.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_INSTITUTION", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_inst_seq")
    @SequenceGenerator(name = "disp_inst_seq", sequenceName = "DISP_INSTITUTION_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NUM_AFFILIATION", length = 20)
    private String numAffiliation;

    @Column(name = "BRANCHE_SOCIALE", length = 10)
    private String brancheSociale;

    @Column(name = "RAISON_SOCIALE", length = 300)
    private String raisonSociale;

    @Column(name = "ADRESSE", length = 500)
    private String adresse;

    @Column(name = "TELEPHONE", length = 20)
    private String telephone;

    @Column(name = "EMAIL", length = 100)
    private String email;

    @Column(name = "GOUVERNORAT", length = 100)
    private String gouvernorat;

    @Column(name = "ACTIF")
    private Boolean actif = true;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (actif == null) actif = true;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    @Transient
    public String getIdentifiantMetier() {
        return (numAffiliation != null ? numAffiliation : "") + "/" + (brancheSociale != null ? brancheSociale : "");
    }
}
