import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { PaiementService, Paiement, PaiementRequest } from '../../services/paiement.service';

@Component({
  selector: 'app-paiement-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Paiements</h2>
        <button (click)="showForm = !showForm"
                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 text-sm font-medium">
          <span class="material-icons text-base">add</span> Nouveau paiement
        </button>
      </div>

      <!-- Form -->
      <div *ngIf="showForm" class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-lg font-semibold mb-4">Enregistrer un paiement</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">ID Cotisation</label>
            <input [(ngModel)]="form.cotisationId" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Code paiement</label>
            <select [(ngModel)]="form.codePaiement" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
              <option value="137">137 - Part patronale</option>
              <option value="138">138 - Part ouvrière</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Montant payé (DT)</label>
            <input [(ngModel)]="form.montantPaye" type="number" step="0.001" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Type paiement</label>
            <select [(ngModel)]="form.typePaiement" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
              <option value="VIREMENT">Virement</option>
              <option value="CHEQUE">Chèque</option>
              <option value="ESPECES">Espèces</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Référence</label>
            <input [(ngModel)]="form.referencePaiement" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Date paiement</label>
            <input [(ngModel)]="form.datePaiement" type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
        </div>
        <div class="flex items-center gap-3 mt-4">
          <button (click)="save()" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium">Enregistrer</button>
          <button (click)="showForm = false" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 text-sm font-medium">Annuler</button>
          <span *ngIf="message" class="text-sm" [class]="error ? 'text-red-600' : 'text-green-600'">{{ message }}</span>
        </div>
      </div>

      <!-- Table -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <table class="w-full text-sm">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="text-left px-4 py-3 font-medium text-gray-600">ID</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Cotisation</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Code</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Montant</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Type</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Référence</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Date</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let p of paiements" class="border-b border-gray-100 hover:bg-blue-50/30">
              <td class="px-4 py-3 font-mono text-gray-500">#{{ p.id }}</td>
              <td class="px-4 py-3">
                <span class="font-mono text-blue-700">Cot #{{ p.cotisation?.id }}</span>
                <span class="text-gray-500 text-xs ml-1" *ngIf="p.cotisation?.agentPublic">
                  - {{ p.cotisation.agentPublic.prenomFr }} {{ p.cotisation.agentPublic.nomFr }}
                </span>
              </td>
              <td class="px-4 py-3">
                <span class="px-2 py-0.5 rounded text-xs font-medium"
                      [class]="p.codePaiement === '137' ? 'bg-blue-100 text-blue-700' : 'bg-rose-100 text-rose-700'">
                  Code {{ p.codePaiement }}
                </span>
              </td>
              <td class="px-4 py-3 text-right font-mono font-medium text-green-700">{{ p.montantPaye | number:'1.3-3' }} DT</td>
              <td class="px-4 py-3 text-gray-600">{{ p.typePaiement }}</td>
              <td class="px-4 py-3 text-gray-600">{{ p.referencePaiement }}</td>
              <td class="px-4 py-3 text-gray-600">{{ p.datePaiement }}</td>
            </tr>
            <tr *ngIf="paiements.length === 0">
              <td colspan="7" class="px-4 py-8 text-center text-gray-400">Aucun paiement enregistré</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `
})
export class PaiementListComponent implements OnInit {
  paiements: Paiement[] = [];
  showForm = false;
  message = '';
  error = false;
  form: PaiementRequest = this.emptyForm();

  constructor(private service: PaiementService) {}

  ngOnInit(): void {
    this.load();
  }

  load(): void {
    this.service.findAll().subscribe(data => this.paiements = data);
  }

  save(): void {
    this.message = '';
    this.error = false;
    this.service.create(this.form).subscribe({
      next: () => {
        this.message = 'Paiement enregistré avec succès';
        this.form = this.emptyForm();
        this.load();
      },
      error: (err: any) => {
        this.message = err.error?.error || 'Erreur lors de l\'enregistrement';
        this.error = true;
      }
    });
  }

  private emptyForm(): PaiementRequest {
    return {
      cotisationId: 0, montantPaye: 0, codePaiement: '137',
      typePaiement: 'VIREMENT', referencePaiement: '',
      datePaiement: new Date().toISOString().split('T')[0]
    };
  }
}
