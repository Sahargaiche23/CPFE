package tn.cnss.cooperation.notification.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.notification.dto.EmailRequest;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {
    
    private final JavaMailSender mailSender;

    @Value("${spring.mail.username:}")
    private String fromEmail;

    public void sendGenericEmail(String to, String subject, String content) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(content);
            if (fromEmail != null && !fromEmail.isBlank()) {
                message.setFrom(fromEmail);
            }
            mailSender.send(message);
            log.info("Email générique envoyé avec succès à: {}", to);
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email générique: {}", e.getMessage());
        }
    }
    
    public void sendAffiliationEmail(EmailRequest request) {
        log.info("Envoi email à: {} pour affiliation: {}", 
                request.getEmail(), request.getNumAffiliation());
        
        String subject = "CNSS - Attestation d'Affiliation Coopération Technique";
        String content = String.format("""
                Bonjour,
                
                Votre affiliation de coopération technique a été effectuée avec succès.
                
                Numéro d'affiliation: %s
                Montant cotisation: %s TND
                RIB du bureau: %s
                
                Les documents joints contiennent:
                - Attestation d'affiliation
                - Avis de paiement
                
                Cordialement,
                CNSS - Service Coopération Technique
                """, 
                request.getNumAffiliation(), 
                request.getMontantCotisation(), 
                request.getRib());
        
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(request.getEmail());
            message.setSubject(subject);
            message.setText(content);
            if (fromEmail != null && !fromEmail.isBlank()) {
                message.setFrom(fromEmail);
            }
            
            mailSender.send(message);
            log.info("Email envoyé avec succès à: {}", request.getEmail());
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email: {}", e.getMessage());
        }
    }
}
