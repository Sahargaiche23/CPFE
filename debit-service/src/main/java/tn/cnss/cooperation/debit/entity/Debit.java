package tn.cnss.cooperation.debit.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DEBIT", schema = "COPT")
@Data
public class Debit {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "debit_seq")
    @SequenceGenerator(name = "debit_seq", sequenceName = "DEBIT_SEQ", allocationSize = 1)
    @Column(name = "DEB_ID")
    private Long id;
    
    @Column(name = "NUM_AFFILIATION")
    private String numAffiliation;
    
    @Column(name = "TRIMESTRE")
    private String trimestre; // Format: 2025T1, 2025T2, etc.
    
    @Column(name = "DATE_EFFET")
    private LocalDate dateEffet;
    
    @Column(name = "MONTANT_COTISATION", precision = 15, scale = 3)
    private BigDecimal montantCotisation;
    
    @Column(name = "PAYE")
    private Boolean paye = false;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
