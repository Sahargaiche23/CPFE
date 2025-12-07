package tn.cnss.cooperation.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.auth.entity.UserSession;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserSessionRepository extends JpaRepository<UserSession, Long> {
    
    List<UserSession> findByUserIdAndActiveTrue(Long userId);
    
    List<UserSession> findByUsernameAndActiveTrue(String username);
    
    Optional<UserSession> findByTokenHashAndActiveTrue(String tokenHash);
    
    @Modifying
    @Query("UPDATE UserSession s SET s.active = false WHERE s.userId = :userId")
    void deactivateAllUserSessions(@Param("userId") Long userId);
    
    @Modifying
    @Query("UPDATE UserSession s SET s.active = false WHERE s.id = :sessionId AND s.userId = :userId")
    void deactivateSession(@Param("sessionId") Long sessionId, @Param("userId") Long userId);
    
    @Modifying
    @Query("UPDATE UserSession s SET s.lastActivity = :time WHERE s.tokenHash = :tokenHash")
    void updateLastActivity(@Param("tokenHash") String tokenHash, @Param("time") LocalDateTime time);
    
    @Modifying
    @Query("UPDATE UserSession s SET s.active = false WHERE s.expiresAt < :now")
    void deactivateExpiredSessions(@Param("now") LocalDateTime now);
    
    long countByUserIdAndActiveTrue(Long userId);
}
