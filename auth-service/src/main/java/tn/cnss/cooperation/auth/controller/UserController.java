package tn.cnss.cooperation.auth.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.auth.dto.ChangePasswordRequest;
import tn.cnss.cooperation.auth.dto.CreateUserRequest;
import tn.cnss.cooperation.auth.dto.UpdateUserRequest;
import tn.cnss.cooperation.auth.entity.AuditLog;
import tn.cnss.cooperation.auth.entity.Governorate;
import tn.cnss.cooperation.auth.entity.User;
import tn.cnss.cooperation.auth.entity.UserSession;
import tn.cnss.cooperation.auth.repository.GovernorateRepository;
import tn.cnss.cooperation.auth.service.AuditService;
import tn.cnss.cooperation.auth.service.SessionService;
import tn.cnss.cooperation.auth.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UserController {
    
    private final UserService userService;
    private final AuditService auditService;
    private final SessionService sessionService;
    private final GovernorateRepository governorateRepository;
    
    // ========== GESTION DES UTILISATEURS (ADMIN) ==========
    
    /**
     * Liste tous les utilisateurs
     */
    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok(userService.getAllUsers());
    }
    
    /**
     * Obtenir un utilisateur par ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        return userService.getUserById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    /**
     * Créer un nouvel utilisateur (admin only)
     */
    @PostMapping
    public ResponseEntity<?> createUser(@RequestBody CreateUserRequest request, 
                                        HttpServletRequest httpRequest) {
        try {
            User user = userService.createUser(request);
            auditService.logAction(null, "admin", AuditService.ACTION_USER_CREATE,
                    "Création utilisateur: " + request.getUsername(), httpRequest, null, true);
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    /**
     * Mettre à jour un utilisateur
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateUser(@PathVariable Long id, 
                                        @RequestBody UpdateUserRequest request,
                                        HttpServletRequest httpRequest) {
        try {
            User user = userService.updateUser(id, request);
            auditService.logAction(id, user.getUsername(), AuditService.ACTION_USER_UPDATE,
                    "Mise à jour utilisateur", httpRequest, null, true);
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    /**
     * Supprimer un utilisateur
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable Long id, HttpServletRequest httpRequest) {
        try {
            userService.getUserById(id).ifPresent(user -> {
                auditService.logAction(id, user.getUsername(), AuditService.ACTION_USER_DELETE,
                        "Suppression utilisateur", httpRequest, null, true);
            });
            userService.deleteUser(id);
            return ResponseEntity.ok(Map.of("message", "Utilisateur supprimé"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    /**
     * Activer/Désactiver un utilisateur
     */
    @PutMapping("/{id}/toggle-status")
    public ResponseEntity<?> toggleUserStatus(@PathVariable Long id, HttpServletRequest httpRequest) {
        try {
            userService.toggleUserStatus(id);
            return ResponseEntity.ok(Map.of("message", "Statut modifié"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    /**
     * Réinitialiser le mot de passe (admin)
     */
    @PutMapping("/{id}/reset-password")
    public ResponseEntity<?> resetPassword(@PathVariable Long id, 
                                           @RequestBody Map<String, String> request,
                                           HttpServletRequest httpRequest) {
        try {
            String newPassword = request.get("newPassword");
            userService.resetPassword(id, newPassword);
            userService.getUserById(id).ifPresent(user -> {
                auditService.logAction(id, user.getUsername(), AuditService.ACTION_PASSWORD_CHANGE,
                        "Réinitialisation mot de passe par admin", httpRequest, null, true);
            });
            return ResponseEntity.ok(Map.of("message", "Mot de passe réinitialisé"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    // ========== CHANGEMENT MOT DE PASSE (USER) ==========
    
    /**
     * Changer son propre mot de passe
     */
    @PutMapping("/{id}/change-password")
    public ResponseEntity<?> changePassword(@PathVariable Long id,
                                            @RequestBody ChangePasswordRequest request,
                                            HttpServletRequest httpRequest) {
        try {
            boolean success = userService.changePassword(id, request);
            User user = userService.getUserById(id).orElse(null);
            String username = user != null ? user.getUsername() : "unknown";
            
            auditService.logPasswordChange(id, username, httpRequest, success);
            
            if (success) {
                return ResponseEntity.ok(Map.of("message", "Mot de passe changé avec succès"));
            } else {
                return ResponseEntity.badRequest().body(Map.of("error", "Mot de passe actuel incorrect"));
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    // ========== LOGS D'AUDIT (ADMIN) ==========
    
    /**
     * Obtenir tous les logs avec pagination
     */
    @GetMapping("/audit-logs")
    public ResponseEntity<?> getAuditLogs(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "50") int size) {
        try {
            return ResponseEntity.ok(auditService.getAllLogs(page, size));
        } catch (Exception e) {
            // Table AUDIT_LOG n'existe pas
            return ResponseEntity.ok(Map.of("content", List.of(), "totalElements", 0));
        }
    }
    
    /**
     * Obtenir les logs d'un utilisateur
     */
    @GetMapping("/{id}/logs")
    public ResponseEntity<List<AuditLog>> getUserLogs(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(auditService.getLogsByUser(id));
        } catch (Exception e) {
            return ResponseEntity.ok(List.of());
        }
    }
    
    /**
     * Obtenir les logs par bureau
     */
    @GetMapping("/audit-logs/bureau/{burCode}")
    public ResponseEntity<List<AuditLog>> getLogsByBureau(@PathVariable Integer burCode) {
        try {
            return ResponseEntity.ok(auditService.getLogsByBureau(burCode));
        } catch (Exception e) {
            return ResponseEntity.ok(List.of());
        }
    }
    
    // ========== GOUVERNORATS ==========
    
    /**
     * Liste des gouvernorats (retourne liste statique si table n'existe pas)
     */
    @GetMapping("/governorates")
    public ResponseEntity<List<Map<String, Object>>> getGovernorates() {
        try {
            List<Governorate> govs = governorateRepository.findAllByOrderByNameAsc();
            if (govs != null && !govs.isEmpty()) {
                return ResponseEntity.ok(govs.stream().map(g -> Map.<String, Object>of(
                    "code", g.getCode(),
                    "name", g.getName(),
                    "nameAr", g.getNameAr() != null ? g.getNameAr() : "",
                    "region", g.getRegion() != null ? g.getRegion() : ""
                )).toList());
            }
        } catch (Exception e) {
            // Table GOVERNORATE n'existe pas - retourner liste statique
        }
        // Liste statique des 24 gouvernorats de Tunisie
        return ResponseEntity.ok(getStaticGovernorates());
    }
    
    private List<Map<String, Object>> getStaticGovernorates() {
        return List.of(
            Map.of("code", 11, "name", "Tunis", "region", "Grand Tunis"),
            Map.of("code", 12, "name", "Ariana", "region", "Grand Tunis"),
            Map.of("code", 13, "name", "Ben Arous", "region", "Grand Tunis"),
            Map.of("code", 14, "name", "Manouba", "region", "Grand Tunis"),
            Map.of("code", 21, "name", "Nabeul", "region", "Nord-Est"),
            Map.of("code", 22, "name", "Zaghouan", "region", "Nord-Est"),
            Map.of("code", 23, "name", "Bizerte", "region", "Nord-Est"),
            Map.of("code", 31, "name", "Béja", "region", "Nord-Ouest"),
            Map.of("code", 32, "name", "Jendouba", "region", "Nord-Ouest"),
            Map.of("code", 33, "name", "Le Kef", "region", "Nord-Ouest"),
            Map.of("code", 34, "name", "Siliana", "region", "Nord-Ouest"),
            Map.of("code", 41, "name", "Sousse", "region", "Centre-Est"),
            Map.of("code", 42, "name", "Monastir", "region", "Centre-Est"),
            Map.of("code", 43, "name", "Mahdia", "region", "Centre-Est"),
            Map.of("code", 51, "name", "Kairouan", "region", "Centre-Ouest"),
            Map.of("code", 52, "name", "Kasserine", "region", "Centre-Ouest"),
            Map.of("code", 53, "name", "Sidi Bouzid", "region", "Centre-Ouest"),
            Map.of("code", 61, "name", "Sfax", "region", "Sud-Est"),
            Map.of("code", 71, "name", "Gabès", "region", "Sud-Est"),
            Map.of("code", 72, "name", "Médenine", "region", "Sud-Est"),
            Map.of("code", 73, "name", "Tataouine", "region", "Sud-Est"),
            Map.of("code", 81, "name", "Gafsa", "region", "Sud-Ouest"),
            Map.of("code", 82, "name", "Tozeur", "region", "Sud-Ouest"),
            Map.of("code", 83, "name", "Kébili", "region", "Sud-Ouest")
        );
    }
    
    // ========== STATISTIQUES ==========
    
    /**
     * Statistiques des utilisateurs
     */
    @GetMapping("/stats")
    public ResponseEntity<Map<String, Object>> getUserStats() {
        Map<String, Object> stats = new HashMap<>();
        List<User> allUsers = userService.getAllUsers();
        
        stats.put("totalUsers", allUsers.size());
        stats.put("activeUsers", allUsers.stream().filter(u -> u.getActive() == 1).count());
        stats.put("adminUsers", allUsers.stream().filter(u -> "admin".equals(u.getProfil())).count());
        stats.put("regularUsers", allUsers.stream().filter(u -> "user".equals(u.getProfil())).count());
        
        return ResponseEntity.ok(stats);
    }
    
    // ========== GESTION DES SESSIONS ==========
    
    /**
     * Obtenir les sessions actives d'un utilisateur
     */
    @GetMapping("/{id}/sessions")
    public ResponseEntity<List<UserSession>> getUserSessions(@PathVariable Long id) {
        return ResponseEntity.ok(sessionService.getActiveSessions(id));
    }
    
    /**
     * Révoquer une session spécifique
     */
    @DeleteMapping("/{userId}/sessions/{sessionId}")
    public ResponseEntity<?> revokeSession(
            @PathVariable Long userId,
            @PathVariable Long sessionId) {
        boolean success = sessionService.revokeSession(sessionId, userId);
        if (success) {
            return ResponseEntity.ok(Map.of("message", "Session révoquée avec succès"));
        }
        return ResponseEntity.badRequest().body(Map.of("error", "Impossible de révoquer la session"));
    }
    
    /**
     * Révoquer toutes les autres sessions
     */
    @DeleteMapping("/{userId}/sessions")
    public ResponseEntity<?> revokeAllOtherSessions(
            @PathVariable Long userId,
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        String token = authHeader != null && authHeader.startsWith("Bearer ") 
                ? authHeader.substring(7) : "";
        
        boolean success = sessionService.revokeAllOtherSessions(userId, token);
        if (success) {
            return ResponseEntity.ok(Map.of("message", "Toutes les autres sessions ont été révoquées"));
        }
        return ResponseEntity.badRequest().body(Map.of("error", "Impossible de révoquer les sessions"));
    }
}
