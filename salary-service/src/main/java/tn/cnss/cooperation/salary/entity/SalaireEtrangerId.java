package tn.cnss.cooperation.salary.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Clé composée pour la table SALAIRE_ETRANGER
 * PRIMARY KEY (EMP_MAT, EMP_CLE, DCO_DTDEB, SLE_DATE)
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalaireEtrangerId implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Long empMat;           // Matricule employeur
    private Integer empCle;        // Clé employeur
    private LocalDate dcoDateDebut; // Date début dossier
    private LocalDate sleDate;     // Date du salaire étranger
}
