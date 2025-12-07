package tn.cnss.cooperation.auth.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.auth.entity.AuditLog;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AuditLogRepository extends JpaRepository<AuditLog, Long> {
    
    // Trouver les logs par utilisateur
    List<AuditLog> findByUserIdOrderByCreatedAtDesc(Long userId);
    
    // Trouver les logs par username
    List<AuditLog> findByUsernameOrderByCreatedAtDesc(String username);
    
    // Trouver les logs par action
    List<AuditLog> findByActionOrderByCreatedAtDesc(String action);
    
    // Trouver les logs par bureau
    List<AuditLog> findByBurCodeOrderByCreatedAtDesc(Integer burCode);
    
    // Trouver les logs par période
    @Query("SELECT a FROM AuditLog a WHERE a.createdAt BETWEEN :startDate AND :endDate ORDER BY a.createdAt DESC")
    List<AuditLog> findByDateRange(
        @Param("startDate") LocalDateTime startDate, 
        @Param("endDate") LocalDateTime endDate
    );
    
    // Trouver les logs avec pagination
    Page<AuditLog> findAllByOrderByCreatedAtDesc(Pageable pageable);
    
    // Trouver les logs par utilisateur avec pagination
    Page<AuditLog> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);
    
    // Statistiques: nombre de connexions par jour
    @Query("SELECT CAST(a.createdAt AS DATE) as date, COUNT(a) as count FROM AuditLog a WHERE a.action = 'LOGIN' GROUP BY CAST(a.createdAt AS DATE) ORDER BY date DESC")
    List<Object[]> getLoginStatsByDay();
    
    // Dernière connexion par utilisateur
    @Query("SELECT a FROM AuditLog a WHERE a.userId = :userId AND a.action = 'LOGIN' ORDER BY a.createdAt DESC")
    List<AuditLog> findLastLoginByUser(@Param("userId") Long userId);
}
