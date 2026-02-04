package tn.cnss.cooperation.employer.reclamation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/reclamations")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
@Slf4j
public class ReclamationController {

    private final ReclamationRepository repository;
    private final RestTemplate restTemplate;
    
    @Value("${notification.service.url:http://localhost:8087}")
    private String notificationServiceUrl;

    @PostMapping
    public ResponseEntity<Reclamation> creer(@RequestBody ReclamationRequest request) {
        Reclamation reclamation = new Reclamation();
        reclamation.setEmailCooperant(request.getEmail());
        reclamation.setMotif(request.getMotif());
        reclamation.setDocumentsManquants(request.getDocumentsManquants());
        reclamation.setAgentId(request.getAgentId());
        
        Reclamation saved = repository.save(reclamation);
        
        // Envoyer email de notification au coopérant
        envoyerNotification(saved);
        
        log.info("Réclamation créée pour {} - Documents manquants: {}", request.getEmail(), request.getDocumentsManquants());
        return ResponseEntity.ok(saved);
    }

    @GetMapping
    public ResponseEntity<List<Reclamation>> getAll() {
        return ResponseEntity.ok(repository.findAll());
    }

    @GetMapping("/cooperant/{email}")
    public ResponseEntity<List<Reclamation>> getByCooperant(@PathVariable String email) {
        return ResponseEntity.ok(repository.findByEmailCooperantOrderByDateCreationDesc(email));
    }

    @GetMapping("/cooperant/{email}/en-attente")
    public ResponseEntity<List<Reclamation>> getEnAttenteByCooperant(@PathVariable String email) {
        return ResponseEntity.ok(repository.findByEmailCooperantAndStatut(email, "EN_ATTENTE"));
    }

    @GetMapping("/en-attente")
    public ResponseEntity<List<Reclamation>> getEnAttente() {
        return ResponseEntity.ok(repository.findByStatutOrderByDateCreationDesc("EN_ATTENTE"));
    }

    @PutMapping("/{id}/corriger")
    public ResponseEntity<Reclamation> corriger(@PathVariable Long id, @RequestBody Map<String, String> body) {
        Reclamation reclamation = repository.findById(id)
            .orElseThrow(() -> new RuntimeException("Réclamation non trouvée"));
        
        reclamation.setStatut("CORRIGE");
        reclamation.setCommentaireCooperant(body.get("commentaire"));
        reclamation.setDateTraitement(LocalDateTime.now());
        
        log.info("Réclamation {} corrigée par le coopérant", id);
        return ResponseEntity.ok(repository.save(reclamation));
    }

    @PutMapping("/{id}/traiter")
    public ResponseEntity<Reclamation> traiter(@PathVariable Long id) {
        Reclamation reclamation = repository.findById(id)
            .orElseThrow(() -> new RuntimeException("Réclamation non trouvée"));
        
        reclamation.setStatut("TRAITE");
        reclamation.setDateTraitement(LocalDateTime.now());
        
        log.info("Réclamation {} traitée", id);
        return ResponseEntity.ok(repository.save(reclamation));
    }

    private void envoyerNotification(Reclamation reclamation) {
        try {
            String url = notificationServiceUrl + "/notification/email";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            StringBuilder content = new StringBuilder();
            content.append("Bonjour,\n\n");
            content.append("Une réclamation a été émise concernant vos documents déposés.\n\n");
            
            if (reclamation.getDocumentsManquants() != null && !reclamation.getDocumentsManquants().isEmpty()) {
                content.append("Documents manquants ou incorrects:\n");
                for (String doc : reclamation.getDocumentsManquants()) {
                    content.append("  - ").append(getDocumentLabel(doc)).append("\n");
                }
                content.append("\n");
            }
            
            if (reclamation.getMotif() != null && !reclamation.getMotif().isBlank()) {
                content.append("Motif: ").append(reclamation.getMotif()).append("\n\n");
            }
            
            content.append("Veuillez vous connecter sur la plateforme pour corriger et redéposer les documents manquants.\n\n");
            content.append("Connectez-vous sur: http://localhost:4200\n\n");
            content.append("Cordialement,\nCNSS - Caisse Nationale de Sécurité Sociale");
            
            Map<String, String> body = new HashMap<>();
            body.put("to", reclamation.getEmailCooperant());
            body.put("subject", "CNSS - Réclamation Documents - Action requise");
            body.put("content", content.toString());
            
            HttpEntity<Map<String, String>> request = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, request, String.class);
            
            log.info("Email de réclamation envoyé à {}", reclamation.getEmailCooperant());
        } catch (Exception e) {
            log.error("Erreur envoi email réclamation: {}", e.getMessage());
        }
    }
    
    private String getDocumentLabel(String type) {
        return switch (type.toLowerCase()) {
            case "identite" -> "Pièce d'identité";
            case "contrat" -> "Contrat de travail";
            case "diplome" -> "Diplômes et certificats";
            case "attestation" -> "Attestation de détachement";
            case "atct" -> "Formulaire ATCT signé";
            case "autres" -> "Autres documents";
            default -> type;
        };
    }
}

class ReclamationRequest {
    private String email;
    private String motif;
    private List<String> documentsManquants;
    private Long agentId;
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMotif() { return motif; }
    public void setMotif(String motif) { this.motif = motif; }
    public List<String> getDocumentsManquants() { return documentsManquants; }
    public void setDocumentsManquants(List<String> documentsManquants) { this.documentsManquants = documentsManquants; }
    public Long getAgentId() { return agentId; }
    public void setAgentId(Long agentId) { this.agentId = agentId; }
}
