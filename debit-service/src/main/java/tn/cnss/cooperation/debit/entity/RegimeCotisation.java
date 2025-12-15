package tn.cnss.cooperation.debit.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "regime_cotisation")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegimeCotisation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "code", nullable = false, unique = true)
    private String code; // Ex: "133", "91", "0"
    
    @Column(name = "nom_ar", nullable = false)
    private String nomAr; // Nom en arabe: جرايات الشيخوخة والعجز والباقين على قيد الحياة
    
    @Column(name = "nom_fr")
    private String nomFr; // Nom en français: Pensions de vieillesse, d'invalidité et de survivants
    
    @Column(name = "taux", nullable = false, precision = 5, scale = 2)
    private BigDecimal taux; // Pourcentage: 13.5, 9, 0
    
    @Column(name = "base_calcul")
    private String baseCalcul; // "SALAIRE" ou "SALAIRE_PLAFONNE" (73.5%)
    
    @Column(name = "coefficient_base", precision = 5, scale = 3)
    private BigDecimal coefficientBase; // 1.0 pour salaire complet, 0.735 pour plafonné
    
    @Column(name = "actif")
    private Boolean actif = true;
    
    @Column(name = "ordre")
    private Integer ordre; // Ordre d'affichage dans le tableau
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
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
