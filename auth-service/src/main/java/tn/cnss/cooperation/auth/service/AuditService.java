package tn.cnss.cooperation.auth.service;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.auth.entity.AuditLog;
import tn.cnss.cooperation.auth.repository.AuditLogRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuditService {
    
    private final AuditLogRepository auditLogRepository;
    
    /**
     * Actions d'audit possibles
     */
    public static final String ACTION_LOGIN = "LOGIN";
    public static final String ACTION_LOGOUT = "LOGOUT";
    public static final String ACTION_LOGIN_FAILED = "LOGIN_FAILED";
    public static final String ACTION_PASSWORD_CHANGE = "PASSWORD_CHANGE";
    public static final String ACTION_USER_CREATE = "USER_CREATE";
    public static final String ACTION_USER_UPDATE = "USER_UPDATE";
    public static final String ACTION_USER_DELETE = "USER_DELETE";
    public static final String ACTION_VIEW_PAGE = "VIEW_PAGE";
    
    /**
     * Enregistrer un événement d'audit (non-bloquant, sans transaction)
     */
    public AuditLog logAction(Long userId, String username, String action, 
                              String description, HttpServletRequest request, 
                              Integer burCode, boolean success) {
        
        String ipAddress = getClientIp(request);
        String userAgent = request != null ? request.getHeader("User-Agent") : null;
        String location = getLocationFromRequest(request);
        
        log.info("Audit: {} - {} - {} - IP: {}", username, action, description, ipAddress);
        
        try {
            AuditLog auditLog = AuditLog.builder()
                    .userId(userId)
                    .username(username)
                    .action(action)
                    .description(description)
                    .ipAddress(ipAddress)
                    .userAgent(userAgent)
                    .location(location)
                    .burCode(burCode)
                    .success(success)
                    .build();
            
            return auditLogRepository.save(auditLog);
        } catch (Exception e) {
            // Log l'erreur mais ne bloque pas l'opération principale
            log.warn("Impossible de sauvegarder l'audit log: {}", e.getMessage());
            return null;
        }
    }
    
    /**
     * Log de connexion réussie
     */
    public void logLogin(Long userId, String username, HttpServletRequest request, Integer burCode) {
        logAction(userId, username, ACTION_LOGIN, "Connexion réussie", request, burCode, true);
    }
    
    /**
     * Log de connexion échouée
     */
    public void logLoginFailed(String username, HttpServletRequest request, String reason) {
        logAction(null, username, ACTION_LOGIN_FAILED, reason, request, null, false);
    }
    
    /**
     * Log de déconnexion
     */
    public void logLogout(Long userId, String username, HttpServletRequest request) {
        logAction(userId, username, ACTION_LOGOUT, "Déconnexion", request, null, true);
    }
    
    /**
     * Log de changement de mot de passe
     */
    public void logPasswordChange(Long userId, String username, HttpServletRequest request, boolean success) {
        String desc = success ? "Mot de passe changé avec succès" : "Échec du changement de mot de passe";
        logAction(userId, username, ACTION_PASSWORD_CHANGE, desc, request, null, success);
    }
    
    /**
     * Obtenir tous les logs avec pagination
     */
    public Page<AuditLog> getAllLogs(int page, int size) {
        return auditLogRepository.findAllByOrderByCreatedAtDesc(PageRequest.of(page, size));
    }
    
    /**
     * Obtenir les logs d'un utilisateur
     */
    public List<AuditLog> getLogsByUser(Long userId) {
        return auditLogRepository.findByUserIdOrderByCreatedAtDesc(userId);
    }
    
    /**
     * Obtenir les logs par username
     */
    public List<AuditLog> getLogsByUsername(String username) {
        return auditLogRepository.findByUsernameOrderByCreatedAtDesc(username);
    }
    
    /**
     * Obtenir les logs par bureau
     */
    public List<AuditLog> getLogsByBureau(Integer burCode) {
        return auditLogRepository.findByBurCodeOrderByCreatedAtDesc(burCode);
    }
    
    /**
     * Obtenir les logs par période
     */
    public List<AuditLog> getLogsByDateRange(LocalDateTime startDate, LocalDateTime endDate) {
        return auditLogRepository.findByDateRange(startDate, endDate);
    }
    
    /**
     * Extraire l'IP du client
     */
    private String getClientIp(HttpServletRequest request) {
        if (request == null) return "unknown";
        
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        
        // Si plusieurs IPs (proxy chain), prendre la première
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }
        
        return ip;
    }
    
    /**
     * Extraire la localisation depuis la requête
     */
    private String getLocationFromRequest(HttpServletRequest request) {
        if (request == null) return null;
        // Peut être enrichi avec un service de géolocalisation IP
        return request.getLocale().getDisplayCountry();
    }
}
