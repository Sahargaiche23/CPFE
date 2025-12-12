package tn.cnss.cooperation.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.auth.entity.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);
    
    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
    
    @Query("SELECT MAX(u.id) FROM User u")
    Optional<Long> findMaxId();
    
    List<User> findByProfil(String profil);
    
    List<User> findByBurCod(String burCod);
    
    List<User> findByActiveOrderByUsernameAsc(Integer active);
    
    @Query("SELECT u FROM User u ORDER BY u.createdAt DESC")
    List<User> findAllOrderByCreatedAtDesc();
}
