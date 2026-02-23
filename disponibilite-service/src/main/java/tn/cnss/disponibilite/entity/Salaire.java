package tn.cnss.disponibilite.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_SALAIRE", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Salaire {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_salaire_seq")
    @SequenceGenerator(name = "disp_salaire_seq", sequenceName = "DISP_SALAIRE_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "AGENT_PUBLIC_ID", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private AgentPublic agentPublic;

    @Column(name = "SALAIRE_MENSUEL", precision = 15, scale = 3, nullable = false)
    private BigDecimal salaireMensuel;

    @Column(name = "DATE_EFFET", nullable = false)
    private LocalDate dateEffet;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
