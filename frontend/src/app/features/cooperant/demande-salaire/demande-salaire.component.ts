import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService } from '../../../core/services/demande.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-demande-salaire',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-700 via-pink-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <h1 class="text-lg font-bold text-gray-800">Demande d'Actualisation Salaire</h1>
          <a routerLink="/cooperant/espace" class="ml-auto text-pink-600 hover:text-pink-800 text-sm">← Retour</a>
        </div>
      </header>

      <main class="max-w-3xl mx-auto px-4 py-8">
        <!-- Loading -->
        <div *ngIf="loadingCoop" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-pink-600 mx-auto"></div>
          <p class="mt-4 text-gray-500">Chargement de vos informations...</p>
        </div>

        <!-- Formulaire -->
        <div *ngIf="cooperant && !loadingCoop && !submitted" class="space-y-6">
          <!-- Info coopérant -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
              </svg>
              Vos Informations
            </h2>
            <div class="grid grid-cols-2 gap-4 text-sm">
              <div><span class="text-gray-500">Nom:</span> <strong>{{ cooperant.prenomFr }} {{ cooperant.nomFr }}</strong></div>
              <div><span class="text-gray-500">Matricule:</span> <strong class="text-pink-600">{{ cooperant.matriculeComplet }}</strong></div>
              <div><span class="text-gray-500">N° Affiliation:</span> <strong>{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</strong></div>
              <div><span class="text-gray-500">Salaire actuel:</span> <strong class="text-emerald-600">{{ cooperant.salaire | number:'1.3-3' }} TND</strong></div>
            </div>
          </div>

          <!-- Formulaire salaire -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              Nouveau Salaire
            </h2>
            <div class="space-y-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Nouveau salaire mensuel (TND) *</label>
                <input type="number" [(ngModel)]="nouveauSalaire" step="0.001" min="0"
                       class="w-full border-2 rounded-lg px-4 py-3 text-lg focus:border-pink-500 focus:outline-none"
                       placeholder="Ex: 3500.000">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Date d'effet</label>
                <input type="date" [(ngModel)]="dateEffet"
                       class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Motif de l'actualisation</label>
                <textarea [(ngModel)]="motif" rows="3"
                          class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none"
                          placeholder="Promotion, révision annuelle, changement de poste..."></textarea>
              </div>

              <!-- Aperçu impact -->
              <div *ngIf="nouveauSalaire" class="bg-emerald-50 border border-emerald-200 rounded-lg p-4">
                <h4 class="font-semibold text-emerald-800 text-sm mb-2">Aperçu de l'impact</h4>
                <div class="grid grid-cols-3 gap-4 text-center text-sm">
                  <div>
                    <div class="text-gray-500">Ancien</div>
                    <div class="font-bold text-gray-700">{{ cooperant!.salaire | number:'1.3-3' }}</div>
                  </div>
                  <div>
                    <div class="text-gray-500">Nouveau</div>
                    <div class="font-bold text-emerald-700">{{ nouveauSalaire | number:'1.3-3' }}</div>
                  </div>
                  <div>
                    <div class="text-gray-500">Variation</div>
                    <div class="font-bold" [ngClass]="getVariation() >= 0 ? 'text-green-600' : 'text-red-600'">
                      {{ getVariation() >= 0 ? '+' : '' }}{{ getVariation() | number:'1.3-3' }} TND
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Boutons -->
          <div class="flex justify-between">
            <a routerLink="/cooperant/espace" class="px-6 py-3 bg-white text-gray-600 rounded-lg shadow hover:bg-gray-50">Annuler</a>
            <button (click)="submit()" [disabled]="loading || !nouveauSalaire"
                    class="px-6 py-3 bg-emerald-600 text-white rounded-lg shadow hover:bg-emerald-700 disabled:opacity-50 flex items-center gap-2">
              <span *ngIf="loading" class="animate-spin">⏳</span>
              Déposer la demande
            </button>
          </div>
        </div>

        <!-- Succès -->
        <div *ngIf="submitted" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
            </svg>
          </div>
          <h2 class="text-xl font-bold text-gray-800 mb-2">Demande déposée avec succès !</h2>
          <p class="text-gray-500 mb-6">Votre demande d'actualisation de salaire est en cours de traitement.</p>
          <div class="flex justify-center gap-4">
            <a routerLink="/cooperant/espace" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700">Retour à l'espace</a>
            <a routerLink="/cooperant/mes-demandes" class="px-4 py-2 border border-pink-600 text-pink-600 rounded-lg hover:bg-pink-50">Suivre ma demande</a>
          </div>
        </div>
      </main>
    </div>
  `
})
export class DemandeSalaireComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loadingCoop = true;
  loading = false;
  submitted = false;
  nouveauSalaire: number = 0;
  dateEffet = '';
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
      next: (list) => {
        this.cooperant = list.find(c => c.email === email) || null;
        this.loadingCoop = false;
      },
      error: () => this.loadingCoop = false
    });
  }

  getVariation(): number {
    return this.nouveauSalaire - (this.cooperant?.salaire || 0);
  }

  submit() {
    if (!this.cooperant?.id || !this.nouveauSalaire) return;
    this.loading = true;
    this.demandeService.creerActualisationSalaire({
      cooperantId: this.cooperant.id,
      nouveauSalaire: this.nouveauSalaire,
      dateEffet: this.dateEffet,
      motif: this.motif
    }).subscribe({
      next: () => { this.loading = false; this.submitted = true; },
      error: () => { this.loading = false; alert('Erreur lors du dépôt de la demande'); }
    });
  }
}
