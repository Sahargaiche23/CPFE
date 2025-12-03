package tn.cnss.cooperation.salary.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Table SALAIRE_ETRANGER basée sur slaire_etranger.sql
 */
@Entity
@Table(name = "SALAIRE_ETRANGER", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalaireEtranger {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "salaire_etr_seq")
    @SequenceGenerator(name = "salaire_etr_seq", sequenceName = "SALAIRE_ETR_SEQ", allocationSize = 1)
    @Column(name = "SLE_ID")
    private Long id;
    
    @Column(name = "EMP_MAT", nullable = false)
    private Long matricule;
    
    @Column(name = "EMP_CLE")
    private Integer cle;
    
    @Column(name = "DCO_DTDEB", nullable = false)
    private LocalDate dateDebut;
    
    @Column(name = "SLE_DATE", nullable = false)
    private LocalDate salaireDate;
    
    // Salaire en devise étrangère
    @Column(name = "SLE_SALAIRE_DEVISE", precision = 15, scale = 3)
    private BigDecimal salaireDevise;
    
    // Code devise (EUR, USD, CAD, etc.)
    @Column(name = "SLE_DEVISE", length = 3)
    private String devise;
    
    // Taux de change BCT
    @Column(name = "SLE_TAUX_CHANGE", precision = 10, scale = 6)
    private BigDecimal tauxChange;
    
    // Salaire converti en TND (Dinar Tunisien)
    @Column(name = "SLE_SALAIRE", precision = 15, scale = 3)
    private BigDecimal salaireTND;
    
    // Salaire trimestriel (x3 mois)
    @Column(name = "SLE_SALAIRE_TRIM", precision = 15, scale = 3)
    private BigDecimal salaireTrimestriel;
    
    @Column(name = "SLE_AGENT")
    private Long agentId;
    
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
