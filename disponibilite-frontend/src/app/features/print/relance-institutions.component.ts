import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CotisationService, Cotisation } from '../../services/cotisation.service';

interface InstitutionRelance {
  numAffiliation: string;
  branche: string;
  raisonSociale: string;
  securiteSociale: number;
  complementaire: number;
  total: number;
  cotisations: Cotisation[];
}

@Component({
  selector: 'app-relance-institutions',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <!-- Screen View -->
    <div class="bg-white rounded-xl shadow-lg overflow-hidden print:hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center gap-3">
        <span class="material-icons">warning</span>
        <div>
          <h2 class="font-bold text-lg">إعلام حول تأخير المؤسسات للتسديد</h2>
          <p class="text-rose-200 text-sm">Relance des institutions en retard de paiement</p>
        </div>
      </div>

      <!-- Form -->
      <div class="p-6">
        <div class="max-w-3xl mx-auto">
          <!-- Trimestre/Année -->
          <div class="mb-6">
            <label class="block text-sm font-medium text-gray-600 mb-1">الثلاثية / السنة</label>
            <div class="flex gap-2">
              <select [(ngModel)]="trimestre" class="border border-gray-300 rounded-lg px-3 py-2">
                <option [value]="1">T1 (Jan-Mar)</option>
                <option [value]="2">T2 (Avr-Juin)</option>
                <option [value]="3">T3 (Juil-Sep)</option>
                <option [value]="4">T4 (Oct-Déc)</option>
              </select>
              <input [(ngModel)]="annee" type="number" class="w-28 border border-gray-300 rounded-lg px-3 py-2">
            </div>
          </div>

          <!-- Mode Selection -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            <!-- إعلام المؤسسات المشغلة -->
            <div class="bg-gray-50 rounded-xl p-4 border">
              <h4 class="font-bold text-gray-800 mb-3">إعلام المؤسسات المشغلة</h4>
              <div class="space-y-2">
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="modeInstitution" value="ALL" class="text-rose-600">
                  <span class="text-sm">كافة المؤسسات</span>
                </label>
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="modeInstitution" value="ONE" class="text-rose-600">
                  <span class="text-sm">مؤسسة واحدة</span>
                </label>
              </div>
              <div *ngIf="modeInstitution === 'ONE'" class="mt-3 space-y-2">
                <input [(ngModel)]="institutionId" placeholder="رقم الانخراط (64759)" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
              </div>
            </div>

            <!-- Filter by Status -->
            <div class="bg-gray-50 rounded-xl p-4 border">
              <h4 class="font-bold text-gray-800 mb-3">حالة المساهمات</h4>
              <div class="space-y-2">
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="statusFilter" value="EN_ATTENTE" class="text-rose-600">
                  <span class="text-sm">في الانتظار (EN_ATTENTE)</span>
                </label>
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="statusFilter" value="ALL" class="text-rose-600">
                  <span class="text-sm">الكل</span>
                </label>
              </div>
            </div>
          </div>

          <div class="flex gap-3 justify-center">
            <button (click)="search()" [disabled]="loading" class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 disabled:opacity-50">
              <span class="material-icons" [class.animate-spin]="loading">{{ loading ? 'sync' : 'search' }}</span>
              بحث
            </button>
            <button (click)="printReport()" [disabled]="!results.length" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 flex items-center gap-2 disabled:opacity-50">
              <span class="material-icons">print</span>
              طباعة الإعلام
            </button>
          </div>
        </div>

        <!-- Results Table -->
        <div *ngIf="results.length" class="mt-8">
          <h4 class="font-bold text-gray-800 mb-4">المساهمات / Cotisations - {{ results.length }} مؤسسة(ات)</h4>
          <table class="w-full text-sm">
            <thead class="bg-red-50">
              <tr>
                <th class="px-3 py-2 text-right font-medium border-b">رقم الانخراط</th>
                <th class="px-3 py-2 text-right font-medium border-b">المؤسسة</th>
                <th class="px-3 py-2 text-right font-medium border-b">النظام الأساسي</th>
                <th class="px-3 py-2 text-right font-medium border-b">النظام التكميلي</th>
                <th class="px-3 py-2 text-right font-medium border-b">المجموع</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let r of results" class="border-b hover:bg-gray-50">
                <td class="px-3 py-2 font-mono">{{ r.numAffiliation }}/{{ r.branche }}</td>
                <td class="px-3 py-2">{{ r.raisonSociale }}</td>
                <td class="px-3 py-2 font-mono">{{ r.securiteSociale | number:'1.3-3' }}</td>
                <td class="px-3 py-2 font-mono">{{ r.complementaire | number:'1.3-3' }}</td>
                <td class="px-3 py-2 font-mono font-bold text-rose-700">{{ r.total | number:'1.3-3' }}</td>
              </tr>
            </tbody>
            <tfoot class="bg-gray-100 font-bold">
              <tr>
                <td colspan="4" class="px-3 py-2 text-left">المجموع العام</td>
                <td class="px-3 py-2 font-mono text-rose-700">{{ grandTotal | number:'1.3-3' }}</td>
              </tr>
            </tfoot>
          </table>
        </div>

        <div *ngIf="error" class="mt-4 p-3 bg-red-50 border border-red-200 rounded text-red-700 text-sm">
          {{ error }}
        </div>
      </div>
    </div>

  `
})
export class RelanceInstitutionsComponent {
  trimestre = Math.ceil((new Date().getMonth() + 1) / 3);
  annee = new Date().getFullYear();
  modeInstitution = 'ALL';
  statusFilter = 'EN_ATTENTE';
  institutionId = '';
  branche = '';
  loading = false;
  error = '';
  results: InstitutionRelance[] = [];
  grandTotal = 0;
  today = new Date().toLocaleDateString('ar-TN');

  constructor(private cotisationService: CotisationService) {}

  search(): void {
    this.loading = true;
    this.error = '';
    this.results = [];
    this.grandTotal = 0;

    this.cotisationService.findAll(this.annee, this.trimestre).subscribe({
      next: (cotisations) => {
        // Filter by status if needed
        let filtered = cotisations;
        if (this.statusFilter === 'EN_ATTENTE') {
          filtered = cotisations.filter(c => c.statut === 'EN_ATTENTE');
        }

        // Filter by institution if specific one selected
        if (this.modeInstitution === 'ONE' && this.institutionId) {
          filtered = filtered.filter(c => 
            c.institution?.numAffiliation === this.institutionId
          );
        }

        // Group by institution
        const grouped = new Map<string, InstitutionRelance>();
        for (const c of filtered) {
          const key = c.institution?.numAffiliation + '/' + c.institution?.brancheSociale;
          if (!grouped.has(key)) {
            grouped.set(key, {
              numAffiliation: c.institution?.numAffiliation || '',
              branche: c.institution?.brancheSociale || '',
              raisonSociale: c.institution?.raisonSociale || '',
              securiteSociale: 0,
              complementaire: 0,
              total: 0,
              cotisations: []
            });
          }
          const inst = grouped.get(key)!;
          inst.securiteSociale += (c.montantCode137 || 0) + (c.montantCode138 || 0);
          inst.complementaire += (c.montantCode197 || 0) + (c.montantCode198 || 0);
          inst.total += c.montantTotal || 0;
          inst.cotisations.push(c);
        }

        this.results = Array.from(grouped.values());
        this.grandTotal = this.results.reduce((sum, r) => sum + r.total, 0);
        this.loading = false;
      },
      error: (err) => {
        this.error = 'خطأ في تحميل البيانات - Erreur de chargement';
        this.loading = false;
        console.error(err);
      }
    });
  }

  printReport(): void {
    const printWindow = window.open('', '_blank');
    if (!printWindow) return;

    const triNames: {[key: number]: string} = {1: 'الأولى', 2: 'الثانية', 3: 'الثالثة', 4: 'الرابعة'};
    const triName = triNames[this.trimestre] || this.trimestre;

    const tableRows = this.results.map(r => `
      <tr>
        <td style="border:1px solid #000;padding:8px;text-align:right;">${r.raisonSociale}</td>
        <td style="border:1px solid #000;padding:8px;text-align:center;">${r.numAffiliation}/${r.branche}</td>
        <td style="border:1px solid #000;padding:8px;text-align:center;">${r.securiteSociale.toFixed(3)}</td>
        <td style="border:1px solid #000;padding:8px;text-align:center;">${r.complementaire.toFixed(3)}</td>
        <td style="border:1px solid #000;padding:8px;text-align:center;font-weight:bold;">${r.total.toFixed(3)}</td>
        <td style="border:1px solid #000;padding:8px;"></td>
      </tr>
    `).join('');

    printWindow.document.write(`
      <!DOCTYPE html>
      <html dir="rtl" lang="ar">
      <head>
        <meta charset="UTF-8">
        <title>إعلام حول تأخير المؤسسات</title>
        <style>
          body { font-family: 'Traditional Arabic', 'Arial', sans-serif; padding: 20px 40px; direction: rtl; font-size: 14px; line-height: 1.6; }
          .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px; border-bottom: 1px solid #000; padding-bottom: 10px; }
          .header-right { text-align: right; font-size: 12px; }
          .header-center { text-align: center; flex: 1; }
          .header-left { text-align: left; font-size: 11px; }
          .cnss-title { font-weight: bold; font-size: 16px; text-decoration: underline; }
          .office-box { background: #000; color: white; padding: 5px 20px; display: inline-block; margin-top: 8px; font-size: 13px; }
          .title-box { text-align: center; margin: 25px auto; max-width: 600px; border: 2px solid #000; padding: 15px 20px; }
          .title-box h2 { font-size: 16px; font-weight: bold; line-height: 1.6; margin: 0; }
          .title-box p { font-size: 13px; margin: 8px 0 0; }
          .info { margin: 20px 0; font-size: 14px; }
          .info p { margin: 4px 0; }
          table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 12px; }
          th, td { border: 1px solid #000; padding: 8px; text-align: center; }
          th { background: #f5f5f5; font-weight: bold; }
          .signature { margin-top: 60px; }
          .btn-bar { text-align: center; margin: 20px 0; }
          .btn-bar button { padding: 10px 30px; margin: 0 10px; font-size: 14px; cursor: pointer; border: none; border-radius: 6px; }
          .btn-print { background: #9f1239; color: white; }
          .btn-cancel { background: #6b7280; color: white; }
          @media print { .btn-bar { display: none !important; } body { padding: 15px; } }
        </style>
      </head>
      <body>
        <div class="btn-bar">
          <button class="btn-print" onclick="window.print()">🖨️ طباعة</button>
          <button class="btn-cancel" onclick="window.close()">✕ إلغاء</button>
        </div>

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
            <div style="margin-top:8px;font-weight:bold;">Caisse Nationale</div>
            <div style="font-weight:bold;">de Sécurité Sociale</div>
          </div>
        </div>

        <div class="title-box">
          <h2>إعلام حول تأخير أو إخلال المؤسسات المشغلة في تسديد المساهمات المحمولة عليها</h2>
          <p>طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24 فيفري 2003</p>
        </div>

        <div class="info">
          <p><strong>الثلاثية :</strong> ${triName} - ${this.annee}</p>
          <p><strong>تاريخ الطباعة :</strong> ${new Date().toLocaleDateString('fr-TN')}</p>
        </div>

        <table>
          <thead>
            <tr>
              <th rowspan="2" style="vertical-align:middle;width:25%;">المؤسسة المشغلة</th>
              <th rowspan="2" style="vertical-align:middle;width:12%;">رقم الانخراط</th>
              <th colspan="3">المساهمات</th>
              <th rowspan="2" style="vertical-align:middle;width:12%;">ملاحظات</th>
            </tr>
            <tr>
              <th style="font-size:11px;">النظام الأساسي<br/>للضمان الاجتماعي</th>
              <th style="font-size:11px;">النظام التكميلي</th>
              <th style="font-size:11px;">المجموع</th>
            </tr>
          </thead>
          <tbody>
            ${tableRows}
          </tbody>
          <tfoot>
            <tr style="font-weight:bold;background:#f5f5f5;">
              <td colspan="2" style="border:1px solid #000;padding:8px;text-align:center;">المجموع العام</td>
              <td style="border:1px solid #000;padding:8px;"></td>
              <td style="border:1px solid #000;padding:8px;"></td>
              <td style="border:1px solid #000;padding:8px;text-align:center;">${this.grandTotal.toFixed(3)}</td>
              <td style="border:1px solid #000;padding:8px;"></td>
            </tr>
          </tfoot>
        </table>

        <div class="signature">
          <div style="text-align:right;">تونس في: ............................</div>
          <div style="text-align:right;margin-top:40px;font-weight:bold;">مدير الاستخلاص والمراقبة</div>
        </div>
      </body>
      </html>
    `);
    printWindow.document.close();
  }
}
