package tn.cnss.cooperation.employer.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import tn.cnss.cooperation.employer.dto.CooperantDTO;
import tn.cnss.cooperation.employer.dto.CreateCooperantRequest;
import tn.cnss.cooperation.employer.entity.Cooperant;
import tn.cnss.cooperation.employer.repository.CooperantRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Service pour la gestion des Coopérants
 */
@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class CooperantService {
    
    private final CooperantRepository cooperantRepository;
    
    // Répertoire de stockage des fichiers
    private static final String UPLOAD_DIR = "/opt/cnss/uploads/cooperants";
    
    // URLs des services (via Eureka ou localhost)
    @Value("${auth.service.url:http://localhost:8089}")
    private String authServiceUrl;
    
    @Value("${notification.service.url:http://localhost:8087}")
    private String notificationServiceUrl;
    
    private final RestTemplate restTemplate = new RestTemplate();
    
    /**
     * Récupérer tous les coopérants actifs
     */
    public List<CooperantDTO> findAll() {
        return cooperantRepository.findByActifTrue()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * Récupérer un coopérant par ID
     */
    public CooperantDTO findById(Long id) {
        return cooperantRepository.findById(id)
                .map(this::toDTO)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
    }
    
    /**
     * Récupérer un coopérant par matricule
     */
    public CooperantDTO findByMatricule(Long matricule, Integer cle) {
        return cooperantRepository.findByMatriculeAndCle(matricule, cle)
                .map(this::toDTO)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + matricule + "-" + cle));
    }
    
    /**
     * Créer un nouveau coopérant
     */
    public CooperantDTO create(CreateCooperantRequest request) {
        // Vérifier si le numéro de pièce existe déjà
        if (cooperantRepository.findByNumPieceIdentite(request.getNumPieceIdentite()).isPresent()) {
            throw new RuntimeException("Un coopérant avec ce numéro de pièce d'identité existe déjà");
        }
        
        Cooperant cooperant = new Cooperant();
        
        // Générer matricule
        Long nextMat = Objects.requireNonNullElse(cooperantRepository.getNextMatricule(), 1L);
        cooperant.setMatricule(nextMat);
        cooperant.setCle(calculateCle(nextMat));
        
        // Mapper les données
        mapRequestToEntity(request, cooperant);
        
        // Statut initial
        cooperant.setStatutValidation("EN_ATTENTE");
        cooperant.setActif(true);
        
        Cooperant saved = Objects.requireNonNull(cooperantRepository.save(cooperant));
        log.info("Coopérant créé: {}-{}", saved.getMatricule(), saved.getCle());
        
        // Créer le compte utilisateur automatiquement (login=email, mdp=matricule complet)
        if (saved.getEmail() != null && !saved.getEmail().isBlank()) {
            createUserAccount(saved);
        }
        
        return toDTO(saved);
    }
    
    /**
     * Mettre à jour un coopérant
     */
    public CooperantDTO update(Long id, CreateCooperantRequest request) {
        Cooperant cooperant = cooperantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
        
        mapRequestToEntity(request, cooperant);
        
        Cooperant saved = Objects.requireNonNull(cooperantRepository.save(cooperant));
        log.info("Coopérant mis à jour: {}", id);
        
        return toDTO(saved);
    }
    
    /**
     * Supprimer définitivement un coopérant et son compte utilisateur
     */
    public void delete(Long id) {
        Cooperant cooperant = cooperantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
        
        String email = cooperant.getEmail();
        
        // Supprimer le coopérant de la base
        cooperantRepository.delete(cooperant);
        log.info("Coopérant supprimé: {}", id);
        
        // Supprimer le compte utilisateur associé via auth-service
        if (email != null && !email.isEmpty()) {
            try {
                restTemplate.delete(authServiceUrl + "/api/users/by-email/" + email);
                log.info("Compte utilisateur supprimé pour: {}", email);
            } catch (Exception e) {
                log.warn("Impossible de supprimer le compte utilisateur: {}", e.getMessage());
            }
        }
    }
    
    /**
     * Supprimer (définitivement) un coopérant par email
     */
    public void deleteByEmail(String email) {
        cooperantRepository.findByEmail(email).ifPresent(cooperant -> {
            cooperantRepository.delete(cooperant);
            log.info("Coopérant supprimé définitivement par email: {}", email);
        });
    }
    
    /**
     * Valider un coopérant (par un agent)
     */
    public CooperantDTO valider(Long id, Long agentId) {
        Cooperant cooperant = cooperantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
        
        cooperant.setStatutValidation("VALIDE");
        cooperant.setDateValidation(LocalDateTime.now());
        cooperant.setValidePar(agentId);
        cooperant.setMotifRejet(null);
        
        Cooperant saved = Objects.requireNonNull(cooperantRepository.save(cooperant));
        log.info("Coopérant validé: {} par agent: {}", id, agentId);
        
        return toDTO(saved);
    }
    
    /**
     * Rejeter un coopérant (par un agent)
     */
    public CooperantDTO rejeter(Long id, Long agentId, String motif) {
        Cooperant cooperant = cooperantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
        
        cooperant.setStatutValidation("REJETE");
        cooperant.setDateValidation(LocalDateTime.now());
        cooperant.setValidePar(agentId);
        cooperant.setMotifRejet(motif);
        
        Cooperant saved = Objects.requireNonNull(cooperantRepository.save(cooperant));
        log.info("Coopérant rejeté: {} par agent: {}, motif: {}", id, agentId, motif);
        
        return toDTO(saved);
    }
    
    /**
     * Liste des coopérants en attente de validation
     */
    public List<CooperantDTO> findPendingValidation() {
        return cooperantRepository.findPendingValidation()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * Recherche par nom ou matricule
     */
    public List<CooperantDTO> search(String query) {
        return cooperantRepository.searchByName(query)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * Liste par régime
     */
    public List<CooperantDTO> findByRegime(String codeRegime) {
        return cooperantRepository.findByCodeRegimeAndActifTrue(codeRegime)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * Upload de fichier pour un coopérant
     */
    public String uploadFile(Long cooperantId, MultipartFile file, String typeFile) throws IOException {
        Cooperant cooperant = cooperantRepository.findById(cooperantId)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + cooperantId));
        
        // Créer le répertoire si nécessaire
        Path uploadPath = Paths.get(UPLOAD_DIR, cooperantId.toString());
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        
        // Générer un nom unique
        String originalFilename = file.getOriginalFilename();
        String extension = (originalFilename != null && originalFilename.contains("."))
                ? originalFilename.substring(originalFilename.lastIndexOf("."))
                : "";
        String newFilename = typeFile + "_" + UUID.randomUUID() + extension;
        
        // Sauvegarder le fichier
        Path filePath = uploadPath.resolve(newFilename);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        
        String relativePath = cooperantId + "/" + newFilename;
        
        // Mettre à jour l'entité selon le type
        switch (typeFile) {
            case "dossier" -> cooperant.setFichierDossier(relativePath);
            case "identite" -> cooperant.setFichierIdentite(relativePath);
            case "autre" -> cooperant.setFichierAutre(relativePath);
        }
        
        Objects.requireNonNull(cooperantRepository.save(cooperant));
        log.info("Fichier uploadé pour coopérant {}: {}", cooperantId, relativePath);
        
        return relativePath;
    }
    
    /**
     * Statistiques par régime
     */
    public Map<String, Long> getStatsByRegime() {
        Map<String, Long> stats = new HashMap<>();
        cooperantRepository.countByRegime().forEach(row -> {
            String regime = (String) row[0];
            Long count = (Long) row[1];
            stats.put(regime, count);
        });
        return stats;
    }
    
    /**
     * Statistiques par statut validation
     */
    public Map<String, Long> getStatsByValidation() {
        Map<String, Long> stats = new HashMap<>();
        cooperantRepository.countByStatutValidation().forEach(row -> {
            String statut = (String) row[0];
            Long count = (Long) row[1];
            stats.put(statut, count);
        });
        return stats;
    }
    
    // ===== MÉTHODES PRIVÉES =====
    
    private void mapRequestToEntity(CreateCooperantRequest request, Cooperant cooperant) {
        cooperant.setNomFr(request.getNomFr());
        cooperant.setPrenomFr(request.getPrenomFr());
        cooperant.setAdresseFr(request.getAdresseFr());
        cooperant.setCodePostal(request.getCodePostal());
        cooperant.setLocaliteFr(request.getLocaliteFr());
        cooperant.setLieuNaissanceFr(request.getLieuNaissanceFr());
        
        cooperant.setNomAr(request.getNomAr());
        cooperant.setPrenomAr(request.getPrenomAr());
        cooperant.setAdresseAr(request.getAdresseAr());
        cooperant.setLocaliteAr(request.getLocaliteAr());
        cooperant.setLieuNaissanceAr(request.getLieuNaissanceAr());
        
        cooperant.setDateNaissance(request.getDateNaissance());
        
        cooperant.setTelephone(request.getTelephone());
        cooperant.setFax(request.getFax());
        cooperant.setEmail(request.getEmail());
        
        cooperant.setTypePieceIdentite(request.getTypePieceIdentite());
        cooperant.setNumPieceIdentite(request.getNumPieceIdentite());
        
        cooperant.setNationalite(request.getNationalite());
        cooperant.setCodeRegime(request.getCodeRegime());
    }
    
    private CooperantDTO toDTO(Cooperant c) {
        CooperantDTO dto = new CooperantDTO();
        dto.setId(c.getId());
        dto.setMatricule(c.getMatricule());
        dto.setCle(c.getCle());
        
        dto.setNomFr(c.getNomFr());
        dto.setPrenomFr(c.getPrenomFr());
        dto.setAdresseFr(c.getAdresseFr());
        dto.setCodePostal(c.getCodePostal());
        dto.setLocaliteFr(c.getLocaliteFr());
        dto.setLieuNaissanceFr(c.getLieuNaissanceFr());
        
        dto.setNomAr(c.getNomAr());
        dto.setPrenomAr(c.getPrenomAr());
        dto.setAdresseAr(c.getAdresseAr());
        dto.setLocaliteAr(c.getLocaliteAr());
        dto.setLieuNaissanceAr(c.getLieuNaissanceAr());
        
        dto.setDateNaissance(c.getDateNaissance());
        
        dto.setTelephone(c.getTelephone());
        dto.setFax(c.getFax());
        dto.setEmail(c.getEmail());
        
        dto.setTypePieceIdentite(c.getTypePieceIdentite());
        dto.setNumPieceIdentite(c.getNumPieceIdentite());
        
        dto.setNationalite(c.getNationalite());
        dto.setCodeRegime(c.getCodeRegime());
        dto.setLibelleRegime(c.getLibelleRegime());
        
        dto.setFichierDossier(c.getFichierDossier());
        dto.setFichierIdentite(c.getFichierIdentite());
        dto.setFichierAutre(c.getFichierAutre());
        
        dto.setNumAffiliation(c.getNumAffiliation());
        dto.setCleAffiliation(c.getCleAffiliation());
        
        dto.setStatutValidation(c.getStatutValidation());
        dto.setDateValidation(c.getDateValidation());
        dto.setValidePar(c.getValidePar());
        dto.setMotifRejet(c.getMotifRejet());
        
        dto.setActif(c.getActif());
        dto.setCreatedAt(c.getCreatedAt());
        dto.setUpdatedAt(c.getUpdatedAt());
        
        dto.setMatriculeComplet(c.getMatriculeComplet());
        dto.setNomCompletFr(c.getNomCompletFr());
        dto.setNomCompletAr(c.getNomCompletAr());
        
        return dto;
    }
    
    /**
     * Calcul de la clé de contrôle (modulo 97)
     */
    private Integer calculateCle(Long matricule) {
        return (int) (97 - (matricule * 100 % 97));
    }
    
    /**
     * Créer un compte utilisateur pour le coopérant et envoyer email avec identifiants
     */
    private void createUserAccount(Cooperant cooperant) {
        String matriculeComplet = cooperant.getMatriculeComplet();
        // Mot de passe = matricule + "cnss" pour avoir au moins 6 caractères
        String password = matriculeComplet + "cnss";
        String email = cooperant.getEmail();
        String nomComplet = cooperant.getNomCompletFr();
        
        try {
            // 1. Vérifier si l'utilisateur existe déjà
            boolean userExists = false;
            try {
                restTemplate.getForEntity(
                        authServiceUrl + "/api/auth/debug/" + email,
                        Object.class
                );
                userExists = true;
                log.info("Utilisateur existe déjà: {}", email);
            } catch (Exception e) {
                // Utilisateur n'existe pas, on peut le créer
                userExists = false;
            }
            
            if (!userExists) {
                // 2. Appeler auth-service pour créer le compte
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_JSON);
                
                Map<String, Object> userRequest = new HashMap<>();
                userRequest.put("username", email);
                userRequest.put("password", password);
                userRequest.put("email", email);
                userRequest.put("firstName", cooperant.getPrenomFr());
                userRequest.put("lastName", cooperant.getNomFr());
                userRequest.put("profil", "COOPERANT");
                
                HttpEntity<Map<String, Object>> entity = new HttpEntity<>(userRequest, headers);
                
                restTemplate.postForEntity(
                        authServiceUrl + "/api/users",
                        entity,
                        Object.class
                );
                log.info("Compte utilisateur créé pour coopérant: {}", email);
            }
            
            // 3. Envoyer email avec identifiants via notification-service (toujours)
            sendCredentialsEmail(email, password, nomComplet);
            
        } catch (Exception e) {
            // On log l'erreur mais on ne bloque pas la création du coopérant
            log.error("Erreur création compte utilisateur pour {}: {}", email, e.getMessage());
        }
    }
    
    /**
     * Envoyer email avec identifiants de connexion
     */
    private void sendCredentialsEmail(String email, String matricule, String nomComplet) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            String subject = "CNSS - Vos identifiants de connexion";
            String content = String.format("""
                    Bonjour %s,
                    
                    Votre dossier de coopérant a été enregistré avec succès.
                    
                    Vos identifiants de connexion:
                    - Identifiant: %s
                    - Mot de passe: %s
                    
                    Vous pouvez vous connecter à l'adresse:
                    http://localhost:4200/auth/login
                    
                    Cordialement,
                    CNSS - Service Coopération Technique
                    """,
                    nomComplet != null ? nomComplet : "",
                    email,
                    matricule
            );
            
            Map<String, String> emailRequest = new HashMap<>();
            emailRequest.put("to", email);
            emailRequest.put("subject", subject);
            emailRequest.put("content", content);
            
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(emailRequest, headers);
            
            restTemplate.postForEntity(
                    notificationServiceUrl + "/notification/email",
                    entity,
                    String.class
            );
            log.info("Email identifiants envoyé à: {}", email);
            
        } catch (Exception e) {
            log.error("Erreur envoi email identifiants à {}: {}", email, e.getMessage());
        }
    }
    
    /**
     * Mise à jour partielle du coopérant (affiliation)
     */
    public CooperantDTO updateAffiliation(Long id, Map<String, String> updates) {
        Cooperant cooperant = cooperantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coopérant non trouvé: " + id));
        
        if (updates.containsKey("numAffiliation")) {
            cooperant.setNumAffiliation(updates.get("numAffiliation"));
        }
        if (updates.containsKey("cleAffiliation")) {
            cooperant.setCleAffiliation(updates.get("cleAffiliation"));
        }
        
        cooperant.setUpdatedAt(LocalDateTime.now());
        Cooperant saved = cooperantRepository.save(cooperant);
        log.info("Affiliation mise à jour pour coopérant {}: {}-{}", id, 
                saved.getCleAffiliation(), saved.getNumAffiliation());
        
        return toDTO(saved);
    }
}
