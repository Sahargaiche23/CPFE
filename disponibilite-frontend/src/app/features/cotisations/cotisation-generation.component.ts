import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CotisationService, Cotisation, CotisationGenerationRequest } from '../../services/cotisation.service';
import { InstitutionService } from '../../services/institution.service';
import { AgentService, AgentPublic } from '../../services/agent.service';

@Component({
  selector: 'app-cotisation-generation',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="material-icons">calculate</span>
          <div>
            <h2 class="font-bold text-lg">عدم المباشرة الخاصة</h2>
            <p class="text-rose-200 text-sm">تنزيل المساهمات - Génération des cotisations</p>
          </div>
        </div>
      </div>

      <!-- Generation Form -->
      <div class="p-6">
        <div class="max-w-2xl mx-auto bg-gray-50 rounded-xl p-6 border border-gray-200">
          <!-- Mode Selection -->
          <div class="space-y-3 mb-6">
            <label class="flex items-center gap-3 p-3 bg-white rounded-lg border border-gray-200 cursor-pointer hover:border-rose-300"
                   [class.border-rose-500]="mode === 'ALL'" [class.bg-rose-50]="mode === 'ALL'">
              <input type="radio" [(ngModel)]="mode" value="ALL" class="text-rose-600">
              <div>
                <p class="font-medium">كافة المؤسسات المشغلة</p>
                <p class="text-xs text-gray-500">Toutes les institutions</p>
              </div>
            </label>
            <label class="flex items-center gap-3 p-3 bg-white rounded-lg border border-gray-200 cursor-pointer hover:border-rose-300"
                   [class.border-rose-500]="mode === 'INSTITUTION'" [class.bg-rose-50]="mode === 'INSTITUTION'">
              <input type="radio" [(ngModel)]="mode" value="INSTITUTION" class="text-rose-600">
              <div>
                <p class="font-medium">كافة أعوان مؤسسة واحدة</p>
                <p class="text-xs text-gray-500">Tous les agents d'une institution</p>
              </div>
            </label>
            <label class="flex items-center gap-3 p-3 bg-white rounded-lg border border-gray-200 cursor-pointer hover:border-rose-300"
                   [class.border-rose-500]="mode === 'AGENT'" [class.bg-rose-50]="mode === 'AGENT'">
              <input type="radio" [(ngModel)]="mode" value="AGENT" class="text-rose-600">
              <div>
                <p class="font-medium">عون عمومي واحد</p>
                <p class="text-xs text-gray-500">Un seul agent public</p>
              </div>
            </label>
          </div>

          <!-- Parameters -->
          <div class="grid grid-cols-2 gap-4 mb-6">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">الثلاثية / Trimestre</label>
              <select [(ngModel)]="trimestre" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                <option [value]="1">T1 (Jan-Mar)</option>
                <option [value]="2">T2 (Avr-Jun)</option>
                <option [value]="3">T3 (Jul-Sep)</option>
                <option [value]="4">T4 (Oct-Déc)</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">السنة / Année</label>
              <input [(ngModel)]="annee" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2">
            </div>
          </div>

          <!-- Conditional Fields -->
          <div *ngIf="mode === 'INSTITUTION'" class="mb-6">
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة / Institution</label>
            <input [(ngModel)]="institutionId" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
          </div>

          <div *ngIf="mode === 'AGENT'" class="mb-6">
            <label class="block text-sm font-medium text-gray-600 mb-1">رقم التسجيل / N° Inscription Agent</label>
            <input [(ngModel)]="agentId" (blur)="searchAgent()" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="23456789">
          </div>

          <!-- Agent Info Display (auto-filled) -->
          <div *ngIf="mode === 'AGENT' && selectedAgent" class="mb-6 p-4 bg-gray-50 rounded-lg border">
            <div class="grid grid-cols-2 gap-4 text-sm">
              <div>
                <span class="text-gray-500">الاسم واللقب / Nom:</span>
                <span class="font-medium mr-2">{{ selectedAgent.nom }} {{ selectedAgent.prenom }}</span>
              </div>
              <div>
                <span class="text-gray-500">المؤسسة / Institution:</span>
                <span class="font-medium mr-2">{{ selectedAgent.institution?.numAffiliation }}/{{ selectedAgent.institution?.brancheSociale }}</span>
              </div>
              <div>
                <span class="text-gray-500">تاريخ الإلحاق / Date Ilhaq:</span>
                <span class="font-medium mr-2">{{ selectedAgent.dateDebutIlhaq }}</span>
              </div>
              <div>
                <span class="text-gray-500">الاسم التجاري / Raison Sociale:</span>
                <span class="font-medium mr-2">{{ selectedAgent.institution?.raisonSociale }}</span>
              </div>
            </div>
          </div>

          <div *ngIf="mode === 'AGENT' && agentSearchError" class="mb-6 p-3 bg-red-50 border border-red-200 rounded-lg text-red-700 text-sm">
            {{ agentSearchError }}
          </div>

          <!-- Force Recalcul Checkbox -->
          <div class="mb-6">
            <label class="flex items-center gap-2 cursor-pointer">
              <input type="checkbox" [(ngModel)]="forceRecalcul" class="w-4 h-4 text-rose-600 rounded">
              <span class="text-sm text-gray-700">إعادة حساب المساهمات الموجودة / Recalculer les cotisations existantes</span>
            </label>
          </div>

          <!-- Generate Button -->
          <button (click)="generate()" [disabled]="generating"
                  class="w-full py-3 bg-rose-700 text-white rounded-lg font-medium hover:bg-rose-800 disabled:opacity-50 flex items-center justify-center gap-2">
            <span class="material-icons" [class.animate-spin]="generating">{{ generating ? 'sync' : 'play_arrow' }}</span>
            {{ generating ? 'جاري التنزيل...' : 'تنزيل / Générer' }}
          </button>

          <!-- Results -->
          <div *ngIf="result" class="mt-6 p-4 bg-green-50 border border-green-200 rounded-lg">
            <div class="flex items-center gap-2 text-green-700">
              <span class="material-icons">check_circle</span>
              <span>{{ result }}</span>
            </div>
          </div>

          <!-- Error -->
          <div *ngIf="error" class="mt-6 p-4 bg-red-50 border border-red-200 rounded-lg">
            <div class="flex items-center gap-2 text-red-700">
              <span class="material-icons">error</span>
              <span>{{ error }}</span>
            </div>
          </div>

          <!-- Stats -->
          <div class="mt-6 grid grid-cols-2 gap-4 text-center">
            <div class="bg-white p-4 rounded-lg border">
              <p class="text-2xl font-bold text-rose-700">{{ generatedCount }}</p>
              <p class="text-xs text-gray-500">المحدثة / Mises à jour</p>
            </div>
            <div class="bg-white p-4 rounded-lg border">
              <p class="text-2xl font-bold text-green-700">{{ totalFiles }}</p>
              <p class="text-xs text-gray-500">ملفات من أصل / Fichiers sur</p>
            </div>
          </div>

          <!-- Print Button -->
          <button *ngIf="generatedCotisations.length > 0" (click)="print()"
                  class="w-full mt-4 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 flex items-center justify-center gap-2">
            <span class="material-icons">print</span>
            طباعة كشف المساهمات / Imprimer
          </button>
        </div>
      </div>
    </div>

    <!-- Print Template (hidden) -->
    <div id="printArea" class="hidden print:block">
      <div class="p-8 font-arabic" dir="rtl">
        <div class="text-center mb-6">
          <p class="text-sm">الجمهورية التونسية</p>
          <p class="text-sm">وزارة الشؤون الاجتماعية</p>
          <p class="font-bold">الصندوق الوطني للضمان الاجتماعي</p>
        </div>
        <h1 class="text-xl font-bold text-center mb-4">كشف المساهمات على عدم المباشرة الخاصة</h1>
        <p class="text-center text-sm mb-4">طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24 فيفري 2003</p>
        
        <div class="grid grid-cols-2 gap-4 mb-4 text-sm">
          <div><strong>المؤسسة المشغلة:</strong> {{ printData.institutionName }}</div>
          <div><strong>رقم الانخراط:</strong> {{ printData.numAffiliation }}</div>
          <div><strong>الثلاثي:</strong> {{ printData.trimestre }} - {{ printData.annee }}</div>
        </div>

        <table class="w-full border-collapse border border-black text-sm">
          <thead>
            <tr class="bg-gray-100">
              <th class="border border-black p-2">رقم التسجيل</th>
              <th class="border border-black p-2">الاسم واللقب</th>
              <th class="border border-black p-2">الأجر الشهري</th>
              <th class="border border-black p-2">النظام الأساسي<br>(المشغل 17.07%)</th>
              <th class="border border-black p-2">النظام الأساسي<br>(العون 9.68%)</th>
              <th class="border border-black p-2">النظام التكميلي</th>
              <th class="border border-black p-2">المبلغ الجملي</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let c of generatedCotisations">
              <td class="border border-black p-2 text-center">{{ c.agentPublic?.numInscription }}</td>
              <td class="border border-black p-2">{{ c.agentPublic?.prenom }} {{ c.agentPublic?.nom }}</td>
              <td class="border border-black p-2 text-center">{{ c.salaireMensuelApplique | number:'1.3-3' }}</td>
              <td class="border border-black p-2 text-center">{{ c.montantCode137 | number:'1.3-3' }}</td>
              <td class="border border-black p-2 text-center">{{ c.montantCode138 | number:'1.3-3' }}</td>
              <td class="border border-black p-2 text-center">{{ (c.montantCode197 || 0) + (c.montantCode198 || 0) | number:'1.3-3' }}</td>
              <td class="border border-black p-2 text-center font-bold">{{ c.montantTotal | number:'1.3-3' }}</td>
            </tr>
          </tbody>
          <tfoot>
            <tr class="bg-gray-100 font-bold">
              <td colspan="6" class="border border-black p-2 text-left">المجموع العام</td>
              <td class="border border-black p-2 text-center">{{ getTotalAmount() | number:'1.3-3' }}</td>
            </tr>
          </tfoot>
        </table>
        
        <div class="mt-8 text-sm">
          <p>تاريخ الطباعة: {{ today }}</p>
        </div>
      </div>
    </div>
  `
})
export class CotisationGenerationComponent {
  mode = 'ALL';
  trimestre = Math.ceil((new Date().getMonth() + 1) / 3);
  annee = new Date().getFullYear();
  institutionId = '';
  agentId = '';
  dateIlhaq = '';
  forceRecalcul = false;
  generating = false;
  result = '';
  error = '';
  generatedCount = 0;
  totalFiles = 0;
  generatedCotisations: Cotisation[] = [];
  printData = { institutionName: '', numAffiliation: '', trimestre: '', annee: '' };
  today = new Date().toLocaleDateString('ar-TN');
  selectedAgent: AgentPublic | null = null;
  agentSearchError = '';

  constructor(
    private cotisationService: CotisationService,
    private institutionService: InstitutionService,
    private agentService: AgentService
  ) {}

  searchAgent(): void {
    if (!this.agentId) {
      this.selectedAgent = null;
      this.agentSearchError = '';
      return;
    }
    this.agentService.searchByNumInscription(this.agentId).subscribe({
      next: (agents) => {
        if (agents.length > 0) {
          this.selectedAgent = agents[0];
          this.agentSearchError = '';
          // Auto-fill institution if available
          if (this.selectedAgent.institution) {
            this.institutionId = this.selectedAgent.institution.numAffiliation || '';
          }
        } else {
          this.selectedAgent = null;
          this.agentSearchError = 'عون غير موجود - Agent non trouvé';
        }
      },
      error: () => {
        this.selectedAgent = null;
        this.agentSearchError = 'خطأ في البحث - Erreur de recherche';
      }
    });
  }

  generate(): void {
    this.generating = true;
    this.result = '';
    this.error = '';
    this.generatedCotisations = [];

    const modeMap: { [key: string]: 'TOUTES' | 'INSTITUTION' | 'AGENT' } = {
      'ALL': 'TOUTES',
      'INSTITUTION': 'INSTITUTION',
      'AGENT': 'AGENT'
    };

    // For INSTITUTION or AGENT mode, first resolve numAffiliation to database ID
    if ((this.mode === 'INSTITUTION' || this.mode === 'AGENT') && this.institutionId) {
      this.institutionService.findByAffiliation(this.institutionId, '').subscribe({
        next: (institutions) => {
          if (institutions.length > 0) {
            const dbId = institutions[0].id!;
            this.executeGeneration(modeMap[this.mode], dbId);
          } else {
            this.error = 'مؤسسة غير موجودة - Institution non trouvée';
            this.generating = false;
          }
        },
        error: () => {
          this.error = 'خطأ في البحث عن المؤسسة';
          this.generating = false;
        }
      });
    } else {
      this.executeGeneration(modeMap[this.mode], undefined);
    }
  }

  private executeGeneration(mode: 'TOUTES' | 'INSTITUTION' | 'AGENT', institutionDbId?: number): void {
    const request: CotisationGenerationRequest = {
      mode: mode,
      trimestre: this.trimestre,
      annee: this.annee,
      forceRecalcul: this.forceRecalcul
    };

    if (institutionDbId) {
      request.institutionId = institutionDbId;
    }
    if (mode === 'AGENT' && this.agentId) {
      // Send numInscription for backend to search
      request.numInscription = this.agentId;
    }

    this.cotisationService.generer(request).subscribe({
      next: (response) => {
        this.generatedCount = response.count || 0;
        this.totalFiles = response.count || 0;
        this.generatedCotisations = response.cotisations || [];
        this.result = `تم تنزيل ${this.generatedCount} مساهمات بنجاح - ${response.message}`;
        this.generating = false;

        if (this.generatedCotisations.length > 0) {
          const first = this.generatedCotisations[0];
          this.printData = {
            institutionName: first.institution?.raisonSociale || '',
            numAffiliation: first.institution?.numAffiliation || '',
            trimestre: `T${this.trimestre}`,
            annee: this.annee.toString()
          };
        }
      },
      error: (err) => {
        this.error = err.error?.error || 'خطأ في التنزيل - Erreur de génération';
        this.generating = false;
      }
    });
  }

  getTotalAmount(): number {
    return this.generatedCotisations.reduce((sum, c) => sum + (c.montantTotal || 0), 0);
  }

  print(): void {
    const printContent = document.getElementById('printArea');
    if (printContent) {
      const printWindow = window.open('', '_blank');
      if (printWindow) {
        printWindow.document.write(`
          <!DOCTYPE html>
          <html dir="rtl" lang="ar">
          <head>
            <meta charset="UTF-8">
            <title>كشف المساهمات</title>
            <style>
              body { font-family: 'Arial', sans-serif; padding: 20px; direction: rtl; }
              table { width: 100%; border-collapse: collapse; margin-top: 20px; }
              th, td { border: 1px solid #000; padding: 8px; text-align: center; }
              th { background-color: #f0f0f0; }
              .header { text-align: center; margin-bottom: 20px; }
              .info { display: flex; justify-content: space-between; margin-bottom: 10px; }
              .total { font-weight: bold; background-color: #f0f0f0; }
              @media print { body { print-color-adjust: exact; } }
            </style>
          </head>
          <body>
            <div class="header">
              <p>الجمهورية التونسية</p>
              <p>وزارة الشؤون الاجتماعية</p>
              <p><strong>الصندوق الوطني للضمان الاجتماعي</strong></p>
              <h2>كشف المساهمات على عدم المباشرة الخاصة</h2>
              <p>طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24 فيفري 2003</p>
            </div>
            <div class="info">
              <span><strong>المؤسسة:</strong> ${this.printData.institutionName}</span>
              <span><strong>رقم الانخراط:</strong> ${this.printData.numAffiliation}</span>
              <span><strong>الثلاثي:</strong> ${this.printData.trimestre} - ${this.printData.annee}</span>
            </div>
            <table>
              <thead>
                <tr>
                  <th>رقم التسجيل</th>
                  <th>الاسم واللقب</th>
                  <th>الأجر الشهري</th>
                  <th>النظام الأساسي (المشغل)</th>
                  <th>النظام الأساسي (العون)</th>
                  <th>النظام التكميلي</th>
                  <th>المبلغ الجملي</th>
                </tr>
              </thead>
              <tbody>
                ${this.generatedCotisations.map(c => `
                  <tr>
                    <td>${c.agentPublic?.numInscription || ''}</td>
                    <td>${c.agentPublic?.prenom || ''} ${c.agentPublic?.nom || ''}</td>
                    <td>${(c.salaireMensuelApplique || 0).toFixed(3)}</td>
                    <td>${(c.montantCode137 || 0).toFixed(3)}</td>
                    <td>${(c.montantCode138 || 0).toFixed(3)}</td>
                    <td>${((c.montantCode197 || 0) + (c.montantCode198 || 0)).toFixed(3)}</td>
                    <td><strong>${(c.montantTotal || 0).toFixed(3)}</strong></td>
                  </tr>
                `).join('')}
              </tbody>
              <tfoot>
                <tr class="total">
                  <td colspan="6" style="text-align: right;">المجموع العام</td>
                  <td><strong>${this.getTotalAmount().toFixed(3)}</strong></td>
                </tr>
              </tfoot>
            </table>
            <p style="margin-top: 20px;">تاريخ الطباعة: ${this.today}</p>
          </body>
          </html>
        `);
        printWindow.document.close();
        printWindow.print();
      }
    }
  }
}
