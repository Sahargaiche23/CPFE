package tn.cnss.disponibilite.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_APP_USER", schema = "COPT")
@Data
public class AppUser {
    @Id
    @Column(name = "USER_ID")
    private Long id;

    @Column(name = "USERNAME", length = 50, unique = true, nullable = false)
    private String username;

    @Column(name = "PASSWORD", length = 255, nullable = false)
    private String password;

    @Column(name = "EMAIL", length = 100)
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

    public String getIdentite() {
        return (firstName != null ? firstName : "") + " " + (lastName != null ? lastName : "");
    }
}
