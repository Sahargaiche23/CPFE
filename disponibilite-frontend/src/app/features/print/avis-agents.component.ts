import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { InstitutionService } from '../../services/institution.service';
import { CotisationService } from '../../services/cotisation.service';
import { AgentService } from '../../services/agent.service';

interface CotisationRow {
  cotisationId: number;
  numInscription: string;
  nomAgent: string;
  code: string;
  salaire: number;
  montantDu: number;
}

@Component({
  selector: 'app-avis-agents',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center gap-3">
        <span class="material-icons">mail</span>
        <div>
          <h2 class="font-bold text-lg">إشعار للخلاص بالنسبة للأعوان</h2>
          <p class="text-rose-200 text-sm">Avis de paiement pour les agents</p>
        </div>
      </div>

      <!-- Form -->
      <div class="p-6">
        <div class="max-w-3xl mx-auto">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">الثلاثية / السنة</label>
              <div class="flex gap-2">
                <select [(ngModel)]="trimestre" class="flex-1 border border-gray-300 rounded-lg px-3 py-2">
                  <option [value]="1">T1</option>
                  <option [value]="2">T2</option>
                  <option [value]="3">T3</option>
                  <option [value]="4">T4</option>
                </select>
                <input [(ngModel)]="annee" type="number" class="w-28 border border-gray-300 rounded-lg px-3 py-2">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">رقم الإنخراط / N° Affiliation</label>
              <div class="flex gap-2">
                <input [(ngModel)]="branche" (blur)="loadByAffiliation()" class="w-16 border border-gray-300 rounded-lg px-3 py-2" placeholder="60">
                <input [(ngModel)]="institutionNum" (blur)="loadByAffiliation()" class="flex-1 border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
              </div>
              <div *ngIf="selectedInstitution" class="mt-1 text-sm text-green-600">{{ selectedInstitution.raisonSociale }}</div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">العون العمومي / Agent</label>
              <div *ngIf="agentsList.length > 0" class="space-y-1">
                <div *ngFor="let ag of agentsList" class="text-sm bg-gray-50 rounded px-3 py-1.5 flex justify-between items-center">
                  <span>{{ ag.prenom }} {{ ag.nom }} — {{ ag.numInscription }}</span>
                  <span class="text-gray-500 text-xs">تاريخ الإلحاق: {{ ag.dateDebutIlhaq }}</span>
                </div>
              </div>
              <div *ngIf="agentsList.length === 0 && selectedInstitution" class="text-sm text-gray-400 mt-1">لا يوجد أعوان</div>
            </div>
          </div>

          <div class="flex gap-3 justify-center">
            <button (click)="search()" [disabled]="!selectedInstitution" class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 flex items-center gap-2">
              <span class="material-icons">search</span>
              بحث
            </button>
            <button (click)="print()" [disabled]="cotisations.length === 0" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 disabled:opacity-50 flex items-center gap-2">
              <span class="material-icons">print</span>
              طباعة
            </button>
          </div>

          <div *ngIf="message" class="mt-4 text-center" [class.text-red-600]="error" [class.text-green-600]="!error">
            {{ message }}
          </div>

          <div *ngIf="loading" class="mt-4 text-center text-gray-500">جاري التحميل...</div>
        </div>

        <!-- Preview -->
        <div *ngIf="cotisations.length > 0" class="mt-8 border border-gray-300 rounded-xl p-8 bg-white max-w-4xl mx-auto" dir="rtl">
          <!-- Institution Info -->
          <div class="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
            <div class="grid grid-cols-2 gap-2 text-sm">
              <p><strong>المؤسسة :</strong> {{ selectedInstitution?.raisonSociale }}</p>
              <p><strong>رقم الإنخراط :</strong> {{ branche }}-{{ institutionNum }}</p>
              <p><strong>رقم التسجيل :</strong> {{ getUniqueNumInscriptions() }}</p>
              <p><strong>العنوان :</strong> {{ selectedInstitution?.adresse }}</p>
            </div>
          </div>

          <div class="text-sm text-gray-500 mb-2">الثلاثي {{ trimestre }} / {{ annee }}</div>

          <table class="w-full text-sm border border-gray-400 mb-4">
            <thead class="bg-gray-100">
              <tr>
                <th class="border border-gray-400 px-3 py-2">اسم ولقب العون المعني</th>
                <th class="border border-gray-400 px-3 py-2">الرمز</th>
                <th class="border border-gray-400 px-3 py-2">رقم المضمون الاجتماعي</th>
                <th class="border border-gray-400 px-3 py-2">مبلغ الأجر</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let c of cotisations">
                <td class="border border-gray-400 px-3 py-2">{{ c.code === '137' || c.code === '197' ? (selectedInstitution?.raisonSociale || '') : c.nomAgent }}</td>
                <td class="border border-gray-400 px-3 py-2">{{ c.code }}</td>
                <td class="border border-gray-400 px-3 py-2 font-mono">{{ c.numInscription }}</td>
                <td class="border border-gray-400 px-3 py-2 font-mono">{{ c.montantDu.toFixed(3) }}</td>
              </tr>
            </tbody>
          </table>

          <!-- Summary -->
          <table class="w-full text-sm border border-gray-400 mb-4">
            <tr>
              <td class="border border-gray-400 px-3 py-2 text-right w-3/4"><strong>جملة الأجور</strong></td>
              <td class="border border-gray-400 px-3 py-2 font-mono text-right">{{ getTotalSalaires().toFixed(3) }}</td>
            </tr>
            <tr>
              <td class="border border-gray-400 px-3 py-2 text-right"><strong>النظام الأساسي (المشغل) %17.07</strong></td>
              <td class="border border-gray-400 px-3 py-2 font-mono text-right">{{ getTotal137().toFixed(3) }}</td>
            </tr>
            <tr>
              <td class="border border-gray-400 px-3 py-2 text-right"><strong>النظام الأساسي (العون) %9.68</strong></td>
              <td class="border border-gray-400 px-3 py-2 font-mono text-right">{{ getTotal138().toFixed(3) }}</td>
            </tr>
            <tr>
              <td class="border border-gray-400 px-3 py-2 text-right"><strong>مساهمات النظام التكميلي للجرايات</strong></td>
              <td class="border border-gray-400 px-3 py-2 font-mono text-right">{{ getTotalComplementary().toFixed(3) }}</td>
            </tr>
            <tr class="bg-gray-100">
              <td class="border border-gray-400 px-3 py-2 text-right"><strong>المجموع</strong></td>
              <td class="border border-gray-400 px-3 py-2 font-mono text-right font-bold text-rose-700">{{ totalAmount.toFixed(3) }}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  `,
  styles: [`
    @media print {
      :host { display: block; }
    }
  `]
})
export class AvisAgentsComponent implements OnInit {
  private institutionService = inject(InstitutionService);
  private cotisationService = inject(CotisationService);
  private agentService = inject(AgentService);

  trimestre: any = 1;
  annee: any = 2026;
  institutions: any[] = [];
  selectedInstitutionId: any = '';
  selectedInstitution: any = null;
  institutionNum = '';
  branche = '';
  agentsList: any[] = [];
  selectedAgentId: any = '';
  agentNum = '';
  dateIlhaq = '';
  cotisations: CotisationRow[] = [];
  totalAmount = 0;
  loading = false;
  message = '';
  error = false;

  ngOnInit(): void {}

  loadByAffiliation(): void {
    if (!this.institutionNum) return;

    this.selectedInstitution = null;
    this.agentsList = [];
    this.cotisations = [];
    this.agentNum = '';

    this.institutionService.findAll().subscribe({
      next: (all: any[]) => {
        let filtered = all.filter(i => i.numAffiliation === this.institutionNum);
        if (this.branche) {
          filtered = filtered.filter(i => i.brancheSociale === this.branche);
        }
        if (filtered.length === 0) return;

        this.selectedInstitution = filtered[0];

        // Auto-load agents for this institution
        this.agentService.findByInstitution(this.selectedInstitution.id).subscribe({
          next: (agents) => {
            this.agentsList = agents;
          }
        });
      }
    });
  }

  search(): void {
    if (!this.selectedInstitution) {
      this.message = 'يرجى إدخال رقم الإنخراط';
      this.error = true;
      return;
    }

    this.loading = true;
    this.message = '';
    this.error = false;
    this.cotisations = [];
    this.loadCotisations();
  }

  private loadCotisations(): void {
    this.cotisationService.findByInstitution(this.selectedInstitution.id, +this.annee).subscribe({
      next: (allCotisations) => {
        let filtered = allCotisations.filter((c: any) => c.trimestre === +this.trimestre);

        // Filter by agent if provided
        if (this.agentNum) {
          filtered = filtered.filter((c: any) => c.agentPublic?.numInscription === this.agentNum);
        }

        this.cotisations = [];
        for (const c of filtered) {
          if (c.montantCode137 > 0) {
            this.cotisations.push({
              cotisationId: c.id || 0,
              numInscription: c.agentPublic?.numInscription || '',
              nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
              code: '137',
              salaire: c.salaireMensuelApplique || 0,
              montantDu: c.montantCode137
            });
          }
          if (c.montantCode138 > 0) {
            this.cotisations.push({
              cotisationId: c.id || 0,
              numInscription: c.agentPublic?.numInscription || '',
              nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
              code: '138',
              salaire: c.salaireMensuelApplique || 0,
              montantDu: c.montantCode138
            });
          }
          if (c.montantCode197 && c.montantCode197 > 0) {
            this.cotisations.push({
              cotisationId: c.id || 0,
              numInscription: c.agentPublic?.numInscription || '',
              nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
              code: '197',
              salaire: c.salaireMensuelApplique || 0,
              montantDu: c.montantCode197
            });
          }
          if (c.montantCode198 && c.montantCode198 > 0) {
            this.cotisations.push({
              cotisationId: c.id || 0,
              numInscription: c.agentPublic?.numInscription || '',
              nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
              code: '198',
              salaire: c.salaireMensuelApplique || 0,
              montantDu: c.montantCode198
            });
          }
        }

        this.totalAmount = this.cotisations.reduce((s, c) => s + c.montantDu, 0);
        this.loading = false;

        if (this.cotisations.length === 0) {
          this.message = 'لا توجد مساهمات لهذه الفترة';
          this.error = false;
        }
      },
      error: () => {
        this.message = 'خطأ في تحميل المساهمات';
        this.error = true;
        this.loading = false;
      }
    });
  }

  getUniqueNumInscriptions(): string {
    return [...new Set(this.cotisations.map(c => c.numInscription))].join(' - ');
  }

  getTotal137(): number {
    return this.cotisations.filter(c => c.code === '137').reduce((s, c) => s + c.montantDu, 0);
  }

  getTotal138(): number {
    return this.cotisations.filter(c => c.code === '138').reduce((s, c) => s + c.montantDu, 0);
  }

  getTotalComplementary(): number {
    return this.cotisations.filter(c => c.code === '197' || c.code === '198').reduce((s, c) => s + c.montantDu, 0);
  }

  getTotalSalaires(): number {
    const seen = new Set<number>();
    let total = 0;
    for (const c of this.cotisations) {
      if (!seen.has(c.cotisationId)) {
        seen.add(c.cotisationId);
        total += (c.salaire || 0) * 3;
      }
    }
    return total;
  }

  print(): void {
    const triNames: {[key: number]: string} = {1: 'الأولى', 2: 'الثانية', 3: 'الثالثة', 4: 'الرابعة'};
    const totalInWords = this.convertToArabicWords(this.totalAmount);
    const today = new Date().toLocaleDateString('fr-TN');

    const printWindow = window.open('', '_blank');
    if (!printWindow) return;

    printWindow.document.write(`
      <!DOCTYPE html>
      <html dir="rtl" lang="ar">
      <head>
        <meta charset="UTF-8">
        <title>إعلام لدفع المساهمات</title>
        <style>
          body { font-family: 'Traditional Arabic', 'Arial', sans-serif; padding: 20px 40px; direction: rtl; font-size: 14px; line-height: 1.6; }
          .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px; border-bottom: 1px solid #000; padding-bottom: 10px; }
          .header-right { text-align: right; font-size: 12px; }
          .header-center { text-align: center; flex: 1; }
          .header-left { text-align: left; font-size: 11px; }
          .cnss-title { font-weight: bold; font-size: 16px; text-decoration: underline; }
          .office-box { background: #000; color: white; padding: 5px 20px; display: inline-block; margin-top: 8px; font-size: 13px; }
          .date { text-align: left; margin: 15px 0; font-size: 13px; }
          .institution-box { display: flex; align-items: center; margin: 25px 0; padding: 0 50px; }
          .bracket { font-size: 90px; font-weight: 100; line-height: 0.8; font-family: Arial; color: #000; }
          .box-content { flex: 1; padding: 10px 15px; }
          .box-content p { margin: 6px 0; font-size: 14px; }
          .subject { font-weight: bold; font-size: 15px; margin: 20px 0; text-decoration: underline; }
          .body-text { text-align: justify; margin-bottom: 15px; font-size: 13px; }
          .amount-text { font-weight: bold; margin: 10px 0; font-size: 14px; }
          table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 12px; }
          th, td { border: 1px solid #000; padding: 6px; text-align: center; }
          th { background: #f5f5f5; font-weight: bold; }
          .summary { margin-top: 15px; }
          .summary td { text-align: right; padding: 5px 10px; }
          .summary td:first-child { width: 70%; }
          .footer { margin-top: 20px; font-size: 11px; color: #666; }
          @media print { body { padding: 15px; } }
        </style>
      </head>
      <body>
        <div class="header">
          <div class="header-right">
            <div>الجمهورية التونسية</div>
            <div>وزارة الشؤون الاجتماعية و التضامن</div>
            <div>و التونسيين بالخارج</div>
          </div>
          <div class="header-center">
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" style="height:70px;">
            <div class="cnss-title">الصندوق الوطني للضمان الاجتماعي</div>
            <div class="office-box">المكتب الجهوي: تونس المدينة</div>
          </div>
          <div class="header-left">
            <div>République Tunisienne</div>
            <div>Ministère des Affaires Sociales et de solidarité</div>
            <div>et des Tunisiens à l'Étranger</div>
            <div style="margin-top: 8px; font-weight: bold;">Caisse Nationale</div>
            <div style="font-weight: bold;">de Sécurité Sociale</div>
          </div>
        </div>

        <div class="date">${today}</div>

        <div class="institution-box">
          <span class="bracket">[</span>
          <div class="box-content">
            <p><strong>المؤسسة :</strong> ${this.selectedInstitution?.raisonSociale || ''}</p>
            <p><strong>رقم الإنخراط:</strong> ${this.branche || ''}-${this.institutionNum || ''}</p>
            <p><strong>رقم التسجيل :</strong> ${[...new Set(this.cotisations.map(c => c.numInscription))].join(' - ')}</p>
            <p><strong>العنوان :</strong> ${this.selectedInstitution?.adresse || ''}</p>
          </div>
          <span class="bracket">]</span>
        </div>

        <div class="subject">الموضوع: إعلام لدفع المساهمات</div>

        <div class="body-text">
          أما بعد،<br>
          أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية
          الاجتماعية للأعوان العموميين المحالين على عدم المباشرة الخاصة، طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24
          فيفري 2003، بعنوان الثلاثي ${triNames[+this.trimestre]} لسنة ${this.annee}
        </div>

        <div class="amount-text">
          حدد بـ ${totalInWords}
        </div>

        <table>
          <thead>
            <tr>
              <th>اسم ولقب العون المعني</th>
              <th>الرمز</th>
              <th>رقم المضمون الاجتماعي</th>
              <th>مبلغ الأجر</th>
            </tr>
          </thead>
          <tbody>
            ${this.cotisations.map(c => `
              <tr>
                <td>${c.code === '137' || c.code === '197' ? (this.selectedInstitution?.raisonSociale || '') : c.nomAgent}</td>
                <td>${c.code}</td>
                <td>${c.numInscription}</td>
                <td>${c.montantDu.toFixed(3)}</td>
              </tr>
            `).join('')}
          </tbody>
        </table>

        <table class="summary">
          <tr>
            <td><strong>جملة الأجور</strong></td>
            <td>${this.getTotalSalaires().toFixed(3)}</td>
          </tr>
          <tr>
            <td><strong>النظام الأساسي (المشغل) %17.07</strong></td>
            <td>${this.cotisations.filter(c => c.code === '137').reduce((s, c) => s + c.montantDu, 0).toFixed(3)}</td>
          </tr>
          <tr>
            <td><strong>النظام الأساسي (العون) %9.68</strong></td>
            <td>${this.cotisations.filter(c => c.code === '138').reduce((s, c) => s + c.montantDu, 0).toFixed(3)}</td>
          </tr>
          <tr>
            <td><strong>مساهمات النظام التكميلي للجرايات</strong></td>
            <td>${this.cotisations.filter(c => c.code === '197' || c.code === '198').reduce((s, c) => s + c.montantDu, 0).toFixed(3)}</td>
          </tr>
          <tr>
            <td><strong>المجموع</strong></td>
            <td><strong>${this.totalAmount.toFixed(3)}</strong></td>
          </tr>
        </table>

        <div class="footer">
          <p>تاريخ الطباعة: ${today}</p>
        </div>
      </body>
      </html>
    `);
    printWindow.document.close();
    printWindow.print();
  }

  private convertToArabicWords(amount: number): string {
    const intPart = Math.floor(amount);
    const decPart = Math.round((amount - intPart) * 1000);

    const ones = ['صفر', 'واحد', 'اثنان', 'ثلاثة', 'أربعة', 'خمسة', 'ستة', 'سبعة', 'ثمانية', 'تسعة'];
    const teens = ['عشرة', 'أحد عشر', 'اثنا عشر', 'ثلاثة عشر', 'أربعة عشر', 'خمسة عشر', 'ستة عشر', 'سبعة عشر', 'ثمانية عشر', 'تسعة عشر'];
    const tens = ['', 'عشرة', 'عشرون', 'ثلاثون', 'أربعون', 'خمسون', 'ستون', 'سبعون', 'ثمانون', 'تسعون'];
    const hundreds = ['', 'مائة', 'مائتان', 'ثلاثمائة', 'أربعمائة', 'خمسمائة', 'ستمائة', 'سبعمائة', 'ثمانمائة', 'تسعمائة'];

    const convertHundreds = (n: number): string => {
      let result = '';
      if (n >= 100) {
        result += hundreds[Math.floor(n / 100)];
        n = n % 100;
        if (n > 0) result += ' و ';
      }
      if (n >= 10 && n <= 19) {
        result += teens[n - 10];
      } else if (n >= 20) {
        const unit = n % 10;
        const ten = Math.floor(n / 10);
        if (unit > 0) {
          result += ones[unit] + ' و ' + tens[ten];
        } else {
          result += tens[ten];
        }
      } else if (n > 0) {
        result += ones[n];
      }
      return result;
    };

    let result = '';
    const thousands = Math.floor(intPart / 1000);
    const remainder = intPart % 1000;

    if (thousands > 0) {
      if (thousands === 1) {
        result += 'ألف';
      } else if (thousands === 2) {
        result += 'ألفان';
      } else if (thousands >= 3 && thousands <= 10) {
        result += convertHundreds(thousands) + ' آلاف';
      } else {
        result += convertHundreds(thousands) + ' ألف';
      }
      if (remainder > 0) result += ' و ';
    }

    if (remainder > 0) {
      result += convertHundreds(remainder);
    } else if (thousands === 0) {
      result += 'صفر';
    }

    result += ' دينار';
    if (decPart > 0) {
      result += ' و ' + decPart + ' مليم';
    }

    return result.trim();
  }
}
