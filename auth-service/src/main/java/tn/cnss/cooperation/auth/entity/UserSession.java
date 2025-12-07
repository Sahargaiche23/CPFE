package tn.cnss.cooperation.auth.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "USER_SESSION", schema = "COPT")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserSession {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SESSION_ID")
    private Long id;
    
    @Column(name = "USER_ID", nullable = false)
    private Long userId;
    
    @Column(name = "USERNAME", length = 50, nullable = false)
    private String username;
    
    @Column(name = "TOKEN_HASH", length = 64, nullable = false)
    private String tokenHash;
    
    @Column(name = "DEVICE_TYPE", length = 50)
    private String deviceType; // Desktop, Mobile, Tablet
    
    @Column(name = "BROWSER", length = 100)
    private String browser;
    
    @Column(name = "OS", length = 50)
    private String os;
    
    @Column(name = "IP_ADDRESS", length = 45)
    private String ipAddress;
    
    @Column(name = "LOCATION", length = 100)
    private String location;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @Column(name = "LAST_ACTIVITY")
    private LocalDateTime lastActivity;
    
    @Column(name = "EXPIRES_AT")
    private LocalDateTime expiresAt;
    
    @Column(name = "ACTIVE")
    private Boolean active;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        lastActivity = LocalDateTime.now();
        active = true;
    }
}
