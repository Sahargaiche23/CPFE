package tn.cnss.cooperation.auth.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tn.cnss.cooperation.auth.dto.SendEmailRequest;
import tn.cnss.cooperation.auth.entity.PasswordResetOtp;
import tn.cnss.cooperation.auth.entity.User;
import tn.cnss.cooperation.auth.repository.PasswordResetOtpRepository;
import tn.cnss.cooperation.auth.repository.UserRepository;

import java.security.SecureRandom;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Slf4j
public class PasswordResetService {

    private final PasswordResetOtpRepository otpRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${notification.service.url:http://localhost:8087}")
    private String notificationServiceUrl;

    @Value("${password.reset.otp.ttl.minutes:10}")
    private long otpTtlMinutes;

    private static final SecureRandom RANDOM = new SecureRandom();

    @Transactional
    public void requestOtp(String email) {
        if (email == null || email.isBlank()) {
            throw new IllegalArgumentException("Email requis");
        }

        // Vérifier que l'utilisateur existe (souvent username = email)
        User user = userRepository.findByUsername(email).orElse(null);
        if (user == null) {
            user = userRepository.findByEmail(email).orElse(null);
        }
        if (user == null) {
            throw new RuntimeException("Aucun compte associé à cet email");
        }

        // Générer OTP 6 chiffres
        String otp = String.format("%06d", RANDOM.nextInt(1_000_000));

        Long nextId = otpRepository.findMaxId().orElse(0L) + 1;
        PasswordResetOtp entity = new PasswordResetOtp();
        entity.setId(nextId);
        entity.setEmail(user.getEmail() != null ? user.getEmail() : email);
        entity.setOtpCode(otp);
        entity.setCreatedAt(LocalDateTime.now());
        entity.setExpiresAt(LocalDateTime.now().plusMinutes(otpTtlMinutes));
        entity.setUsed(0);
        otpRepository.save(entity);

        sendOtpEmail(entity.getEmail(), otp);
    }

    @Transactional
    public void resetPassword(String email, String otp, String newPassword) {
        if (email == null || email.isBlank()) {
            throw new IllegalArgumentException("Email requis");
        }
        if (otp == null || otp.isBlank()) {
            throw new IllegalArgumentException("OTP requis");
        }
        if (newPassword == null || newPassword.length() < 6) {
            throw new IllegalArgumentException("Le nouveau mot de passe doit contenir au moins 6 caractères");
        }

        PasswordResetOtp code = otpRepository.findTopByEmailAndOtpCodeOrderByCreatedAtDesc(email, otp)
                .orElseThrow(() -> new RuntimeException("OTP incorrect"));

        if (code.getUsed() != null && code.getUsed() == 1) {
            throw new RuntimeException("OTP déjà utilisé");
        }
        if (code.getExpiresAt() == null || code.getExpiresAt().isBefore(LocalDateTime.now())) {
            throw new RuntimeException("OTP expiré");
        }

        User user = userRepository.findByUsername(email).orElse(null);
        if (user == null) {
            user = userRepository.findByEmail(email).orElse(null);
        }
        if (user == null) {
            throw new RuntimeException("Utilisateur non trouvé");
        }

        user.setPassword(passwordEncoder.encode(newPassword));
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);

        code.setUsed(1);
        otpRepository.save(code);
    }

    private void sendOtpEmail(String to, String otp) {
        String subject = "CNSS - Réinitialisation du mot de passe (OTP)";
        String content = "Votre code OTP est: " + otp + "\n\nCe code expire dans " + otpTtlMinutes + " minutes.";

        try {
            String url = notificationServiceUrl + "/notification/email";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            SendEmailRequest req = new SendEmailRequest(to, subject, content);
            ResponseEntity<String> response = restTemplate.postForEntity(url, new HttpEntity<>(req, headers), String.class);
            log.info("OTP email sent to {} - response: {}", to, response.getStatusCode());
        } catch (Exception e) {
            // On garde l'OTP en base mais on log l'erreur d'envoi
            log.error("Erreur envoi email OTP: {}", e.getMessage());
        }
    }
}
