import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { InstitutionService } from '../../services/institution.service';
import { CotisationService } from '../../services/cotisation.service';
import { AgentService } from '../../services/agent.service';
import { PaiementService } from '../../services/paiement.service';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-suivi-paiements',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center gap-3">
        <span class="material-icons">fact_check</span>
        <div>
          <h2 class="font-bold text-lg">متابعة خلاص المساهمات</h2>
          <p class="text-rose-200 text-sm">Suivi des paiements des cotisations</p>
        </div>
      </div>

      <!-- Form -->
      <div class="p-6">
        <div class="max-w-2xl mx-auto">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">السنة / Année</label>
              <input [(ngModel)]="annee" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2">
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
            <button (click)="print()" [disabled]="!results.length" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 disabled:opacity-50 flex items-center gap-2">
              <span class="material-icons">print</span>
              طباعة
            </button>
          </div>

          <div *ngIf="message" class="mt-4 text-center" [class.text-red-600]="error" [class.text-green-600]="!error">{{ message }}</div>
          <div *ngIf="loading" class="mt-4 text-center text-gray-500">جاري التحميل...</div>
        </div>

        <!-- Results Table -->
        <div *ngIf="results.length" class="mt-8">
          <table class="w-full text-sm">
            <thead class="bg-rose-100">
              <tr>
                <th class="px-4 py-3 text-right font-medium border-b">الثلاثية</th>
                <th class="px-4 py-3 text-right font-medium border-b">المؤسسة</th>
                <th class="px-4 py-3 text-right font-medium border-b">العون</th>
                <th class="px-4 py-3 text-right font-medium border-b">المبلغ المستوجب</th>
                <th class="px-4 py-3 text-right font-medium border-b">المبلغ المسدد</th>
                <th class="px-4 py-3 text-right font-medium border-b">الباقي</th>
                <th class="px-4 py-3 text-center font-medium border-b">الحالة</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let r of results" class="border-b hover:bg-gray-50">
                <td class="px-4 py-2">T{{ r.trimestre }}/{{ r.annee }}</td>
                <td class="px-4 py-2">{{ r.institution }}</td>
                <td class="px-4 py-2">{{ r.agent }}</td>
                <td class="px-4 py-2 font-mono">{{ r.montantDu.toFixed(3) }}</td>
                <td class="px-4 py-2 font-mono text-green-600">{{ r.montantPaye.toFixed(3) }}</td>
                <td class="px-4 py-2 font-mono text-red-600">{{ r.reste.toFixed(3) }}</td>
                <td class="px-4 py-2 text-center">
                  <span class="px-2 py-0.5 rounded-full text-xs font-medium"
                        [class]="r.statut === 'PAYE' ? 'bg-green-100 text-green-700' : r.statut === 'PARTIEL' ? 'bg-yellow-100 text-yellow-700' : 'bg-red-100 text-red-700'">
                    {{ r.statut }}
                  </span>
                </td>
              </tr>
            </tbody>
            <tfoot class="bg-gray-100 font-bold">
              <tr>
                <td colspan="3" class="px-4 py-3 text-right">المجموع</td>
                <td class="px-4 py-3 font-mono">{{ totalDu.toFixed(3) }}</td>
                <td class="px-4 py-3 font-mono text-green-600">{{ totalPaye.toFixed(3) }}</td>
                <td class="px-4 py-3 font-mono text-red-600">{{ totalReste.toFixed(3) }}</td>
                <td></td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  `
})
export class SuiviPaiementsComponent {
  private institutionService = inject(InstitutionService);
  private cotisationService = inject(CotisationService);
  private agentService = inject(AgentService);
  private paiementService = inject(PaiementService);

  annee: any = 2026;
  institutionNum = '';
  branche = '';
  selectedInstitution: any = null;
  agentsList: any[] = [];
  results: any[] = [];
  totalDu = 0;
  totalPaye = 0;
  totalReste = 0;
  loading = false;
  message = '';
  error = false;

  loadByAffiliation(): void {
    if (!this.institutionNum) return;

    this.selectedInstitution = null;
    this.agentsList = [];
    this.results = [];

    this.institutionService.findAll().subscribe({
      next: (all: any[]) => {
        let filtered = all.filter(i => i.numAffiliation === this.institutionNum);
        if (this.branche) {
          filtered = filtered.filter(i => i.brancheSociale === this.branche);
        }
        if (filtered.length === 0) return;

        this.selectedInstitution = filtered[0];

        this.agentService.findByInstitution(this.selectedInstitution.id).subscribe({
          next: (agents) => { this.agentsList = agents; }
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
    this.results = [];

    this.cotisationService.findByInstitution(this.selectedInstitution.id, +this.annee).subscribe({
      next: (cotisations) => {
        if (cotisations.length === 0) {
          this.message = 'لا توجد مساهمات لهذه السنة';
          this.loading = false;
          return;
        }

        // Sort by trimestre
        cotisations.sort((a: any, b: any) => a.trimestre - b.trimestre);

        // For each cotisation, fetch paiements
        const paiementRequests = cotisations.map((c: any) =>
          this.paiementService.findByCotisation(c.id || 0)
        );

        forkJoin(paiementRequests).subscribe({
          next: (paiementsArrays: any[]) => {
            this.results = cotisations.map((c: any, idx: number) => {
              const paiements = paiementsArrays[idx] || [];
              const montantDu = c.montantTotal || 0;
              const montantPaye = paiements.reduce((s: number, p: any) => s + (p.montantPaye || 0), 0);
              const reste = montantDu - montantPaye;
              const agentNom = (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || '');

              let statut = 'EN_ATTENTE';
              if (montantPaye >= montantDu && montantDu > 0) {
                statut = 'PAYE';
              } else if (montantPaye > 0) {
                statut = 'PARTIEL';
              }

              return {
                trimestre: c.trimestre,
                annee: c.annee,
                institution: this.selectedInstitution?.raisonSociale || '',
                agent: agentNom,
                montantDu,
                montantPaye,
                reste: Math.max(0, reste),
                statut
              };
            });

            this.calculateTotals();
            this.loading = false;
          },
          error: () => {
            // If paiement API fails, show cotisations with 0 paid
            this.results = cotisations.map((c: any) => {
              const agentNom = (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || '');
              return {
                trimestre: c.trimestre,
                annee: c.annee,
                institution: this.selectedInstitution?.raisonSociale || '',
                agent: agentNom,
                montantDu: c.montantTotal || 0,
                montantPaye: 0,
                reste: c.montantTotal || 0,
                statut: 'EN_ATTENTE'
              };
            });
            this.calculateTotals();
            this.loading = false;
          }
        });
      },
      error: () => {
        this.message = 'خطأ في تحميل المساهمات';
        this.error = true;
        this.loading = false;
      }
    });
  }

  calculateTotals(): void {
    this.totalDu = this.results.reduce((s, r) => s + r.montantDu, 0);
    this.totalPaye = this.results.reduce((s, r) => s + r.montantPaye, 0);
    this.totalReste = this.results.reduce((s, r) => s + r.reste, 0);
  }

  print(): void {
    const printWindow = window.open('', '_blank');
    if (!printWindow) return;

    const instNom = this.selectedInstitution?.raisonSociale || '';
    const numAff = (this.branche || '') + '-' + (this.institutionNum || '');

    printWindow.document.write(`
      <!DOCTYPE html>
      <html dir="rtl" lang="ar">
      <head>
        <meta charset="UTF-8">
        <title>متابعة خلاص المساهمات</title>
        <style>
          body { font-family: 'Traditional Arabic', 'Arial', sans-serif; padding: 20px 40px; direction: rtl; font-size: 14px; line-height: 1.6; }
          .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px; border-bottom: 1px solid #000; padding-bottom: 10px; }
          .header-right { text-align: right; font-size: 12px; }
          .header-center { text-align: center; flex: 1; }
          .header-left { text-align: left; font-size: 11px; }
          .cnss-title { font-weight: bold; font-size: 16px; text-decoration: underline; }
          .office-box { background: #000; color: white; padding: 5px 20px; display: inline-block; margin-top: 8px; font-size: 13px; }
          .title { text-align: center; font-weight: bold; font-size: 15px; margin: 20px 0; text-decoration: underline; }
          .info { margin: 15px 0; }
          .info p { margin: 4px 0; font-size: 13px; }
          table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 12px; }
          th, td { border: 1px solid #000; padding: 6px; text-align: center; }
          th { background: #f5f5f5; font-weight: bold; }
          .paye { color: green; }
          .partiel { color: #b8860b; }
          .attente { color: red; }
          .total-row { background: #f5f5f5; font-weight: bold; }
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

        <div class="title">متابعة خلاص المساهمات — سنة ${this.annee}</div>

        <div class="info">
          <p><strong>المؤسسة :</strong> ${instNom}</p>
          <p><strong>رقم الإنخراط :</strong> ${numAff}</p>
        </div>

        <table>
          <thead>
            <tr>
              <th>الثلاثية</th>
              <th>المؤسسة</th>
              <th>العون</th>
              <th>المبلغ المستوجب</th>
              <th>المبلغ المسدد</th>
              <th>الباقي</th>
              <th>الحالة</th>
            </tr>
          </thead>
          <tbody>
            ${this.results.map(r => `
              <tr>
                <td>T${r.trimestre}/${r.annee}</td>
                <td>${r.institution}</td>
                <td>${r.agent}</td>
                <td>${r.montantDu.toFixed(3)}</td>
                <td class="paye">${r.montantPaye.toFixed(3)}</td>
                <td class="attente">${r.reste.toFixed(3)}</td>
                <td class="${r.statut === 'PAYE' ? 'paye' : r.statut === 'PARTIEL' ? 'partiel' : 'attente'}">${r.statut}</td>
              </tr>
            `).join('')}
            <tr class="total-row">
              <td colspan="3">المجموع</td>
              <td>${this.totalDu.toFixed(3)}</td>
              <td class="paye">${this.totalPaye.toFixed(3)}</td>
              <td class="attente">${this.totalReste.toFixed(3)}</td>
              <td></td>
            </tr>
          </tbody>
        </table>

        <div class="footer">تاريخ الطباعة: ${new Date().toLocaleDateString('fr-TN')}</div>
      </body>
      </html>
    `);
    printWindow.document.close();
    printWindow.print();
  }
}
