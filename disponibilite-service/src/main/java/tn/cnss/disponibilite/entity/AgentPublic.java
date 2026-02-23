package tn.cnss.disponibilite.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_AGENT_PUBLIC", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgentPublic {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_agent_seq")
    @SequenceGenerator(name = "disp_agent_seq", sequenceName = "DISP_AGENT_PUBLIC_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NUM_INSCRIPTION", length = 20, unique = true)
    private String numInscription;

    @Column(name = "CODE_EXPLOITATION", length = 10)
    private String codeExploitation;

    @Column(name = "NOM", length = 100)
    private String nom;

    @Column(name = "PRENOM", length = 100)
    private String prenom;

    @Column(name = "NOM_FR", length = 100)
    private String nomFr;

    @Column(name = "PRENOM_FR", length = 100)
    private String prenomFr;

    @Column(name = "DATE_NAISSANCE")
    private LocalDate dateNaissance;

    @Column(name = "CIN", length = 20)
    private String cin;

    @Column(name = "ADRESSE", length = 500)
    private String adresse;

    @Column(name = "EMAIL", length = 100)
    private String email;

    @Column(name = "TELEPHONE", length = 20)
    private String telephone;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "INSTITUTION_ID")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Institution institution;

    @Column(name = "DATE_DEBUT_ILHAQ")
    private LocalDate dateDebutIlhaq;

    @Column(name = "DATE_FIN_ILHAQ")
    private LocalDate dateFinIlhaq;

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
    public String getNomCompletAr() {
        return (prenom != null ? prenom : "") + " " + (nom != null ? nom : "");
    }

    @Transient
    public String getNomCompletFr() {
        return (prenomFr != null ? prenomFr : "") + " " + (nomFr != null ? nomFr : "");
    }
}
