import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
            <input [(ngModel)]="numInscription" class="w-full border border-gray-300 rounded-lg px-3 py-2">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة / Institution</label>
            <input [(ngModel)]="institutionId" class="w-full border border-gray-300 rounded-lg px-3 py-2">
          </div>
          <div class="flex items-end">
            <button (click)="search()" class="w-full py-2 bg-rose-600 text-white rounded-lg hover:bg-rose-700 flex items-center justify-center gap-2">
              <span class="material-icons">search</span>
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
              <p class="font-bold text-rose-800">{{ agent.numInscription }}</p>
            </div>
            <div>
              <p class="text-gray-500">الاسم واللقب</p>
              <p class="font-bold">{{ agent.nom }}</p>
            </div>
            <div>
              <p class="text-gray-500">المؤسسة</p>
              <p class="font-bold">{{ agent.institution }}</p>
            </div>
            <div>
              <p class="text-gray-500">رقم الانخراط</p>
              <p class="font-bold font-mono">{{ agent.numAffiliation }}</p>
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
                <th class="px-4 py-3 text-right font-medium border-b">المساهمات 9.18%<br>Part Agent</th>
                <th class="px-4 py-3 text-right font-medium border-b">المساهمات 16.57%<br>Part Employeur</th>
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
            </tbody>
            <tfoot class="bg-rose-100 font-bold">
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
        <div class="mt-6 text-center">
          <button (click)="print()" class="px-6 py-3 bg-rose-700 text-white rounded-lg hover:bg-rose-800 flex items-center gap-2 mx-auto">
            <span class="material-icons">print</span>
            طباعة البطاقة / Imprimer
          </button>
        </div>
      </div>
    </div>
  `
})
export class CartePaiementComponent {
  numInscription = '';
  institutionId = '';
  agent: any = null;
  paiements: any[] = [];
  totalSalaire = 0;
  totalAgent = 0;
  totalEmployeur = 0;
  grandTotal = 0;

  search(): void {
    this.agent = {
      numInscription: '16078805/05',
      nom: 'فرحات السمين',
      institution: 'غرفة التجارة والصناعة لتونس',
      numAffiliation: '64759/60'
    };
    this.paiements = [
      { trimestre: '2017/3', salaire: 1050.447, partAgent: 96.431, partEmployeur: 174.059, total: 270.490 },
      { trimestre: '2017/4', salaire: 3151.340, partAgent: 289.293, partEmployeur: 522.177, total: 811.470 },
      { trimestre: '2018/1', salaire: 3275.948, partAgent: 300.732, partEmployeur: 542.825, total: 843.557 },
      { trimestre: '2018/2', salaire: 3275.948, partAgent: 300.732, partEmployeur: 542.825, total: 843.557 },
      { trimestre: '2018/3', salaire: 3275.948, partAgent: 300.732, partEmployeur: 542.825, total: 843.557 },
      { trimestre: '2018/4', salaire: 3275.848, partAgent: 300.732, partEmployeur: 542.825, total: 843.557 },
      { trimestre: '2021/3', salaire: 3732.876, partAgent: 342.678, partEmployeur: 618.538, total: 961.216 },
      { trimestre: '2021/4', salaire: 3732.876, partAgent: 342.678, partEmployeur: 618.538, total: 961.216 },
      { trimestre: '2022/1', salaire: 3732.876, partAgent: 342.678, partEmployeur: 618.538, total: 961.216 },
      { trimestre: '2022/2', salaire: 2488.582, partAgent: 228.481, partEmployeur: 412.358, total: 640.839 },
      { trimestre: '2022/3', salaire: 3732.876, partAgent: 342.678, partEmployeur: 618.538, total: 961.216 }
    ];
    this.calculateTotals();
  }

  calculateTotals(): void {
    this.totalSalaire = this.paiements.reduce((s, p) => s + p.salaire, 0);
    this.totalAgent = this.paiements.reduce((s, p) => s + p.partAgent, 0);
    this.totalEmployeur = this.paiements.reduce((s, p) => s + p.partEmployeur, 0);
    this.grandTotal = this.totalAgent + this.totalEmployeur;
  }

  print(): void {
    window.print();
  }
}
