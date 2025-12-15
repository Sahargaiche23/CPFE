import { Injectable } from '@angular/core';
import { I18nService } from './i18n.service';
import jsPDF from 'jspdf';

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
          <div class="info-right">
            المكتب الجهوي بتونس المدينة<br>
            شارع مدريد - تونس 12
          </div>
          <div class="info-left">
            تونس في ${dateStr}
          </div>
        </div>
        
        <div style="text-align: right; margin: 15px 0; font-size: 13px;">
          <strong>رقم الإنخراط:</strong> ${data.affiliationNumber || '54-500380'}<br>
          <strong>رقم التسجيل:</strong> ${data.registrationNumber || '02-16732404'}
        </div>
        
        <!-- Bénéficiaire -->
        <div style="text-align: right; margin: 20px 0; font-size: 13px;">
          <strong>السيد/ة :</strong> ${data.employeeName || ''}<br>
          <strong>العنوان :</strong> ${data.address || ''}
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
   * Génère un reçu de paiement en PDF avec l'en-tête CNSS officiel
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
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    const amountWords = this.numberToWords(data.amount);
    
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
            line-height: 1.6;
            padding: 40px;
            background: white;
          }
          .header { display: flex; justify-content: space-between; margin-bottom: 25px; }
          .header-fr { text-align: left; font-size: 12px; direction: ltr; }
          .header-ar { text-align: right; font-size: 14px; }
          .logo-box { 
            border: 3px solid #8B0000; 
            padding: 15px; 
            margin: 20px 0; 
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
          }
          .logo-fr { color: #8B0000; font-size: 20px; font-weight: bold; font-style: italic; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 16px; font-weight: bold; margin-top: 5px; }
          .logo-img { width: 70px; height: auto; }
          .title { text-align: center; margin: 30px 0; }
          .title h1 { color: #8B0000; font-size: 24px; font-weight: bold; direction: ltr; }
          .title-ar { color: #8B0000; font-size: 18px; margin-top: 5px; }
          .ref-line { display: flex; justify-content: space-between; margin: 15px 0; font-size: 12px; direction: ltr; border-bottom: 1px solid #ccc; padding-bottom: 10px; }
          .content { margin: 30px 0; direction: ltr; }
          .info-box { background: #f5f5f5; padding: 20px; margin: 20px 0; border-radius: 8px; }
          .info-line { margin: 10px 0; font-size: 14px; }
          .info-line strong { color: #333; }
          .amount-box { 
            border: 2px solid #8B0000; 
            background: #FFF8DC; 
            padding: 20px; 
            text-align: center; 
            margin: 30px 0;
            border-radius: 8px;
          }
          .amount { color: #8B0000; font-size: 28px; font-weight: bold; }
          .amount-words { font-size: 12px; color: #666; margin-top: 10px; }
          .signature-area { display: flex; justify-content: space-between; margin-top: 60px; padding-top: 20px; border-top: 1px solid #ccc; }
          .signature-box { text-align: center; width: 45%; }
          .signature-line { border-bottom: 1px solid #333; height: 50px; margin-bottom: 10px; }
          .footer { 
            text-align: center; 
            font-size: 10px; 
            color: #666; 
            margin-top: 50px; 
            border-top: 1px solid #ccc; 
            padding-top: 15px;
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
        <div class="logo-box">
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        
        <!-- Titre -->
        <div class="title">
          <h1>REÇU DE PAIEMENT</h1>
          <div class="title-ar">وصل دفع</div>
        </div>
        
        <!-- Référence et date -->
        <div class="ref-line">
          <span>N° ${data.reference}</span>
          <span>Date: ${data.paymentDate}</span>
        </div>
        
        <!-- Informations employeur -->
        <div class="content">
          <div class="info-box">
            <div class="info-line"><strong>Employeur:</strong> ${data.employerName}</div>
            <div class="info-line"><strong>N° Matricule:</strong> ${data.employerNumber}</div>
            <div class="info-line"><strong>Trimestre:</strong> ${data.trimestre || '-'}</div>
          </div>
          
          <!-- Montant -->
          <div class="amount-box">
            <div class="amount">${data.amount?.toLocaleString('fr-FR', {minimumFractionDigits: 3})} TND</div>
            <div class="amount-words">Montant en lettres: ${amountWords}</div>
          </div>
          
          <div class="info-line"><strong>Mode de paiement:</strong> ${data.paymentMode}</div>
        </div>
        
        <!-- Zone de signature -->
        <div class="signature-area">
          <div class="signature-box">
            <div class="signature-line"></div>
            <div>Signature du responsable</div>
          </div>
          <div class="signature-box">
            <div class="signature-line"></div>
            <div>Cachet de l'établissement</div>
          </div>
        </div>
        
        <div class="footer">
          Ce reçu est généré automatiquement par le Système de Coopération Technique CNSS<br>
          © 2025 - Caisse Nationale de Sécurité Sociale - Tunisie
        </div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { 
        scale: 2,
        useCORS: true,
        logging: false,
        backgroundColor: '#ffffff'
      }).then((canvas: HTMLCanvasElement) => {
        const { jsPDF } = (window as any).jspdf;
        const doc = new jsPDF('p', 'mm', 'a4');
        
        const imgData = canvas.toDataURL('image/jpeg', 1.0);
        doc.addImage(imgData, 'JPEG', 0, 0, 210, 297);
        doc.save(`recu_${data.reference}.pdf`);
        
        document.body.removeChild(iframe);
      }).catch((err: any) => {
        console.error('Erreur génération PDF:', err);
        document.body.removeChild(iframe);
      });
    }, 1500);
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

  /**
   * Génère le rapport des affiliations en PDF (même en-tête que attestation)
   */
  generateAffiliationsReport(affiliations: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    // Créer une iframe cachée pour le rendu (taille A4 paysage en pixels à 150 DPI)
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1754px; height: 1240px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) {
      console.error('Cannot access iframe document');
      return;
    }
    
    // Générer les lignes du tableau
    let tableRows = '';
    affiliations.forEach(a => {
      // Mapper les champs selon la structure utilisée dans affiliation-list.component.ts
      const salaire = a.salaire || a.dcoSalaire || a.salary || 0;
      const dateDebut = a.dateDebut || a.dcoDateDebut || a.startDate || '';
      const trimestre = dateDebut ? this.formatTrimestre(dateDebut) : '-';
      const nom = a.assureName || a.nomComplet || '-';
      const employeur = a.employerId || a.employerName || '-';
      const numAssure = a.numAffiliation || '-';
      
      tableRows += `
        <tr>
          <td>${Number(salaire).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
          <td>${trimestre}</td>
          <td>${nom}</td>
          <td>${employeur}</td>
          <td>${numAssure}</td>
        </tr>
      `;
    });
    
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
            font-size: 16px; 
            line-height: 1.6;
            padding: 40px;
            background: white;
          }
          .header { display: flex; justify-content: space-between; margin-bottom: 25px; }
          .header-fr { text-align: left; font-size: 14px; direction: ltr; }
          .header-ar { text-align: right; font-size: 16px; }
          .logo-box { 
            border: 3px solid #8B0000; 
            padding: 20px; 
            margin: 20px 0; 
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 25px;
          }
          .logo-fr { color: #8B0000; font-size: 24px; font-weight: bold; font-style: italic; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 20px; font-weight: bold; margin-top: 5px; }
          .logo-img { width: 80px; height: auto; }
          .info-row { display: flex; justify-content: space-between; margin: 15px 0; font-size: 14px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          table { width: 100%; border-collapse: collapse; margin-top: 30px; font-size: 14px; direction: ltr; font-family: Arial, sans-serif; }
          th { background: #F5F5DC; border: 2px solid #000; padding: 12px 8px; text-align: center; font-weight: bold; font-size: 14px; }
          td { border: 1px solid #000; padding: 10px 6px; text-align: center; font-size: 13px; }
          tr:nth-child(even) { background-color: #f9f9f9; }
          .footer { text-align: center; font-size: 12px; color: #666; margin-top: 35px; border-top: 1px solid #ccc; padding-top: 15px; direction: ltr; }
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
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        
        <!-- Informations -->
        <div class="info-row">
          <div class="info-left">
            Tunis, le ${dateStr}<br>
            <strong>Bureau: ${bureau}</strong>
          </div>
          <div class="info-right">
            المكتب الجهوي بتونس المدينة<br>
            شارع مدريد - تونس 12
          </div>
        </div>
        
        <div style="text-align: right; margin: 10px 0; direction: ltr;">
          <strong>Date: ${dateStr}</strong><br>
          <strong>Nombre de lignes: ${affiliations.length}</strong>
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
            ${tableRows}
          </tbody>
        </table>
        
        <div class="footer">
          Document généré automatiquement par le Système de Coopération Technique CNSS<br>
          © 2025 - Caisse Nationale de Sécurité Sociale - Tunisie
        </div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    // Attendre le chargement complet
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { 
        scale: 2, // Résolution élevée
        useCORS: true,
        logging: false,
        backgroundColor: '#ffffff',
        windowWidth: 1754,
        windowHeight: 1240,
        imageTimeout: 0
      }).then((canvas: HTMLCanvasElement) => {
        const { jsPDF } = (window as any).jspdf;
        const doc = new jsPDF('l', 'mm', 'a4'); // Paysage
        
        const imgData = canvas.toDataURL('image/jpeg', 1.0); // JPEG haute qualité
        doc.addImage(imgData, 'JPEG', 0, 0, 297, 210);
        doc.save('rapport_affiliations_' + dateStr.replace(/\//g, '-') + '.pdf');
        
        document.body.removeChild(iframe);
      }).catch((err: any) => {
        console.error('Erreur génération PDF:', err);
        document.body.removeChild(iframe);
      });
    }, 2000);
  }
  
  private formatTrimestre(dateStr: string): string {
    try {
      const date = new Date(dateStr);
      const trimestre = Math.floor(date.getMonth() / 3) + 1;
      return `0${trimestre}/${date.getFullYear()}`;
    } catch {
      return '-';
    }
  }

  /**
   * Génère un PDF d'avis de débit officiel CNSS (même format que attestation)
   */
  generateDebitPdf(debit: {
    number: string;
    employerName: string;
    trimestre: string;
    generatedDate: string;
    amount: number;
    statusLabel: string;
    numAffiliation?: string;
    matricule?: string;
    salaire?: number;
    adresse?: string;
    annee?: number;
    cotisations?: { code: string; nomAr: string; taux: number; base: number; montant: number }[];
  }, openForPrint: boolean = false): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    // Extraire trimestre et année
    const trimestreMatch = debit.trimestre?.match(/T(\d)/);
    const trimestreNum = trimestreMatch ? parseInt(trimestreMatch[1]) : 1;
    const annee = debit.annee || new Date().getFullYear();
    
    // Utiliser les cotisations dynamiques ou calculer par défaut
    const salaire = debit.salaire || (debit.amount / 0.2575);
    const hasDynamicCotisations = debit.cotisations && debit.cotisations.length > 0;
    const total = hasDynamicCotisations 
      ? debit.cotisations!.reduce((sum, c) => sum + c.montant, 0)
      : debit.amount;
    
    // Date limite de paiement (15 du mois suivant le trimestre)
    const moisLimite = trimestreNum * 3 + 1;
    const dateLimite = new Date(annee, moisLimite > 12 ? 0 : moisLimite - 1, 15);
    if (moisLimite > 12) dateLimite.setFullYear(annee + 1);
    const dateLimiteStr = dateLimite.toLocaleDateString('fr-FR');
    
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
            font-size: 13px; 
            line-height: 1.8;
            padding: 30px 40px;
            background: white;
          }
          .header { display: flex; justify-content: space-between; margin-bottom: 15px; }
          .header-fr { text-align: left; font-size: 11px; direction: ltr; }
          .header-ar { text-align: right; font-size: 12px; }
          .logo-box { 
            border: 2px solid #8B0000; 
            padding: 15px 20px; 
            margin: 15px 0; 
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
          }
          .logo-fr { color: #8B0000; font-size: 18px; font-weight: bold; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 14px; font-weight: bold; margin-top: 3px; }
          .logo-img { width: 60px; height: auto; }
          .info-row { display: flex; justify-content: space-between; margin: 10px 0; font-size: 12px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          .subject { 
            text-align: center; 
            margin: 20px 0; 
            font-size: 16px; 
            font-weight: bold;
          }
          .body-text { 
            text-align: right; 
            font-size: 12px; 
            line-height: 2;
            margin: 15px 0;
          }
          .body-text p { margin-bottom: 10px; text-align: justify; }
          table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 11px; }
          th, td { border: 1px solid #333; padding: 6px 8px; text-align: center; }
          th { background: #f0f0f0; font-weight: bold; }
          .signature { text-align: left; margin-top: 30px; font-weight: bold; font-size: 12px; }
          .footer { 
            text-align: center; 
            font-size: 9px; 
            color: #666; 
            margin-top: 30px; 
            border-top: 1px solid #000; 
            padding-top: 8px;
            direction: ltr;
          }
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
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        
        <!-- Informations -->
        <div class="info-row">
          <div class="info-right">
            المكتب الجهوي بتونس المدينة<br>
            شارع مدريد - تونس 12
          </div>
          <div class="info-left">
            تونس في ${dateStr}
          </div>
        </div>
        
        <div style="text-align: right; margin: 10px 0; font-size: 12px;">
          <strong>رقم الإنخراط:</strong> ${debit.numAffiliation || debit.number}<br>
          <strong>رقم التسجيل:</strong> ${debit.matricule || ''}
        </div>
        
        <!-- Bénéficiaire -->
        <div style="text-align: right; margin: 15px 0; font-size: 12px;">
          <strong>السيد/ة :</strong> ${debit.employerName}<br>
          <strong>العنوان :</strong> ${debit.adresse || ''}
        </div>
        
        <!-- Sujet -->
        <div class="subject">الموضوع : إعلام بدفع المساهمات</div>
        
        <!-- Corps -->
        <div class="body-text">
          <p>أما بعد،</p>
          <p>أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني، طبقا للأمر عدد 1879 لسنة 2007،</p>
          <p>لسنة <strong>${annee}</strong> الثلاثية <strong>${trimestreNum}</strong> الموافق في 23 جويلية 2007، بدفوعل الثلاث</p>
          <p>مفصلا كما يلي سنة آلاف و تسعة مائة و واحد و خمسون دينار و 285 مليم حدد ب</p>
        </div>
        
        <!-- Tableau des cotisations -->
        <table>
          <tr>
            <th>المبلغ</th>
            <th>النسبة (%)</th>
            <th>قاعدة الإحتساب (د.ت)</th>
            <th>النظام</th>
            <th>الرمز</th>
          </tr>
          ${hasDynamicCotisations 
            ? debit.cotisations!.map(c => `
              <tr>
                <td>${c.montant.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>${c.taux}</td>
                <td>${c.base.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>${c.nomAr}</td>
                <td>${c.code}</td>
              </tr>
            `).join('')
            : `
              <tr>
                <td>${(salaire * 0.135).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>13.5</td>
                <td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>جرايات الشيخوخة و العجز و الباقين على قيد الحياة</td>
                <td>133</td>
              </tr>
              <tr>
                <td>0.000</td>
                <td>0</td>
                <td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>التأمينات الاجتماعية</td>
                <td>0</td>
              </tr>
              <tr>
                <td>${(salaire * 0.735 * 0.09).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>9</td>
                <td>${(salaire * 0.735).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
                <td>(*) النظام التكميلي للجرايات</td>
                <td>91</td>
              </tr>
            `
          }
          <tr style="font-weight: bold; background: #f9f9f9;">
            <td>${total.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
            <td colspan="4">المجملة</td>
          </tr>
        </table>
        
        <div class="body-text">
          <p>(*) الجزء الذي يفوق 6 مرات الأجر الأدنى</p>
          <p>هذا ويمكنكم تسديد مساهماتكم بواسطة <strong>${dateLimiteStr}</strong> فالمرغوب منكم تسديد هذا المبلغ في أجل لا يتجاوز</p>
          <p>تحويل بريدي أو بنكي إلى الحساب الجاري للصندوق لدى الشركة التونسية للبنك عدد: 10104059103466578833</p>
          <p>أو إلى الحساب الجاري البريدي للصندوق عدد: 17001000000000733217</p>
          <p class="highlight">كما يمكنكم تكليف من تريدون بتسديد المساهمات مباشرة بشباليك المكتب الجهوري بتونس المدينة</p>
          <p>يغرم الصندوق بتحميل مبالغها طبقا للنسب ب <strong>${dateLimiteStr.replace(/\d{4}/, (parseInt(dateLimiteStr.split('/')[2]) + 2).toString())}</strong> و في صورة عدم دفع مساهماتكم في أجل أقصاه</p>
          <p>المنصوص</p>
          <p>عليها بالقانون عدد 105 لسنة 1995 المؤرخ في 14 ديسمبر 1995 و المتعلق بإحداث نظام موحد لضم الخدمات بعنوان</p>
          <p>أنظمة التقاعد و العجز والباقين على قيد الحياة</p>
          <p style="margin-top: 20px;">مع فائق الاحترام والتقدير</p>
          <p><strong>والسلام</strong></p>
        </div>
        
        <!-- Signature -->
        <div class="signature">رئيس المكتب الجهوي بتونس المدينة</div>
        
        <!-- Footer -->
        <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le ${dateStr}</div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
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
        
        if (openForPrint) {
          const pdfBlob = doc.output('blob');
          const pdfUrl = URL.createObjectURL(pdfBlob);
          const printWindow = window.open(pdfUrl, '_blank');
          if (printWindow) {
            printWindow.onload = () => {
              printWindow.print();
            };
          }
        } else {
          doc.save(`avis_debit_${debit.numAffiliation || debit.number}.pdf`);
        }
        
        document.body.removeChild(iframe);
      }).catch((err: any) => {
        console.error('Erreur génération PDF:', err);
        document.body.removeChild(iframe);
      });
    }, 2000);
  }

  /**
   * Génère un rapport de paiements en PDF
   */
  generatePaiementsReport(paiements: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1754px; height: 1240px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) return;
    
    let tableRows = '';
    paiements.forEach(p => {
      tableRows += `
        <tr>
          <td>${p.reference || p.id || '-'}</td>
          <td>${p.employerName || '-'}</td>
          <td>${p.debitRef || '-'}</td>
          <td>${p.date || '-'}</td>
          <td>${Number(p.amount || p.montant || 0).toLocaleString('fr-FR', {minimumFractionDigits: 2})}</td>
          <td>${p.mode || '-'}</td>
          <td>${p.statusLabel || '-'}</td>
        </tr>
      `;
    });
    
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
          body { font-family: 'Amiri', Arial, serif; font-size: 16px; padding: 40px; background: white; }
          .header { display: flex; justify-content: space-between; margin-bottom: 25px; }
          .header-fr { text-align: left; font-size: 14px; direction: ltr; }
          .header-ar { text-align: right; font-size: 16px; }
          .logo-box { border: 3px solid #8B0000; padding: 20px; margin: 20px 0; display: flex; align-items: center; justify-content: center; gap: 25px; }
          .logo-fr { color: #8B0000; font-size: 24px; font-weight: bold; font-style: italic; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 20px; font-weight: bold; margin-top: 5px; }
          .logo-img { width: 80px; }
          .info-row { display: flex; justify-content: space-between; margin: 15px 0; font-size: 14px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          table { width: 100%; border-collapse: collapse; margin-top: 30px; font-size: 13px; direction: ltr; font-family: Arial, sans-serif; }
          th { background: #D1FAE5; border: 2px solid #000; padding: 12px 8px; text-align: center; font-weight: bold; }
          td { border: 1px solid #000; padding: 10px 6px; text-align: center; }
          tr:nth-child(even) { background-color: #f9f9f9; }
          .footer { text-align: center; font-size: 12px; color: #666; margin-top: 35px; border-top: 1px solid #ccc; padding-top: 15px; direction: ltr; }
        </style>
      </head>
      <body>
        <div class="header">
          <div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l'Étranger</div>
          <div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div>
        </div>
        <div class="logo-box">
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        <div class="info-row">
          <div class="info-left">Tunis, le ${dateStr}<br><strong>Bureau: ${bureau}</strong></div>
          <div class="info-right">المكتب الجهوي بتونس المدينة<br>شارع مدريد - تونس 12</div>
        </div>
        <div style="text-align: center; margin: 20px 0; direction: ltr;">
          <h2 style="color: #065F46;">RAPPORT DES PAIEMENTS</h2>
          <p>Nombre de paiements: ${paiements.length}</p>
        </div>
        <table>
          <thead>
            <tr>
              <th>Référence</th>
              <th>Employeur</th>
              <th>Débit</th>
              <th>Date</th>
              <th>Montant (TND)</th>
              <th>Mode</th>
              <th>Statut</th>
            </tr>
          </thead>
          <tbody>${tableRows}</tbody>
        </table>
        <div class="footer">
          Document généré automatiquement par le Système de Coopération Technique CNSS<br>
          © 2025 - Caisse Nationale de Sécurité Sociale - Tunisie
        </div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { scale: 2, useCORS: true, backgroundColor: '#ffffff', windowWidth: 1754, windowHeight: 1240 })
        .then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('l', 'mm', 'a4');
          doc.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 0, 0, 297, 210);
          doc.save('rapport_paiements_' + dateStr.replace(/\//g, '-') + '.pdf');
          document.body.removeChild(iframe);
        });
    }, 2000);
  }

  /**
   * Génère un rapport des employeurs en PDF
   */
  generateEmployeursReport(employeurs: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1754px; height: 1240px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) return;
    
    let tableRows = '';
    employeurs.forEach(e => {
      tableRows += `
        <tr>
          <td>${e.matricule || e.empMat + '-' + e.empCle || '-'}</td>
          <td>${e.nomCommercial || e.name || '-'}</td>
          <td>${e.regime || '-'}</td>
          <td>${e.pays || 'Tunisie'}</td>
          <td>${e.affiliationsCount || 0}</td>
          <td><span style="color: ${e.actif !== false ? 'green' : 'red'}">${e.actif !== false ? 'Actif' : 'Inactif'}</span></td>
        </tr>
      `;
    });
    
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
          body { font-family: 'Amiri', Arial, serif; font-size: 16px; padding: 40px; background: white; }
          .header { display: flex; justify-content: space-between; margin-bottom: 25px; }
          .header-fr { text-align: left; font-size: 14px; direction: ltr; }
          .header-ar { text-align: right; font-size: 16px; }
          .logo-box { border: 3px solid #8B0000; padding: 20px; margin: 20px 0; display: flex; align-items: center; justify-content: center; gap: 25px; }
          .logo-fr { color: #8B0000; font-size: 24px; font-weight: bold; font-style: italic; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 20px; font-weight: bold; margin-top: 5px; }
          .logo-img { width: 80px; }
          .info-row { display: flex; justify-content: space-between; margin: 15px 0; font-size: 14px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          table { width: 100%; border-collapse: collapse; margin-top: 30px; font-size: 13px; direction: ltr; font-family: Arial, sans-serif; }
          th { background: #E9D5FF; border: 2px solid #000; padding: 12px 8px; text-align: center; font-weight: bold; }
          td { border: 1px solid #000; padding: 10px 6px; text-align: center; }
          tr:nth-child(even) { background-color: #f9f9f9; }
          .footer { text-align: center; font-size: 12px; color: #666; margin-top: 35px; border-top: 1px solid #ccc; padding-top: 15px; direction: ltr; }
        </style>
      </head>
      <body>
        <div class="header">
          <div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l'Étranger</div>
          <div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div>
        </div>
        <div class="logo-box">
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div>
            <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
          </div>
        </div>
        <div class="info-row">
          <div class="info-left">Tunis, le ${dateStr}<br><strong>Bureau: ${bureau}</strong></div>
          <div class="info-right">المكتب الجهوي بتونس المدينة<br>شارع مدريد - تونس 12</div>
        </div>
        <div style="text-align: center; margin: 20px 0; direction: ltr;">
          <h2 style="color: #7C3AED;">RAPPORT DES EMPLOYEURS</h2>
          <p>Nombre d'employeurs: ${employeurs.length}</p>
        </div>
        <table>
          <thead>
            <tr>
              <th>Matricule</th>
              <th>Nom Commercial</th>
              <th>Régime</th>
              <th>Pays</th>
              <th>Affiliations</th>
              <th>Statut</th>
            </tr>
          </thead>
          <tbody>${tableRows}</tbody>
        </table>
        <div class="footer">
          Document généré automatiquement par le Système de Coopération Technique CNSS<br>
          © 2025 - Caisse Nationale de Sécurité Sociale - Tunisie
        </div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { scale: 2, useCORS: true, backgroundColor: '#ffffff', windowWidth: 1754, windowHeight: 1240 })
        .then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('l', 'mm', 'a4');
          doc.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 0, 0, 297, 210);
          doc.save('rapport_employeurs_' + dateStr.replace(/\//g, '-') + '.pdf');
          document.body.removeChild(iframe);
        });
    }, 2000);
  }

  /**
   * Génère un rapport d'audit en PDF
   */
  generateAuditReport(auditLogs: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1754px; height: 1240px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) return;
    
    let tableRows = '';
    auditLogs.forEach(log => {
      const statusColor = log.status === 'Succès' ? '#059669' : '#DC2626';
      tableRows += '<tr><td>' + log.date + '</td><td>' + log.user + '</td><td>' + log.action + '</td><td>' + log.description + '</td><td>' + log.ip + '</td><td style="color:' + statusColor + ';font-weight:bold">' + log.status + '</td></tr>';
    });
    
    iframeDoc.open();
    iframeDoc.write('<!DOCTYPE html><html lang="ar" dir="rtl"><head><meta charset="UTF-8"><link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap" rel="stylesheet"><style>@import url(\'https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap\');*{margin:0;padding:0;box-sizing:border-box}body{font-family:\'Amiri\',Arial,serif;font-size:16px;padding:40px;background:white}.header{display:flex;justify-content:space-between;margin-bottom:25px}.header-fr{text-align:left;font-size:14px;direction:ltr}.header-ar{text-align:right;font-size:16px}.logo-box{border:3px solid #8B0000;padding:20px;margin:20px 0;display:flex;align-items:center;justify-content:center;gap:25px}.logo-fr{color:#8B0000;font-size:24px;font-weight:bold;font-style:italic;direction:ltr}.logo-ar{color:#8B0000;font-size:20px;font-weight:bold;margin-top:5px}.logo-img{width:80px}.info-row{display:flex;justify-content:space-between;margin:15px 0;font-size:14px}.info-left{text-align:left;direction:ltr}.info-right{text-align:right}table{width:100%;border-collapse:collapse;margin-top:30px;font-size:13px;direction:ltr;font-family:Arial,sans-serif}th{background:#FDBA74;border:2px solid #000;padding:12px 8px;text-align:center;font-weight:bold}td{border:1px solid #000;padding:10px 6px;text-align:center}tr:nth-child(even){background-color:#f9f9f9}.footer{text-align:center;font-size:12px;color:#666;margin-top:35px;border-top:1px solid #ccc;padding-top:15px;direction:ltr}</style></head><body><div class="header"><div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l\'Étranger</div><div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div></div><div class="logo-box"><img class="logo-img" src="' + logoUrl + '" alt="CNSS"><div><div class="logo-fr">Caisse Nationale de Sécurité Sociale</div><div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div></div></div><div class="info-row"><div class="info-left">Tunis, le ' + dateStr + '<br><strong>Bureau: ' + bureau + '</strong></div><div class="info-right">المكتب الجهوي بتونس المدينة<br>شارع مدريد - تونس 12</div></div><div style="text-align:center;margin:20px 0;direction:ltr"><h2 style="color:#EA580C">JOURNAL D\'AUDIT</h2><p>Nombre d\'entrées: ' + auditLogs.length + '</p></div><table><thead><tr><th>Date</th><th>Utilisateur</th><th>Action</th><th>Description</th><th>IP</th><th>Statut</th></tr></thead><tbody>' + tableRows + '</tbody></table><div class="footer">Document généré automatiquement par le Système de Coopération Technique CNSS<br>© 2025 - Caisse Nationale de Sécurité Sociale - Tunisie</div></body></html>');
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { scale: 2, useCORS: true, backgroundColor: '#ffffff', windowWidth: 1754, windowHeight: 1240 })
        .then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('l', 'mm', 'a4');
          doc.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 0, 0, 297, 210);
          doc.save('journal_audit_' + dateStr.replace(/\//g, '-') + '.pdf');
          document.body.removeChild(iframe);
        });
    }, 2000);
  }

  /**
   * Génère un rapport statistiques en PDF
   */
  generateStatistiquesReport(stats: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1754px; height: 1240px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) return;
    
    let tableRows = '';
    stats.forEach(stat => {
      const evolColor = stat.evolution.startsWith('+') ? '#059669' : stat.evolution.startsWith('-') ? '#DC2626' : '#6B7280';
      tableRows += '<tr><td style="font-weight:bold">' + stat.indicateur + '</td><td style="font-size:18px;font-weight:bold;color:#1F2937">' + stat.valeur + '</td><td style="color:' + evolColor + ';font-weight:bold">' + stat.evolution + '</td><td>' + stat.periode + '</td></tr>';
    });
    
    iframeDoc.open();
    iframeDoc.write('<!DOCTYPE html><html lang="ar" dir="rtl"><head><meta charset="UTF-8"><link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap" rel="stylesheet"><style>@import url(\'https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap\');*{margin:0;padding:0;box-sizing:border-box}body{font-family:\'Amiri\',Arial,serif;font-size:16px;padding:40px;background:white}.header{display:flex;justify-content:space-between;margin-bottom:25px}.header-fr{text-align:left;font-size:14px;direction:ltr}.header-ar{text-align:right;font-size:16px}.logo-box{border:3px solid #8B0000;padding:20px;margin:20px 0;display:flex;align-items:center;justify-content:center;gap:25px}.logo-fr{color:#8B0000;font-size:24px;font-weight:bold;font-style:italic;direction:ltr}.logo-ar{color:#8B0000;font-size:20px;font-weight:bold;margin-top:5px}.logo-img{width:80px}.info-row{display:flex;justify-content:space-between;margin:15px 0;font-size:14px}.info-left{text-align:left;direction:ltr}.info-right{text-align:right}table{width:100%;border-collapse:collapse;margin-top:30px;font-size:14px;direction:ltr;font-family:Arial,sans-serif}th{background:#FCA5A5;border:2px solid #000;padding:14px 10px;text-align:center;font-weight:bold}td{border:1px solid #000;padding:12px 8px;text-align:center}tr:nth-child(even){background-color:#f9f9f9}.footer{text-align:center;font-size:12px;color:#666;margin-top:35px;border-top:1px solid #ccc;padding-top:15px;direction:ltr}</style></head><body><div class="header"><div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l\'Étranger</div><div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div></div><div class="logo-box"><img class="logo-img" src="' + logoUrl + '" alt="CNSS"><div><div class="logo-fr">Caisse Nationale de Sécurité Sociale</div><div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div></div></div><div class="info-row"><div class="info-left">Tunis, le ' + dateStr + '<br><strong>Bureau: ' + bureau + '</strong></div><div class="info-right">المكتب الجهوي بتونس المدينة<br>شارع مدريد - تونس 12</div></div><div style="text-align:center;margin:20px 0;direction:ltr"><h2 style="color:#DC2626">RAPPORT STATISTIQUES</h2><p>Indicateurs clés de performance</p></div><table><thead><tr><th>Indicateur</th><th>Valeur</th><th>Évolution</th><th>Période</th></tr></thead><tbody>' + tableRows + '</tbody></table><div class="footer">Document généré automatiquement par le Système de Coopération Technique CNSS<br>© 2025 - Caisse Nationale de Sécurité Sociale - Tunisie</div></body></html>');
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { scale: 2, useCORS: true, backgroundColor: '#ffffff', windowWidth: 1754, windowHeight: 1240 })
        .then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('l', 'mm', 'a4');
          doc.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 0, 0, 297, 210);
          doc.save('rapport_statistiques_' + dateStr.replace(/\//g, '-') + '.pdf');
          document.body.removeChild(iframe);
        });
    }, 2000);
  }

  /**
   * Génère l'attestation d'affiliation en PDF et retourne le base64 (utilise html2canvas pour l'arabe)
   */
  generateAttestationPdfBase64(data: {
    affiliationNumber: string;
    employeeName: string;
    employeeNameAr?: string;
    registrationNumber: string;
    regime: string;
    dateEffet: string;
    periodeDebut: string;
    periodeFin: string;
    salaire: number;
    montantCotisation: string;
    address?: string;
  }): Promise<string> {
    return new Promise((resolve, reject) => {
      const today = new Date().toLocaleDateString('fr-FR');
      const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
      
      const iframe = document.createElement('iframe');
      iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 794px; height: 1123px; border: none; z-index: -1; opacity: 0;';
      document.body.appendChild(iframe);
      
      const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
      if (!iframeDoc) {
        reject('Cannot access iframe document');
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
          
          <div class="logo-box" style="display: flex; align-items: center; justify-content: center; gap: 20px;">
            <img src="${logoUrl}" alt="CNSS" style="width: 70px; height: auto;" crossorigin="anonymous">
            <div>
              <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
              <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="info-right" style="text-align: right;">
              المكتب الجهوي بتونس المدينة<br>
              شارع مدريد - تونس 12
            </div>
            <div class="info-left" style="text-align: left; direction: ltr;">
              تونس في ${today}
            </div>
          </div>
          
          <div style="text-align: right; margin: 15px 0; font-size: 13px;">
            <strong>رقم الإنخراط:</strong> ${data.affiliationNumber}<br>
            <strong>رقم التسجيل:</strong> ${data.registrationNumber}
          </div>
          
          <div style="text-align: right; margin: 20px 0; font-size: 13px;">
            <strong>السيد/ة :</strong> ${data.employeeNameAr || data.employeeName}<br>
            <strong>العنوان :</strong> ${data.address || ''}
          </div>
          
          <div class="subject">الموضوع : إعلام بالانخراط</div>
          
          <div class="body-text">
            <p>أما بعد،</p>
            <p>أتشرف بإعلامكم بقبول مطلب انخراطكم بالصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني وبإسنادكم رقم الانخراط المبين أعلاه والذي:</p>
            <p>- وإثره فإعلاوة بعنوان نظام جرايات الشيخوخة والعجز والباقين على قيد الحياة من تاريخ <strong>${data.dateEffet}</strong></p>
            <p>- وكذلك فإعلاوة بعنوان نظام التأمينات الاجتماعية من تاريخ <strong>${data.periodeDebut}</strong></p>
            <p>لذا فالمرغوب منكم ذكر رقم انخراطكم، إضافة إلى رقم تسجيلكم، في مختلف تعاملاتكم مع مصالح الصندوق الوطني للضمان الاجتماعي المتعلقة بالتغطية الاجتماعية بعنوان فترات الإلحاق في نطاق التعاون الفني.</p>
            <p>ولضمان مواصلة التمتع بمنافع الضمان الاجتماعي في أحسن الظروف، المرغوب منكم دفع مساهماتكم قبل انقضاء الأجل القانوني المحدد باليوم الخامس عشر الموالي لكل ثلاثية، كما يمكنكم دفع مساهماتكم مسبقا أو شهريا.</p>
            <p>وعند الاقتضاء، ونظرا لتعديل مبالغ مساهماتكم طبقا للنسب المنصوص عليها بالقانون عدد 105 لسنة 1995 المؤرخ في 14 ديسمبر 1995 والمتعلق بإحداث نظام موحد لضم الخدمات بعنوان أنظمة التقاعد والعجز والباقين على قيد الحياة، يتعين عليكم دفع مساهماتكم في أول أقساطه سنة من الأجل القانوني المذكور أعلاه.</p>
            <p style="margin-top: 25px;">مع فائق الاحترام والتقدير</p>
            <p><strong>والسلام</strong></p>
          </div>
          
          <div class="signature">رئيس المكتب الجهوي بتونس المدينة</div>
          
          <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale</div>
        </body>
        </html>
      `);
      iframeDoc.close();
      
      setTimeout(() => {
        const html2canvas = (window as any).html2canvas;
        html2canvas(iframeDoc.body, { 
          scale: 1.5,
          useCORS: true,
          logging: false,
          backgroundColor: '#ffffff',
          windowWidth: 794,
          windowHeight: 1123
        }).then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('p', 'mm', 'a4');
          
          const imgData = canvas.toDataURL('image/jpeg', 0.8);
          doc.addImage(imgData, 'JPEG', 0, 0, 210, 297);
          
          const pdfBase64 = doc.output('datauristring').split(',')[1];
          document.body.removeChild(iframe);
          resolve(pdfBase64);
        }).catch((err: any) => {
          document.body.removeChild(iframe);
          reject(err);
        });
      }, 2000);
    });
  }

  /**
   * Génère un rapport PDF de tous les débits (mode "Toutes")
   */
  generateAllDebitsReport(debits: any[], bureau: string = 'TUNIS'): void {
    const today = new Date();
    const dateStr = today.toLocaleDateString('fr-FR');
    const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
    
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 1200px; height: 1600px; border: none; z-index: -1; opacity: 0;';
    document.body.appendChild(iframe);
    
    const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
    if (!iframeDoc) return;
    
    let tableRows = '';
    let totalAmount = 0;
    debits.forEach(d => {
      const salaire = d.salaire || 0;
      const montant = d.amount || d.montantCotisation || 0;
      totalAmount += montant;
      tableRows += `
        <tr>
          <td style="text-align: right;">${Number(salaire).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td>
          <td>${d.trimestre || '-'}/${d.annee || '-'}</td>
          <td style="text-align: left;">${d.employerName || d.nomCooperant || '-'}</td>
          <td>${d.matricule || '-'}</td>
          <td>${d.numAffiliation || d.number || '-'}</td>
        </tr>
      `;
    });
    
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
          body { font-family: 'Amiri', Arial, serif; font-size: 14px; padding: 30px; background: white; }
          .header { display: flex; justify-content: space-between; margin-bottom: 20px; }
          .header-fr { text-align: left; font-size: 12px; direction: ltr; }
          .header-ar { text-align: right; font-size: 14px; }
          .logo-box { border: 2px solid #8B0000; padding: 15px 25px; margin: 15px 0; display: flex; align-items: center; justify-content: center; gap: 20px; }
          .logo-fr { color: #8B0000; font-size: 22px; font-weight: bold; font-style: italic; direction: ltr; }
          .logo-ar { color: #8B0000; font-size: 18px; font-weight: bold; margin-top: 5px; }
          .logo-img { width: 70px; }
          .info-row { display: flex; justify-content: space-between; margin: 15px 0; font-size: 13px; }
          .info-left { text-align: left; direction: ltr; }
          .info-right { text-align: right; }
          .title { text-align: center; margin: 20px 0; font-size: 16px; font-weight: bold; }
          table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 12px; }
          th { background: #f0f0f0; border: 1px solid #000; padding: 10px 6px; text-align: center; font-weight: bold; }
          td { border: 1px solid #000; padding: 8px 6px; text-align: center; }
          tr:nth-child(even) { background-color: #f9f9f9; }
          .footer { text-align: center; font-size: 10px; color: #666; margin-top: 30px; border-top: 1px solid #ccc; padding-top: 10px; direction: ltr; }
          .count-info { text-align: right; margin: 10px 0; font-size: 13px; }
        </style>
      </head>
      <body>
        <div class="header">
          <div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales et de solidarité<br>et des Tunisiens à l'Étranger</div>
          <div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية و التضامن<br>والتونسيين بالخارج</div>
        </div>
        
        <div class="logo-box">
          <img class="logo-img" src="${logoUrl}" alt="CNSS">
          <div style="text-align: center;">
            <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
            <div class="logo-fr">Caisse Nationale<br>de Sécurité Sociale</div>
          </div>
        </div>
        
        <div class="info-row">
          <div class="info-right">
            المكتب الجهوري بتونس المدينة<br>
            شارع مدريد - تونس 12
          </div>
          <div class="info-left">
            ${dateStr} تونس في
          </div>
        </div>
        
        <div class="count-info">
          <strong>Nombre de lignes</strong> ${debits.length}
        </div>
        
        <table>
          <thead>
            <tr>
              <th>Salaire</th>
              <th>Tr/Année</th>
              <th>Nom&prénom / raison sociale</th>
              <th>Employeur</th>
              <th>°Assur</th>
            </tr>
          </thead>
          <tbody>
            ${tableRows}
          </tbody>
        </table>
        
        <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Rapport généré le ${dateStr}</div>
      </body>
      </html>
    `);
    iframeDoc.close();
    
    setTimeout(() => {
      const html2canvas = (window as any).html2canvas;
      html2canvas(iframeDoc.body, { 
        scale: 2,
        useCORS: true,
        logging: false,
        backgroundColor: '#ffffff',
        windowWidth: 1200,
        windowHeight: 1600
      }).then((canvas: HTMLCanvasElement) => {
        const { jsPDF } = (window as any).jspdf;
        const doc = new jsPDF('l', 'mm', 'a4'); // Landscape
        
        const imgData = canvas.toDataURL('image/png');
        doc.addImage(imgData, 'PNG', 0, 0, 297, 210);
        
        const pdfBlob = doc.output('blob');
        const pdfUrl = URL.createObjectURL(pdfBlob);
        const printWindow = window.open(pdfUrl, '_blank');
        if (printWindow) {
          printWindow.onload = () => printWindow.print();
        }
        
        document.body.removeChild(iframe);
      }).catch((err: any) => {
        console.error('Erreur génération PDF:', err);
        document.body.removeChild(iframe);
      });
    }, 2000);
  }

  /**
   * Génère un PDF d'avis de débit et retourne le base64 pour envoi par email
   */
  generateDebitPdfBase64(debit: {
    number: string;
    employerName: string;
    trimestre: string;
    generatedDate: string;
    amount: number;
    numAffiliation?: string;
    matricule?: string;
    salaire?: number;
    adresse?: string;
    annee?: number;
  }): Promise<string> {
    return new Promise((resolve, reject) => {
      const today = new Date();
      const dateStr = today.toLocaleDateString('fr-FR');
      const logoUrl = window.location.origin + '/assets/images/logo-cnss.png';
      
      const trimestreMatch = debit.trimestre?.match(/T(\d)/);
      const trimestreNum = trimestreMatch ? parseInt(trimestreMatch[1]) : 1;
      const annee = debit.annee || new Date().getFullYear();
      const salaire = debit.salaire || (debit.amount / 0.2575);
      const total = debit.amount;
      
      const moisLimite = trimestreNum * 3 + 1;
      const dateLimite = new Date(annee, moisLimite > 12 ? 0 : moisLimite - 1, 15);
      if (moisLimite > 12) dateLimite.setFullYear(annee + 1);
      const dateLimiteStr = dateLimite.toLocaleDateString('fr-FR');
      const dateLimitePlus2Ans = new Date(dateLimite.getFullYear() + 2, dateLimite.getMonth(), dateLimite.getDate()).toLocaleDateString('fr-FR');
      
      const iframe = document.createElement('iframe');
      iframe.style.cssText = 'position: fixed; top: 0; left: 0; width: 794px; height: 1123px; border: none; z-index: -1; opacity: 0;';
      document.body.appendChild(iframe);
      
      const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
      if (!iframeDoc) {
        reject('Cannot access iframe document');
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
            body { font-family: 'Amiri', 'Traditional Arabic', 'Arial', serif; font-size: 13px; line-height: 1.8; padding: 30px 40px; background: white; }
            .header { display: flex; justify-content: space-between; margin-bottom: 15px; }
            .header-fr { text-align: left; font-size: 11px; direction: ltr; }
            .header-ar { text-align: right; font-size: 12px; }
            .logo-box { border: 2px solid #8B0000; padding: 15px 20px; margin: 15px 0; display: flex; align-items: center; justify-content: center; gap: 15px; }
            .logo-fr { color: #8B0000; font-size: 18px; font-weight: bold; direction: ltr; }
            .logo-ar { color: #8B0000; font-size: 14px; font-weight: bold; margin-top: 3px; }
            .logo-img { width: 60px; height: auto; }
            .info-row { display: flex; justify-content: space-between; margin: 10px 0; font-size: 12px; }
            .subject { text-align: center; margin: 20px 0; font-size: 16px; font-weight: bold; }
            .body-text { text-align: right; font-size: 12px; line-height: 2; margin: 15px 0; }
            .body-text p { margin-bottom: 10px; }
            table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 11px; }
            th, td { border: 1px solid #333; padding: 6px 8px; text-align: center; }
            th { background: #f0f0f0; font-weight: bold; }
            .signature { text-align: left; margin-top: 30px; font-weight: bold; font-size: 12px; }
            .footer { text-align: center; font-size: 9px; color: #666; margin-top: 30px; border-top: 1px solid #000; padding-top: 8px; direction: ltr; }
          </style>
        </head>
        <body>
          <div class="header">
            <div class="header-fr">République Tunisienne<br>Ministère des Affaires Sociales<br>et des Tunisiens à l'Étranger</div>
            <div class="header-ar">الجمهورية التونسية<br>وزارة الشؤون الاجتماعية والتضامن<br>والتونسيين بالخارج</div>
          </div>
          <div class="logo-box">
            <img class="logo-img" src="${logoUrl}" alt="CNSS">
            <div>
              <div class="logo-fr">Caisse Nationale de Sécurité Sociale</div>
              <div class="logo-ar">الصندوق الوطني للضمان الاجتماعي</div>
            </div>
          </div>
          <div class="info-row">
            <div style="text-align: right;">المكتب الجهوي بتونس المدينة<br>شارع مدريد - تونس 12</div>
            <div style="text-align: left; direction: ltr;">تونس في ${dateStr}</div>
          </div>
          <div style="text-align: right; margin: 10px 0; font-size: 12px;">
            <strong>رقم الإنخراط:</strong> ${debit.numAffiliation || debit.number}<br>
            <strong>رقم التسجيل:</strong> ${debit.matricule || ''}
          </div>
          <div style="text-align: right; margin: 15px 0; font-size: 12px;">
            <strong>السيد/ة :</strong> ${debit.employerName}<br>
            <strong>العنوان :</strong> ${debit.adresse || ''}
          </div>
          <div class="body-text">
            <p>أما بعد،</p>
            <p>أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني،</p>
            <p>طبقا للأمر عدد 1879 لسنة 2007،</p>
            <p>لسنة <strong>${annee}</strong> الثلاثية <strong>${trimestreNum}</strong> الموافق في 23 جويلية 2007، بدفوعل الثلاث</p>
            <p>مفصلا كما يلي سنة آلاف و تسعة مائة و واحد و خمسون دينار و 285 مليم حدد ب</p>
          </div>
          <table>
            <tr><th>المبلغ</th><th>النسبة (%)</th><th>قاعدة الإحتساب (د.ت)</th><th>النظام</th><th>الرمز</th></tr>
            <tr><td>${(salaire * 0.135).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>13.5</td><td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>جرايات الشيخوخة و العجز و الباقين على قيد الحياة</td><td>133</td></tr>
            <tr><td>0.000</td><td>0</td><td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>التأمينات الاجتماعية</td><td>0</td></tr>
            <tr><td>${(salaire * 0.735 * 0.09).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>9</td><td>${(salaire * 0.735).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>(*) النظام التكميلي للجرايات</td><td>91</td></tr>
            <tr><td>${(salaire * 0.02).toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>2</td><td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td>لا يوجد تغطية تأمين صحي من قبل CNAM</td><td>134</td></tr>
            <tr style="font-weight: bold; background: #fffacd;"><td>${total.toLocaleString('fr-FR', {minimumFractionDigits: 3})}</td><td colspan="4">المجملة</td></tr>
          </table>
          <div class="body-text">
            <p>(*) الجزء الذي يفوق 6 مرات الأجر الأدنى</p>
            <p>هذا ويمكنكم تسديد مساهماتكم بواسطة <strong>${dateLimiteStr}</strong> فالمرغوب منكم تسديد هذا المبلغ في أجل لا يتجاوز</p>
            <p>تحويل بريدي أو بنكي إلى الحساب الجاري للصندوق لدى الشركة التونسية للبنك عدد: <strong>10104059103466578833</strong></p>
            <p>أو إلى الحساب الجاري البريدي للصندوق عدد: <strong>17001000000000733217</strong></p>
            <p style="background: #fffacd; padding: 8px; border-radius: 4px; margin: 10px 0;">كما يمكنكم تكليف من تريدون بتسديد المساهمات مباشرة بشباليك المكتب الجهوري بتونس المدينة</p>
            <p>يغرم الصندوق بتحميل مبالغها طبقا للنسب ب <strong>${dateLimitePlus2Ans}</strong> و في صورة عدم دفع مساهماتكم في أجل أقصاه</p>
            <p>المنصوص</p>
            <p>عليها بالقانون عدد 105 لسنة 1995 المؤرخ في 14 ديسمبر 1995 و المتعلق بإحداث نظام موحد لضم الخدمات بعنوان</p>
            <p>أنظمة التقاعد و العجز والباقين على قيد الحياة</p>
            <p style="margin-top: 15px;">مع فائق الاحترام والتقدير</p>
            <p><strong>والسلام</strong></p>
          </div>
          <div class="signature">رئيس المكتب الجهوري بتونس المدينة</div>
          <div class="footer">© CNSS - Caisse Nationale de Sécurité Sociale - Document généré le ${dateStr}</div>
        </body>
        </html>
      `);
      iframeDoc.close();
      
      setTimeout(() => {
        const html2canvas = (window as any).html2canvas;
        html2canvas(iframeDoc.body, { 
          scale: 2, useCORS: true, logging: false, backgroundColor: '#ffffff',
          windowWidth: 794, windowHeight: 1123
        }).then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('p', 'mm', 'a4');
          const imgData = canvas.toDataURL('image/png');
          doc.addImage(imgData, 'PNG', 0, 0, 210, 297);
          
          const pdfBase64 = doc.output('datauristring').split(',')[1];
          document.body.removeChild(iframe);
          resolve(pdfBase64);
        }).catch((err: any) => {
          document.body.removeChild(iframe);
          reject(err);
        });
      }, 2000);
    });
  }
}
