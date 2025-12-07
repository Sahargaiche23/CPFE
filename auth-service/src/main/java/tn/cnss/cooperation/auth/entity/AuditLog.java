package tn.cnss.cooperation.auth.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Entité pour le journal d'audit des actions utilisateurs
 */
@Entity
@Table(name = "AUDIT_LOG", schema = "COPT")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuditLog {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LOG_ID")
    private Long id;
    
    @Column(name = "USER_ID")
    private Long userId;
    
    @Column(name = "USERNAME", length = 50)
    private String username;
    
    @Column(name = "ACTION", length = 50, nullable = false)
    private String action;
    
    @Column(name = "DESCRIPTION", length = 500)
    private String description;
    
    @Column(name = "IP_ADDRESS", length = 45)
    private String ipAddress;
    
    @Column(name = "USER_AGENT", length = 500)
    private String userAgent;
    
    @Column(name = "LOCATION", length = 100)
    private String location;
    
    @Column(name = "BUR_CODE")
    private Integer burCode;
    
    @Column(name = "SUCCESS")
    private Boolean success;
    
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (success == null) success = true;
    }
}
