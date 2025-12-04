package tn.cnss.cooperation.auth.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import tn.cnss.cooperation.auth.entity.User;
import tn.cnss.cooperation.auth.repository.UserRepository;

import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
@Slf4j
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) {
        // Toujours mettre à jour le mot de passe admin à admin123
        User admin = userRepository.findByUsername("admin").orElse(new User());
        admin.setId(1L);
        admin.setUsername("admin");
        admin.setPassword(passwordEncoder.encode("admin123"));
        admin.setEmail("admin@cnss.tn");
        admin.setFirstName("Admin");
        admin.setLastName("CNSS");
        admin.setProfil("ADMIN");
        admin.setBurCod("TUNIS");
        admin.setActive(1);
        if (admin.getCreatedAt() == null) {
            admin.setCreatedAt(LocalDateTime.now());
        }
        admin.setUpdatedAt(LocalDateTime.now());
        
        userRepository.save(admin);
        log.info("✅ Utilisateur admin initialisé - mot de passe: admin123");
    }
}
