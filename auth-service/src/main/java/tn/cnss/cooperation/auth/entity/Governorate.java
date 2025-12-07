package tn.cnss.cooperation.auth.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Entité pour les 24 gouvernorats de Tunisie
 */
@Entity
@Table(name = "GOVERNORATE", schema = "COPT")
@Data
public class Governorate {
    
    @Id
    @Column(name = "GOV_CODE")
    private Integer code;
    
    @Column(name = "GOV_NAME", length = 50, nullable = false)
    private String name;
    
    @Column(name = "GOV_NAME_AR", length = 50)
    private String nameAr;
    
    @Column(name = "REGION", length = 20)
    private String region;
}
