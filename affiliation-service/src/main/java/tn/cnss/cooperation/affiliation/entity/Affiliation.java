package tn.cnss.cooperation.affiliation.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "AFFILIATION", schema = "COPT")
@Data
public class Affiliation {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "aff_seq")
    @SequenceGenerator(name = "aff_seq", sequenceName = "AFFILIATION_SEQ", allocationSize = 1)
    @Column(name = "AFF_ID")
    private Long id;
    
    @Column(name = "NUM_AFFILIATION", unique = true)
    private String numAffiliation;
    
    @Column(name = "MATRICULE")
    private Long matricule;
    
    @Column(name = "DATE_EFFET")
    private LocalDate dateEffet;
    
    @Column(name = "DATE_ASSUJETTISSEMENT")
    private LocalDate dateAssujettissement;
    
    @Column(name = "REGIME")
    private String regime;
    
    @Column(name = "ATTESTATION_PATH")
    private String attestationPath;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
