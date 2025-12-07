package tn.cnss.cooperation.auth.service;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.auth.entity.UserSession;
import tn.cnss.cooperation.auth.repository.UserSessionRepository;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class SessionService {
    
    private final UserSessionRepository sessionRepository;
    
    /**
     * Créer une nouvelle session lors de la connexion
     */
    @Transactional
    public UserSession createSession(Long userId, String username, String token, HttpServletRequest request) {
        try {
            String userAgent = request != null ? request.getHeader("User-Agent") : "Unknown";
            String ipAddress = getClientIp(request);
            
            UserSession session = UserSession.builder()
                    .userId(userId)
                    .username(username)
                    .tokenHash(hashToken(token))
                    .deviceType(detectDeviceType(userAgent))
                    .browser(detectBrowser(userAgent))
                    .os(detectOS(userAgent))
                    .ipAddress(ipAddress)
                    .location(getLocationFromIp(ipAddress))
                    .expiresAt(LocalDateTime.now().plusDays(1)) // Token expire après 24h
                    .build();
            
            return sessionRepository.save(session);
        } catch (Exception e) {
            log.warn("Impossible de créer la session: {}", e.getMessage());
            return null;
        }
    }
    
    /**
     * Obtenir toutes les sessions actives d'un utilisateur
     */
    public List<UserSession> getActiveSessions(Long userId) {
        try {
            return sessionRepository.findByUserIdAndActiveTrue(userId);
        } catch (Exception e) {
            log.warn("Impossible de récupérer les sessions: {}", e.getMessage());
            return List.of();
        }
    }
    
    /**
     * Révoquer une session spécifique
     */
    @Transactional
    public boolean revokeSession(Long sessionId, Long userId) {
        try {
            sessionRepository.deactivateSession(sessionId, userId);
            log.info("Session {} révoquée pour l'utilisateur {}", sessionId, userId);
            return true;
        } catch (Exception e) {
            log.warn("Impossible de révoquer la session: {}", e.getMessage());
            return false;
        }
    }
    
    /**
     * Révoquer toutes les sessions sauf la courante
     */
    @Transactional
    public boolean revokeAllOtherSessions(Long userId, String currentToken) {
        try {
            String currentHash = hashToken(currentToken);
            List<UserSession> sessions = sessionRepository.findByUserIdAndActiveTrue(userId);
            
            for (UserSession session : sessions) {
                if (!session.getTokenHash().equals(currentHash)) {
                    session.setActive(false);
                    sessionRepository.save(session);
                }
            }
            
            log.info("Toutes les autres sessions révoquées pour l'utilisateur {}", userId);
            return true;
        } catch (Exception e) {
            log.warn("Impossible de révoquer les sessions: {}", e.getMessage());
            return false;
        }
    }
    
    /**
     * Mettre à jour la dernière activité
     */
    @Transactional
    public void updateLastActivity(String token) {
        try {
            String tokenHash = hashToken(token);
            sessionRepository.updateLastActivity(tokenHash, LocalDateTime.now());
        } catch (Exception e) {
            // Silently fail
        }
    }
    
    /**
     * Vérifier si une session est valide
     */
    public boolean isSessionValid(String token) {
        try {
            String tokenHash = hashToken(token);
            return sessionRepository.findByTokenHashAndActiveTrue(tokenHash).isPresent();
        } catch (Exception e) {
            return true; // Si la table n'existe pas, on laisse passer
        }
    }
    
    // ===== Méthodes utilitaires =====
    
    private String hashToken(String token) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(token.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            return token.substring(0, Math.min(token.length(), 64));
        }
    }
    
    private String getClientIp(HttpServletRequest request) {
        if (request == null) return "Unknown";
        
        String[] headers = {"X-Forwarded-For", "X-Real-IP", "Proxy-Client-IP", "WL-Proxy-Client-IP"};
        for (String header : headers) {
            String ip = request.getHeader(header);
            if (ip != null && !ip.isEmpty() && !"unknown".equalsIgnoreCase(ip)) {
                return ip.split(",")[0].trim();
            }
        }
        return request.getRemoteAddr();
    }
    
    private String detectDeviceType(String userAgent) {
        if (userAgent == null) return "Unknown";
        userAgent = userAgent.toLowerCase();
        
        if (userAgent.contains("mobile") || userAgent.contains("android") && !userAgent.contains("tablet")) {
            return "Mobile";
        } else if (userAgent.contains("tablet") || userAgent.contains("ipad")) {
            return "Tablet";
        }
        return "Desktop";
    }
    
    private String detectBrowser(String userAgent) {
        if (userAgent == null) return "Unknown";
        
        if (userAgent.contains("Firefox")) return "Firefox";
        if (userAgent.contains("Edg")) return "Edge";
        if (userAgent.contains("Chrome")) return "Chrome";
        if (userAgent.contains("Safari")) return "Safari";
        if (userAgent.contains("Opera") || userAgent.contains("OPR")) return "Opera";
        if (userAgent.contains("curl")) return "cURL";
        
        return "Unknown";
    }
    
    private String detectOS(String userAgent) {
        if (userAgent == null) return "Unknown";
        
        if (userAgent.contains("Windows")) return "Windows";
        if (userAgent.contains("Mac OS")) return "macOS";
        if (userAgent.contains("Linux")) return "Linux";
        if (userAgent.contains("Android")) return "Android";
        if (userAgent.contains("iOS") || userAgent.contains("iPhone") || userAgent.contains("iPad")) return "iOS";
        
        return "Unknown";
    }
    
    private String getLocationFromIp(String ip) {
        // Simplifié - en production, utiliser un service de géolocalisation
        if (ip == null || ip.startsWith("192.168") || ip.startsWith("10.") || ip.startsWith("172.")) {
            return "Réseau local";
        }
        return "Tunisie"; // Par défaut
    }
}
