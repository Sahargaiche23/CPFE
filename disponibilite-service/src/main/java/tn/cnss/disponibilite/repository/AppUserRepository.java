package tn.cnss.disponibilite.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.cnss.disponibilite.entity.AppUser;

import java.util.Optional;

public interface AppUserRepository extends JpaRepository<AppUser, Long> {
    Optional<AppUser> findByUsername(String username);
    Optional<AppUser> findByEmail(String email);
}
