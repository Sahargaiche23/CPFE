import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-salaire-update',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="material-icons">payments</span>
          <div>
            <h2 class="font-bold text-lg">عدم المباشرة الخاصة</h2>
            <p class="text-rose-200 text-sm">الأجور - Salaires</p>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <button (click)="save()" class="p-2 bg-green-600 hover:bg-green-500 rounded" title="حفظ">
            <span class="material-icons">save</span>
          </button>
          <button (click)="search()" class="p-2 bg-blue-600 hover:bg-blue-500 rounded" title="بحث">
            <span class="material-icons">search</span>
          </button>
        </div>
      </div>

      <!-- Agent Public Section -->
      <div class="p-6 border-b border-gray-200">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-icons text-rose-600">person</span>
          <h3 class="font-bold text-gray-800">العون العمومي</h3>
          <span class="text-gray-400 text-sm">/ Agent Public</span>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة / Institution</label>
            <div class="flex gap-2">
              <input [(ngModel)]="institutionId" class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-right" placeholder="64759">
              <input [(ngModel)]="branche" class="w-20 border border-gray-300 rounded-lg px-3 py-2 text-right" placeholder="60">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الشعبة الاجتماعية</label>
            <input [(ngModel)]="institutionName" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">رقم التسجيل / N° Inscription</label>
            <input [(ngModel)]="numInscription" (blur)="loadAgent()" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الاسم واللقب / Nom & Prénom</label>
            <input [(ngModel)]="agentName" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">تاريخ الإلحاق / Date Ilhaq</label>
            <input [(ngModel)]="dateIlhaq" type="date" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 bg-gray-50">
          </div>
        </div>
      </div>

      <!-- Salaires Section -->
      <div class="p-6">
        <div class="flex items-center justify-between mb-4">
          <div class="flex items-center gap-2">
            <span class="material-icons text-green-600">monetization_on</span>
            <h3 class="font-bold text-gray-800">الأجور</h3>
            <span class="text-gray-400 text-sm">/ Salaires</span>
          </div>
          <button (click)="addSalaire()" class="px-3 py-1.5 bg-green-100 text-green-700 rounded-lg hover:bg-green-200 text-sm flex items-center gap-1">
            <span class="material-icons text-sm">add</span>
            إضافة أجر
          </button>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-green-50">
              <tr>
                <th class="px-4 py-3 text-right font-medium text-green-800 border-b">الأجر الشهري<br><span class="text-xs text-gray-500">Salaire Mensuel (DT)</span></th>
                <th class="px-4 py-3 text-right font-medium text-green-800 border-b">تاريخ الفاعلية<br><span class="text-xs text-gray-500">Date d'effet</span></th>
                <th class="px-4 py-3 text-center font-medium text-green-800 border-b">إجراءات</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let s of salaires; let i = index" class="border-b border-gray-100 hover:bg-green-50/30">
                <td class="px-4 py-2">
                  <input [(ngModel)]="s.salaireMensuel" type="number" step="0.001"
                         class="w-full border border-gray-300 rounded px-3 py-2 text-right">
                </td>
                <td class="px-4 py-2">
                  <input [(ngModel)]="s.dateEffet" type="date"
                         class="w-full border border-gray-300 rounded px-3 py-2">
                </td>
                <td class="px-4 py-2 text-center">
                  <button (click)="removeSalaire(i)" class="text-red-500 hover:text-red-700">
                    <span class="material-icons">delete</span>
                  </button>
                </td>
              </tr>
              <tr *ngIf="salaires.length === 0">
                <td colspan="3" class="px-4 py-8 text-center text-gray-400">
                  لا توجد أجور مسجلة - Aucun salaire enregistré
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Message -->
      <div *ngIf="message" class="px-6 pb-4">
        <div [class]="success ? 'bg-green-50 text-green-700 border-green-200' : 'bg-red-50 text-red-700 border-red-200'"
             class="px-4 py-3 rounded-lg border text-sm">{{ message }}</div>
      </div>
    </div>
  `
})
export class SalaireUpdateComponent {
  institutionId = '';
  branche = '';
  institutionName = '';
  numInscription = '';
  agentName = '';
  dateIlhaq = '';
  salaires: any[] = [];
  message = '';
  success = false;

  loadAgent(): void {
    if (this.numInscription) {
      this.agentName = 'فرحات السمين';
      this.dateIlhaq = '2025-01-01';
      this.salaires = [
        { salaireMensuel: 1954.945, dateEffet: '2024-01-01' }
      ];
    }
  }

  addSalaire(): void {
    this.salaires.push({ salaireMensuel: 0, dateEffet: new Date().toISOString().split('T')[0] });
  }

  removeSalaire(index: number): void {
    this.salaires.splice(index, 1);
  }

  save(): void {
    this.message = 'تم الحفظ بنجاح - Enregistrement réussi';
    this.success = true;
  }

  search(): void {
    this.loadAgent();
  }
}
