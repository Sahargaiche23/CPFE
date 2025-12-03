package tn.cnss.cooperation.payment.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "PAYMENT", schema = "COPT")
@Data
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pay_seq")
    @SequenceGenerator(name = "pay_seq", sequenceName = "PAYMENT_SEQ", allocationSize = 1)
    @Column(name = "PAY_ID")
    private Long id;
    
    @Column(name = "NUM_AFFILIATION")
    private String numAffiliation;
    
    @Column(name = "TRIMESTRE")
    private String trimestre;
    
    @Column(name = "MONTANT", precision = 15, scale = 3)
    private BigDecimal montant;
    
    @Column(name = "MODE_PAIEMENT")
    private String modePaiement;
    
    @Column(name = "PAIEMENT_PARTIEL")
    private Boolean paiementPartiel = false;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
