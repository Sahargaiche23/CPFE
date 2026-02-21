import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService } from '../../../core/services/demande.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-demande-sortie-regime',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-700 via-pink-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <h1 class="text-lg font-bold text-gray-800">Demande Sortie Régime Maladie</h1>
          <a routerLink="/cooperant/espace" class="ml-auto text-pink-600 hover:text-pink-800 text-sm">← Retour</a>
        </div>
      </header>

      <main class="max-w-3xl mx-auto px-4 py-8">
        <div *ngIf="loadingCoop" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-pink-600 mx-auto"></div>
          <p class="mt-4 text-gray-500">Chargement...</p>
        </div>

        <div *ngIf="cooperant && !loadingCoop && !submitted" class="space-y-6">
          <!-- Info coopérant -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
              </svg>
              Vos Informations
            </h2>
            <div class="grid grid-cols-2 gap-4 text-sm">
              <div><span class="text-gray-500">Nom:</span> <strong>{{ cooperant.prenomFr }} {{ cooperant.nomFr }}</strong></div>
              <div><span class="text-gray-500">Matricule:</span> <strong class="text-pink-600">{{ cooperant.matriculeComplet }}</strong></div>
              <div><span class="text-gray-500">N° Affiliation:</span> <strong>{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</strong></div>
              <div><span class="text-gray-500">Régime:</span> <strong>{{ cooperant.codeRegime === '500' ? 'Général' : cooperant.codeRegime === '510' ? 'Agricole Amélioré' : cooperant.codeRegime }}</strong></div>
            </div>
          </div>

          <!-- Formulaire -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
              </svg>
              Détails de la demande
            </h2>
            <div class="space-y-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Régime concerné *</label>
                <select [(ngModel)]="regimeConcerne" class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none">
                  <option value="">-- Sélectionner --</option>
                  <option value="134">134 - Assurance Maladie CNAM</option>
                  <option value="0">0 - Assurances Sociales</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Impact sur les cotisations (TND)</label>
                <input type="number" [(ngModel)]="impactCotisation" step="0.001" min="0"
                       class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none"
                       placeholder="Montant de réduction estimé">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Motif de la demande *</label>
                <textarea [(ngModel)]="motif" rows="4"
                          class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none"
                          placeholder="Expliquez le motif de sortie du régime maladie..."></textarea>
              </div>
              <div class="bg-blue-50 border border-blue-200 rounded-lg p-4 text-sm text-blue-800">
                <strong>Note:</strong> La sortie du régime maladie entraîne la suppression de la couverture CNAM. Cette demande nécessite une validation par un agent CNSS.
              </div>
            </div>
          </div>

          <div class="flex justify-between">
            <a routerLink="/cooperant/espace" class="px-6 py-3 bg-white text-gray-600 rounded-lg shadow hover:bg-gray-50">Annuler</a>
            <button (click)="submit()" [disabled]="loading || !regimeConcerne || !motif"
                    class="px-6 py-3 bg-blue-600 text-white rounded-lg shadow hover:bg-blue-700 disabled:opacity-50 flex items-center gap-2">
              <span *ngIf="loading" class="animate-spin">⏳</span>
              Déposer la demande
            </button>
          </div>
        </div>

        <div *ngIf="submitted" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
            </svg>
          </div>
          <h2 class="text-xl font-bold text-gray-800 mb-2">Demande déposée !</h2>
          <p class="text-gray-500 mb-6">Votre demande de sortie du régime maladie est en cours de traitement.</p>
          <div class="flex justify-center gap-4">
            <a routerLink="/cooperant/espace" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700">Retour</a>
            <a routerLink="/cooperant/mes-demandes" class="px-4 py-2 border border-pink-600 text-pink-600 rounded-lg hover:bg-pink-50">Suivre</a>
          </div>
        </div>
      </main>
    </div>
  `
})
export class DemandeSortieRegimeComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loadingCoop = true;
  loading = false;
  submitted = false;
  regimeConcerne = '';
  impactCotisation: number = 0;
  motif = '';

  constructor(
    private cooperantService: CooperantService,
    private demandeService: DemandeService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    const email = user?.username || '';
    this.cooperantService.getAll().subscribe({
      next: (list) => { this.cooperant = list.find(c => c.email === email) || null; this.loadingCoop = false; },
      error: () => this.loadingCoop = false
    });
  }

  submit() {
    if (!this.cooperant?.id || !this.regimeConcerne || !this.motif) return;
    this.loading = true;
    this.demandeService.creerSortieRegimeMaladie({
      cooperantId: this.cooperant.id,
      regimeConcerne: this.regimeConcerne,
      motif: this.motif,
      impactCotisation: this.impactCotisation || 0
    }).subscribe({
      next: () => { this.loading = false; this.submitted = true; },
      error: () => { this.loading = false; alert('Erreur lors du dépôt'); }
    });
  }
}
