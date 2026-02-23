package tn.cnss.disponibilite.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.dto.LoginRequest;
import tn.cnss.disponibilite.dto.LoginResponse;
import tn.cnss.disponibilite.entity.AppUser;
import tn.cnss.disponibilite.repository.AppUserRepository;
import tn.cnss.disponibilite.security.JwtService;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = {"http://localhost:4200", "http://localhost:4300"})
@RequiredArgsConstructor
@Slf4j
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final AppUserRepository userRepository;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        try {
            log.info("Tentative de connexion pour: {}", request.getUsername());

            AppUser user = userRepository.findByUsername(request.getUsername())
                    .or(() -> userRepository.findByEmail(request.getUsername()))
                    .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));

            if (user.getActive() == null || user.getActive() != 1) {
                log.warn("Compte désactivé: {}", request.getUsername());
                return ResponseEntity.status(403).body(Map.of("error", "Compte désactivé"));
            }

            // Vérifier le rôle pour Mise en Disponibilité
            String profil = user.getProfil();
            if (!isValidDisponibiliteRole(profil)) {
                log.warn("Rôle non autorisé: {} pour {}", profil, request.getUsername());
                return ResponseEntity.status(403).body(Map.of("error", "Accès non autorisé pour cette application"));
            }

            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(user.getUsername(), request.getPassword())
            );

            String token = jwtService.generateToken(
                User.withUsername(user.getUsername())
                    .password(user.getPassword())
                    .authorities("ROLE_" + profil)
                    .build()
            );

            log.info("Connexion réussie pour: {}", user.getUsername());

            return ResponseEntity.ok(LoginResponse.builder()
                    .token(token)
                    .userId(user.getId())
                    .username(user.getUsername())
                    .identite(user.getIdentite())
                    .profil(profil)
                    .burCod(user.getBurCod())
                    .build());

        } catch (Exception e) {
            log.error("Erreur de connexion: {}", e.getMessage());
            return ResponseEntity.status(401).body(Map.of("error", "Identifiants incorrects"));
        }
    }

    private boolean isValidDisponibiliteRole(String profil) {
        return profil != null && (
            profil.equals("agentCnssMiseEnDisponibilite") ||
            profil.equals("assureMiseEnDisponibilite") ||
            profil.equals("employerMiseEnDisponibilite") ||
            profil.equals("ADMIN")
        );
    }

    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Disponibilite Auth Service is running");
    }

    @GetMapping("/me")
    public ResponseEntity<?> me(@RequestHeader("Authorization") String authHeader) {
        try {
            String token = authHeader.substring(7);
            String username = jwtService.extractUsername(token);
            AppUser user = userRepository.findByUsername(username).orElse(null);
            if (user == null) {
                return ResponseEntity.status(404).body(Map.of("error", "Utilisateur non trouvé"));
            }
            return ResponseEntity.ok(LoginResponse.builder()
                    .userId(user.getId())
                    .username(user.getUsername())
                    .identite(user.getIdentite())
                    .profil(user.getProfil())
                    .burCod(user.getBurCod())
                    .build());
        } catch (Exception e) {
            return ResponseEntity.status(401).body(Map.of("error", "Token invalide"));
        }
    }
}
