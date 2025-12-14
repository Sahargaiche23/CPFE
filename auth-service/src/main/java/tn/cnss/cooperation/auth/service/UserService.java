package tn.cnss.cooperation.auth.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tn.cnss.cooperation.auth.dto.ChangePasswordRequest;
import tn.cnss.cooperation.auth.dto.CreateUserRequest;
import tn.cnss.cooperation.auth.dto.UpdateUserRequest;
import tn.cnss.cooperation.auth.entity.User;
import tn.cnss.cooperation.auth.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final RestTemplate restTemplate;
    
    @Value("${employer.service.url:http://employer-service:8081}")
    private String employerServiceUrl;
    
    /**
     * Obtenir tous les utilisateurs
     */
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    /**
     * Obtenir un utilisateur par ID
     */
    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }
    
    /**
     * Obtenir un utilisateur par username
     */
    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    /**
     * Créer un nouvel utilisateur (admin only)
     */
    @Transactional
    public User createUser(CreateUserRequest request) {
        log.info("Création d'un nouvel utilisateur: {}", request.getUsername());
        
        // Vérifier si le username existe déjà
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new RuntimeException("Ce nom d'utilisateur existe déjà");
        }
        
        // Trouver le prochain ID
        Long nextId = userRepository.findMaxId().orElse(0L) + 1;
        
        User user = new User();
        user.setId(nextId);
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEmail(request.getEmail());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setProfil(request.getProfil() != null ? request.getProfil() : "user");
        user.setBurCod(request.getBurCode());
        user.setActive(1);
        user.setCreatedAt(LocalDateTime.now());
        
        return userRepository.save(user);
    }
    
    /**
     * Mettre à jour un utilisateur
     */
    @Transactional
    public User updateUser(Long id, UpdateUserRequest request) {
        log.info("Mise à jour de l'utilisateur ID: {}", id);
        
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        
        if (request.getEmail() != null) user.setEmail(request.getEmail());
        if (request.getFirstName() != null) user.setFirstName(request.getFirstName());
        if (request.getLastName() != null) user.setLastName(request.getLastName());
        if (request.getProfil() != null) user.setProfil(request.getProfil());
        if (request.getBurCode() != null) user.setBurCod(request.getBurCode());
        if (request.getActive() != null) user.setActive(request.getActive());
        
        user.setUpdatedAt(LocalDateTime.now());
        
        return userRepository.save(user);
    }
    
    /**
     * Changer le mot de passe
     */
    @Transactional
    public boolean changePassword(Long userId, ChangePasswordRequest request) {
        log.info("Changement de mot de passe pour l'utilisateur ID: {}", userId);
        
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        
        // Vérifier l'ancien mot de passe
        if (!passwordEncoder.matches(request.getCurrentPassword(), user.getPassword())) {
            log.warn("Ancien mot de passe incorrect pour l'utilisateur: {}", user.getUsername());
            return false;
        }
        
        // Vérifier que le nouveau mot de passe et la confirmation correspondent
        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            throw new RuntimeException("Le nouveau mot de passe et la confirmation ne correspondent pas");
        }
        
        // Mettre à jour le mot de passe
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);
        
        log.info("Mot de passe changé avec succès pour: {}", user.getUsername());
        return true;
    }
    
    /**
     * Réinitialiser le mot de passe (admin only)
     */
    @Transactional
    public void resetPassword(Long userId, String newPassword) {
        log.info("Réinitialisation du mot de passe pour l'utilisateur ID: {}", userId);
        
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        
        user.setPassword(passwordEncoder.encode(newPassword));
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);
    }
    
    /**
     * Activer/Désactiver un utilisateur
     */
    @Transactional
    public void toggleUserStatus(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        
        user.setActive(user.getActive() == 1 ? 0 : 1);
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);
        
        log.info("Statut de l'utilisateur {} changé à: {}", 
                user.getUsername(), user.getActive() == 1 ? "actif" : "inactif");
    }
    
    /**
     * Supprimer un utilisateur
     */
    @Transactional
    public void deleteUser(Long userId) {
        log.info("Suppression de l'utilisateur ID: {}", userId);
        userRepository.deleteById(userId);
    }
    
    /**
     * Supprimer un utilisateur par email
     */
    @Transactional
    public void deleteUserByEmail(String email) {
        log.info("Suppression de l'utilisateur par email: {}", email);
        userRepository.findByEmail(email).ifPresent(user -> {
            userRepository.delete(user);
            log.info("Utilisateur supprimé: {}", email);
        });
    }
    
    /**
     * Mise à jour de la dernière connexion
     */
    @Transactional
    public void updateLastLogin(Long userId, String ipAddress) {
        userRepository.findById(userId).ifPresent(user -> {
            user.setUpdatedAt(LocalDateTime.now());
            userRepository.save(user);
        });
    }
    
    /**
     * Supprimer le coopérant associé par email via employer-service
     */
    public void deleteCooperantByEmail(String email) {
        if (email == null || email.isEmpty()) return;
        try {
            log.info("Suppression du coopérant avec email: {}", email);
            restTemplate.delete(employerServiceUrl + "/api/cooperants/by-email/" + email);
            log.info("Coopérant supprimé avec succès");
        } catch (Exception e) {
            log.error("Erreur lors de la suppression du coopérant: {}", e.getMessage());
            throw e;
        }
    }
}
