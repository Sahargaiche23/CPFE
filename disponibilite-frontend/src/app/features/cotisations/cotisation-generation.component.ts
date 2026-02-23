import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
          <div *ngIf="mode === 'INSTITUTION' || mode === 'AGENT'" class="grid grid-cols-2 gap-4 mb-6">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة / Institution</label>
              <input [(ngModel)]="institutionId" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
            </div>
            <div *ngIf="mode === 'AGENT'">
              <label class="block text-sm font-medium text-gray-600 mb-1">العون العمومي / Agent</label>
              <input [(ngModel)]="agentId" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="16078805">
            </div>
          </div>

          <div *ngIf="mode === 'AGENT'" class="mb-6">
            <label class="block text-sm font-medium text-gray-600 mb-1">تاريخ الإلحاق / Date Ilhaq</label>
            <input [(ngModel)]="dateIlhaq" type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2">
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
  generating = false;
  result = '';
  generatedCount = 0;
  totalFiles = 0;

  generate(): void {
    this.generating = true;
    this.result = '';
    setTimeout(() => {
      this.generatedCount = 5;
      this.totalFiles = 5;
      this.result = `تم تنزيل ${this.generatedCount} مساهمات بنجاح - ${this.generatedCount} cotisations générées`;
      this.generating = false;
    }, 1500);
  }
}
