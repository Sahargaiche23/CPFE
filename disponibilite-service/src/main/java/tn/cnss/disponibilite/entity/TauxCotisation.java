package tn.cnss.disponibilite.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "DISP_TAUX_COTISATION", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TauxCotisation {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_taux_seq")
    @SequenceGenerator(name = "disp_taux_seq", sequenceName = "DISP_TAUX_COTISATION_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @Column(name = "DATE_DEBUT", nullable = false)
    private LocalDate dateDebut;

    @Column(name = "DATE_FIN")
    private LocalDate dateFin;

    @Column(name = "TAUX_CODE_137", precision = 10, scale = 4, nullable = false)
    private BigDecimal tauxCode137;

    @Column(name = "TAUX_CODE_138", precision = 10, scale = 4, nullable = false)
    private BigDecimal tauxCode138;

    @Column(name = "TAUX_CODE_197", precision = 10, scale = 4)
    private BigDecimal tauxCode197;

    @Column(name = "TAUX_CODE_198", precision = 10, scale = 4)
    private BigDecimal tauxCode198;
}
