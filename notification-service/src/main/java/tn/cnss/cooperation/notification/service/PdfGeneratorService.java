package tn.cnss.cooperation.notification.service;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
@Slf4j
public class PdfGeneratorService {

    /**
     * Génère un PDF à partir du HTML arabe (conversion HTML -> PDF)
     */
    public byte[] generateDebitPdf(String numAffiliation, String matricule, String nomCooperant, 
                                    String adresse, int trimestre, int annee, double salaire, 
                                    double montantTotal) {
        try {
            String html = generateDebitHtmlAr(numAffiliation, matricule, nomCooperant, 
                                               adresse, trimestre, annee, salaire, montantTotal);
            
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode();
            builder.withHtmlContent(html, null);
            builder.toStream(baos);
            builder.run();
            
            log.info("PDF arabe généré avec succès pour: {}", numAffiliation);
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur génération PDF arabe: {}", e.getMessage());
            // Fallback: générer PDF français si erreur
            return generateDebitPdfFr(numAffiliation, matricule, nomCooperant, adresse, trimestre, annee, salaire, montantTotal);
        }
    }

    /**
     * Génère un PDF en version française
     */
    public byte[] generateDebitPdfFr(String numAffiliation, String matricule, String nomCooperant, 
                                    String adresse, int trimestre, int annee, double salaire, 
                                    double montantTotal) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            Document document = new Document(PageSize.A4, 50, 50, 40, 40);
            PdfWriter.getInstance(document, baos);
            document.open();

            Font titleFont = new Font(Font.HELVETICA, 16, Font.BOLD, new Color(139, 0, 0));
            Font headerFont = new Font(Font.HELVETICA, 10, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 10, Font.NORMAL);
            Font smallFont = new Font(Font.HELVETICA, 8, Font.NORMAL);

            String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            String dateLimit = LocalDate.now().plusMonths(1).withDayOfMonth(15).format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

            // Header
            document.add(new Paragraph("République Tunisienne\nMinistère des Affaires Sociales\net des Tunisiens à l'Étranger", smallFont));
            document.add(new Paragraph("\n"));

            // Logo Box
            PdfPTable logoTable = new PdfPTable(1);
            logoTable.setWidthPercentage(70);
            logoTable.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell logoCell = new PdfPCell();
            logoCell.setBorderColor(new Color(139, 0, 0));
            logoCell.setBorderWidth(2);
            logoCell.setPadding(12);
            logoCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            logoCell.addElement(new Paragraph("Caisse Nationale de Sécurité Sociale", titleFont));
            logoTable.addCell(logoCell);
            document.add(logoTable);
            document.add(new Paragraph("\n\n"));

            // Infos
            document.add(new Paragraph("Tunis, le " + dateStr, normalFont));
            document.add(new Paragraph("N° Affiliation: " + numAffiliation, normalFont));
            document.add(new Paragraph("N° Matricule: " + matricule, normalFont));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Mr/Mme: " + nomCooperant, headerFont));
            document.add(new Paragraph("Adresse: " + adresse, normalFont));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Année: " + annee + " - Trimestre: T" + trimestre, headerFont));
            document.add(new Paragraph("\n"));

            // Tableau
            PdfPTable cotTable = new PdfPTable(5);
            cotTable.setWidthPercentage(100);
            cotTable.setWidths(new float[]{12, 40, 12, 18, 18});

