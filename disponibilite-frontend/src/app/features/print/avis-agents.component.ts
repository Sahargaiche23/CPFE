import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-avis-agents',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center gap-3">
        <span class="material-icons">mail</span>
        <div>
          <h2 class="font-bold text-lg">إشعار للخلاص بالنسبة للأعوان</h2>
          <p class="text-rose-200 text-sm">Avis de paiement pour les agents</p>
        </div>
      </div>

      <!-- Form -->
      <div class="p-6">
        <div class="max-w-3xl mx-auto">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">الثلاثية / السنة</label>
              <div class="flex gap-2">
                <select [(ngModel)]="trimestre" class="flex-1 border border-gray-300 rounded-lg px-3 py-2">
                  <option [value]="1">T1</option>
                  <option [value]="2">T2</option>
                  <option [value]="3">T3</option>
                  <option [value]="4">T4</option>
                </select>
                <input [(ngModel)]="annee" type="number" class="w-28 border border-gray-300 rounded-lg px-3 py-2">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة / Institution</label>
              <div class="flex gap-2">
                <input [(ngModel)]="institutionId" class="flex-1 border border-gray-300 rounded-lg px-3 py-2" placeholder="64759">
                <input [(ngModel)]="branche" class="w-16 border border-gray-300 rounded-lg px-3 py-2" placeholder="60">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">العون العمومي / Agent</label>
              <input [(ngModel)]="agentId" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="16078805">
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
            <button (click)="print()" [disabled]="!avis" class="px-6 py-2 bg-rose-700 text-white rounded-lg hover:bg-rose-800 disabled:opacity-50 flex items-center gap-2">
              <span class="material-icons">print</span>
              طباعة
            </button>
          </div>
        </div>

        <!-- Preview -->
        <div *ngIf="avis" class="mt-8 border border-gray-300 rounded-xl p-8 bg-white max-w-4xl mx-auto" id="printArea">
          <!-- Letterhead -->
          <div class="flex justify-between items-start mb-6 border-b pb-4">
            <div class="text-right">
              <p class="font-bold">الجمهورية التونسية</p>
              <p class="text-sm">وزارة الشؤون الاجتماعية والتضامن</p>
              <p class="font-bold text-rose-800">الصندوق الوطني للضمان الاجتماعي</p>
              <p class="text-sm">المكتب الجهوي: تونس المدينة</p>
            </div>
            <div class="text-left text-sm">
              <p>{{ currentDate }}</p>
            </div>
          </div>

          <!-- Institution Info -->
          <div class="mb-6 text-right">
            <p><strong>المؤسسة:</strong> {{ avis.institution }}</p>
            <p><strong>رقم الإنخراط:</strong> {{ avis.numAffiliation }}</p>
            <p><strong>العنوان:</strong> {{ avis.adresse }}</p>
          </div>

          <!-- Subject -->
          <div class="text-center mb-6">
            <p class="text-lg font-bold underline">الموضوع: إعلام لدفع المساهمات</p>
          </div>

          <!-- Body -->
          <div class="text-right mb-6 leading-relaxed">
            <p>أما بعد،</p>
            <p class="mt-2">
              أتشرف بإعلامكم بأن مبلغ المساهمات الواجب عليكم دفعها للصندوق الوطني للضمان الاجتماعي في إطار التغطية
              الاجتماعية للأعوان العموميين المحالين على عدم المباشرة الخاصة، طبقا للقانون عدد 16 لسنة 2003 المؤرخ في 24
              فيفري 2003، بعنوان الثلاثي {{ getTrimestreAr() }} لسنة {{ annee }}
            </p>
            <p class="mt-2 font-bold">
              حدد بـ {{ avis.montantLettre }}
            </p>
          </div>

          <!-- Table -->
          <table class="w-full text-sm border border-gray-400 mb-6">
            <thead class="bg-gray-100">
              <tr>
                <th class="border border-gray-400 px-3 py-2 text-right">الرمز</th>
                <th class="border border-gray-400 px-3 py-2 text-right">اسم ولقب العون المعني</th>
                <th class="border border-gray-400 px-3 py-2 text-right">رقم المضمون الاجتماعي</th>
                <th class="border border-gray-400 px-3 py-2 text-right">مبلغ الأجور</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let item of avis.items">
                <td class="border border-gray-400 px-3 py-2">{{ item.code }}</td>
                <td class="border border-gray-400 px-3 py-2">{{ item.nom }}</td>
                <td class="border border-gray-400 px-3 py-2 font-mono">{{ item.numInscription }}</td>
                <td class="border border-gray-400 px-3 py-2 font-mono">{{ item.salaire | number:'1.3-3' }}</td>
              </tr>
            </tbody>
          </table>

          <!-- Signature -->
          <div class="text-left mt-8">
            <p>رئيس مصلحة أول</p>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    @media print {
      :host { display: block; }
      #printArea { border: none !important; }
    }
  `]
})
export class AvisAgentsComponent {
  trimestre = 3;
  annee = 2025;
  institutionId = '64759';
  branche = '60';
  agentId = '16078805';
  dateIlhaq = '2025-01-01';
  avis: any = null;
  currentDate = new Date().toLocaleDateString('ar-TN');

  getTrimestreAr(): string {
    const names = ['الأولى', 'الثانية', 'الثالثة', 'الرابعة'];
    return names[this.trimestre - 1];
  }

  search(): void {
    this.avis = {
      institution: 'غرفة التجارة والصناعة لتونس',
      numAffiliation: '60-64759',
      adresse: 'AVENUE DE PARIS 31',
      montantLettre: 'ثلاثة مائة وثلاثة وعشرون دينار و 934 مليم',
      items: [
        { code: '137', nom: 'فرحات السمين', numInscription: '05-16078805', salaire: 1954.945 },
        { code: '197', nom: '', numInscription: '', salaire: 0.000 }
      ]
    };
  }

  print(): void {
    window.print();
  }
}
