import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CotisationService, Cotisation, CotisationGenerationRequest } from '../../services/cotisation.service';

@Component({
  selector: 'app-cotisation-list',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Cotisations</h2>
        <button (click)="showGenForm = !showGenForm"
                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 text-sm font-medium">
          <span class="material-icons text-base">calculate</span> Générer cotisations
        </button>
      </div>

      <!-- Generation Form -->
      <div *ngIf="showGenForm" class="bg-white rounded-xl shadow-sm border border-blue-200 p-6">
        <h3 class="text-lg font-semibold mb-4 flex items-center gap-2">
          <span class="material-icons text-blue-600">calculate</span> Génération trimestrielle
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Mode</label>
            <select [(ngModel)]="genRequest.mode" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
              <option value="TOUTES">Toutes les institutions</option>
              <option value="INSTITUTION">Par institution</option>
              <option value="AGENT">Par agent</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Trimestre</label>
            <select [(ngModel)]="genRequest.trimestre" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
              <option [ngValue]="1">T1 (Jan-Mars)</option>
              <option [ngValue]="2">T2 (Avr-Juin)</option>
              <option [ngValue]="3">T3 (Jul-Sep)</option>
              <option [ngValue]="4">T4 (Oct-Déc)</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Année</label>
            <input [(ngModel)]="genRequest.annee" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
          </div>
          <div *ngIf="genRequest.mode === 'INSTITUTION'">
            <label class="block text-sm font-medium text-gray-700 mb-1">ID Institution</label>
            <input [(ngModel)]="genRequest.institutionId" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
          </div>
          <div *ngIf="genRequest.mode === 'AGENT'">
            <label class="block text-sm font-medium text-gray-700 mb-1">ID Agent</label>
            <input [(ngModel)]="genRequest.agentPublicId" type="number" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
          </div>
        </div>
        <div class="flex items-center gap-3 mt-4">
          <button (click)="generer()" [disabled]="generating"
                  class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium disabled:opacity-50 flex items-center gap-2">
            <span class="material-icons text-base" [class.animate-spin]="generating">{{ generating ? 'sync' : 'play_arrow' }}</span>
            {{ generating ? 'Génération...' : 'Lancer la génération' }}
          </button>
          <span *ngIf="genMessage" class="text-sm" [class]="genError ? 'text-red-600' : 'text-green-600'">{{ genMessage }}</span>
        </div>
      </div>

      <!-- Filters -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4 flex gap-4 items-end">
        <div>
          <label class="block text-xs font-medium text-gray-500 mb-1">Année</label>
          <input [(ngModel)]="filterAnnee" type="number" placeholder="2024" class="border border-gray-300 rounded-lg px-3 py-2 text-sm w-28 focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
          <label class="block text-xs font-medium text-gray-500 mb-1">Trimestre</label>
          <select [(ngModel)]="filterTrimestre" class="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500">
            <option [ngValue]="null">Tous</option>
            <option [ngValue]="1">T1</option>
            <option [ngValue]="2">T2</option>
            <option [ngValue]="3">T3</option>
            <option [ngValue]="4">T4</option>
          </select>
        </div>
        <button (click)="load()" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 text-sm font-medium">Filtrer</button>
      </div>

      <!-- Table -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <table class="w-full text-sm">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Période</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Agent</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Institution</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Salaire</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Code 137</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Code 138</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Total</th>
              <th class="text-center px-4 py-3 font-medium text-gray-600">Statut</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let c of cotisations" class="border-b border-gray-100 hover:bg-blue-50/30">
              <td class="px-4 py-3 font-medium">T{{ c.trimestre }}/{{ c.annee }}</td>
              <td class="px-4 py-3">
                <a *ngIf="c.agentPublic" [routerLink]="['/agents', c.agentPublic.id]" class="text-blue-600 hover:underline">
                  {{ c.agentPublic.prenomFr }} {{ c.agentPublic.nomFr }}
                </a>
              </td>
              <td class="px-4 py-3 text-gray-600">{{ c.institution?.raisonSociale || '-' }}</td>
              <td class="px-4 py-3 text-right font-mono">{{ c.salaireMensuelApplique | number:'1.3-3' }}</td>
              <td class="px-4 py-3 text-right font-mono">{{ c.montantCode137 | number:'1.3-3' }}</td>
              <td class="px-4 py-3 text-right font-mono">{{ c.montantCode138 | number:'1.3-3' }}</td>
              <td class="px-4 py-3 text-right font-mono font-bold">{{ c.montantTotal | number:'1.3-3' }}</td>
              <td class="px-4 py-3 text-center">
                <span class="px-2 py-0.5 rounded-full text-xs font-medium"
                      [class]="c.statut === 'PAYE' ? 'bg-green-100 text-green-700' : c.statut === 'PARTIELLEMENT_PAYE' ? 'bg-yellow-100 text-yellow-700' : c.statut === 'EN_RETARD' ? 'bg-red-100 text-red-700' : 'bg-gray-100 text-gray-700'">
                  {{ c.statut }}
                </span>
              </td>
            </tr>
            <tr *ngIf="cotisations.length === 0">
              <td colspan="8" class="px-4 py-8 text-center text-gray-400">Aucune cotisation trouvée</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `
})
export class CotisationListComponent implements OnInit {
  cotisations: Cotisation[] = [];
  showGenForm = false;
  generating = false;
  genMessage = '';
  genError = false;
  filterAnnee: number | null = null;
  filterTrimestre: number | null = null;

  genRequest: CotisationGenerationRequest = {
    mode: 'TOUTES',
    trimestre: Math.ceil((new Date().getMonth() + 1) / 3),
    annee: new Date().getFullYear()
  };

  constructor(private service: CotisationService) {}

  ngOnInit(): void {
    this.load();
  }

  load(): void {
    this.service.findAll(this.filterAnnee || undefined, this.filterTrimestre || undefined)
      .subscribe(data => this.cotisations = data);
  }

  generer(): void {
    this.generating = true;
    this.genMessage = '';
    this.genError = false;
    this.service.generer(this.genRequest).subscribe({
      next: (result: any) => {
        this.genMessage = result.message || (result.count + ' cotisation(s) générée(s)');
        this.generating = false;
        this.load();
      },
      error: (err: any) => {
        this.genMessage = err.error?.error || 'Erreur lors de la génération';
        this.genError = true;
        this.generating = false;
      }
    });
  }
}