            String[] headers = {"Code", "Régime", "Taux %", "Base", "Montant"};
            for (String h : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(h, headerFont));
                cell.setBackgroundColor(new Color(230, 230, 230));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setPadding(6);
                cotTable.addCell(cell);
            }

            double cotRetraite = salaire * 0.135;
            double baseComp = salaire * 0.735;
            double cotComp = baseComp * 0.09;
            
            addRow(cotTable, "133", "Pensions de vieillesse", "13.5", salaire, cotRetraite, normalFont);
            addRow(cotTable, "0", "Assurances sociales", "0", salaire, 0, normalFont);
            addRow(cotTable, "91", "Régime complémentaire", "9", baseComp, cotComp, normalFont);

            PdfPCell totalLabel = new PdfPCell(new Phrase("TOTAL", headerFont));
            totalLabel.setColspan(4);
            totalLabel.setHorizontalAlignment(Element.ALIGN_RIGHT);
            totalLabel.setBackgroundColor(new Color(255, 255, 200));
            totalLabel.setPadding(6);
            cotTable.addCell(totalLabel);
            
            PdfPCell totalValue = new PdfPCell(new Phrase(String.format("%.3f", montantTotal), headerFont));
            totalValue.setHorizontalAlignment(Element.ALIGN_CENTER);
            totalValue.setBackgroundColor(new Color(255, 255, 200));
            totalValue.setPadding(6);
            cotTable.addCell(totalValue);

            document.add(cotTable);
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Date limite de paiement: " + dateLimit, headerFont));
            document.add(new Paragraph("Compte bancaire: 10104059103466578833", normalFont));
            document.add(new Paragraph("Compte postal: 17001000000000733217", normalFont));
            document.add(new Paragraph("\n\n"));
            document.add(new Paragraph("Le Chef du Bureau Régional de Tunis Ville", headerFont));
            document.add(new Paragraph("\n\n\n"));
            
            Paragraph footer = new Paragraph("© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le " + dateStr, smallFont);
            footer.setAlignment(Element.ALIGN_CENTER);
            document.add(footer);

            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur génération PDF FR: {}", e.getMessage());
            return new byte[0];
        }
    }

    /**
     * Génère le HTML en arabe (identique au frontend)
     */
    public String generateDebitHtmlAr(String numAffiliation, String matricule, String nomCooperant, 
                                       String adresse, int trimestre, int annee, double salaire, 
                                       double montantTotal) {
        double cotRetraite = salaire * 0.135;
        double baseComp = salaire * 0.735;
        double cotComp = baseComp * 0.09;
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String dateLimit = LocalDate.now().plusMonths(1).withDayOfMonth(15).format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        
        // Logo CNSS en SVG inline
        String logoSvg = """
            <svg width="50" height="50" viewBox="0 0 100 100">
                <circle cx="50" cy="50" r="45" fill="#2d8f4e"/>
                <text x="50" y="35" text-anchor="middle" fill="white" font-size="12" font-weight="bold">CNSS</text>
                <text x="50" y="55" text-anchor="middle" fill="white" font-size="8">صندوق</text>
                <text x="50" y="70" text-anchor="middle" fill="white" font-size="8">الضمان</text>
            </svg>
            """;
        
        return String.format("""
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="ar" dir="rtl">
            <head>
                <meta charset="UTF-8" />
                <style>
                    @page { size: A4; margin: 15mm; }
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: Arial, sans-serif; font-size: 11px; line-height: 1.6; padding: 20px; background: white; }
                    .header { display: flex; justify-content: space-between; margin-bottom: 10px; }
                    .header-fr { text-align: left; font-size: 10px; direction: ltr; }
                    .header-ar { text-align: right; font-size: 10px; }
                    .logo-box { 
                        border: 2px solid #8B0000; 
                        padding: 10px 15px; 
                        margin: 10px auto; 
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 10px;
                        max-width: 450px;
                    }
                    .logo-text { text-align: center; }
                    .logo-fr { color: #8B0000; font-size: 14px; font-weight: bold; direction: ltr; }
                    .logo-ar { color: #8B0000; font-size: 11px; font-weight: bold; margin-top: 2px; }
                    .info-section { margin: 10px 0; font-size: 10px; }
                    .info-row { display: flex; justify-content: space-between; margin: 8px 0; }
                    .subject { text-align: center; margin: 15px 0; font-size: 13px; font-weight: bold; text-decoration: underline; }
                    .body-text { text-align: right; font-size: 10px; line-height: 1.8; margin: 10px 0; }
                    .body-text p { margin-bottom: 8px; }
                    table { width: 100%%; border-collapse: collapse; margin: 10px 0; font-size: 10px; }
                    th, td { border: 1px solid #333; padding: 5px 6px; text-align: center; }
                    th { background: #f0f0f0; font-weight: bold; }
                    .total-row { font-weight: bold; background: #fffacd; }
                    .payment-info { margin: 10px 0; font-size: 10px; text-align: right; }
                    .highlight { background: #fffacd; padding: 6px; border-radius: 3px; margin: 8px 0; }
                    .signature { text-align: left; margin-top: 20px; font-weight: bold; font-size: 10px; }
                    .footer { text-align: center; font-size: 8px; color: #666; margin-top: 20px; border-top: 1px solid #ccc; padding-top: 6px; direction: ltr; }
                </style>
            </head>
            <body>
                <div class="header">
                    <div class="header-fr">
                        République Tunisienne<br />
                        Ministère des Affaires Sociales<br />
                        et des Tunisiens à l'Étranger
                    </div>
                    <div class="header-ar">
                        الجمهورية التونسية<br />
                        وزارة الشؤون الاجتماعية والتضامن<br />
                        والتونسيين بالخارج
                    </div>
                </div>
                
                <div class="logo-box">
                    %s
                    <div class="logo-text">
                        <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
                        <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
                    </div>
                </div>
                
                <div class="info-row">
                    <div style="text-align: left; direction: ltr;">تونس في %s</div>
                    <div style="text-align: right;">
                        المكتب الجهوي بتونس المدينة<br />
                        شارع مدريد - تونس 12
                    </div>
                </div>
                
                <div class="info-section" style="text-align: right;">
                    <strong>رقم الإنخراط:</strong> %s<br />
                    <strong>رقم التسجيل:</strong> %s
                </div>
                
                <div class="info-section" style="text-align: right;">
                    <strong>السيد/ة :</strong> %s<br />
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
                    <tr class="total-row">
                        <td>%.3f</td>
                        <td colspan="4">المجملة</td>
                    </tr>
                </table>
                
                <!-- Infos paiement -->
                <div class="body-text">
                    <p>(*) الجزء الذي يفوق 6 مرات الأجر الأدنى</p>
                    <p>هذا ويمكنكم تسديد مساهماتكم بواسطة <strong>%s</strong> فالمرغوب منكم تسديد هذا المبلغ في أجل لا يتجاوز</p>
                    <p>تحويل بريدي أو بنكي إلى الحساب الجاري للصندوق لدى الشركة التونسية للبنك عدد: <strong>10104059103466578833</strong></p>
                    <p>أو إلى الحساب الجاري البريدي للصندوق عدد: <strong>17001000000000733217</strong></p>
                    <p class="highlight">كما يمكنكم تكليف من تريدون بتسديد المساهمات مباشرة بشباليك المكتب الجهوري بتونس المدينة</p>
                    <p style="margin-top: 15px;">مع فائق الاحترام والتقدير</p>
                    <p><strong>والسلام</strong></p>
                </div>
                
                <!-- Signature -->
                <div class="signature">رئيس المكتب الجهوري بتونس المدينة</div>
                
                <!-- Footer -->
                <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le %s</div>
            </body>
            </html>
            """, logoSvg, dateStr, numAffiliation, matricule, nomCooperant, adresse, annee, trimestre,
            cotRetraite, salaire, salaire, cotComp, baseComp, montantTotal, dateLimit, dateStr);
    }

    private void addRow(PdfPTable table, String code, String regime, String taux, double base, double montant, Font font) {
        for (String val : new String[]{code, regime, taux, String.format("%.3f", base), String.format("%.3f", montant)}) {
            PdfPCell cell = new PdfPCell(new Phrase(val, font));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(5);
            table.addCell(cell);
        }
    }
}
