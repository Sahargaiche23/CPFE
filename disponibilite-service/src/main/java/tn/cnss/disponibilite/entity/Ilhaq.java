package tn.cnss.disponibilite.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_ILHAQ", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ilhaq {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_ilhaq_seq")
    @SequenceGenerator(name = "disp_ilhaq_seq", sequenceName = "DISP_ILHAQ_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AGENT_PUBLIC_ID", nullable = false)
    private AgentPublic agentPublic;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "INSTITUTION_ID", nullable = false)
    private Institution institution;

    @Column(name = "DATE_DEBUT", nullable = false)
    private LocalDate dateDebut;

    @Column(name = "DATE_FIN")
    private LocalDate dateFin;

    @Column(name = "DATE_IHALA")
    private LocalDate dateIhala;

    @Column(name = "REFERENCE_ARRETE", length = 100)
    private String referenceArrete;

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
}
