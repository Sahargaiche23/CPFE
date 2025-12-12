package tn.cnss.cooperation.auth.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.auth.dto.ForgotPasswordRequest;
import tn.cnss.cooperation.auth.dto.ResetPasswordRequest;
import tn.cnss.cooperation.auth.service.PasswordResetService;

import java.util.Map;

@RestController
@RequestMapping("/api/auth/password")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class PasswordResetController {

    private final PasswordResetService passwordResetService;

    @PostMapping("/forgot")
    public ResponseEntity<?> forgot(@RequestBody ForgotPasswordRequest request) {
        try {
            passwordResetService.requestOtp(request.getEmail());
            return ResponseEntity.ok(Map.of("message", "OTP envoyé par email"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @PostMapping("/reset")
    public ResponseEntity<?> reset(@RequestBody ResetPasswordRequest request) {
        try {
            passwordResetService.resetPassword(request.getEmail(), request.getOtp(), request.getNewPassword());
            return ResponseEntity.ok(Map.of("message", "Mot de passe mis à jour"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}
