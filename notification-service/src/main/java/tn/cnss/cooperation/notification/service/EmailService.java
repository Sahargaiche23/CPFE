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
    private final PdfGeneratorService pdfGeneratorService;

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
            
            // Toujours envoyer le contenu comme HTML
            helper.setText(content != null ? content : "", true);
            
            if (fromEmail != null && !fromEmail.isBlank()) {
                helper.setFrom(fromEmail);
            }
            
            // Attacher le PDF (décodé depuis Base64) comme pièce jointe PDF
            if (pdfBase64 != null && !pdfBase64.isBlank()) {
                byte[] pdfBytes = Base64.getDecoder().decode(pdfBase64);
                ByteArrayResource pdfResource = new ByteArrayResource(pdfBytes);
                String attachmentName = fileName != null ? fileName : "avis_debit.pdf";
                helper.addAttachment(attachmentName, pdfResource, "application/pdf");
            }
            
            mailSender.send(message);
            log.info("Email avec pièce jointe PDF envoyé avec succès à: {}", to);
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email avec pièce jointe: {}", e.getMessage());
        }
    }

    public void sendDebitEmailWithPdf(String to, String subject, String numAffiliation, String matricule,
                                       String nomCooperant, String adresse, int trimestre, int annee,
                                       double salaire, double montantTotal) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            helper.setTo(to);
            helper.setSubject(subject);
            
            // Corps de l'email en HTML
            String htmlContent = buildDebitEmailHtml(numAffiliation, matricule, nomCooperant, adresse, 
                                                      trimestre, annee, salaire, montantTotal);
            helper.setText(htmlContent, true);
            
            if (fromEmail != null && !fromEmail.isBlank()) {
                helper.setFrom(fromEmail);
            }
            
            // Générer le PDF et l'attacher
            byte[] pdfBytes = pdfGeneratorService.generateDebitPdf(numAffiliation, matricule, nomCooperant,
                                                                    adresse, trimestre, annee, salaire, montantTotal);
            if (pdfBytes != null && pdfBytes.length > 0) {
                ByteArrayResource pdfResource = new ByteArrayResource(pdfBytes);
                String fileName = "avis_debit_" + numAffiliation + "_T" + trimestre + "_" + annee + ".pdf";
                helper.addAttachment(fileName, pdfResource, "application/pdf");
            }
            
            mailSender.send(message);
            log.info("Email débit avec PDF envoyé avec succès à: {}", to);
        } catch (Exception e) {
            log.error("Erreur envoi email débit: {}", e.getMessage());
        }
    }

    private String buildDebitEmailHtml(String numAffiliation, String matricule, String nomCooperant,
                                        String adresse, int trimestre, int annee, double salaire, double montantTotal) {
        double cotRetraite = salaire * 0.135;
        double baseComp = salaire * 0.735;
        double cotComp = baseComp * 0.09;
        String dateStr = java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String dateLimit = java.time.LocalDate.now().plusMonths(1).withDayOfMonth(15).format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        
        return String.format("""
            <!DOCTYPE html>
            <html lang="ar" dir="rtl">
            <head>
                <meta charset="UTF-8">
                <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap" rel="stylesheet">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap');
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: 'Amiri', 'Traditional Arabic', 'Arial', serif; font-size: 13px; line-height: 1.8; padding: 30px 40px; background: white; }
                    .header { display: flex; justify-content: space-between; margin-bottom: 15px; }
                    .header-fr { text-align: left; font-size: 11px; direction: ltr; }
                    .header-ar { text-align: right; font-size: 12px; }
                    .logo-box { border: 2px solid #8B0000; padding: 15px 20px; margin: 15px 0; display: flex; align-items: center; justify-content: center; gap: 15px; }
                    .logo-fr { color: #8B0000; font-size: 18px; font-weight: bold; direction: ltr; }
                    .logo-ar { color: #8B0000; font-size: 14px; font-weight: bold; margin-top: 3px; }
                    .info-row { display: flex; justify-content: space-between; margin: 10px 0; font-size: 12px; }
                    .info-left { text-align: left; direction: ltr; }
                    .info-right { text-align: right; }
                    .subject { text-align: center; margin: 20px 0; font-size: 16px; font-weight: bold; }
                    .body-text { text-align: right; font-size: 12px; line-height: 2; margin: 15px 0; }
                    .body-text p { margin-bottom: 10px; text-align: justify; }
                    table { width: 100%%; border-collapse: collapse; margin: 15px 0; font-size: 11px; }
                    th, td { border: 1px solid #333; padding: 6px 8px; text-align: center; }
                    th { background: #f0f0f0; font-weight: bold; }
                    .signature { text-align: left; margin-top: 30px; font-weight: bold; font-size: 12px; }
                    .footer { text-align: center; font-size: 9px; color: #666; margin-top: 30px; border-top: 1px solid #000; padding-top: 8px; direction: ltr; }
                    .highlight { background: #fffacd; padding: 8px; border-radius: 4px; margin: 10px 0; }
                </style>
            </head>
            <body>
                <!-- En-tête bilingue -->
                <div class="header">
                    <div class="header-fr">
                        République Tunisienne<br>
                        Ministère des Affaires Sociales<br>
                        et des Tunisiens à l'Étranger
                    </div>
                    <div class="header-ar">
                        الجمهورية التونسية<br>
                        وزارة الشؤون الاجتماعية والتضامن<br>
                        والتونسيين بالخارج
                    </div>
                </div>
                
                <!-- Logo CNSS -->
                <div class="logo-box">
                    <div>
                        <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
                        <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
                    </div>
                </div>
                
                <!-- Informations -->
                <div class="info-row">
                    <div class="info-right">
                        المكتب الجهوري بتونس المدينة<br>
                        شارع مدريد - تونس 12
                    </div>
                    <div class="info-left">
                        تونس في %s
                    </div>
                </div>
                
                <div style="text-align: right; margin: 10px 0; font-size: 12px;">
                    <strong>رقم الإنخراط:</strong> %s<br>
                    <strong>رقم التسجيل:</strong> %s
                </div>
                
                <!-- Bénéficiaire -->
                <div style="text-align: right; margin: 15px 0; font-size: 12px;">
                    <strong>السيد/ة :</strong> %s<br>
                    <strong>العنوان :</strong> %s
                </div>
                
                <!-- Sujet -->
                <div class="subject">الموضوع : إعلام بدفع المساهمات</div>
                
                <!-- Corps -->
                <div class="body-text">
                    <p>أما بعد،</p>
                    <p>أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني، طبقا للأمر عدد 1879 لسنة 2007،</p>
                    <p>لسنة <strong>%d</strong> الثلاثية <strong>%d</strong> الموافق في 23 جويلية 2007، بدفوعل الثلاث</p>
                    <p>مفصلا كما يلي سنة آلاف و تسعة مائة و واحد و خمسون دينار و 285 مليم حدد ب</p>
                </div>
                
                <!-- Tableau des cotisations -->
                <table>
                    <tr>
                        <th>المبلغ</th>
                        <th>النسبة (%%)</th>
                        <th>قاعدة الإحتساب (د.ت)</th>
                        <th>النظام</th>
                        <th>الرمز</th>
                    </tr>
                    <tr>
                        <td>%.3f</td>
                        <td>13.5</td>
                        <td>%.3f</td>
                        <td>جرايات الشيخوخة و العجز و الباقين على قيد الحياة</td>
                        <td>133</td>
                    </tr>
                    <tr>
                        <td>0.000</td>
                        <td>0</td>
                        <td>%.3f</td>
                        <td>التأمينات الاجتماعية</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>%.3f</td>
                        <td>9</td>
                        <td>%.3f</td>
                        <td>(*) النظام التكميلي للجرايات</td>
                        <td>91</td>
                    </tr>
                    <tr style="font-weight: bold; background: #f9f9f9;">
                        <td>%.3f</td>
                        <td colspan="4">المجملة</td>
                    </tr>
                </table>
                
                <div class="body-text">
                    <p>(*) الجزء الذي يفوق 6 مرات الأجر الأدنى</p>
                    <p>هذا ويمكنكم تسديد مساهماتكم بواسطة <strong>%s</strong> فالمرغوب منكم تسديد هذا المبلغ في أجل لا يتجاوز</p>
                    <p>تحويل بريدي أو بنكي إلى الحساب الجاري للصندوق لدى الشركة التونسية للبنك عدد: <strong>10104059103466578833</strong></p>
                    <p>أو إلى الحساب الجاري البريدي للصندوق عدد: <strong>17001000000000733217</strong></p>
                    <p class="highlight">كما يمكنكم تكليف من تريدون بتسديد المساهمات مباشرة بشباليك المكتب الجهوري بتونس المدينة</p>
                    <p style="margin-top: 20px;">مع فائق الاحترام والتقدير</p>
                    <p><strong>والسلام</strong></p>
                </div>
                
                <!-- Signature -->
                <div class="signature">رئيس المكتب الجهوري بتونس المدينة</div>
                
                <!-- Footer -->
                <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le %s</div>
            </body>
            </html>
            """, dateStr, numAffiliation, matricule, nomCooperant, adresse, annee, trimestre,
            cotRetraite, salaire, salaire, cotComp, baseComp, montantTotal, dateLimit, dateStr);
    }
}
