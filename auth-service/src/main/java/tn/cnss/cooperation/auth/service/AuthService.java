package tn.cnss.cooperation.auth.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.auth.dto.LoginRequest;
import tn.cnss.cooperation.auth.dto.LoginResponse;
import tn.cnss.cooperation.auth.entity.User;
import tn.cnss.cooperation.auth.repository.UserRepository;
import tn.cnss.cooperation.auth.security.JwtService;

@RequiredArgsConstructor
@Slf4j
@Service
public class AuthService {
    
    private final UserRepository userRepository;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;
    
    @Transactional
    public LoginResponse login(LoginRequest request) {
        log.info("Tentative de connexion pour: {}", request.getUsername());
        
        // Vérifier d'abord si l'utilisateur existe et est actif
        User user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        
        // Vérifier si le compte est actif
        if (user.getActive() == null || user.getActive() != 1) {
            log.warn("Tentative de connexion avec compte désactivé: {}", request.getUsername());
            throw new RuntimeException("Compte désactivé. Contactez l'administrateur.");
        }
        
        // Authentification avec Spring Security
        Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                request.getUsername(),
                request.getPassword()
            )
        );

        // Génération du token JWT
        String token = jwtService.generateToken(
            org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .authorities("ROLE_" + user.getProfil())
                .build()
        );

        log.info("Connexion réussie pour: {}", user.getUsername());

        return LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .username(user.getUsername())
                .identite(user.getIdentite())
                .profil(user.getProfil())
                .burCod(user.getBurCod())
                .build();
    }
    
    @Transactional
    public User register(User user) {
        log.info("Inscription nouvel utilisateur: {}", user.getUsername());
        
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new RuntimeException("Nom d'utilisateur déjà utilisé");
        }
        
        // Encoder le mot de passe
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        
        return userRepository.save(user);
    }
    
    public User findUser(String username) {
        return userRepository.findByUsername(username).orElse(null);
    }
}
