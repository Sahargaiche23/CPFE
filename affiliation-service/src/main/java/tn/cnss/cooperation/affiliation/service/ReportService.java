package tn.cnss.cooperation.affiliation.service;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.properties.VerticalAlignment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import tn.cnss.cooperation.affiliation.entity.DossierCoop;
import tn.cnss.cooperation.affiliation.repository.DossierCoopRepository;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReportService {

    private final DossierCoopRepository dossierRepository;
    
    private static final DeviceRgb CNSS_GREEN = new DeviceRgb(0, 128, 0);
    private static final DeviceRgb CNSS_RED = new DeviceRgb(180, 0, 0);
    private static final DeviceRgb HEADER_BG = new DeviceRgb(245, 245, 220);
    
    private PdfFont arabicFont;

    /**
     * Générer le rapport des affiliations au format PDF avec HTML (supporte l'arabe)
     */
    public byte[] generateAffiliationsReport(String bureau, String periode) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            // Récupérer les données
            List<DossierCoop> dossiers = dossierRepository.findAll();
            String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            
            // Charger le logo en base64
            String logoBase64 = "";
            try {
                ClassPathResource logoResource = new ClassPathResource("images/cnss-logo.png");
                byte[] logoBytes = logoResource.getInputStream().readAllBytes();
                logoBase64 = java.util.Base64.getEncoder().encodeToString(logoBytes);
            } catch (Exception e) {
                log.warn("Logo non trouvé");
            }
            
            // Générer le HTML
            String html = generateHtmlReport(dossiers, bureau, dateStr, logoBase64);
            
            // Convertir HTML en PDF
            com.itextpdf.html2pdf.HtmlConverter.convertToPdf(html, baos);
            
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur génération rapport: {}", e.getMessage(), e);
            throw new RuntimeException("Erreur génération du rapport PDF", e);
        }
    }
    
    /**
     * Générer le HTML du rapport avec le même en-tête que attestation_affiliation
     */
    private String generateHtmlReport(List<DossierCoop> dossiers, String bureau, String dateStr, String logoBase64) {
        StringBuilder html = new StringBuilder();
        
        // Même style que attestation_affiliation
        html.append("""
            <!DOCTYPE html>
            <html lang="ar" dir="rtl">
            <head>
                <meta charset="UTF-8">
                <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap" rel="stylesheet">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap');
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { 
                        font-family: 'Amiri', 'Traditional Arabic', 'Arial', serif; 
                        font-size: 12px; 
                        line-height: 1.6;
                        padding: 30px;
                        background: white;
                    }
                    .header { display: flex; justify-content: space-between; margin-bottom: 20px; }
                    .header-fr { text-align: left; font-size: 11px; direction: ltr; }
                    .header-ar { text-align: right; font-size: 12px; }
                    .logo-box { 
                        border: 2px solid #8B0000; 
                        padding: 15px 20px; 
                        margin: 20px 0; 
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 20px;
                    }
                    .logo-fr { color: #8B0000; font-size: 18px; font-weight: bold; font-style: italic; direction: ltr; }
                    .logo-ar { color: #8B0000; font-size: 15px; font-weight: bold; margin-top: 5px; }
                    .logo-img { width: 65px; height: auto; }
                    .info-row { display: flex; justify-content: space-between; margin: 12px 0; font-size: 11px; }
                    .info-left { text-align: left; direction: ltr; }
                    .info-right { text-align: right; }
                    table { width: 100%; border-collapse: collapse; margin-top: 25px; font-size: 10px; direction: ltr; }
                    th { background: #F5F5DC; border: 1px solid #000; padding: 6px; text-align: center; font-weight: bold; }
                    td { border: 1px solid #000; padding: 5px; text-align: center; }
                    .footer { 
                        text-align: center; 
                        font-size: 9px; 
                        color: #666; 
                        margin-top: 40px; 
                        border-top: 1px solid #ccc; 
                        padding-top: 10px;
                        direction: ltr;
                    }
                </style>
            </head>
            <body>
                <!-- En-tête bilingue (même que attestation_affiliation) -->
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
                
                <!-- Logo CNSS (même que attestation_affiliation) -->
                <div class="logo-box">
            """);
        
        if (!logoBase64.isEmpty()) {
            html.append("<img class='logo-img' src='data:image/png;base64,").append(logoBase64).append("' alt='CNSS'/>");
        }
        
        html.append("""
                    <div>
                        <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
                        <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
                    </div>
                </div>
                
                <!-- Informations -->
                <div class="info-row">
                    <div class="info-left">
            """);
        html.append("Tunis, le ").append(dateStr).append("<br><br>");
        html.append("<strong>Bureau: ").append(bureau != null ? bureau : "TUNIS").append("</strong>");
        html.append("""
                    </div>
                    <div class="info-right">
                        المكتب الجهوي بتونس المدينة<br>
                        شارع مدريد - تونس 12
                    </div>
                </div>
                
                <div style="text-align: right; margin: 20px 0; direction: ltr;">
            """);
        html.append("<strong>Date: ").append(dateStr).append("</strong><br>");
        html.append("<strong>Nombre de lignes: ").append(dossiers.size()).append("</strong>");
        html.append("""
                </div>
                
                <!-- Tableau des données -->
                <table>
                    <thead>
                        <tr>
                            <th>Salaire</th>
                            <th>Tr/Année</th>
                            <th>Nom & Prénom / Raison Sociale</th>
                            <th>Employeur</th>
                            <th>N° Assuré</th>
                        </tr>
                    </thead>
                    <tbody>
            """);
        
        for (DossierCoop d : dossiers) {
            html.append("<tr>");
            html.append("<td>").append(d.getDcoSalaire() != null ? String.format("%,.3f", d.getDcoSalaire()) : "0.000").append("</td>");
            html.append("<td>").append(formatTrimestre(d.getDcoDateDebut())).append("</td>");
            html.append("<td>").append(d.getNomComplet() != null ? d.getNomComplet() : "-").append("</td>");
            html.append("<td>").append(d.getEmployeurMatriculeComplet()).append("</td>");
            html.append("<td>").append(d.getAssureMatriculeComplet()).append("</td>");
            html.append("</tr>");
        }
        
        html.append("""
                    </tbody>
                </table>
                
                <div class="footer">
                    Document généré automatiquement par le Système de Coopération Technique CNSS<br>
                    © 2025 - Caisse Nationale de Sécurité Sociale - Tunisie
                </div>
            </body>
            </html>
            """);
        
        return html.toString();
    }

    private void addHeader(Document document, String bureau) throws Exception {
        // === LIGNE 1: Texte arabe (gauche) et français (droite) ===
        Table topRow = new Table(UnitValue.createPercentArray(new float[]{50, 50}))
                .useAllAvailableWidth();

        // Colonne gauche - Texte arabe
        Cell leftCell = new Cell()
                .setBorder(Border.NO_BORDER);
        
        Paragraph arabicLine1 = new Paragraph("الجمهورية التونسية")
                .setFontSize(11)
                .setTextAlignment(TextAlignment.LEFT)
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        Paragraph arabicLine2 = new Paragraph("وزارة الشؤون الاجتماعية والتضامن")
                .setFontSize(9)
                .setTextAlignment(TextAlignment.LEFT)
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        Paragraph arabicLine3 = new Paragraph("والتونسيين بالخارج")
                .setFontSize(9)
                .setTextAlignment(TextAlignment.LEFT)
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        
        if (arabicFont != null) {
            arabicLine1.setFont(arabicFont);
            arabicLine2.setFont(arabicFont);
            arabicLine3.setFont(arabicFont);
        }
        
        leftCell.add(arabicLine1).add(arabicLine2).add(arabicLine3);
        topRow.addCell(leftCell);

        // Colonne droite - Texte français
        Cell rightCell = new Cell()
                .setBorder(Border.NO_BORDER)
                .add(new Paragraph("République Tunisienne")
                        .setFontSize(11)
                        .setTextAlignment(TextAlignment.RIGHT))
                .add(new Paragraph("Ministère des Affaires Sociales")
                        .setFontSize(9)
                        .setTextAlignment(TextAlignment.RIGHT))
                .add(new Paragraph("et des Tunisiens à l'Étranger")
                        .setFontSize(9)
                        .setTextAlignment(TextAlignment.RIGHT));
        topRow.addCell(rightCell);

        document.add(topRow);
        document.add(new Paragraph("\n"));

        // === LIGNE 2: Encadré rouge avec titre CNSS et logo ===
        Table cnssBox = new Table(UnitValue.createPercentArray(new float[]{75, 25}))
                .useAllAvailableWidth()
                .setBorder(new SolidBorder(CNSS_RED, 2));

        // Colonne gauche - Titre CNSS
        Cell titleCell = new Cell()
                .setBorder(Border.NO_BORDER)
                .setPadding(10);
        
        titleCell.add(new Paragraph("Caisse Nationale de Sécurité Sociale")
                .setFontColor(CNSS_RED)
                .setFontSize(16)
                .setBold()
                .setItalic());
        
        Paragraph arabicTitle = new Paragraph("الصندوق الوطني للضمان الاجتماعي")
                .setFontColor(CNSS_RED)
                .setFontSize(14)
                .setBold()
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        if (arabicFont != null) {
            arabicTitle.setFont(arabicFont);
        }
        titleCell.add(arabicTitle);
        
        cnssBox.addCell(titleCell);

        // Colonne droite - Logo CNSS
        Cell logoCell = new Cell()
                .setBorder(Border.NO_BORDER)
                .setPadding(5)
                .setVerticalAlignment(VerticalAlignment.MIDDLE);
        
        try {
            ClassPathResource logoResource = new ClassPathResource("images/cnss-logo.png");
            InputStream logoStream = logoResource.getInputStream();
            byte[] logoBytes = logoStream.readAllBytes();
            ImageData imageData = ImageDataFactory.create(logoBytes);
            Image logo = new Image(imageData);
            logo.setWidth(70);
            logo.setHorizontalAlignment(com.itextpdf.layout.properties.HorizontalAlignment.CENTER);
            logoCell.add(logo);
        } catch (Exception e) {
            log.warn("Logo non trouvé");
            logoCell.add(new Paragraph("CNSS")
                    .setFontColor(CNSS_GREEN)
                    .setFontSize(18)
                    .setBold()
                    .setTextAlignment(TextAlignment.CENTER));
        }
        cnssBox.addCell(logoCell);

        document.add(cnssBox);
        document.add(new Paragraph("\n"));
        
        // === LIGNE 3: Bureau et date ===
        Table infoLine = new Table(UnitValue.createPercentArray(new float[]{50, 50}))
                .useAllAvailableWidth();
        
        Paragraph bureauArabic = new Paragraph("المكتب الجهوي بتونس المدينة")
                .setFontSize(9)
                .setTextAlignment(TextAlignment.LEFT)
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        if (arabicFont != null) bureauArabic.setFont(arabicFont);
        infoLine.addCell(new Cell().setBorder(Border.NO_BORDER).add(bureauArabic));
        
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        Paragraph dateArabic = new Paragraph("تونس في  " + dateStr)
                .setFontSize(9)
                .setTextAlignment(TextAlignment.RIGHT)
                .setBaseDirection(BaseDirection.RIGHT_TO_LEFT);
        if (arabicFont != null) dateArabic.setFont(arabicFont);
        infoLine.addCell(new Cell().setBorder(Border.NO_BORDER).add(dateArabic));
        
        document.add(infoLine);
        
        // Bureau en français
        document.add(new Paragraph("Bureau: " + (bureau != null ? bureau : "TUNIS"))
                .setFontSize(10)
                .setBold()
                .setTextAlignment(TextAlignment.RIGHT));
        
        document.add(new Paragraph("\n"));
    }

    private void addReportInfo(Document document, String periode) {
        document.add(new Paragraph("\n"));
        
        Table infoTable = new Table(UnitValue.createPercentArray(new float[]{50, 50}))
                .useAllAvailableWidth();
        
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        
        infoTable.addCell(new Cell().setBorder(Border.NO_BORDER)
                .add(new Paragraph("تونس في").setTextAlignment(TextAlignment.LEFT)));
        infoTable.addCell(new Cell().setBorder(Border.NO_BORDER)
                .add(new Paragraph(dateStr).setTextAlignment(TextAlignment.RIGHT)));
        
        document.add(infoTable);
        document.add(new Paragraph("\n"));
    }

    private void addDataTable(Document document, List<DossierCoop> dossiers) {
        // Titre "Nombre de lignes"
        document.add(new Paragraph("Nombre de lignes: " + dossiers.size())
                .setTextAlignment(TextAlignment.RIGHT)
                .setFontSize(10)
                .setBold());
        document.add(new Paragraph("\n"));

        // Tableau principal
        Table table = new Table(UnitValue.createPercentArray(new float[]{15, 10, 30, 20, 15}))
                .useAllAvailableWidth();

        // En-têtes
        addTableHeader(table, "Salaire");
        addTableHeader(table, "Tr/Année");
        addTableHeader(table, "Nom&prénom / raison sociale");
        addTableHeader(table, "Employeur");
        addTableHeader(table, "N.Assur.");

        // Données
        for (DossierCoop dossier : dossiers) {
            addTableCell(table, formatSalaire(dossier.getDcoSalaire() != null ? dossier.getDcoSalaire().doubleValue() : null));
            addTableCell(table, formatTrimestre(dossier.getDcoDateDebut()));
            addTableCell(table, dossier.getNomComplet() != null ? dossier.getNomComplet() : "");
            addTableCell(table, dossier.getEmployeurMatriculeComplet());
            addTableCell(table, dossier.getAssureMatriculeComplet());
        }

        document.add(table);
    }

    private void addTableHeader(Table table, String text) {
        Cell cell = new Cell()
                .setBackgroundColor(HEADER_BG)
                .setBorder(new SolidBorder(ColorConstants.BLACK, 0.5f))
                .add(new Paragraph(text)
                        .setBold()
                        .setFontSize(9)
                        .setTextAlignment(TextAlignment.CENTER));
        table.addHeaderCell(cell);
    }

    private void addTableCell(Table table, String text) {
        Cell cell = new Cell()
                .setBorder(new SolidBorder(ColorConstants.BLACK, 0.5f))
                .add(new Paragraph(text != null ? text : "")
                        .setFontSize(8)
                        .setTextAlignment(TextAlignment.CENTER));
        table.addCell(cell);
    }

    private void addFooter(Document document) {
        document.add(new Paragraph("\n\n"));
        document.add(new Paragraph("Document généré automatiquement par le Système de Coopération Technique CNSS")
                .setFontSize(8)
                .setFontColor(ColorConstants.GRAY)
                .setTextAlignment(TextAlignment.CENTER));
        document.add(new Paragraph("© " + LocalDate.now().getYear() + " - Caisse Nationale de Sécurité Sociale - Tunisie")
                .setFontSize(8)
                .setFontColor(ColorConstants.GRAY)
                .setTextAlignment(TextAlignment.CENTER));
    }

    // Méthodes utilitaires de formatage
    private String formatSalaire(Double salaire) {
        if (salaire == null) return "0.000";
        return String.format("%,.3f", salaire);
    }

    private String formatTrimestre(LocalDate date) {
        if (date == null) return "";
        int trimestre = (date.getMonthValue() - 1) / 3 + 1;
        return String.format("0%d/%d", trimestre, date.getYear());
    }

    private String formatEmployeur(String numEmployeur) {
        if (numEmployeur == null) return "";
        return numEmployeur.length() > 2 
            ? numEmployeur.substring(0, 2) + "- " + numEmployeur.substring(2)
            : numEmployeur;
    }

    private String formatNumAssure(String numAssure) {
        if (numAssure == null) return "";
        return numAssure.length() > 2 
            ? numAssure.substring(0, 2) + "- " + numAssure.substring(2)
            : numAssure;
    }
}
