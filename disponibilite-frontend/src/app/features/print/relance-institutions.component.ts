import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-relance-institutions',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
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
                <option [value]="1">T1</option>
                <option [value]="2">T2</option>
                <option [value]="3">T3</option>
                <option [value]="4">T4</option>
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
                  <input type="radio" [(ngModel)]="modeInstitution" value="ONE_ALL" class="text-rose-600">
                  <span class="text-sm">مؤسسة واحدة بعنوان كافة الأعوان</span>
                </label>
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="modeInstitution" value="ONE_ONE" class="text-rose-600">
                  <span class="text-sm">مؤسسة واحدة بعنوان عون واحد</span>
                </label>
              </div>
              <div class="mt-3 space-y-2">
                <input [(ngModel)]="institutionId" placeholder="المؤسسة المشغلة" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
                <input [(ngModel)]="branche" placeholder="الشعبة الاجتماعية" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
              </div>
            </div>

            <!-- إعلام الأعوان العموميين -->
            <div class="bg-gray-50 rounded-xl p-4 border">
              <h4 class="font-bold text-gray-800 mb-3">إعلام الأعوان العموميين</h4>
              <div class="space-y-2">
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="modeAgent" value="ALL" class="text-rose-600">
                  <span class="text-sm">كافة الأعوان</span>
                </label>
                <label class="flex items-center gap-2 cursor-pointer">
                  <input type="radio" [(ngModel)]="modeAgent" value="ONE" class="text-rose-600">
                  <span class="text-sm">عون واحد</span>
                </label>
              </div>
              <div class="mt-3 space-y-2">
                <input [(ngModel)]="agentId" placeholder="العون العمومي" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
                <input [(ngModel)]="dateIlhaq" type="date" placeholder="تاريخ الإلحاق" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
                <input [(ngModel)]="codeExploitation" placeholder="الرمز" class="w-full border border-gray-300 rounded px-3 py-2 text-sm">
              </div>
            </div>
          </div>

          <div class="flex gap-3 justify-center">
            <button (click)="search()" class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2">
              <span class="material-icons">search</span>
              بحث
            </button>
            <button (click)="generate()" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 flex items-center gap-2">
              <span class="material-icons">print</span>
              توليد الإعلامات
            </button>
          </div>
        </div>

        <!-- Results Table -->
        <div *ngIf="results.length" class="mt-8">
          <h4 class="font-bold text-gray-800 mb-4">المساهمات / Cotisations</h4>
          <table class="w-full text-sm">
            <thead class="bg-red-50">
              <tr>
                <th class="px-3 py-2 text-right font-medium border-b">رقم الانخراط</th>
                <th class="px-3 py-2 text-right font-medium border-b">الضمان الاجتماعي</th>
                <th class="px-3 py-2 text-right font-medium border-b">الضمان التكميلي</th>
                <th class="px-3 py-2 text-right font-medium border-b">المجموع</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let r of results" class="border-b hover:bg-gray-50">
                <td class="px-3 py-2 font-mono">{{ r.numAffiliation }}</td>
                <td class="px-3 py-2 font-mono">{{ r.securiteSociale | number:'1.3-3' }}</td>
                <td class="px-3 py-2 font-mono">{{ r.complementaire | number:'1.3-3' }}</td>
                <td class="px-3 py-2 font-mono font-bold">{{ r.total | number:'1.3-3' }}</td>
              </tr>
            </tbody>
          </table>
          <div class="mt-4 text-sm text-gray-500">
            {{ results.length }} مؤسسة(ات) en retard
          </div>
        </div>
      </div>
    </div>
  `
})
export class RelanceInstitutionsComponent {
  trimestre = 3;
  annee = 2025;
  modeInstitution = 'ALL';
  modeAgent = 'ALL';
  institutionId = '';
  branche = '';
  agentId = '';
  dateIlhaq = '';
  codeExploitation = '';
  results: any[] = [];

  search(): void {
    this.results = [
      { numAffiliation: '64759/60', securiteSociale: 523.456, complementaire: 0.000, total: 523.456 },
      { numAffiliation: '12345/60', securiteSociale: 412.358, complementaire: 0.000, total: 412.358 }
    ];
  }

  generate(): void {
    window.print();
  }
}
