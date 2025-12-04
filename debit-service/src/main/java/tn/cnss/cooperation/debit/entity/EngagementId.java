package tn.cnss.cooperation.debit.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Clé composée pour la table ENGAGEMNT
 * PRIMARY KEY (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB)
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EngagementId implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Long engNum;           // Numéro engagement
    private Long empMat;           // Matricule employeur
    private Integer empCle;        // Clé employeur
    private LocalDate dcoDateDebut; // Date début dossier
}
