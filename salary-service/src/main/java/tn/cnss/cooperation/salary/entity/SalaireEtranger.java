package tn.cnss.cooperation.salary.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Entité JPA pour la table SALAIRE_ETRANGER
 * Représente un salaire étranger converti en TND
 * PRIMARY KEY (EMP_MAT, EMP_CLE, DCO_DTDEB, SLE_DATE)
 * 
 * Structure exacte de la table Oracle:
 * - emp_mat     NUMBER(8) not null
 * - emp_cle     NUMBER(2) not null
 * - dco_dtdeb   DATE not null
 * - sle_date    DATE not null
 * - sle_salaire NUMBER(15,3)
 * - sle_agent   NUMBER(6)
 */
@Entity
@Table(name = "SALAIRE_ETRANGER", schema = "COPT")
@IdClass(SalaireEtrangerId.class)
@Data
@NoArgsConstructor
public class SalaireEtranger {
    
    // === Clé Primaire Composée ===
    @Id
    @Column(name = "EMP_MAT", nullable = false)
    private Long empMat;
    
    @Id
    @Column(name = "EMP_CLE", nullable = false)
    private Integer empCle;
    
    @Id
    @Column(name = "DCO_DTDEB", nullable = false)
    private LocalDate dcoDateDebut;
    
    @Id
    @Column(name = "SLE_DATE", nullable = false)
    private LocalDate sleDate;
    
    // === Données ===
    @Column(name = "SLE_SALAIRE", precision = 15, scale = 3)
    private BigDecimal sleSalaire;  // Salaire en TND
    
    @Column(name = "SLE_AGENT")
    private Long sleAgent;  // ID de l'agent qui a saisi
    
    // === Méthodes Utilitaires ===
    
    /**
     * Génère le matricule complet employeur
     */
    public String getEmployeurMatriculeComplet() {
        return String.format("%d-%02d", empMat, empCle);
    }
    
    /**
     * Calcule le salaire trimestriel (x3 mois)
     */
    public BigDecimal getSalaireTrimestriel() {
        if (sleSalaire != null) {
            return sleSalaire.multiply(new BigDecimal("3"));
        }
        return BigDecimal.ZERO;
    }
}
