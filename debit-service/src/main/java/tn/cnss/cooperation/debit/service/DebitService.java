package tn.cnss.cooperation.debit.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tn.cnss.cooperation.debit.dto.GenerateDebitRequest;
import tn.cnss.cooperation.debit.entity.Debit;
import tn.cnss.cooperation.debit.repository.DebitRepository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class DebitService {
    
    private final DebitRepository debitRepository;
    private final RestTemplate restTemplate = new RestTemplate();
    
    @Value("${notification.service.url:http://notification-service:8087}")
    private String notificationServiceUrl;
    
    @Transactional
    public Debit generateDebit(GenerateDebitRequest request) {
        log.info("Génération débit pour affiliation: {}, trimestre: T{}/{}", 
                request.getNumAffiliation(), request.getTrimestre(), request.getAnnee());
        
        String trimestreStr = "T" + request.getTrimestre() + "-" + request.getAnnee();
        
        Debit debit = new Debit();
        debit.setNumAffiliation(request.getNumAffiliation());
        debit.setTrimestre(trimestreStr);
        debit.setNomCooperant(request.getNomCooperant());
        debit.setAdresse(request.getAdresse());
        debit.setMatricule(request.getMatricule());
        debit.setAnnee(request.getAnnee());
        debit.setSalaire(request.getSalaire());
        
        // Calculer le montant cotisation si non fourni
        BigDecimal montant = request.getMontantCotisation();
        if (montant == null && request.getSalaire() != null) {
            montant = request.getSalaire().multiply(new BigDecimal("0.2575"));
        }
        debit.setMontantCotisation(montant != null ? montant : new BigDecimal("0"));
        
        if (request.getDateDebut() != null && !request.getDateDebut().isEmpty()) {
            debit.setDateEffet(LocalDate.parse(request.getDateDebut()));
        }
        debit.setPaye(false);
        debit.setCreatedAt(LocalDateTime.now());
        
        debit = debitRepository.save(debit);
        log.info("Débit créé avec succès, ID: {}", debit.getId());
        
        // Envoyer email avec avis de débit si email fourni
        if (request.getEmail() != null && !request.getEmail().isEmpty()) {
            sendDebitNotification(request, debit);
        }
        
        return debit;
    }
    
    private void sendDebitNotification(GenerateDebitRequest request, Debit debit) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            String subject = "CNSS - Avis de Débit T" + request.getTrimestre() + "/" + request.getAnnee();
            
            // Si le PDF arabe est fourni par le frontend, l'utiliser directement
            if (request.getPdfBase64() != null && !request.getPdfBase64().isEmpty()) {
                Map<String, Object> emailRequest = new HashMap<>();
                emailRequest.put("to", request.getEmail());
                emailRequest.put("subject", subject);
                emailRequest.put("content", buildDebitEmailContentHtml(request, debit));
                emailRequest.put("pdfBase64", request.getPdfBase64());
                emailRequest.put("fileName", "avis_debit_" + request.getNumAffiliation() + "_T" + request.getTrimestre() + "_" + request.getAnnee() + ".pdf");
                
                HttpEntity<Map<String, Object>> entity = new HttpEntity<>(emailRequest, headers);
                restTemplate.postForEntity(
                        notificationServiceUrl + "/notification/email-with-attachment",
                        entity,
                        Object.class
                );
                log.info("Email avec PDF arabe envoyé à: {}", request.getEmail());
            } else {
                // Fallback: utiliser l'ancien endpoint qui génère le PDF côté serveur
                Map<String, Object> emailRequest = new HashMap<>();
                emailRequest.put("to", request.getEmail());
                emailRequest.put("subject", subject);
                emailRequest.put("numAffiliation", request.getNumAffiliation());
                emailRequest.put("matricule", request.getMatricule() != null ? request.getMatricule() : "");
                emailRequest.put("nomCooperant", request.getNomCooperant() != null ? request.getNomCooperant() : "");
                emailRequest.put("adresse", request.getAdresse() != null ? request.getAdresse() : "");
                emailRequest.put("trimestre", request.getTrimestre());
                emailRequest.put("annee", request.getAnnee());
                emailRequest.put("salaire", request.getSalaire() != null ? request.getSalaire().doubleValue() : 0.0);
                emailRequest.put("montantTotal", debit.getMontantCotisation() != null ? debit.getMontantCotisation().doubleValue() : 0.0);
                
                HttpEntity<Map<String, Object>> entity = new HttpEntity<>(emailRequest, headers);
                restTemplate.postForEntity(
                        notificationServiceUrl + "/notification/debit-email",
                        entity,
                        Object.class
                );
                log.info("Email avec PDF français envoyé à: {}", request.getEmail());
            }
            
        } catch (Exception e) {
            log.error("Erreur envoi email avis de débit: {}", e.getMessage());
        }
    }
    
    private String buildDebitEmailContentHtml(GenerateDebitRequest request, Debit debit) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String dateStr = LocalDate.now().format(fmt);
        String dateLimit = LocalDate.now().plusMonths(1).withDayOfMonth(15).format(fmt);
        
        BigDecimal salaire = request.getSalaire() != null ? request.getSalaire() : new BigDecimal("0");
        BigDecimal cotisationRetraite = salaire.multiply(new BigDecimal("0.135"));
        BigDecimal cotisationComplementaire = salaire.multiply(new BigDecimal("0.735")).multiply(new BigDecimal("0.09"));
        BigDecimal total = debit.getMontantCotisation();
        
        // Design identique au PDF imprimé
        return String.format("""
            <!DOCTYPE html>
            <html lang="ar" dir="rtl">
            <head>
                <meta charset="UTF-8">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap');
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: 'Amiri', 'Traditional Arabic', Arial, serif; font-size: 13px; line-height: 1.8; padding: 30px 40px; background: white; }
                    .header { display: flex; justify-content: space-between; margin-bottom: 15px; }
                    .header-fr { text-align: left; font-size: 11px; direction: ltr; }
                    .header-ar { text-align: right; font-size: 12px; }
                    .logo-box { border: 2px solid #8B0000; padding: 15px 20px; margin: 15px 0; display: flex; align-items: center; justify-content: center; gap: 15px; }
                    .logo-fr { color: #8B0000; font-size: 18px; font-weight: bold; direction: ltr; }
                    .logo-ar { color: #8B0000; font-size: 14px; font-weight: bold; margin-top: 3px; }
                    .info-row { display: flex; justify-content: space-between; margin: 10px 0; font-size: 12px; }
                    .info-left { text-align: left; direction: ltr; }
                    .info-right { text-align: right; }
                    .subject { text-align: center; margin: 20px 0; font-size: 16px; font-weight: bold; color: #8B0000; text-decoration: underline; }
                    .body-text { text-align: right; font-size: 12px; line-height: 2; margin: 15px 0; }
                    .body-text p { margin-bottom: 10px; text-align: justify; }
                    table { width: 100%%; border-collapse: collapse; margin: 15px 0; font-size: 11px; }
                    th, td { border: 1px solid #333; padding: 6px 8px; text-align: center; }
                    th { background: #f0f0f0; font-weight: bold; }
                    .total-row { font-weight: bold; background: #f9f9f9; }
                    .signature { text-align: left; margin-top: 30px; font-weight: bold; font-size: 12px; }
                    .footer { text-align: center; font-size: 9px; color: #666; margin-top: 30px; border-top: 1px solid #000; padding-top: 8px; direction: ltr; }
                    .highlight { background: #fffacd; padding: 8px; border-radius: 4px; margin: 10px 0; }
                </style>
            </head>
            <body>
                <!-- En-tête bilingue -->
                <div class="header">
                    <div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l'Étranger</div>
                    <div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div>
                </div>
                
                <!-- Logo CNSS -->
                <div class="logo-box">
                    <div style="text-align: center;">
                        <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
                        <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
                    </div>
                </div>
                
                <!-- Informations -->
                <div class="info-row">
                    <div class="info-right">المكتب الجهوري بتونس المدينة<br>شارع مدريد - تونس 12</div>
                    <div class="info-left">تونس في %s</div>
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
                        <td>%s</td>
                        <td>13.5</td>
                        <td>%s</td>
                        <td>جرايات الشيخوخة والعجز والباقين على قيد الحياة</td>
                        <td>133</td>
                    </tr>
                    <tr>
                        <td>0.000</td>
                        <td>0</td>
                        <td>%s</td>
                        <td>التأمينات الاجتماعية</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>%s</td>
                        <td>9</td>
                        <td>%s</td>
                        <td>(*) النظام التكميلي للجرايات</td>
                        <td>91</td>
                    </tr>
                    <tr class="total-row">
                        <td><strong>%s</strong></td>
                        <td colspan="4"><strong>المجملة</strong></td>
                    </tr>
                </table>
                
                <div class="body-text">
                    <p>(*) الجزء الذي يفوق 6 مرات الأجر الأدنى</p>
                    <p class="highlight"><strong>تاريخ الدفع الأقصى:</strong> %s<br>يمكنكم تسديد مساهماتكم عبر:<br>- تحويل بنكي إلى الحساب: <strong>10104059103466578833</strong><br>- الحساب الجاري البريدي: <strong>17001000000000733217</strong></p>
                    <p>كما يمكنكم تكليف من تريدون بتسديد المساهمات مباشرة بشباليك المكتب الجهوري بتونس المدينة</p>
                    <p style="margin-top: 20px;">مع فائق الاحترام والتقدير</p>
                    <p><strong>والسلام</strong></p>
                </div>
                
                <!-- Signature -->
                <div class="signature">رئيس المكتب الجهوي بتونس المدينة</div>
                
                <!-- Footer -->
                <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le %s</div>
            </body>
            </html>
            """,
            dateStr,
            request.getNumAffiliation(),
            request.getMatricule() != null ? request.getMatricule() : "-",
            request.getNomCooperant() != null ? request.getNomCooperant() : "-",
            request.getAdresse() != null ? request.getAdresse() : "-",
            request.getAnnee(),
            request.getTrimestre(),
            cotisationRetraite.setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            salaire.setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            salaire.setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            cotisationComplementaire.setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            salaire.multiply(new BigDecimal("0.735")).setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            total.setScale(3, java.math.RoundingMode.HALF_UP).toString(),
            dateLimit,
            dateStr
        );
    }
    
    
    public Debit getDebit(String numAffiliation, String trimestre) {
        return debitRepository.findByNumAffiliationAndTrimestre(numAffiliation, trimestre)
                .orElseThrow(() -> new RuntimeException("Débit non trouvé"));
    }
}
