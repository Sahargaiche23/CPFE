package tn.cnss.cooperation.affiliation.service;

import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.kernel.pdf.PdfWriter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.affiliation.entity.DossierCoop;

import java.io.ByteArrayOutputStream;
import java.time.format.DateTimeFormatter;

@Service
@RequiredArgsConstructor
@Slf4j
public class PdfGenerationService {

    public byte[] genererAttestationAffiliation(DossierCoop dossier) {
        log.info("Génération PDF pour dossier: {}-{}", dossier.getEmpMat(), dossier.getEmpCle());
        
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            PdfWriter writer = new PdfWriter(baos);
            String html = buildHtmlAttestation(dossier);
            HtmlConverter.convertToPdf(html, writer);
            
            log.info("PDF généré avec succès");
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur génération PDF", e);
            throw new RuntimeException("Erreur lors de la génération du PDF", e);
        }
    }

    private String buildHtmlAttestation(DossierCoop dossier) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        
        return """
            <!DOCTYPE html>
            <html dir="rtl">
            <head>
                <meta charset="UTF-8">
                <style>
                    body { font-family: Arial, sans-serif; direction: rtl; text-align: center; }
                    .header { background-color: #4A1E8C; color: white; padding: 20px; }
                    .logo { font-size: 24px; font-weight: bold; }
                    .title { font-size: 20px; margin: 30px 0; font-weight: bold; }
                    .content { margin: 20px 40px; text-align: right; line-height: 1.8; }
                    .info { margin: 10px 0; }
                    .footer { margin-top: 50px; text-align: left; }
                    .signature { margin-top: 80px; }
                    table { width: 100%; border-collapse: collapse; margin: 20px 0; }
                    td { padding: 10px; border: 1px solid #ddd; text-align: right; }
                    .label { font-weight: bold; background-color: #f5f5f5; }
                </style>
            </head>
            <body>
                <div class="header">
                    <div class="logo">
                        الجمهورية التونسية<br>
                        République Tunisienne<br>
                        <span style="font-size: 18px;">الصندوق الوطني للضمان الاجتماعي</span><br>
                        <span style="font-size: 14px;">Caisse Nationale de Sécurité Sociale</span>
                    </div>
                </div>
                
                <div class="title">
                    شهادة انتساب في إطار التعاون الفني<br>
                    Attestation d'Affiliation - Coopération Technique
                </div>
                
                <div class="content">
                    <p>نشهد أن السيد(ة):</p>
                    <p>Il est certifié que:</p>
                    
                    <table>
                        <tr>
                            <td class="label" style="width: 40%;">رقم الضمان الاجتماعي / Matricule</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">رقم الانتساب / N° Affiliation</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">المشغل / Employeur</td>
                            <td>%s-%s</td>
                        </tr>
                        <tr>
                            <td class="label">النظام / Régime</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">بلد التكليف / Pays de Prestation</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">تاريخ البداية / Date Début</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">الأجر الشهري / Salaire Mensuel</td>
                            <td>%,.2f TND</td>
                        </tr>
                    </table>
                    
                    <p style="margin-top: 30px;">
                        هذه الشهادة صالحة لكل الاستعمالات الإدارية.<br>
                        Cette attestation est valable pour toutes les utilisations administratives.
                    </p>
                </div>
                
                <div class="footer">
                    <div class="signature">
                        <p>تونس في / Tunis le: %s</p>
                        <p>الختم والإمضاء<br>Cachet et Signature</p>
                    </div>
                </div>
            </body>
            </html>
            """.formatted(
                dossier.getAssureMat(),
                dossier.getDcoNumAffiliation() != null ? dossier.getDcoNumAffiliation() : 0L,
                dossier.getEmpMat(),
                dossier.getEmpCle(),
                dossier.getPaysCode(),
                "N/A", // Pays de prestation
                dossier.getDcoDateDebut().format(formatter),
                dossier.getDcoSalaire() != null ? dossier.getDcoSalaire().doubleValue() : 0.0,
                java.time.LocalDate.now().format(formatter)
            );
    }
}
