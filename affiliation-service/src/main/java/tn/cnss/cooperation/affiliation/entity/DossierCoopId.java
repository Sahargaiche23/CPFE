package tn.cnss.cooperation.affiliation.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Clé composée pour la table DOSSIER_COP
 * PRIMARY KEY (EMP_MAT, EMP_CLE, DCO_DTDEB)
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DossierCoopId implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Long empMat;        // Matricule employeur
    private Integer empCle;     // Clé employeur
    private LocalDate dcoDateDebut;  // Date début
}
