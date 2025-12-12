package tn.cnss.cooperation.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.auth.entity.PasswordResetOtp;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface PasswordResetOtpRepository extends JpaRepository<PasswordResetOtp, Long> {

    @Query("SELECT MAX(o.id) FROM PasswordResetOtp o")
    Optional<Long> findMaxId();

    Optional<PasswordResetOtp> findTopByEmailAndOtpCodeOrderByCreatedAtDesc(String email, String otpCode);

    @Query("SELECT o FROM PasswordResetOtp o WHERE o.email = :email AND o.used = 0 AND o.expiresAt > :now ORDER BY o.createdAt DESC")
    Optional<PasswordResetOtp> findLatestValidOtp(String email, LocalDateTime now);
}
