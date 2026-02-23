package tn.cnss.disponibilite.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_COTISATION", schema = "COPT",
       uniqueConstraints = @UniqueConstraint(columnNames = {"AGENT_PUBLIC_ID", "TRIMESTRE", "ANNEE"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cotisation {

    public enum StatutCotisation {
        EN_ATTENTE, PARTIELLEMENT_PAYE, PAYE, EN_RETARD
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_cotis_seq")
    @SequenceGenerator(name = "disp_cotis_seq", sequenceName = "DISP_COTISATION_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "AGENT_PUBLIC_ID", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private AgentPublic agentPublic;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "INSTITUTION_ID", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Institution institution;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ILHAQ_ID")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Ilhaq ilhaq;

    @Column(name = "TRIMESTRE", nullable = false)
    private Integer trimestre;

    @Column(name = "ANNEE", nullable = false)
    private Integer annee;

    @Column(name = "SALAIRE_MENSUEL_APPLIQUE", precision = 15, scale = 3)
    private BigDecimal salaireMensuelApplique;

    @Column(name = "MONTANT_CODE_137", precision = 15, scale = 3)
    private BigDecimal montantCode137;

    @Column(name = "MONTANT_CODE_138", precision = 15, scale = 3)
    private BigDecimal montantCode138;

    @Column(name = "MONTANT_CODE_197", precision = 15, scale = 3)
    private BigDecimal montantCode197;

    @Column(name = "MONTANT_CODE_198", precision = 15, scale = 3)
    private BigDecimal montantCode198;

    @Column(name = "MONTANT_TOTAL", precision = 15, scale = 3)
    private BigDecimal montantTotal;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUT", length = 30)
    private StatutCotisation statut = StatutCotisation.EN_ATTENTE;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (statut == null) statut = StatutCotisation.EN_ATTENTE;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
