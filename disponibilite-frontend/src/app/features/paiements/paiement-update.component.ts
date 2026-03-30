import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CotisationService, Cotisation } from '../../services/cotisation.service';
import { InstitutionService } from '../../services/institution.service';
import { PaiementService, PaiementRequest } from '../../services/paiement.service';
import { forkJoin, of } from 'rxjs';

interface CotisationRow {
  cotisation: Cotisation;
  numInscription: string;
  nomAgent: string;
  code: string;
  dateIlhaq: string;
  exploitation: string;
  salaire: number;
  montantDu: number;
  montantPaye: number;
  originalMontantPaye: number;
  datePaiement: string;
}

@Component({
  selector: 'app-paiement-update',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="material-icons">receipt_long</span>
          <div>
            <h2 class="font-bold text-lg">تحيين خلاص المساهمات</h2>
            <p class="text-rose-200 text-sm">Mise à jour des paiements</p>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <button (click)="payAll()" [disabled]="cotisations.length === 0" class="px-3 py-2 bg-amber-500 hover:bg-amber-400 rounded text-sm font-medium flex items-center gap-1 disabled:opacity-50" title="خلاص كامل">
            <span class="material-icons text-sm">payments</span>
            خلاص كامل
          </button>
          <button (click)="print()" [disabled]="cotisations.length === 0" class="p-2 bg-blue-600 hover:bg-blue-500 rounded disabled:opacity-50" title="طباعة">
            <span class="material-icons">print</span>
          </button>
          <button (click)="save()" [disabled]="saving || cotisations.length === 0" class="p-2 bg-green-600 hover:bg-green-500 rounded disabled:opacity-50" title="حفظ">
            <span class="material-icons" [class.animate-spin]="saving">{{ saving ? 'sync' : 'save' }}</span>
          </button>
        </div>
      </div>

      <!-- Filter Section -->
      <div class="p-6 border-b border-gray-200 bg-gray-50">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الثلاثية / السنة</label>
            <div class="flex gap-2">
              <select [(ngModel)]="trimestre" class="flex-1 border border-gray-300 rounded-lg px-3 py-2">
                <option [value]="1">T1</option>
                <option [value]="2">T2</option>
                <option [value]="3">T3</option>
                <option [value]="4">T4</option>
              </select>
              <input [(ngModel)]="annee" type="number" class="w-24 border border-gray-300 rounded-lg px-3 py-2">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة</label>
            <div class="flex gap-2">
              <input [(ngModel)]="institutionNum" class="flex-1 border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
              <input [(ngModel)]="branche" class="w-16 border border-gray-300 rounded-lg px-3 py-2" placeholder="60">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المبلغ / Montant</label>
            <input [value]="totalAmount | number:'1.3-3'" type="text" readonly
                   class="w-full border border-gray-200 rounded-lg px-3 py-2 bg-white font-bold text-green-700">
          </div>
          <div class="flex items-end">
            <button (click)="search()" [disabled]="loading" class="w-full py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center justify-center gap-2 disabled:opacity-50">
              <span class="material-icons" [class.animate-spin]="loading">{{ loading ? 'sync' : 'search' }}</span>
              بحث
            </button>
          </div>
        </div>
        <!-- Institution Info -->
        <div *ngIf="selectedInstitution" class="mt-3 p-3 bg-white rounded border text-sm">
          <strong>{{ selectedInstitution.raisonSociale }}</strong> - {{ selectedInstitution.adresse || '' }}
        </div>
      </div>

      <!-- Cotisations Table -->
      <div class="p-6">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-icons text-rose-600">people</span>
          <h3 class="font-bold text-gray-800">المضمون الاجتماعي</h3>
          <span class="text-gray-400 text-sm">/ Assurés sociaux</span>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-rose-50">
              <tr>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">رقم التسجيل<br><span class="text-xs text-gray-500">N° Inscription</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">الاسم واللقب<br><span class="text-xs text-gray-500">Nom</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">رقم<br><span class="text-xs text-gray-500">Code</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">تاريخ الإلحاق<br><span class="text-xs text-gray-500">Date Ilhaq</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">الاستغلال<br><span class="text-xs text-gray-500">Exploitation</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">المبلغ المستوجب<br><span class="text-xs text-gray-500">Montant dû</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">المبلغ المسدد<br><span class="text-xs text-gray-500">Montant payé</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">تاريخ الخلاص<br><span class="text-xs text-gray-500">Date paiement</span></th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let c of cotisations" class="border-b border-gray-100 hover:bg-rose-50/30">
                <td class="px-3 py-2 font-mono text-rose-700">{{ c.numInscription }}</td>
                <td class="px-3 py-2">{{ c.nomAgent }}</td>
                <td class="px-3 py-2">
                  <span class="px-2 py-0.5 rounded text-xs font-medium"
                        [class]="c.code === '137' || c.code === '197' ? 'bg-blue-100 text-blue-700' : 'bg-orange-100 text-orange-700'">
                    {{ c.code }}
                  </span>
                  <div class="text-[10px] mt-0.5"
                       [class]="c.code === '137' || c.code === '197' ? 'text-blue-500' : 'text-orange-500'">
                    {{ c.code === '137' ? 'المشغّل' : c.code === '138' ? 'المضمون' : c.code === '197' ? 'تكميلي مشغّل' : 'تكميلي مضمون' }}
                  </div>
                </td>
                <td class="px-3 py-2">{{ c.dateIlhaq }}</td>
                <td class="px-3 py-2">{{ c.exploitation }}</td>
                <td class="px-3 py-2 font-mono">{{ c.montantDu | number:'1.3-3' }}</td>
                <td class="px-3 py-2">
                  <div class="flex items-center gap-1">
                    <button (click)="fillRow(c)" class="p-0.5 text-amber-600 hover:text-amber-800" title="خلاص كامل">
                      <span class="material-icons text-sm">arrow_back</span>
                    </button>
                    <input [(ngModel)]="c.montantPaye" type="number" step="0.001" [max]="c.montantDu"
                           class="w-28 border border-gray-300 rounded px-2 py-1 text-right font-mono"
                           [class.border-green-500]="+c.montantPaye >= c.montantDu"
                           [class.bg-green-50]="+c.montantPaye >= c.montantDu">
                  </div>
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="c.datePaiement" type="date"
                         class="border border-gray-300 rounded px-2 py-1">
                </td>
              </tr>
              <tr *ngIf="cotisations.length === 0 && !loading">
                <td colspan="8" class="px-3 py-8 text-center text-gray-400">
                  لا توجد مساهمات - Aucune cotisation
                </td>
              </tr>
            </tbody>
          </table>
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
export class PaiementUpdateComponent {
  trimestre = Math.ceil((new Date().getMonth() + 1) / 3);
  annee = new Date().getFullYear();
  institutionNum = '';
  branche = '';
  totalAmount = 0;
  cotisations: CotisationRow[] = [];
  selectedInstitution: any = null;
  message = '';
  error = false;
  loading = false;
  saving = false;
  today = new Date().toLocaleDateString('ar-TN');

  constructor(
    private cotisationService: CotisationService,
    private institutionService: InstitutionService,
    private paiementService: PaiementService
  ) {}

  search(): void {
    if (!this.institutionNum) {
      this.message = 'يرجى إدخال رقم المؤسسة';
      this.error = true;
      return;
    }

    this.loading = true;
    this.message = '';
    this.error = false;
    this.cotisations = [];
    this.selectedInstitution = null;

    // Fetch all institutions and filter by numAffiliation and branche
    this.institutionService.findAll().subscribe({
      next: (institutions: any[]) => {
        // Filter by numAffiliation (exact match)
        let filtered = institutions.filter(i => i.numAffiliation === this.institutionNum);
        
        // Filter by branche if provided
        if (this.branche) {
          filtered = filtered.filter(i => i.brancheSociale === this.branche);
        }
        
        if (filtered.length === 0) {
          this.message = 'مؤسسة غير موجودة - Institution non trouvée';
          this.error = true;
          this.loading = false;
          return;
        }

        this.selectedInstitution = filtered[0];
        this.loadCotisations();
      },
      error: (err) => {
        console.error('Institution search error:', err);
        this.message = 'خطأ في البحث عن المؤسسة';
        this.error = true;
        this.loading = false;
      }
    });
  }

  private loadCotisations(): void {
    this.cotisationService.findByInstitution(this.selectedInstitution.id, +this.annee).subscribe({
      next: (allCotisations) => {
        // Filter by trimestre
        const filtered = allCotisations.filter(c => c.trimestre === +this.trimestre);

        if (filtered.length === 0) {
          this.message = 'لا توجد مساهمات لهذه الفترة';
          this.error = false;
          this.loading = false;
          return;
        }

        // Today's date for new payments
        const now = new Date();
        const todayStr = now.getFullYear() + '-' + String(now.getMonth() + 1).padStart(2, '0') + '-' + String(now.getDate()).padStart(2, '0');

        // Fetch paiements for each cotisation in parallel
        const paiementRequests = filtered.map(c =>
          c.id ? this.paiementService.findByCotisation(c.id) : of([])
        );

        forkJoin(paiementRequests).subscribe({
          next: (paiementsArrays) => {
            this.cotisations = [];

            for (let i = 0; i < filtered.length; i++) {
              const c = filtered[i];
              const paiements = paiementsArrays[i] || [];

              // Sum all existing payments per code (there may be multiple)
              const sumByCode = (code: string) => paiements
                .filter((p: any) => p.codePaiement === code)
                .reduce((s: number, p: any) => s + (p.montantPaye || 0), 0);
              const lastDateByCode = (code: string) => {
                const pays = paiements.filter((p: any) => p.codePaiement === code);
                return pays.length > 0 ? pays[pays.length - 1].datePaiement || '' : '';
              };

              // Code 137 - Employeur base
              if (c.montantCode137 > 0) {
                this.cotisations.push({
                  cotisation: c,
                  numInscription: c.agentPublic?.numInscription || '',
                  nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
                  code: '137',
                  dateIlhaq: c.agentPublic?.dateDebutIlhaq || '',
                  exploitation: c.agentPublic?.codeExploitation || '',
                  salaire: c.salaireMensuelApplique || 0,
                  montantDu: c.montantCode137,
                  montantPaye: sumByCode('137'),
                  originalMontantPaye: sumByCode('137'),
                  datePaiement: lastDateByCode('137')
                });
              }
              // Code 138 - Agent base
              if (c.montantCode138 > 0) {
                this.cotisations.push({
                  cotisation: c,
                  numInscription: c.agentPublic?.numInscription || '',
                  nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
                  code: '138',
                  dateIlhaq: c.agentPublic?.dateDebutIlhaq || '',
                  exploitation: c.agentPublic?.codeExploitation || '',
                  salaire: c.salaireMensuelApplique || 0,
                  montantDu: c.montantCode138,
                  montantPaye: sumByCode('138'),
                  originalMontantPaye: sumByCode('138'),
                  datePaiement: lastDateByCode('138')
                });
              }
              // Code 197 - Employeur complementaire
              if (c.montantCode197 && c.montantCode197 > 0) {
                this.cotisations.push({
                  cotisation: c,
                  numInscription: c.agentPublic?.numInscription || '',
                  nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
                  code: '197',
                  dateIlhaq: c.agentPublic?.dateDebutIlhaq || '',
                  exploitation: c.agentPublic?.codeExploitation || '',
                  salaire: c.salaireMensuelApplique || 0,
                  montantDu: c.montantCode197,
                  montantPaye: sumByCode('197'),
                  originalMontantPaye: sumByCode('197'),
                  datePaiement: lastDateByCode('197')
                });
              }
              // Code 198 - Agent complementaire
              if (c.montantCode198 && c.montantCode198 > 0) {
                this.cotisations.push({
                  cotisation: c,
                  numInscription: c.agentPublic?.numInscription || '',
                  nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''),
                  code: '198',
                  dateIlhaq: c.agentPublic?.dateDebutIlhaq || '',
                  exploitation: c.agentPublic?.codeExploitation || '',
                  salaire: c.salaireMensuelApplique || 0,
                  montantDu: c.montantCode198,
                  montantPaye: sumByCode('198'),
                  originalMontantPaye: sumByCode('198'),
                  datePaiement: lastDateByCode('198')
                });
              }
            }

            this.totalAmount = this.cotisations.reduce((sum, c) => sum + c.montantDu, 0);
            this.loading = false;

            if (this.cotisations.length === 0) {
              this.message = 'لا توجد مساهمات لهذه الفترة';
              this.error = false;
            }
          },
          error: () => {
            // Fallback: show cotisations with montantPaye = 0
            this.cotisations = [];
            for (const c of filtered) {
              if (c.montantCode137 > 0) {
                this.cotisations.push({ cotisation: c, numInscription: c.agentPublic?.numInscription || '', nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''), code: '137', dateIlhaq: c.agentPublic?.dateDebutIlhaq || '', exploitation: c.agentPublic?.codeExploitation || '', salaire: c.salaireMensuelApplique || 0, montantDu: c.montantCode137, montantPaye: 0, originalMontantPaye: 0, datePaiement: '' });
              }
              if (c.montantCode138 > 0) {
                this.cotisations.push({ cotisation: c, numInscription: c.agentPublic?.numInscription || '', nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''), code: '138', dateIlhaq: c.agentPublic?.dateDebutIlhaq || '', exploitation: c.agentPublic?.codeExploitation || '', salaire: c.salaireMensuelApplique || 0, montantDu: c.montantCode138, montantPaye: 0, originalMontantPaye: 0, datePaiement: '' });
              }
              if (c.montantCode197 && c.montantCode197 > 0) {
                this.cotisations.push({ cotisation: c, numInscription: c.agentPublic?.numInscription || '', nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''), code: '197', dateIlhaq: c.agentPublic?.dateDebutIlhaq || '', exploitation: c.agentPublic?.codeExploitation || '', salaire: c.salaireMensuelApplique || 0, montantDu: c.montantCode197, montantPaye: 0, originalMontantPaye: 0, datePaiement: '' });
              }
              if (c.montantCode198 && c.montantCode198 > 0) {
                this.cotisations.push({ cotisation: c, numInscription: c.agentPublic?.numInscription || '', nomAgent: (c.agentPublic?.prenom || '') + ' ' + (c.agentPublic?.nom || ''), code: '198', dateIlhaq: c.agentPublic?.dateDebutIlhaq || '', exploitation: c.agentPublic?.codeExploitation || '', salaire: c.salaireMensuelApplique || 0, montantDu: c.montantCode198, montantPaye: 0, originalMontantPaye: 0, datePaiement: '' });
              }
            }
            this.totalAmount = this.cotisations.reduce((sum, c) => sum + c.montantDu, 0);
            this.loading = false;
          }
        });
      },
      error: (err) => {
        console.error('Cotisations load error:', err);
        this.message = 'خطأ في تحميل المساهمات';
        this.error = true;
        this.loading = false;
      }
    });
  }

  payAll(): void {
    const todayStr = new Date().toISOString().split('T')[0];
    for (const c of this.cotisations) {
      if (+c.montantPaye < c.montantDu) {
        c.montantPaye = c.montantDu;
        if (!c.datePaiement) {
          c.datePaiement = todayStr;
        }
      }
    }
    this.save();
  }

  fillRow(c: CotisationRow): void {
    c.montantPaye = c.montantDu;
    if (!c.datePaiement) {
      c.datePaiement = new Date().toISOString().split('T')[0];
    }
  }

  save(): void {
    this.saving = true;
    this.message = '';
    this.error = false;

    const paymentsToSave = this.cotisations.filter(c => +c.montantPaye > +c.originalMontantPaye && c.datePaiement);
    
    if (paymentsToSave.length === 0) {
      this.message = 'يرجى إدخال المبالغ المسددة وتواريخ الخلاص';
      this.error = true;
      this.saving = false;
      return;
    }

    let completed = 0;
    let errors = 0;
    let lastError = '';

    for (const row of paymentsToSave) {
      const increment = Math.round((+row.montantPaye - +row.originalMontantPaye) * 1000) / 1000;
      const request: PaiementRequest = {
        cotisationId: row.cotisation.id!,
        montantPaye: increment,
        codePaiement: row.code,
        typePaiement: 'VIREMENT',
        referencePaiement: `PAY-${row.cotisation.id}-${row.code}-${Date.now()}`,
        datePaiement: row.datePaiement
      };

      console.log('Saving paiement:', request);

      this.paiementService.create(request).subscribe({
        next: () => {
          completed++;
          row.originalMontantPaye = +row.montantPaye;
          if (completed + errors === paymentsToSave.length) {
            this.saving = false;
            if (errors === 0) {
              this.message = `تم حفظ ${completed} عملية دفع بنجاح`;
            } else {
              this.message = `تم حفظ ${completed} عملية، فشل ${errors}: ${lastError}`;
              this.error = true;
            }
          }
        },
        error: (err) => {
          errors++;
          lastError = err.error?.error || err.message || 'خطأ غير معروف';
          console.error('Save paiement error:', row.code, lastError, err);
          if (completed + errors === paymentsToSave.length) {
            this.saving = false;
            this.message = `تم حفظ ${completed} عملية، فشل ${errors}: ${lastError}`;
            this.error = true;
          }
        }
      });
    }
  }

  print(): void {
    const triNames: {[key: number]: string} = {1: 'الأولى', 2: 'الثانية', 3: 'الثالثة', 4: 'الرابعة'};

    const employeurRows = this.cotisations.filter(c => c.code === '137' || c.code === '197');
    const assureRows = this.cotisations.filter(c => c.code === '138' || c.code === '198');

    const totalEmployeur = employeurRows.reduce((s, c) => s + c.montantDu, 0);
    const totalAssure = assureRows.reduce((s, c) => s + c.montantDu, 0);

    const total137 = this.cotisations.filter(c => c.code === '137').reduce((s, c) => s + c.montantDu, 0);
    const total138 = this.cotisations.filter(c => c.code === '138').reduce((s, c) => s + c.montantDu, 0);
    const total197 = this.cotisations.filter(c => c.code === '197').reduce((s, c) => s + c.montantDu, 0);
    const total198 = this.cotisations.filter(c => c.code === '198').reduce((s, c) => s + c.montantDu, 0);
    const totalSalaires = this.getTotalSalaires();

    const buildPage = (title: string, subtitle: string, rows: CotisationRow[], total: number, summaryHtml: string): string => {
      const totalWords = this.convertToArabicWords(total);
      return `
        <div class="page">
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

          <div class="date">${new Date().toLocaleDateString('fr-TN')}</div>

          <div class="institution-box">
            <span class="bracket">[</span>
            <div class="box-content">
              <p><strong>المؤسسة :</strong> ${this.selectedInstitution?.raisonSociale || ''}</p>
              <p><strong>رقم الإنخراط:</strong> ${this.branche || ''}-${this.institutionNum || ''}</p>
              <p><strong>رقم التسجيل :</strong> ${[...new Set(rows.map(c => c.numInscription))].join(' - ')}</p>
              <p><strong>العنوان :</strong> ${this.selectedInstitution?.adresse || ''}</p>
            </div>
            <span class="bracket">]</span>
          </div>

          <div class="subject">${title}</div>
          <div class="subtitle">${subtitle}</div>

          <div class="body-text">
            أما بعد،<br>
            أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية
            الاجتماعية للأعوان العموميين المحالين على عدم المباشرة الخاصة، طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24
            فيفري 2003، بعنوان الثلاثي ${triNames[+this.trimestre]} لسنة ${this.annee}
          </div>

          <div class="amount-text">حدد بـ ${totalWords}</div>

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
              ${rows.map(c => `
                <tr>
                  <td>${c.code === '137' || c.code === '197' ? (this.selectedInstitution?.raisonSociale || '') : c.nomAgent}</td>
                  <td>${c.code}</td>
                  <td>${c.numInscription}</td>
                  <td>${c.montantDu.toFixed(3)}</td>
                </tr>
              `).join('')}
            </tbody>
          </table>

          ${summaryHtml}

          <div class="footer">
            <p>تاريخ الطباعة: ${this.today}</p>
          </div>
        </div>`;
    };

    const employeurSummary = `
      <table class="summary">
        <tr><td><strong>جملة الأجور</strong></td><td>${totalSalaires.toFixed(3)}</td></tr>
        <tr><td><strong>النظام الأساسي (المشغل) %17.07</strong></td><td>${total137.toFixed(3)}</td></tr>
        ${total197 > 0 ? `<tr><td><strong>مساهمات النظام التكميلي (المشغل)</strong></td><td>${total197.toFixed(3)}</td></tr>` : ''}
        <tr><td><strong>المجموع</strong></td><td><strong>${totalEmployeur.toFixed(3)}</strong></td></tr>
      </table>`;

    const assureSummary = `
      <table class="summary">
        <tr><td><strong>جملة الأجور</strong></td><td>${totalSalaires.toFixed(3)}</td></tr>
        <tr><td><strong>النظام الأساسي (العون) %9.68</strong></td><td>${total138.toFixed(3)}</td></tr>
        ${total198 > 0 ? `<tr><td><strong>مساهمات النظام التكميلي (المضمون)</strong></td><td>${total198.toFixed(3)}</td></tr>` : ''}
        <tr><td><strong>المجموع</strong></td><td><strong>${totalAssure.toFixed(3)}</strong></td></tr>
      </table>`;

    const printWindow = window.open('', '_blank');
    if (printWindow) {
      printWindow.document.write(`
        <!DOCTYPE html>
        <html dir="rtl" lang="ar">
        <head>
          <meta charset="UTF-8">
          <title>إعلام لدفع المساهمات</title>
          <style>
            body { font-family: 'Traditional Arabic', 'Arial', sans-serif; padding: 20px 40px; direction: rtl; font-size: 14px; line-height: 1.6; }
            .page { page-break-after: always; }
            .page:last-child { page-break-after: avoid; }
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
            .subject { font-weight: bold; font-size: 15px; margin: 15px 0 5px; text-decoration: underline; color: #c00; }
            .subtitle { font-size: 13px; margin-bottom: 15px; color: #666; }
            .body-text { text-align: justify; margin-bottom: 15px; font-size: 13px; }
            .amount-text { font-weight: bold; margin: 10px 0; font-size: 14px; }
            table { width: 100%; border-collapse: collapse; margin: 15px 0; font-size: 12px; }
            th, td { border: 1px solid #000; padding: 6px; text-align: center; }
            th { background: #f5f5f5; font-weight: bold; }
            .summary { margin-top: 15px; }
            .summary td { text-align: right; padding: 5px 10px; }
            .summary td:first-child { width: 70%; }
            .footer { margin-top: 30px; }
            @media print { body { padding: 15px; } .page { page-break-after: always; } .page:last-child { page-break-after: avoid; } }
          </style>
        </head>
        <body>
          ${buildPage(
            'الموضوع: إعلام المشغّل لدفع المساهمات',
            'Avis Employeur - Code 137' + (total197 > 0 ? ' / 197' : ''),
            employeurRows, totalEmployeur, employeurSummary
          )}
          ${buildPage(
            'الموضوع: إعلام المضمون لدفع المساهمات',
            'Avis Assuré - Code 138' + (total198 > 0 ? ' / 198' : ''),
            assureRows, totalAssure, assureSummary
          )}
        </body>
        </html>
      `);
      printWindow.document.close();
      printWindow.print();
    }
  }

  getTotalSalaires(): number {
    // Get unique cotisations (avoid double-counting salary for same agent with codes 137+138)
    const seen = new Set<number>();
    let total = 0;
    for (const c of this.cotisations) {
      const cotId = c.cotisation.id!;
      if (!seen.has(cotId)) {
        seen.add(cotId);
        total += (c.salaire || 0) * 3; // salaire trimestriel = mensuel × 3
      }
    }
    return total;
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
