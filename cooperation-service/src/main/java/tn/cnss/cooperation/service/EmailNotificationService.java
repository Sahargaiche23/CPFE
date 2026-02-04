package tn.cnss.cooperation.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailNotificationService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username:noreply@cnss.tn}")
    private String fromEmail;

    @Value("${app.mail.enabled:true}")
    private boolean mailEnabled;

    @Async
    public void sendEmail(String to, String subject, String body) {
        if (!mailEnabled) {
            log.info("Email désactivé - Simulation envoi à {} : {}", to, subject);
            return;
        }

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(body);

            mailSender.send(message);
            log.info("Email envoyé avec succès à {}", to);
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email à {}: {}", to, e.getMessage());
            throw new RuntimeException("Erreur envoi email", e);
        }
    }

    @Async
    public void sendHtmlEmail(String to, String subject, String htmlBody) {
        if (!mailEnabled) {
            log.info("Email HTML désactivé - Simulation envoi à {} : {}", to, subject);
            return;
        }

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(fromEmail);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true);

            mailSender.send(message);
            log.info("Email HTML envoyé avec succès à {}", to);
        } catch (MessagingException e) {
            log.error("Erreur lors de l'envoi de l'email HTML à {}: {}", to, e.getMessage());
            throw new RuntimeException("Erreur envoi email HTML", e);
        }
    }

    public void sendInscriptionEmail(String to, String nomComplet, String email, String tempPassword) {
        String subject = "CNSS - Confirmation d'inscription Coopération Technique";
        
        String htmlBody = String.format("""
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <style>
                    body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
                    .container { max-width: 600px; margin: 0 auto; padding: 20px; }
                    .header { background-color: #1e3a5f; color: white; padding: 20px; text-align: center; }
                    .content { padding: 20px; background-color: #f9f9f9; }
                    .credentials { background-color: #e8f4f8; border: 1px solid #1e3a5f; padding: 15px; margin: 20px 0; border-radius: 5px; }
                    .footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }
                    .btn { display: inline-block; background-color: #1e3a5f; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 10px 0; }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>🏛️ CNSS - Caisse Nationale de Sécurité Sociale</h1>
                        <p>Coopération Technique</p>
                    </div>
                    <div class="content">
                        <h2>Madame/Monsieur %s,</h2>
                        <p>Nous avons le plaisir de vous informer que votre inscription au régime de <strong>Coopération Technique</strong> a été <strong style="color: green;">validée</strong>.</p>
                        
                        <div class="credentials">
                            <h3>🔐 Vos identifiants de connexion</h3>
                            <p><strong>Email:</strong> %s</p>
                            <p><strong>Mot de passe temporaire:</strong> <code style="background: #fff; padding: 5px;">%s</code></p>
                        </div>
                        
                        <p style="text-align: center;">
                            <a href="https://cnss.tn/cooperant/login" class="btn">Se connecter</a>
                        </p>
                        
                        <p><strong>⚠️ IMPORTANT:</strong> Vous devrez changer votre mot de passe lors de votre première connexion.</p>
                        
                        <h3>Une fois connecté, vous pourrez:</h3>
                        <ul>
                            <li>📁 Déposer vos documents pour finaliser votre inscription CNSS</li>
                            <li>📄 Consulter vos avis de paiement</li>
                            <li>💰 Suivre vos cotisations</li>
                            <li>📝 Effectuer vos demandes en ligne</li>
                        </ul>
                    </div>
                    <div class="footer">
                        <p>CNSS - Caisse Nationale de Sécurité Sociale</p>
                        <p>Pour toute question, contactez votre bureau régional CNSS</p>
                    </div>
                </div>
            </body>
            </html>
            """, nomComplet, email, tempPassword);

        sendHtmlEmail(to, subject, htmlBody);
    }

    public void sendAvisPaymentEmail(String to, String nomComplet, String numAffiliation, 
                                      String periode, String montant, String dateLimite) {
        String subject = "CNSS - Avis de Paiement Coopération Technique";
        
        String body = String.format("""
            Madame/Monsieur %s,
            
            Veuillez trouver ci-dessous votre avis de paiement pour la période %s.
            
            ═══════════════════════════════════════════
            DÉTAILS DU PAIEMENT
            ═══════════════════════════════════════════
            Numéro d'affiliation: %s
            Période: %s
            Montant à payer: %s TND
            Date limite: %s
            ═══════════════════════════════════════════
            
            Vous pouvez effectuer votre paiement:
            - En ligne sur https://cnss.tn/cooperant
            - Par virement bancaire
            - Auprès de votre bureau régional CNSS
            
            Cordialement,
            CNSS - Caisse Nationale de Sécurité Sociale
            """, nomComplet, periode, numAffiliation, periode, montant, dateLimite);

        sendEmail(to, subject, body);
    }

    public void sendRappelEmail(String to, String nomComplet, int nombreTrimestres, String montantTotal) {
        String subject = "CNSS - RAPPEL: Cotisations en retard";
        
        String body = String.format("""
            Madame/Monsieur %s,
            
            ⚠️ RAPPEL IMPORTANT
            
            Nous vous informons que vous avez %d trimestre(s) de cotisation en retard.
            
            Montant total dû: %s TND
            
            Nous vous prions de régulariser votre situation dans les meilleurs délais
            afin d'éviter toute pénalité.
            
            Pour plus d'informations, connectez-vous sur https://cnss.tn/cooperant
            ou contactez votre bureau régional CNSS.
            
            Cordialement,
            CNSS - Caisse Nationale de Sécurité Sociale
            """, nomComplet, nombreTrimestres, montantTotal);

        sendEmail(to, subject, body);
    }
}
