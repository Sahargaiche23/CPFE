package tn.cnss.cooperation.auth.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.auth.dto.LoginRequest;
import tn.cnss.cooperation.auth.dto.LoginResponse;
import tn.cnss.cooperation.auth.service.AuditService;
import tn.cnss.cooperation.auth.service.AuthService;
import tn.cnss.cooperation.auth.service.SessionService;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class AuthController {
    
    private final AuthService authService;
    private final AuditService auditService;
    private final SessionService sessionService;
    
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request, HttpServletRequest httpRequest) {
        try {
            LoginResponse response = authService.login(request);
            
            // Log de connexion réussie
            Integer burCode = null;
            try {
                burCode = response.getBurCod() != null ? Integer.parseInt(response.getBurCod()) : null;
            } catch (NumberFormatException e) {
                // Ignorer si le code bureau n'est pas un nombre
            }
            auditService.logLogin(response.getUserId(), response.getUsername(), httpRequest, burCode);
            
            // Créer une session pour suivre les appareils connectés
            sessionService.createSession(response.getUserId(), response.getUsername(), 
                    response.getToken(), httpRequest);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Log de connexion échouée
            auditService.logLoginFailed(request.getUsername(), httpRequest, e.getMessage());
            
            // Retourner le message spécifique si compte désactivé
            String errorMessage = e.getMessage();
            if (errorMessage != null && errorMessage.contains("désactivé")) {
                return ResponseEntity.status(403).body(Map.of("error", errorMessage));
            }
            return ResponseEntity.status(401).body(Map.of("error", "Identifiants incorrects"));
        }
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Auth Service is running");
    }
    
    @GetMapping("/debug/{username}")
    public ResponseEntity<?> debug(@PathVariable String username) {
        return ResponseEntity.ok(authService.findUser(username));
    }
}
