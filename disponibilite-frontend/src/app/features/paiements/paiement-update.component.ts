import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
          <button (click)="save()" class="p-2 bg-green-600 hover:bg-green-500 rounded" title="حفظ">
            <span class="material-icons">save</span>
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
              <input [(ngModel)]="institutionId" class="flex-1 border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
              <input [(ngModel)]="branche" class="w-16 border border-gray-300 rounded-lg px-3 py-2" placeholder="60">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المبلغ / Montant</label>
            <input [(ngModel)]="totalAmount" type="number" step="0.001" readonly
                   class="w-full border border-gray-200 rounded-lg px-3 py-2 bg-white font-bold text-green-700">
          </div>
          <div class="flex items-end">
            <button (click)="search()" class="w-full py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center justify-center gap-2">
              <span class="material-icons">search</span>
              بحث
            </button>
          </div>
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
                <td class="px-3 py-2">
                  <span class="px-2 py-0.5 rounded text-xs font-medium"
                        [class]="c.code === '137' ? 'bg-blue-100 text-blue-700' : 'bg-orange-100 text-orange-700'">
                    {{ c.code }}
                  </span>
                </td>
                <td class="px-3 py-2">{{ c.dateIlhaq }}</td>
                <td class="px-3 py-2">{{ c.exploitation }}</td>
                <td class="px-3 py-2 font-mono">{{ c.montantDu | number:'1.3-3' }}</td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="c.montantPaye" type="number" step="0.001"
                         class="w-28 border border-gray-300 rounded px-2 py-1 text-right">
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="c.datePaiement" type="date"
                         class="border border-gray-300 rounded px-2 py-1">
                </td>
              </tr>
              <tr *ngIf="cotisations.length === 0">
                <td colspan="7" class="px-3 py-8 text-center text-gray-400">
                  لا توجد مساهمات - Aucune cotisation
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Message -->
      <div *ngIf="message" class="px-6 pb-4">
        <div class="bg-green-50 text-green-700 border border-green-200 px-4 py-3 rounded-lg text-sm">{{ message }}</div>
      </div>
    </div>
  `
})
export class PaiementUpdateComponent {
  trimestre = 3;
  annee = 2025;
  institutionId = '64759';
  branche = '60';
  totalAmount = 179.464;
  cotisations: any[] = [];
  message = '';

  search(): void {
    this.cotisations = [
      { numInscription: '16078805', code: '138', dateIlhaq: '2025-09-01', exploitation: '5', montantDu: 179.464, montantPaye: 0, datePaiement: '' }
    ];
    this.totalAmount = this.cotisations.reduce((sum, c) => sum + c.montantDu, 0);
  }

  save(): void {
    this.message = 'تم الحفظ بنجاح - Enregistrement réussi';
  }
}
