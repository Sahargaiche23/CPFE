import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
              <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة / Institution</label>
              <div class="flex gap-2">
                <input [(ngModel)]="institutionId" class="flex-1 border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
                <input [(ngModel)]="branche" class="w-16 border border-gray-300 rounded-lg px-3 py-2" placeholder="60">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">العون العمومي / Agent</label>
              <input [(ngModel)]="agentId" class="w-full border border-gray-300 rounded-lg px-3 py-2">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">تاريخ الإلحاق / Date Ilhaq</label>
              <input [(ngModel)]="dateIlhaq" type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2">
            </div>
          </div>

          <div class="flex gap-3 justify-center">
            <button (click)="search()" class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2">
              <span class="material-icons">search</span>
              بحث
            </button>
            <button (click)="print()" [disabled]="!results.length" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 disabled:opacity-50 flex items-center gap-2">
              <span class="material-icons">print</span>
              طباعة
            </button>
          </div>
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
                <td class="px-4 py-2 font-mono">{{ r.montantDu | number:'1.3-3' }}</td>
                <td class="px-4 py-2 font-mono text-green-600">{{ r.montantPaye | number:'1.3-3' }}</td>
                <td class="px-4 py-2 font-mono text-red-600">{{ r.reste | number:'1.3-3' }}</td>
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
                <td class="px-4 py-3 font-mono">{{ totalDu | number:'1.3-3' }}</td>
                <td class="px-4 py-3 font-mono text-green-600">{{ totalPaye | number:'1.3-3' }}</td>
                <td class="px-4 py-3 font-mono text-red-600">{{ totalReste | number:'1.3-3' }}</td>
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
  annee = 2025;
  institutionId = '';
  branche = '';
  agentId = '';
  dateIlhaq = '';
  results: any[] = [];
  totalDu = 0;
  totalPaye = 0;
  totalReste = 0;

  search(): void {
    this.results = [
      { trimestre: 1, annee: 2025, institution: 'غرفة التجارة', agent: 'فرحات السمين', montantDu: 523.456, montantPaye: 523.456, reste: 0, statut: 'PAYE' },
      { trimestre: 2, annee: 2025, institution: 'غرفة التجارة', agent: 'فرحات السمين', montantDu: 523.456, montantPaye: 300.000, reste: 223.456, statut: 'PARTIEL' },
      { trimestre: 3, annee: 2025, institution: 'غرفة التجارة', agent: 'فرحات السمين', montantDu: 523.456, montantPaye: 0, reste: 523.456, statut: 'EN_ATTENTE' }
    ];
    this.calculateTotals();
  }

  calculateTotals(): void {
    this.totalDu = this.results.reduce((s, r) => s + r.montantDu, 0);
    this.totalPaye = this.results.reduce((s, r) => s + r.montantPaye, 0);
    this.totalReste = this.results.reduce((s, r) => s + r.reste, 0);
  }

  print(): void {
    window.print();
  }
}
