package tn.cnss.cooperation.notification.service;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import tn.cnss.cooperation.notification.dto.AtctRappelRequest;

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

    /**
     * Génère le PDF du formulaire ATCT officiel - Format exact CNSS (FR uniquement pour compatibilité email)
     */
    public byte[] generateAtctFormulairePdf(AtctRappelRequest r) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            Document document = new Document(PageSize.A4, 35, 35, 25, 25);
            PdfWriter.getInstance(document, baos);
            document.open();
            
            // Polices
            Font titleFont = new Font(Font.HELVETICA, 14, Font.BOLD, new Color(139, 0, 0));
            Font headerFont = new Font(Font.HELVETICA, 10, Font.BOLD);
            Font sectionFont = new Font(Font.HELVETICA, 11, Font.BOLD);
            Font labelFont = new Font(Font.HELVETICA, 9, Font.NORMAL);
            Font valueFont = new Font(Font.HELVETICA, 9, Font.BOLD, new Color(0, 0, 128));
            Font smallFont = new Font(Font.HELVETICA, 8, Font.NORMAL);
            Font tinyFont = new Font(Font.HELVETICA, 7, Font.NORMAL, Color.GRAY);
            
            String dateNow = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            String nomComplet = r.getNomComplet() != null ? r.getNomComplet() : "...........................";
            String nomCompletAr = r.getNomCompletAr() != null ? r.getNomCompletAr() : "";
            String numSS = r.getNumSecuSociale() != null ? r.getNumSecuSociale() : "...........................";
            String email = r.getEmail() != null ? r.getEmail() : "...........................";
            String adresseTn = (r.getAdresseTunisie() != null ? r.getAdresseTunisie() : "") + " " +
                (r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "") + " " +
                (r.getVilleTunisie() != null ? r.getVilleTunisie() : "");
            if (adresseTn.trim().isEmpty()) adresseTn = "...........................";
            String adresseEtr = (r.getAdresseEtranger() != null ? r.getAdresseEtranger() : "") + " " +
                (r.getVilleEtranger() != null ? r.getVilleEtranger() : "") + " - " +
                (r.getPaysEtranger() != null ? r.getPaysEtranger() : "");
            if (adresseEtr.trim().equals("-")) adresseEtr = "...........................";
            String etablissement = r.getEtablissementOrigine() != null ? r.getEtablissementOrigine() : "...........................";
            String organisme = r.getOrganismeEtranger() != null ? r.getOrganismeEtranger() : "...........................";
            String dateDebut = r.getDateDebutDetachement() != null ? r.getDateDebutDetachement() : ".../.../......";
            String dateFin = r.getDateFinDetachement() != null ? r.getDateFinDetachement() : ".../.../......";
            String mode = r.getModePaiement() != null ? r.getModePaiement() : "";
            
            // === EN-TÊTE ===
            PdfPTable header = new PdfPTable(2);
            header.setWidthPercentage(100);
            header.setWidths(new float[]{50, 50});
            
            PdfPCell cellFr = new PdfPCell();
            cellFr.setBorder(0);
            cellFr.addElement(new Paragraph("Republique Tunisienne", smallFont));
            cellFr.addElement(new Paragraph("Ministere des Affaires Sociales", smallFont));
            cellFr.addElement(new Paragraph("et des Tunisiens a l'Etranger", smallFont));
            cellFr.addElement(new Paragraph(" ", smallFont));
            cellFr.addElement(new Paragraph("Caisse Nationale", headerFont));
            cellFr.addElement(new Paragraph("de Securite Sociale", headerFont));
            header.addCell(cellFr);
            
            PdfPCell cellAr = new PdfPCell();
            cellAr.setBorder(0);
            cellAr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cellAr.addElement(new Paragraph("", smallFont)); // Espace pour l'arabe (non rendu)
            header.addCell(cellAr);
            document.add(header);
            document.add(new Paragraph(" "));
            
            // === LOGO CNSS ===
            PdfPTable logoTable = new PdfPTable(1);
            logoTable.setWidthPercentage(80);
            PdfPCell logoCell = new PdfPCell();
            logoCell.setBorderColor(new Color(139, 0, 0));
            logoCell.setBorderWidth(2);
            logoCell.setPadding(10);
            logoCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            Paragraph logoText = new Paragraph("Caisse Nationale de Securite Sociale", titleFont);
            logoText.setAlignment(Element.ALIGN_CENTER);
            logoCell.addElement(logoText);
            Paragraph logoSub = new Paragraph("CNSS - Cooperation Technique", smallFont);
            logoSub.setAlignment(Element.ALIGN_CENTER);
            logoCell.addElement(logoSub);
            logoTable.addCell(logoCell);
            document.add(logoTable);
            document.add(new Paragraph(" "));
            
            // === TITRE ===
            PdfPTable titleTable = new PdfPTable(1);
            titleTable.setWidthPercentage(90);
            PdfPCell titleCell = new PdfPCell();
            titleCell.setBorderWidth(2);
            titleCell.setPadding(10);
            titleCell.setBackgroundColor(new Color(245, 245, 245));
            Paragraph title1 = new Paragraph("FORMULAIRE DE COOPERATION TECHNIQUE (ATCT)", sectionFont);
            title1.setAlignment(Element.ALIGN_CENTER);
            titleCell.addElement(title1);
            Paragraph title2 = new Paragraph("Regularisation des periodes de detachement - Decret n 1879 de 2007", tinyFont);
            title2.setAlignment(Element.ALIGN_CENTER);
            titleCell.addElement(title2);
            titleTable.addCell(titleCell);
            document.add(titleTable);
            
            document.add(new Paragraph("Ref: PM54     Date: " + dateNow, tinyFont));
            document.add(new Paragraph(" "));
            
            // === INFORMATIONS PERSONNELLES ===
            addSectionTitle(document, "INFORMATIONS PERSONNELLES", sectionFont);
            addFieldRow(document, "Nom et Prenom (FR)", nomComplet, labelFont, valueFont);
            if (!nomCompletAr.isEmpty()) {
                addFieldRow(document, "Nom et Prenom (AR)", nomCompletAr, labelFont, valueFont);
            }
            addFieldRow(document, "N Securite Sociale", numSS, labelFont, valueFont);
            addFieldRow(document, "Email", email, labelFont, valueFont);
            document.add(new Paragraph(" "));
            
            // === ADRESSES ===
            addSectionTitle(document, "ADRESSES", sectionFont);
            addFieldRow(document, "Adresse en Tunisie", adresseTn.trim(), labelFont, valueFont);
            addFieldRow(document, "Adresse a l'Etranger", adresseEtr.trim(), labelFont, valueFont);
            document.add(new Paragraph(" "));
            
            // === DETACHEMENT ===
            addSectionTitle(document, "DETACHEMENT", sectionFont);
            addFieldRow(document, "Etablissement d'origine", etablissement, labelFont, valueFont);
            addFieldRow(document, "Organisme d'accueil", organisme, labelFont, valueFont);
            addFieldRow(document, "Debut detachement", dateDebut, labelFont, valueFont);
            addFieldRow(document, "Fin detachement", dateFin, labelFont, valueFont);
            document.add(new Paragraph(" "));
            
            // === ENGAGEMENT ===
            PdfPTable engageTable = new PdfPTable(1);
            engageTable.setWidthPercentage(100);
            PdfPCell engageCell = new PdfPCell();
            engageCell.setBackgroundColor(new Color(255, 253, 231));
            engageCell.setBorderColor(new Color(255, 193, 7));
            engageCell.setPadding(8);
            engageCell.addElement(new Paragraph("ENGAGEMENT:", headerFont));
            engageCell.addElement(new Paragraph("Je m'engage a regulariser ma situation vis-a-vis du regime de retraite et d'invalidite pendant la periode de detachement.", smallFont));
            engageTable.addCell(engageCell);
            document.add(engageTable);
            document.add(new Paragraph(" "));
            
            // === MODE DE PAIEMENT ===
            addSectionTitle(document, "MODE DE PAIEMENT", sectionFont);
            String checkAnticipe = "ANTICIPE".equals(mode) ? "[X]" : "[ ]";
            String checkTrimestriel = "TRIMESTRIEL".equals(mode) ? "[X]" : "[ ]";
            String checkAnnuel = "ANNUEL".equals(mode) ? "[X]" : "[ ]";
            String checkMensuel = "MENSUEL".equals(mode) ? "[X]" : "[ ]";
            document.add(new Paragraph(checkAnticipe + " Par anticipation     " + checkTrimestriel + " Trimestriel", labelFont));
            document.add(new Paragraph(checkAnnuel + " Annuel     " + checkMensuel + " Mensuel", labelFont));
            document.add(new Paragraph(" "));
            
            // === ASSURANCE ===
            addSectionTitle(document, "ASSURANCE MALADIE", sectionFont);
            String checkOui = Boolean.TRUE.equals(r.getAssuranceMaladie()) ? "[X]" : "[ ]";
            String checkNon = !Boolean.TRUE.equals(r.getAssuranceMaladie()) ? "[X]" : "[ ]";
            document.add(new Paragraph(checkOui + " Je souhaite beneficier du regime de prevoyance sociale", labelFont));
            document.add(new Paragraph(checkNon + " Je ne souhaite pas beneficier de ce regime", labelFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            
            // === SIGNATURE ===
            document.add(new Paragraph("Fait a .......................... le " + dateNow, labelFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Signature: _______________________", labelFont));
            document.add(new Paragraph(" "));
            
            // === FOOTER ===
            Paragraph footer = new Paragraph("CNSS - Siege social: 49, Avenue Taieb MHIRI - 1002 Tunis Belvedere - Tel: (216) 71 796 744", tinyFont);
            footer.setAlignment(Element.ALIGN_CENTER);
            document.add(footer);
            
            document.close();
            log.info("PDF ATCT genere avec succes");
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur generation PDF ATCT: {}", e.getMessage(), e);
            return new byte[0];
        }
    }
    
    private void addSectionTitle(Document doc, String title, Font font) throws Exception {
        PdfPTable table = new PdfPTable(1);
        table.setWidthPercentage(100);
        PdfPCell cell = new PdfPCell(new Paragraph(title, font));
        cell.setBackgroundColor(new Color(232, 232, 232));
        cell.setPadding(5);
        cell.setBorder(0);
        table.addCell(cell);
        doc.add(table);
    }
    
    private void addFieldRow(Document doc, String label, String value, Font labelFont, Font valueFont) throws Exception {
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{40, 60});
        PdfPCell labelCell = new PdfPCell(new Paragraph(label, labelFont));
        labelCell.setBorder(0);
        labelCell.setBorderWidthBottom(0.5f);
        labelCell.setBorderColorBottom(Color.LIGHT_GRAY);
        labelCell.setPadding(4);
        table.addCell(labelCell);
        PdfPCell valueCell = new PdfPCell(new Paragraph(value, valueFont));
        valueCell.setBorder(0);
        valueCell.setBorderWidthBottom(0.5f);
        valueCell.setBorderColorBottom(Color.LIGHT_GRAY);
        valueCell.setPadding(4);
        table.addCell(valueCell);
        doc.add(table);
    }
    
    private String generateAtctArabicHtml(AtctRappelRequest r) {
        String dateNow = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String mode = r.getModePaiement() != null ? r.getModePaiement() : "";
        String checkAnticipe = "ANTICIPE".equals(mode) ? "X" : "";
        String checkTrimestriel = "TRIMESTRIEL".equals(mode) ? "X" : "";
        String checkAnnuel = "ANNUEL".equals(mode) ? "X" : "";
        String checkMensuel = "MENSUEL".equals(mode) ? "X" : "";
        String checkAssurance = Boolean.TRUE.equals(r.getAssuranceMaladie()) ? "X" : "";
        String checkNoAssurance = !Boolean.TRUE.equals(r.getAssuranceMaladie()) ? "X" : "";
        
        String nomComplet = r.getNomComplet() != null ? r.getNomComplet() : "..............................";
        String nomCompletAr = r.getNomCompletAr() != null ? r.getNomCompletAr() : "";
        String numSS = r.getNumSecuSociale() != null ? r.getNumSecuSociale() : "..............................";
        String adresseTn = String.format("%s %s %s",
            r.getAdresseTunisie() != null ? r.getAdresseTunisie() : "",
            r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "",
            r.getVilleTunisie() != null ? r.getVilleTunisie() : "").trim();
        if (adresseTn.isBlank()) adresseTn = "..............................";
        String codePostal = r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "..........";
        String adresseEtr = String.format("%s %s - %s",
            r.getAdresseEtranger() != null ? r.getAdresseEtranger() : "",
            r.getVilleEtranger() != null ? r.getVilleEtranger() : "",
            r.getPaysEtranger() != null ? r.getPaysEtranger() : "").trim();
        if (adresseEtr.equals(" - ") || adresseEtr.isBlank()) adresseEtr = "..............................";
        String email = r.getEmail() != null ? r.getEmail() : "..............................";
        String etablissement = r.getEtablissementOrigine() != null ? r.getEtablissementOrigine() : "..............................";
        String organisme = r.getOrganismeEtranger() != null ? r.getOrganismeEtranger() : "..............................";
        String dateDebut = r.getDateDebutDetachement() != null ? r.getDateDebutDetachement() : "....../....../......";
        String dateFin = r.getDateFinDetachement() != null ? r.getDateFinDetachement() : "....../....../......";
        
        return String.format("""
            <!DOCTYPE html>
            <html lang="fr">
            <head>
                <meta charset="UTF-8">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap');
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: 'Amiri', Arial, sans-serif; font-size: 11px; line-height: 1.6; padding: 20px; background: white; }
                    table { width: 100%%; border-collapse: collapse; }
                    .header { display: flex; justify-content: space-between; margin-bottom: 10px; }
                    .header-fr { text-align: left; font-size: 9px; }
                    .header-ar { text-align: right; font-size: 10px; direction: rtl; }
                    .logo-box { border: 2px solid #8B0000; padding: 10px; margin: 10px 0; text-align: center; }
                    .logo-fr { color: #8B0000; font-size: 16px; font-weight: bold; }
                    .logo-ar { color: #8B0000; font-size: 12px; direction: rtl; }
                    .title-box { border: 2px solid #000; padding: 10px; margin: 10px 0; text-align: center; }
                    .title-ar { font-size: 13px; font-weight: bold; direction: rtl; }
                    .title-fr { font-size: 11px; font-weight: bold; margin-top: 5px; }
                    .ref { font-size: 9px; margin: 8px 0; }
                    .section-title { font-weight: bold; font-size: 11px; background: #e8e8e8; padding: 5px 10px; margin: 12px 0 8px 0; display: flex; justify-content: space-between; }
                    .section-title-fr { text-align: left; }
                    .section-title-ar { text-align: right; direction: rtl; }
                    .field-row { display: flex; border-bottom: 1px solid #ddd; padding: 5px 0; font-size: 10px; }
                    .field-fr { width: 30%%; text-align: left; }
                    .field-value { width: 40%%; text-align: center; color: #000080; font-weight: bold; }
                    .field-ar { width: 30%%; text-align: right; direction: rtl; }
                    .commitment { font-size: 9px; margin: 12px 0; padding: 10px; background: #fffde7; border: 1px solid #ffc107; }
                    .commitment-ar { direction: rtl; text-align: right; margin-bottom: 5px; }
                    .commitment-fr { text-align: left; font-style: italic; }
                    .checkbox-row { display: flex; justify-content: space-around; margin: 5px 0; font-size: 10px; }
                    .cb { display: inline-block; width: 12px; height: 12px; border: 1px solid #000; text-align: center; line-height: 10px; margin: 0 5px; }
                    .signature { margin-top: 20px; }
                    .footer { font-size: 8px; text-align: center; margin-top: 15px; border-top: 2px solid #8B0000; padding-top: 8px; }
                </style>
            </head>
            <body>
                <!-- En-tête bilingue -->
                <table style="width:100%%">
                    <tr>
                        <td style="width:50%%; text-align:left; font-size:9px; vertical-align:top;">
                            Republique Tunisienne<br>
                            Ministere des Affaires Sociales,<br>
                            de la Solidarite<br>
                            et des Tunisiens a l'Etranger<br><br>
                            <strong>Caisse Nationale<br>de Securite Sociale</strong>
                        </td>
                        <td style="width:50%%; text-align:right; font-size:10px; vertical-align:top; direction:rtl;">
                            الجمهورية التونسية<br>
                            وزارة الشؤون الاجتماعية والتضامن<br>
                            والتونسيين بالخارج<br><br>
                            <strong>الصندوق الوطني للضمان الاجتماعي</strong>
                        </td>
                    </tr>
                </table>
                
                <!-- Logo CNSS -->
                <div class="logo-box">
                    <div class="logo-fr">Caisse Nationale de Securite Sociale</div>
                    <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
                </div>
                
                <!-- Titre -->
                <div class="title-box">
                    <div class="title-ar">تسوية فترات الإلحاق في إطار التعاون الفني</div>
                    <div class="title-fr">FORMULAIRE DE COOPERATION TECHNIQUE (ATCT)</div>
                    <div style="font-size:8px; margin-top:5px;">Decret n 1879 de 2007 du 23 juillet 2007</div>
                </div>
                
                <p class="ref"><strong>Ref:</strong> PM54 &nbsp;&nbsp;&nbsp; <strong>Date:</strong> %s</p>
                
                <!-- INFORMATIONS PERSONNELLES -->
                <div class="section-title">
                    <span class="section-title-fr">INFORMATIONS PERSONNELLES</span>
                    <span class="section-title-ar">المعلومات الشخصية</span>
                </div>
                <div class="field-row">
                    <div class="field-fr">Nom et Prenom</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">الإسم و اللقب</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">(AR)</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar"></div>
                </div>
                <div class="field-row">
                    <div class="field-fr">N Securite Sociale</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">المضمون الاجتماعي رقم</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">Email</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">العنوان الإلكتروني</div>
                </div>
                
                <!-- ADRESSES -->
                <div class="section-title">
                    <span class="section-title-fr">ADRESSES</span>
                    <span class="section-title-ar">العناوين</span>
                </div>
                <div class="field-row">
                    <div class="field-fr">Adresse en Tunisie</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">العنوان بتونس</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">Adresse a l'Etranger</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">العنوان بالخارج</div>
                </div>
                
                <!-- DETACHEMENT -->
                <div class="section-title">
                    <span class="section-title-fr">DETACHEMENT</span>
                    <span class="section-title-ar">الإلحاق</span>
                </div>
                <div class="field-row">
                    <div class="field-fr">Etablissement d'origine</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">المؤسسة الأصلية بتونس</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">Organisme d'accueil</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">الهيئة المستقبلة بالخارج</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">Debut detachement</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">بداية الإلحاق</div>
                </div>
                <div class="field-row">
                    <div class="field-fr">Fin detachement</div>
                    <div class="field-value">%s</div>
                    <div class="field-ar">نهاية الإلحاق</div>
                </div>
                
                <!-- Engagement -->
                <div class="commitment">
                    <div class="commitment-ar">ألتزم بتسوية وضعيتي إزاء نظام التقاعد والعجز خلال فترة الإلحاق للعمل في إطار التعاون الفني</div>
                    <div class="commitment-fr">Je m'engage a regulariser ma situation vis-a-vis du regime de retraite et d'invalidite pendant la periode de detachement.</div>
                </div>
                
                <!-- Mode de paiement -->
                <div class="section-title">
                    <span class="section-title-fr">MODE DE PAIEMENT</span>
                    <span class="section-title-ar">طريقة الدفع</span>
                </div>
                <div class="checkbox-row">
                    <span><span class="cb">%s</span> Par anticipation / مسبقا</span>
                    <span><span class="cb">%s</span> Trimestriel / كل ثلاثة أشهر</span>
                </div>
                <div class="checkbox-row">
                    <span><span class="cb">%s</span> Annuel / سنويا</span>
                    <span><span class="cb">%s</span> Mensuel / شهريا</span>
                </div>
                
                <!-- Options assurance -->
                <div class="section-title">
                    <span class="section-title-fr">ASSURANCE MALADIE</span>
                    <span class="section-title-ar">التأمين على المرض</span>
                </div>
                <div class="checkbox-row">
                    <span><span class="cb">%s</span> Je souhaite beneficier / أرغب في الإنتفاع</span>
                    <span><span class="cb">%s</span> Je ne souhaite pas / لا أرغب</span>
                </div>
                
                <!-- Signature -->
                <div class="signature">
                    <table style="width:100%%">
                        <tr>
                            <td style="width:50%%">Fait a .................. le %s</td>
                            <td style="width:50%%; text-align:right; direction:rtl;">حررت في .................. في %s</td>
                        </tr>
                        <tr>
                            <td style="padding-top:30px;"><strong>Signature:</strong> _________________</td>
                            <td style="padding-top:30px; text-align:right; direction:rtl;"><strong>الإمضاء:</strong> _________________</td>
                        </tr>
                    </table>
                </div>
                
                <!-- Footer -->
                <div class="footer">
                    Siege social: 49, Avenue Taieb MHIRI - 1002 Tunis Belvedere - Tel: (216) 71 796 744<br>
                    المقر الإجتماعي: 49 شارع الطيب المهيري - 1002 تونس البلفيدير
                </div>
            </body>
            </html>
            """,
            dateNow,
            nomComplet, nomCompletAr, numSS, email,
            adresseTn, adresseEtr,
            etablissement, organisme, dateDebut, dateFin,
            checkAnticipe, checkTrimestriel, checkAnnuel, checkMensuel,
            checkAssurance, checkNoAssurance,
            dateNow, dateNow
        );
    }
    
    private byte[] generateAtctPdfITextFallback(AtctRappelRequest r) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            Document document = new Document(PageSize.A4, 30, 30, 25, 25);
            PdfWriter.getInstance(document, baos);
            document.open();
            
            // Polices
            Font titleFont = new Font(Font.HELVETICA, 12, Font.BOLD, new Color(0, 0, 100));
            Font headerFont = new Font(Font.HELVETICA, 10, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 9, Font.NORMAL);
            Font smallFont = new Font(Font.HELVETICA, 8, Font.NORMAL);
            Font tinyFont = new Font(Font.HELVETICA, 7, Font.NORMAL, Color.GRAY);
            Font boldFont = new Font(Font.HELVETICA, 9, Font.BOLD);
            
            String dateNow = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            
            // === EN-TÊTE ===
            PdfPTable headerTable = new PdfPTable(3);
            headerTable.setWidthPercentage(100);
            headerTable.setWidths(new float[]{35, 30, 35});
            
            // Gauche - Français
            PdfPCell leftCell = new PdfPCell();
            leftCell.setBorder(0);
            leftCell.addElement(new Paragraph("République Tunisienne", smallFont));
            leftCell.addElement(new Paragraph("Ministère des Affaires Sociales,", smallFont));
            leftCell.addElement(new Paragraph("de la Solidarité et des", smallFont));
            leftCell.addElement(new Paragraph("Tunisiens à l'Étranger", smallFont));
            leftCell.addElement(new Paragraph(" ", smallFont));
            leftCell.addElement(new Paragraph("Caisse Nationale", headerFont));
            leftCell.addElement(new Paragraph("de Sécurité Sociale", headerFont));
            headerTable.addCell(leftCell);
            
            // Centre - Logo
            PdfPCell centerCell = new PdfPCell();
            centerCell.setBorder(0);
            centerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            centerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            Paragraph logo = new Paragraph("CNSS", new Font(Font.HELVETICA, 18, Font.BOLD, new Color(0, 100, 0)));
            logo.setAlignment(Element.ALIGN_CENTER);
            centerCell.addElement(logo);
            headerTable.addCell(centerCell);
            
            // Droite - Arabe (translitéré)
            PdfPCell rightCell = new PdfPCell();
            rightCell.setBorder(0);
            rightCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            Paragraph ar1 = new Paragraph("Al-Jumhuriya At-Tunisiya", smallFont);
            ar1.setAlignment(Element.ALIGN_RIGHT);
            rightCell.addElement(ar1);
            Paragraph ar2 = new Paragraph("Wizarat Ash-Shu'un Al-Ijtima'iya", smallFont);
            ar2.setAlignment(Element.ALIGN_RIGHT);
            rightCell.addElement(ar2);
            Paragraph ar3 = new Paragraph(" ", smallFont);
            rightCell.addElement(ar3);
            Paragraph ar4 = new Paragraph("As-Sunduq Al-Watani", headerFont);
            ar4.setAlignment(Element.ALIGN_RIGHT);
            rightCell.addElement(ar4);
            Paragraph ar5 = new Paragraph("Lid-Daman Al-Ijtima'i", headerFont);
            ar5.setAlignment(Element.ALIGN_RIGHT);
            rightCell.addElement(ar5);
            headerTable.addCell(rightCell);
            
            document.add(headerTable);
            document.add(new Paragraph(" "));
            
            // === TITRE ===
            PdfPTable titleTable = new PdfPTable(1);
            titleTable.setWidthPercentage(90);
            titleTable.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell titleCell = new PdfPCell();
            titleCell.setBorderColor(Color.BLACK);
            titleCell.setBorderWidth(2);
            titleCell.setPadding(10);
            titleCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            Paragraph title1 = new Paragraph("FORMULAIRE DE COOPÉRATION TECHNIQUE (ATCT)", titleFont);
            title1.setAlignment(Element.ALIGN_CENTER);
            titleCell.addElement(title1);
            
            Paragraph title2 = new Paragraph("Régularisation des périodes de détachement", normalFont);
            title2.setAlignment(Element.ALIGN_CENTER);
            titleCell.addElement(title2);
            
            Paragraph title3 = new Paragraph("Décret n° 1879 de 2007 du 23 juillet 2007", smallFont);
            title3.setAlignment(Element.ALIGN_CENTER);
            titleCell.addElement(title3);
            
            titleTable.addCell(titleCell);
            document.add(titleTable);
            document.add(new Paragraph(" "));
            
            // Référence
            document.add(new Paragraph("Réf: PM54", tinyFont));
            document.add(new Paragraph(" "));
            
            // === INFORMATIONS PERSONNELLES ===
            document.add(new Paragraph("INFORMATIONS PERSONNELLES", headerFont));
            document.add(new Paragraph(" "));
            
            addFormField(document, "Nom et Prénom", r.getNomComplet(), normalFont, boldFont);
            addFormField(document, "N° Sécurité Sociale", r.getNumSecuSociale(), normalFont, boldFont);
            addFormField(document, "Email", r.getEmail(), normalFont, boldFont);
            
            document.add(new Paragraph(" "));
            document.add(new Paragraph("ADRESSES", headerFont));
            document.add(new Paragraph(" "));
            
            String adresseTn = String.format("%s %s %s",
                r.getAdresseTunisie() != null ? r.getAdresseTunisie() : "",
                r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "",
                r.getVilleTunisie() != null ? r.getVilleTunisie() : "").trim();
            addFormField(document, "Adresse en Tunisie", adresseTn, normalFont, boldFont);
            
            String adresseEtr = String.format("%s %s - %s",
                r.getAdresseEtranger() != null ? r.getAdresseEtranger() : "",
                r.getVilleEtranger() != null ? r.getVilleEtranger() : "",
                r.getPaysEtranger() != null ? r.getPaysEtranger() : "").trim();
            addFormField(document, "Adresse à l'Étranger", adresseEtr, normalFont, boldFont);
            
            document.add(new Paragraph(" "));
            document.add(new Paragraph("DÉTACHEMENT", headerFont));
            document.add(new Paragraph(" "));
            
            addFormField(document, "Établissement d'origine (Tunisie)", r.getEtablissementOrigine(), normalFont, boldFont);
            addFormField(document, "Organisme d'accueil (Étranger)", r.getOrganismeEtranger(), normalFont, boldFont);
            addFormField(document, "Date début détachement", r.getDateDebutDetachement(), normalFont, boldFont);
            addFormField(document, "Date fin détachement", r.getDateFinDetachement() != null ? r.getDateFinDetachement() : "En cours", normalFont, boldFont);
            
            document.add(new Paragraph(" "));
            document.add(new Paragraph("MODE DE PAIEMENT DES COTISATIONS", headerFont));
            document.add(new Paragraph(" "));
            
            String mode = r.getModePaiement() != null ? r.getModePaiement() : "";
            addCheckbox(document, "Par anticipation (avant échéance)", "ANTICIPE".equals(mode), normalFont);
            addCheckbox(document, "Trimestriel (fin de chaque trimestre)", "TRIMESTRIEL".equals(mode), normalFont);
            addCheckbox(document, "Annuel (fin de chaque année)", "ANNUEL".equals(mode), normalFont);
            addCheckbox(document, "Mensuel", "MENSUEL".equals(mode), normalFont);
            
            document.add(new Paragraph(" "));
            document.add(new Paragraph("OPTIONS", headerFont));
            document.add(new Paragraph(" "));
            
            addCheckbox(document, "Je souhaite bénéficier du régime de prévoyance sociale (couverture maladie en Tunisie + capital décès)", 
                Boolean.TRUE.equals(r.getAssuranceMaladie()), normalFont);
            addCheckbox(document, "Je ne souhaite pas continuer à bénéficier du régime de prévoyance sociale", false, normalFont);
            
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            
            // Signature
            document.add(new Paragraph("Fait à ........................... le " + dateNow, normalFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Signature:", boldFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            
            // Notes
            Paragraph notes = new Paragraph("(1) Indiquer jour, mois et année  |  (2) Cocher la case correspondante", tinyFont);
            document.add(notes);
            
            document.add(new Paragraph(" "));
            
            // Footer
            Paragraph footer = new Paragraph(
                "Siège social: 49, Avenue Taïeb MHIRI - 1002 Tunis Belvédère - Tél: (216) 71 796 744 - Fax: 14063", tinyFont);
            footer.setAlignment(Element.ALIGN_CENTER);
            document.add(footer);
            
            document.close();
            log.info("PDF formulaire ATCT généré avec succès (iText)");
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erreur génération PDF ATCT iText: {}", e.getMessage(), e);
            return new byte[0];
        }
    }
    
    private void addFormField(Document doc, String label, String value, Font labelFont, Font valueFont) throws DocumentException {
        Paragraph p = new Paragraph();
        p.add(new Chunk(label + ": ", labelFont));
        p.add(new Chunk(value != null ? value : ".................................", valueFont));
        doc.add(p);
    }
    
    private void addCheckbox(Document doc, String text, boolean checked, Font font) throws DocumentException {
        String checkbox = checked ? "[X] " : "[ ] ";
        doc.add(new Paragraph(checkbox + text, font));
    }
    
    private String generateAtctHtmlTemplate(AtctRappelRequest r) {
        String dateNow = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String mode = r.getModePaiement() != null ? r.getModePaiement() : "";
        String checkAnticipe = "ANTICIPE".equals(mode) ? "X" : "";
        String checkTrimestriel = "TRIMESTRIEL".equals(mode) ? "X" : "";
        String checkAnnuel = "ANNUEL".equals(mode) ? "X" : "";
        String checkMensuel = "MENSUEL".equals(mode) ? "X" : "";
        String checkAssurance = Boolean.TRUE.equals(r.getAssuranceMaladie()) ? "X" : "";
        
        return String.format("""
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
            <head>
                <meta charset="UTF-8"/>
                <style>
                    @page { size: A4; margin: 12mm; }
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: Arial, sans-serif; font-size: 10px; line-height: 1.4; background: white; direction: rtl; }
                    
                    .header { display: flex; justify-content: space-between; align-items: flex-start; padding-bottom: 8px; border-bottom: 1px solid #000; }
                    .header-left { text-align: left; font-size: 8px; direction: ltr; width: 35%%; }
                    .header-center { text-align: center; width: 30%%; }
                    .header-center svg { width: 45px; height: 45px; }
                    .header-right { text-align: right; font-size: 9px; width: 35%%; }
                    
                    .title-box { border: 2px solid #000; padding: 6px 10px; margin: 8px auto; text-align: center; max-width: 85%%; }
                    .title-main { font-size: 13px; font-weight: bold; margin-bottom: 3px; }
                    .title-sub { font-size: 9px; }
                    
                    .ref { font-size: 8px; margin: 5px 0; }
                    .dest { font-size: 9px; margin: 8px 0; }
                    
                    .form-section { margin: 6px 0; }
                    .form-row { display: flex; margin: 4px 0; font-size: 9px; align-items: baseline; }
                    .form-label { white-space: nowrap; }
                    .form-dots { flex: 1; border-bottom: 1px dotted #000; margin: 0 3px; min-width: 50px; }
                    .form-value { font-weight: bold; }
                    
                    .commitment { font-size: 9px; margin: 10px 0; line-height: 1.6; text-align: justify; }
                    
                    .checkbox-section { margin: 8px 0; }
                    .checkbox-row { display: flex; align-items: center; margin: 5px 0; font-size: 9px; }
                    .checkbox { width: 12px; height: 12px; border: 1px solid #000; display: inline-block; text-align: center; line-height: 10px; font-size: 10px; font-weight: bold; margin-left: 5px; }
                    
                    .option-box { border: 1px solid #999; padding: 8px; margin: 8px 0; font-size: 9px; }
                    
                    .signature-section { margin-top: 15px; display: flex; justify-content: flex-start; }
                    .signature-box { text-align: right; font-size: 9px; }
                    
                    .notes { font-size: 7px; margin-top: 10px; border-top: 1px dashed #000; padding-top: 5px; }
                    
                    .footer { font-size: 7px; text-align: center; margin-top: 10px; border-top: 1px solid #000; padding-top: 5px; direction: ltr; }
                </style>
            </head>
            <body>
                <!-- En-tête -->
                <div class="header">
                    <div class="header-left">
                        <strong>République Tunisienne</strong><br/>
                        Ministère des Affaires Sociales,<br/>
                        de la Solidarité<br/>
                        et des Tunisiens à l'Étranger<br/><br/>
                        <strong>Caisse Nationale<br/>de Sécurité Sociale</strong>
                    </div>
                    <div class="header-center">
                        <svg viewBox="0 0 100 100">
                            <circle cx="50" cy="50" r="45" fill="none" stroke="#000" stroke-width="2"/>
                            <text x="50" y="40" text-anchor="middle" font-size="12" font-weight="bold">CNSS</text>
                            <text x="50" y="55" text-anchor="middle" font-size="8">صندوق</text>
                            <text x="50" y="68" text-anchor="middle" font-size="8">الضمان</text>
                        </svg>
                    </div>
                    <div class="header-right">
                        وزارة الشؤون الاجتماعية والتضامن<br/>
                        والتونسيين بالخارج<br/><br/>
                        <strong>الصندوق الوطني للضمان الاجتماعي</strong>
                    </div>
                </div>
                
                <!-- Titre -->
                <div class="title-box">
                    <div class="title-main">تسوية فترات الإلحاق في إطار التعاون الفني</div>
                    <div class="title-sub">الفصل 6 من الأمر عدد 1879 لسنة 2007 المؤرخ في 23 جويلية 2007</div>
                </div>
                
                <!-- Référence -->
                <div class="ref">PM54</div>
                
                <!-- Destinataire -->
                <div class="dest">إلى السيد(ة) مدير(ة) : الصندوق الوطني للضمان الاجتماعي</div>
                
                <!-- Informations personnelles -->
                <div class="form-section">
                    <div class="form-row">
                        <span class="form-label">- الإسم و اللقب :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                        <span style="margin-right: 20px;">المضمون الاجتماعي رقم :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- العنوان الشخصي بتونس :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s %s %s</span>
                        <span style="margin-right: 10px;">الرقم البريدي :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- العنوان الشخصي بالخارج :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s %s - %s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- العنوان الإلكتروني :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- المؤسسة المشغلة الأصلية بتونس :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- الهيئة الأصلية :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                    <div class="form-row">
                        <span class="form-label">- بداية الإلحاق (1) :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                        <span style="margin-right: 20px;">تجديد الإلحاق - نهاية الإلحاق (1) :</span>
                        <span class="form-dots"></span>
                        <span class="form-value">%s</span>
                    </div>
                </div>
                
                <!-- Engagement -->
                <div class="commitment">
                    ألتزم بتسوية وضعيتي إزاء نظام التقاعد و العجز خلال فترة الإلحاق للعمل في إطار التعاون الفني المبينة أعلاه حسب الطريقة التالية لدفع مبلغ المساهمات المستوجبة بهذا العنوان لفائدة الصندوق الوطني للضمان الاجتماعي (2) :
                </div>
                
                <!-- Mode de paiement -->
                <div class="checkbox-section">
                    <div class="checkbox-row">
                        <span class="checkbox">%s</span>
                        <span>مسبقا و قبل حلول أجلها</span>
                        <span style="margin-right: 30px;" class="checkbox">%s</span>
                        <span>بصفة دورية مرة في نهاية كل ثلاثة أشهر</span>
                    </div>
                    <div class="checkbox-row">
                        <span class="checkbox">%s</span>
                        <span>بصفة دورية مرة في نهاية كل سنة</span>
                        <span style="margin-right: 30px;" class="checkbox">%s</span>
                        <span>شهريا</span>
                    </div>
                </div>
                
                <!-- Option assurance -->
                <div class="option-box">
                    <div class="checkbox-row">
                        <span class="checkbox">%s</span>
                        <span>أرغب في الإنتفاع بنظام الحيطة الإجتماعية (تغطية صحية في تونس و نظام رأس المال عند الوفاة) على نظرائي المباشرين بتونس و ذلك بداية من ../../.... والتزم بدفع مبلغ المساهمات المستوجبة بهذا العنوان حسب نفس الطريقة (2).</span>
                    </div>
                    <div class="checkbox-row" style="margin-top: 8px;">
                        <span class="checkbox"></span>
                        <span>لا أرغب في مواصلة الإنتفاع بنظام الحيطة الإجتماعية المنطبق على نظرائي المباشرين بتونس (2).</span>
                    </div>
                </div>
                
                <!-- Signature -->
                <div class="signature-section">
                    <div class="signature-box">
                        <p>حررت في .................. في %s</p>
                        <p style="margin-top: 25px;"><strong>الإمضاء</strong></p>
                    </div>
                </div>
                
                <!-- Notes -->
                <div class="notes">
                    <p>(1) فتر اليوم و الشهر و السنة</p>
                    <p>(2) ضع علامة X في المربع الموافق</p>
                </div>
                
                <!-- Footer -->
                <div class="footer">
                    المقر الإجتماعي : 49 شارع الطيب المهيري - 1002 تونس البلفيدير - هاتف: 71 796 744 (216) - تيلفاكس: 14063<br/>
                    Siège social : 49, Avenue Taïeb MHIRI - 1002 Tunis Belvédère - Tél: (216) 71 796 744-LG - Telex: 14063
                </div>
            </body>
            </html>
            """,
            r.getNomComplet() != null ? r.getNomComplet() : "",
            r.getNumSecuSociale() != null ? r.getNumSecuSociale() : "",
            r.getAdresseTunisie() != null ? r.getAdresseTunisie() : "",
            r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "",
            r.getVilleTunisie() != null ? r.getVilleTunisie() : "",
            r.getCodePostalTunisie() != null ? r.getCodePostalTunisie() : "",
            r.getAdresseEtranger() != null ? r.getAdresseEtranger() : "",
            r.getVilleEtranger() != null ? r.getVilleEtranger() : "",
            r.getPaysEtranger() != null ? r.getPaysEtranger() : "",
            r.getEmail() != null ? r.getEmail() : "",
            r.getEtablissementOrigine() != null ? r.getEtablissementOrigine() : "",
            r.getOrganismeEtranger() != null ? r.getOrganismeEtranger() : "",
            r.getDateDebutDetachement() != null ? r.getDateDebutDetachement() : "",
            r.getDateFinDetachement() != null ? r.getDateFinDetachement() : "En cours",
            checkAnticipe, checkTrimestriel, checkAnnuel, checkMensuel, checkAssurance,
            dateNow
        );
    }
    
    private byte[] generateAtctPdfSimple(AtctRappelRequest r) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            Document document = new Document(PageSize.A4, 40, 40, 30, 30);
            PdfWriter.getInstance(document, baos);
            document.open();
            
            Font titleFont = new Font(Font.HELVETICA, 14, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 10, Font.NORMAL);
            
            document.add(new Paragraph("CNSS - Formulaire ATCT", titleFont));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Nom: " + (r.getNomComplet() != null ? r.getNomComplet() : ""), normalFont));
            document.add(new Paragraph("N° SS: " + (r.getNumSecuSociale() != null ? r.getNumSecuSociale() : ""), normalFont));
            document.add(new Paragraph("Email: " + (r.getEmail() != null ? r.getEmail() : ""), normalFont));
            
            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            return new byte[0];
        }
    }
}
