package tn.cnss.cooperation.auth.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "APP_USER", schema = "COPT")
@Data
public class User {
    @Id
    @Column(name = "USER_ID")
    private Long id;
    
    @Column(name = "USERNAME", length = 50, unique = true, nullable = false)
    private String username;
    
    @Column(name = "PASSWORD", length = 255, nullable = false)
    private String password;
    
    @Column(name = "EMAIL", length = 100, unique = true)
    private String email;
    
    @Column(name = "FIRST_NAME", length = 50)
    private String firstName;
    
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;
    
    @Column(name = "ROLE", length = 20, nullable = false)
    private String profil;
    
    @Column(name = "BUREAU_CODE", length = 10)
    private String burCod;
    
    @Column(name = "ACTIVE")
    private Integer active;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;
    
    // Getter pour compatibilité avec l'ancien code
    public String getIdentite() {
        return firstName + " " + lastName;
    }
}
