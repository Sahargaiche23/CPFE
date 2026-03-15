import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { AgentService } from '../../services/agent.service';
import { CotisationService, Cotisation } from '../../services/cotisation.service';

interface PaiementRow {
  trimestre: string;
  salaire: number;
  partAgent: number;
  partEmployeur: number;
  total: number;
}

@Component({
  selector: 'app-carte-paiement',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center gap-3">
        <span class="material-icons">credit_card</span>
        <div>
          <h2 class="font-bold text-lg">بطاقة خلاص</h2>
          <p class="text-rose-200 text-sm">Carte de paiement</p>
        </div>
      </div>

      <!-- Search -->
      <div class="p-6 border-b border-gray-200 bg-gray-50">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">رقم التسجيل / N° Inscription</label>
            <input [(ngModel)]="numInscription" class="w-full border border-gray-300 rounded-lg px-3 py-2"
                   (keyup.enter)="search()">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة / Institution</label>
            <input [value]="agent?.institution?.raisonSociale || ''" readonly
                   class="w-full border border-gray-200 rounded-lg px-3 py-2 bg-white">
          </div>
          <div class="flex items-end">
            <button (click)="search()" [disabled]="loading"
                    class="w-full py-2 bg-rose-600 text-white rounded-lg hover:bg-rose-700 flex items-center justify-center gap-2 disabled:opacity-50">
              <span class="material-icons" [class.animate-spin]="loading">{{ loading ? 'sync' : 'search' }}</span>
              بحث / Rechercher
            </button>
          </div>
        </div>
      </div>

      <!-- Card Content -->
      <div *ngIf="agent" class="p-6">
        <!-- Agent Info -->
        <div class="bg-rose-50 rounded-xl p-6 mb-6 border border-rose-200">
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
            <div>
              <p class="text-gray-500">رقم التسجيل</p>
              <p class="font-bold text-rose-800">{{ formatNumInscription(agent.numInscription) }}</p>
            </div>
            <div>
              <p class="text-gray-500">الاسم واللقب</p>
              <p class="font-bold">{{ agent.prenom || '' }} {{ agent.nom }}</p>
            </div>
            <div>
              <p class="text-gray-500">المؤسسة</p>
              <p class="font-bold">{{ agent.institution?.raisonSociale || '' }}</p>
            </div>
            <div>
              <p class="text-gray-500">رقم الانخراط</p>
              <p class="font-bold font-mono">{{ agent.institution?.numAffiliation || '' }}/{{ agent.institution?.brancheSociale || '' }}</p>
            </div>
          </div>
        </div>

        <!-- Payment History -->
        <h3 class="font-bold text-gray-800 mb-4 flex items-center gap-2">
          <span class="material-icons text-rose-600">history</span>
          تاريخ الخلاصات / Historique des paiements
        </h3>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-gray-100">
              <tr>
                <th class="px-4 py-3 text-right font-medium border-b">الثلاثية<br>Trimestre</th>
                <th class="px-4 py-3 text-right font-medium border-b">الأجور<br>Salaires</th>
                <th class="px-4 py-3 text-right font-medium border-b">المساهمات %9.68<br>Part Agent</th>
                <th class="px-4 py-3 text-right font-medium border-b">المساهمات %17.07<br>Part Employeur</th>
                <th class="px-4 py-3 text-right font-medium border-b">المجموع<br>Total</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let p of paiements" class="border-b hover:bg-gray-50">
                <td class="px-4 py-2 font-medium">{{ p.trimestre }}</td>
                <td class="px-4 py-2 font-mono">{{ p.salaire | number:'1.3-3' }}</td>
                <td class="px-4 py-2 font-mono">{{ p.partAgent | number:'1.3-3' }}</td>
                <td class="px-4 py-2 font-mono">{{ p.partEmployeur | number:'1.3-3' }}</td>
                <td class="px-4 py-2 font-mono font-bold">{{ p.total | number:'1.3-3' }}</td>
              </tr>
              <tr *ngIf="paiements.length === 0 && !loading">
                <td colspan="5" class="px-4 py-8 text-center text-gray-400">لا توجد مساهمات</td>
              </tr>
            </tbody>
            <tfoot *ngIf="paiements.length > 0" class="bg-rose-100 font-bold">
              <tr>
                <td class="px-4 py-3">المجموع</td>
                <td class="px-4 py-3 font-mono">{{ totalSalaire | number:'1.3-3' }}</td>
                <td class="px-4 py-3 font-mono">{{ totalAgent | number:'1.3-3' }}</td>
                <td class="px-4 py-3 font-mono">{{ totalEmployeur | number:'1.3-3' }}</td>
                <td class="px-4 py-3 font-mono text-rose-800">{{ grandTotal | number:'1.3-3' }}</td>
              </tr>
            </tfoot>
          </table>
        </div>

        <!-- Print Button -->
        <div *ngIf="paiements.length > 0" class="mt-6 text-center">
          <button (click)="print()" class="px-6 py-3 bg-rose-700 text-white rounded-lg hover:bg-rose-800 flex items-center gap-2 mx-auto">
            <span class="material-icons">print</span>
            طباعة البطاقة / Imprimer
          </button>
        </div>
      </div>

      <!-- Messages -->
      <div *ngIf="message" class="px-6 pb-4">
        <div [class]="error ? 'bg-red-50 text-red-700 border-red-200' : 'bg-green-50 text-green-700 border-green-200'"
             class="border px-4 py-3 rounded-lg text-sm">{{ message }}</div>
      </div>
    </div>
  `
})
export class CartePaiementComponent implements OnInit {
  numInscription = '';
  agent: any = null;
  paiements: PaiementRow[] = [];
  totalSalaire = 0;
  totalAgent = 0;
  totalEmployeur = 0;
  grandTotal = 0;
  loading = false;
  message = '';
  error = false;

  constructor(
    private route: ActivatedRoute,
    private agentService: AgentService,
    private cotisationService: CotisationService
  ) {}

  ngOnInit(): void {
    // Auto-search if numInscription is provided via query params
    this.route.queryParams.subscribe(params => {
      if (params['numInscription']) {
        this.numInscription = params['numInscription'];
        this.search();
      }
    });
  }

  formatNumInscription(num: string): string {
    if (!num || num.length < 3) return num;
    return num.substring(0, num.length - 2) + '/' + num.substring(num.length - 2);
  }

  search(): void {
    if (!this.numInscription) {
      this.message = 'يرجى إدخال رقم التسجيل';
      this.error = true;
      return;
    }

    this.loading = true;
    this.message = '';
    this.error = false;
    this.agent = null;
    this.paiements = [];

    this.agentService.searchByNumInscription(this.numInscription).subscribe({
      next: (agents) => {
        if (!agents || agents.length === 0) {
          this.message = 'عون غير موجود - Agent non trouvé';
          this.error = true;
          this.loading = false;
          return;
        }

        this.agent = agents[0];
        this.loadCotisations();
      },
      error: (err) => {
        console.error('Agent search error:', err);
        this.message = 'خطأ في البحث عن العون';
        this.error = true;
        this.loading = false;
      }
    });
  }

  private loadCotisations(): void {
    this.cotisationService.findByAgent(this.agent.id).subscribe({
      next: (cotisations) => {
        // Sort by year and trimestre
        cotisations.sort((a, b) => {
          if (a.annee !== b.annee) return a.annee - b.annee;
          return a.trimestre - b.trimestre;
        });

        // Convert to payment rows
        this.paiements = cotisations.map(c => {
          const salaire = (c.salaireMensuelApplique || 0) * 3;
          const partAgent = c.montantCode138 || 0;
          const partEmployeur = c.montantCode137 || 0;
          return {
            trimestre: c.annee + '/' + c.trimestre,
            salaire: salaire,
            partAgent: partAgent,
            partEmployeur: partEmployeur,
            total: partAgent + partEmployeur + (c.montantCode197 || 0) + (c.montantCode198 || 0)
          };
        });

        this.calculateTotals();
        this.loading = false;

        if (this.paiements.length === 0) {
          this.message = 'لا توجد مساهمات لهذا العون';
          this.error = false;
        }
      },
      error: (err) => {
        console.error('Cotisations load error:', err);
        this.message = 'خطأ في تحميل المساهمات';
        this.error = true;
        this.loading = false;
      }
    });
  }

  calculateTotals(): void {
    this.totalSalaire = this.paiements.reduce((s, p) => s + p.salaire, 0);
    this.totalAgent = this.paiements.reduce((s, p) => s + p.partAgent, 0);
    this.totalEmployeur = this.paiements.reduce((s, p) => s + p.partEmployeur, 0);
    this.grandTotal = this.totalAgent + this.totalEmployeur;
  }

  print(): void {
    const printWindow = window.open('', '_blank');
    if (!printWindow) return;

    const numInscFormatted = this.formatNumInscription(this.agent?.numInscription || '');
    const agentNom = (this.agent?.prenom || '') + ' ' + (this.agent?.nom || '');
    const instNom = this.agent?.institution?.raisonSociale || '';
    const numAff = (this.agent?.institution?.numAffiliation || '') + '/' + (this.agent?.institution?.brancheSociale || '');

    printWindow.document.write(`
      <!DOCTYPE html>
      <html dir="rtl" lang="ar">
      <head>
        <meta charset="UTF-8">
        <title>بطاقة خلاص</title>
        <style>
          body { font-family: 'Traditional Arabic', 'Arial', sans-serif; padding: 30px; direction: rtl; font-size: 13px; line-height: 1.6; }
          .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 15px; }
          .header-right { text-align: right; font-size: 13px; line-height: 1.8; }
          .header-left { text-align: left; font-size: 11px; line-height: 1.8; }
          .header-center { text-align: center; flex: 1; }
          .cnss-title { font-weight: bold; font-size: 15px; margin-top: 5px; }
          .office-box { display: inline-block; background: #2e7d32; color: #fff; padding: 3px 15px; border-radius: 10px; font-size: 11px; margin-top: 5px; }
          .title { text-align: center; font-weight: bold; font-size: 15px; margin: 20px 0; }
          .institution-box { display: flex; justify-content: flex-end; align-items: stretch; margin: 15px 0; }
          .bracket { font-size: 80px; font-weight: 100; line-height: 1; color: #333; }
          .box-content { padding: 5px 15px; text-align: right; }
          .box-content p { margin: 3px 0; font-size: 13px; }
          table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 12px; }
          th, td { border: 1px solid #000; padding: 6px 10px; text-align: center; }
          th { background: #f0f0f0; font-weight: bold; }
          .total-row { background: #f5f5f5; font-weight: bold; }
          .grand-total { text-align: left; font-size: 16px; font-weight: bold; margin-top: 15px; color: #c00; }
          .print-date { text-align: left; font-size: 11px; margin-top: 20px; color: #666; }
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

        <div class="title">
          المبالغ المستحقة لفترة عدم المباشرة الخاصة لـ ${agentNom} مضمون اجتماعي<br>
          عدد ${numInscFormatted}
        </div>

        <div class="institution-box">
          <span class="bracket">[</span>
          <div class="box-content">
            <p><strong>المنخرط :</strong> ${instNom}</p>
            <p><strong>عدد الانخراط :</strong> ${numAff}</p>
            <p><strong>رقم التسجيل :</strong> ${numInscFormatted}</p>
          </div>
          <span class="bracket">]</span>
        </div>

        <table>
          <thead>
            <tr>
              <th>الثلاثية</th>
              <th>الأجور</th>
              <th>المساهمات المحمولة<br>على الاجير %9.68</th>
              <th>المساهمات المحمولة<br>على المؤجر %17.07</th>
              <th>المجموع<br>Total</th>
            </tr>
          </thead>
          <tbody>
            ${this.paiements.map(p => `
              <tr>
                <td>${p.trimestre}</td>
                <td>${p.salaire.toFixed(3)}</td>
                <td>${p.partAgent.toFixed(3)}</td>
                <td>${p.partEmployeur.toFixed(3)}</td>
                <td>${p.total.toFixed(3)}</td>
              </tr>
            `).join('')}
            <tr class="total-row">
              <td>المجموع</td>
              <td>${this.totalSalaire.toFixed(3)}</td>
              <td>${this.totalAgent.toFixed(3)}</td>
              <td>${this.totalEmployeur.toFixed(3)}</td>
              <td style="color:#c00;">${this.grandTotal.toFixed(3)}</td>
            </tr>
          </tbody>
        </table>
        <div class="print-date">تاريخ الطباعة: ${new Date().toLocaleDateString('fr-TN')}</div>
      </body>
      </html>
    `);
    printWindow.document.close();
    printWindow.print();
  }
}
