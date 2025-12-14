package tn.cnss.cooperation.notification.service;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.notification.dto.EmailRequest;

import java.util.Base64;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {
    
    private final JavaMailSender mailSender;

    @Value("${spring.mail.username:}")
    private String fromEmail;

    public void sendGenericEmail(String to, String subject, String content) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            helper.setTo(to);
            helper.setSubject(subject);
            // Envoyer en HTML si le contenu contient des balises HTML
            boolean isHtml = content != null && (content.contains("<html") || content.contains("<body") || content.contains("<div") || content.contains("<table"));
            helper.setText(content != null ? content : "", isHtml);
            
            if (fromEmail != null && !fromEmail.isBlank()) {
                helper.setFrom(fromEmail);
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

    public void sendEmailWithAttachment(String to, String subject, String content, String pdfBase64, String fileName) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, false);
            
            if (fromEmail != null && !fromEmail.isBlank()) {
                helper.setFrom(fromEmail);
            }
            
            // Attacher le PDF
            if (pdfBase64 != null && !pdfBase64.isBlank()) {
                byte[] pdfBytes = Base64.getDecoder().decode(pdfBase64);
                ByteArrayResource pdfResource = new ByteArrayResource(pdfBytes);
                helper.addAttachment(fileName != null ? fileName : "attestation_affiliation.pdf", pdfResource);
            }
            
            mailSender.send(message);
            log.info("Email avec pièce jointe envoyé avec succès à: {}", to);
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email avec pièce jointe: {}", e.getMessage());
        }
    }
}
