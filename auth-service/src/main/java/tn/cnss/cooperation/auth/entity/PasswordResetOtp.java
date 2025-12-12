package tn.cnss.cooperation.auth.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "PASSWORD_RESET_OTP", schema = "COPT")
@Data
public class PasswordResetOtp {

    @Id
    @Column(name = "OTP_ID")
    private Long id;

    @Column(name = "EMAIL", length = 100, nullable = false)
    private String email;

    @Column(name = "OTP_CODE", length = 10, nullable = false)
    private String otpCode;

    @Column(name = "EXPIRES_AT", nullable = false)
    private LocalDateTime expiresAt;

    @Column(name = "USED", nullable = false)
    private Integer used;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;
}
