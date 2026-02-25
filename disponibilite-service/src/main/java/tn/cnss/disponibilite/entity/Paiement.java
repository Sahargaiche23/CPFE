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
@Table(name = "DISP_PAIEMENT", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Paiement {

    public enum TypePaiement {
        VIREMENT, CHEQUE, ESPECES
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_paie_seq")
    @SequenceGenerator(name = "disp_paie_seq", sequenceName = "DISP_PAIEMENT_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "COTISATION_ID", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Cotisation cotisation;

    @Column(name = "MONTANT_PAYE", precision = 15, scale = 3, nullable = false)
    private BigDecimal montantPaye;

    @Column(name = "CODE_PAIEMENT", length = 10, nullable = false)
    private String codePaiement; // 137 ou 138

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE_PAIEMENT", length = 20)
    private TypePaiement typePaiement;

    @Column(name = "REFERENCE_PAIEMENT", length = 100)
    private String referencePaiement;

    @Column(name = "DATE_PAIEMENT", nullable = false)
    private LocalDate datePaiement;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
