import { Injectable } from '@angular/core';
import { I18nService } from './i18n.service';

declare var jspdf: any;

@Injectable({
  providedIn: 'root'
})
export class PdfService {

  constructor(private i18n: I18nService) {}

  /**
   * Génère une attestation d'affiliation officielle CNSS en PDF (Bilingue AR/FR)
   */
  generateAffiliationAttestation(data: {
    affiliationNumber: string;
    employerName: string;
    employerNumber: string;
    employeeName: string;
    startDate: string;
    regime: string;
    address?: string;
    registrationNumber?: string;
  }): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    // Créer une iframe cachée pour le rendu
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 794px; height: 1123px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) {
      console.error('Cannot access iframe document');
      return;
    }
    
    iframeDoc.open();
    iframeDoc.write(`
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
            font-size: 14px; 
            line-height: 1.8;
            padding: 40px;
            background: white;
          }
          .header { display: flex; justify-content: space-between; margin-bottom: 20px; }
          .header-fr { text-align: left; font-size: 11px; direction: ltr; }
          .header-ar { text-align: right; font-size: 13px; }
          .logo-box { 
            border: 2px solid #8B0000; 
            padding: 20px; 
            margin: 25px 0; 
            text-align: center;
          }
          .logo-fr { color: #8B0000; font-size: 20px; font-weight: bold; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 16px; font-weight: bold; margin-top: 5px; }
          .info-row { display: flex; justify-content: space-between; margin: 15px 0; font-size: 12px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          .subject { 
            text-align: center; 
            margin: 30px 0; 
            color: #8B0000; 
            font-size: 18px; 
            font-weight: bold;
            text-decoration: underline;
          }
          .body-text { 
            text-align: right; 
            font-size: 13px; 
            line-height: 2.2;
            margin: 20px 0;
          }
          .body-text p { margin-bottom: 12px; text-align: justify; }
          .signature { text-align: left; margin-top: 40px; font-weight: bold; }
          .footer { 
            text-align: center; 
            font-size: 10px; 
            color: #666; 
            margin-top: 50px; 
            border-top: 1px solid #000; 
            padding-top: 10px;
            direction: ltr;
          }
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
        <div class="logo-box" style="display: flex; align-items: center; justify-content: center; gap: 20px;">
          <img src="${logoUrl}" alt="CNSS" style="width: 70px; height: auto;">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        
        <!-- Informations -->
        <div class="info-row">
          <div class="info-left">
            Tunis, le ${dateStr}<br><br>
            <strong>N° Affiliation:</strong> ${data.affiliationNumber || '54-500380'}<br>
            <strong>N° Enregistrement:</strong> ${data.registrationNumber || '02-16732404'}
          </div>
          <div class="info-right">
            المكتب الجهوي بتونس المدينة<br>
            شارع مدريد - تونس 12
          </div>
        </div>
        
        <!-- Bénéficiaire -->
        <div style="text-align: right; margin: 20px 0; font-size: 13px;">
          <strong>السيد/ة :</strong> ${data.employeeName || 'نجلة بنت محمد حسن القصعجي'}<br>
          <strong>العنوان :</strong> ${data.address || '2036 نهج السروات جامع الروضة 16 العزار'}
        </div>
        
        <!-- Sujet -->
        <div class="subject">الموضوع : إعلام بالانخراط</div>
        
        <!-- Corps -->
        <div class="body-text">
          <p>أما بعد،</p>
          <p>أتشرف بإعلامكم بقبول مطلب انخراطكم بالصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني وبإسنادكم رقم الانخراط المبين أعلاه والذي:</p>
          <p>- وإثره فإعلاوة بعنوان نظام جرايات الشيخوخة والعجز والباقين على قيد الحياة من تاريخ <strong>${data.startDate || '01/01/2025'}</strong></p>
          <p>- وكذلك فإعلاوة بعنوان نظام التأمينات الاجتماعية من تاريخ <strong>${data.startDate || '01/01/2025'}</strong></p>
          <p>لذا فالمرغوب منكم ذكر رقم انخراطكم، إضافة إلى رقم تسجيلكم، في مختلف تعاملاتكم مع مصالح الصندوق الوطني للضمان الاجتماعي المتعلقة بالتغطية الاجتماعية بعنوان فترات الإلحاق في نطاق التعاون الفني.</p>
          <p>ولضمان مواصلة التمتع بمنافع الضمان الاجتماعي في أحسن الظروف، المرغوب منكم دفع مساهماتكم قبل انقضاء الأجل القانوني المحدد باليوم الخامس عشر الموالي لكل ثلاثية، كما يمكنكم دفع مساهماتكم مسبقا أو شهريا.</p>
          <p>وعند الاقتضاء، ونظرا لتعديل مبالغ مساهماتكم طبقا للنسب المنصوص عليها بالقانون عدد 105 لسنة 1995 المؤرخ في 14 ديسمبر 1995 والمتعلق بإحداث نظام موحد لضم الخدمات بعنوان أنظمة التقاعد والعجز والباقين على قيد الحياة، يتعين عليكم دفع مساهماتكم في أول أقساطه سنة من الأجل القانوني المذكور أعلاه.</p>
          <p style="margin-top: 25px;">مع فائق الاحترام والتقدير</p>
          <p><strong>والسلام</strong></p>
        </div>
        
        <!-- Signature -->
        <div class="signature">رئيس المكتب الجهوي بتونس المدينة</div>
        
        <!-- Footer -->
        <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale</div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    // Attendre le chargement complet
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { 
        scale: 2,
        useCORS: true,
        logging: false,
        backgroundColor: '#ffffff',
        windowWidth: 794,
        windowHeight: 1123
      }).then((canvas: HTMLCanvasElement) => {
        const { jsPDF } = (window as any).jspdf;
        const doc = new jsPDF('p', 'mm', 'a4');
        
        const imgData = canvas.toDataURL('image/png');
        doc.addImage(imgData, 'PNG', 0, 0, 210, 297);
        doc.save('attestation_affiliation_' + (data.affiliationNumber || 'CNSS') + '.pdf');
        
        document.body.removeChild(iframe);
      }).catch((err: any) => {
        console.error('Erreur génération PDF:', err);
        document.body.removeChild(iframe);
      });
    }, 2000);
  }

  /**
   * Génère un reçu de paiement en PDF
   */
  generatePaymentReceipt(data: {
    reference: string;
    employerName: string;
    employerNumber: string;
    amount: number;
    paymentDate: string;
    paymentMode: string;
    trimestre?: string;
  }): void {
    const { jsPDF } = (window as any).jspdf;
    const doc = new jsPDF();
    const isArabic = this.i18n.getLanguage() === 'ar';
    
    // Border
    doc.setDrawColor(139, 0, 0);
    doc.setLineWidth(1);
    doc.rect(10, 10, 190, 277);
    
    // Header with logo placeholder
    doc.setFillColor(139, 0, 0);
    doc.rect(10, 10, 190, 25, 'F');
    
    doc.setTextColor(255, 255, 255);
    doc.setFontSize(16);
    
    if (isArabic) {
      doc.text('الصندوق الوطني للضمان الاجتماعي', 105, 25, { align: 'center' });
    } else {
      doc.text('CAISSE NATIONALE DE SÉCURITÉ SOCIALE', 105, 22, { align: 'center' });
      doc.setFontSize(10);
      doc.text('Coopération Technique', 105, 30, { align: 'center' });
    }
    
    // Title
    doc.setTextColor(139, 0, 0);
    doc.setFontSize(20);
    if (isArabic) {
      doc.text('وصل دفع', 105, 55, { align: 'center' });
    } else {
      doc.text('REÇU DE PAIEMENT', 105, 55, { align: 'center' });
    }
    
    // Receipt number and date
    doc.setFontSize(10);
    doc.setTextColor(0, 0, 0);
    doc.text(`N° ${data.reference}`, 15, 70);
    doc.text(`Date: ${data.paymentDate}`, 150, 70);
    
    // Line separator
    doc.setDrawColor(200, 200, 200);
    doc.line(15, 75, 195, 75);
    
    // Content
    doc.setFontSize(11);
    let y = 90;
    
    const labels = isArabic ? {
      employer: 'صاحب العمل:',
      number: 'الرقم:',
      trimestre: 'الثلاثي:',
      amount: 'المبلغ:',
      mode: 'طريقة الدفع:',
      amountWords: 'المبلغ بالحروف:'
    } : {
      employer: 'Employeur:',
      number: 'N° Matricule:',
      trimestre: 'Trimestre:',
      amount: 'Montant:',
      mode: 'Mode de paiement:',
      amountWords: 'Montant en lettres:'
    };
    
    // Employer info box
    doc.setFillColor(245, 245, 245);
    doc.rect(15, y - 5, 180, 35, 'F');
    
    doc.text(`${labels.employer} ${data.employerName}`, 20, y + 5);
    doc.text(`${labels.number} ${data.employerNumber}`, 20, y + 15);
    if (data.trimestre) {
      doc.text(`${labels.trimestre} ${data.trimestre}`, 20, y + 25);
    }
    
    y += 50;
    
    // Amount box
    doc.setFillColor(255, 248, 220);
    doc.rect(15, y - 5, 180, 30, 'F');
    doc.setDrawColor(139, 0, 0);
    doc.rect(15, y - 5, 180, 30);
    
    doc.setFontSize(14);
    doc.setTextColor(139, 0, 0);
    doc.text(`${labels.amount} ${data.amount.toLocaleString('fr-FR', { minimumFractionDigits: 3 })} TND`, 105, y + 8, { align: 'center' });
    
    doc.setFontSize(10);
    doc.setTextColor(0, 0, 0);
    doc.text(`${labels.amountWords} ${this.numberToWords(data.amount)}`, 105, y + 20, { align: 'center' });
    
    y += 45;
    
    // Payment mode
    doc.setFontSize(11);
    doc.text(`${labels.mode} ${data.paymentMode}`, 20, y);
    
    // Signature area
    y = 220;
    doc.setDrawColor(200, 200, 200);
    doc.line(15, y, 195, y);
    
    doc.setFontSize(10);
    if (isArabic) {
      doc.text('توقيع المسؤول', 50, y + 30, { align: 'center' });
      doc.text('ختم المؤسسة', 150, y + 30, { align: 'center' });
    } else {
      doc.text('Signature du responsable', 50, y + 30, { align: 'center' });
      doc.text('Cachet de l\'établissement', 150, y + 30, { align: 'center' });
    }
    
    // Footer
    doc.setFontSize(8);
    doc.setTextColor(128, 128, 128);
    doc.text('Ce reçu est généré automatiquement par le système CNSS - Coopération Technique', 105, 280, { align: 'center' });
    
    // Download
    doc.save(`recu_${data.reference}.pdf`);
  }

  /**
   * Convertit un nombre en lettres (français)
   */
  private numberToWords(num: number): string {
    if (num === null || num === undefined || isNaN(num)) {
      return 'zéro dinars';
    }
    
    const units = ['', 'un', 'deux', 'trois', 'quatre', 'cinq', 'six', 'sept', 'huit', 'neuf'];
    const teens = ['dix', 'onze', 'douze', 'treize', 'quatorze', 'quinze', 'seize', 'dix-sept', 'dix-huit', 'dix-neuf'];
    const tens = ['', '', 'vingt', 'trente', 'quarante', 'cinquante', 'soixante', 'soixante-dix', 'quatre-vingt', 'quatre-vingt-dix'];
    
    const intPart = Math.floor(num);
    const decPart = Math.round((num - intPart) * 1000);
    
    let result = '';
    
    if (intPart === 0) {
      result = 'zéro ';
    } else {
      if (intPart >= 1000000) {
        const millions = Math.floor(intPart / 1000000);
        result += (millions === 1 ? 'un million ' : this.convertHundreds(millions, units, teens, tens) + ' millions ');
      }
      
      const thousands = Math.floor((intPart % 1000000) / 1000);
      if (thousands > 0) {
        result += (thousands === 1 ? 'mille ' : this.convertHundreds(thousands, units, teens, tens) + ' mille ');
      }
      
      const remainder = intPart % 1000;
      if (remainder > 0) {
        result += this.convertHundreds(remainder, units, teens, tens) + ' ';
      }
    }
    
    result += 'dinars';
    
    if (decPart > 0) {
      result += ` et ${decPart} millimes`;
    }
    
    return result.trim();
  }
  
  private convertHundreds(num: number, units: string[], teens: string[], tens: string[]): string {
    let result = '';
    
    if (num >= 100) {
      const h = Math.floor(num / 100);
      result += (h === 1 ? 'cent ' : units[h] + ' cents ');
    }
    
    const tensUnits = num % 100;
    if (tensUnits >= 10 && tensUnits < 20) {
      result += teens[tensUnits - 10];
    } else {
      const t = Math.floor(tensUnits / 10);
      const u = tensUnits % 10;
      if (t > 0) result += tens[t] + (u > 0 ? '-' : '');
      if (u > 0) result += units[u];
    }
    
    return result.trim();
  }
}
