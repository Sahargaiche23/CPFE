import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService } from '../../../core/services/demande.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-demande-annulation',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-700 via-pink-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <h1 class="text-lg font-bold text-gray-800">Annulation Assurance Maladie & Capital Décès</h1>
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
            <div class="grid grid-cols-2 gap-4 text-sm">
              <div><span class="text-gray-500">Nom:</span> <strong>{{ cooperant.prenomFr }} {{ cooperant.nomFr }}</strong></div>
              <div><span class="text-gray-500">Matricule:</span> <strong class="text-pink-600">{{ cooperant.matriculeComplet }}</strong></div>
              <div><span class="text-gray-500">N° Affiliation:</span> <strong>{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</strong></div>
              <div><span class="text-gray-500">Salaire:</span> <strong>{{ cooperant.salaire | number:'1.3-3' }} TND</strong></div>
            </div>
          </div>

          <!-- Avertissement -->
          <div class="bg-red-50 border-2 border-red-200 rounded-xl p-6">
            <div class="flex items-start gap-3">
              <svg class="w-6 h-6 text-red-600 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path>
              </svg>
              <div>
                <h3 class="font-bold text-red-800">Attention - Action irréversible</h3>
                <p class="text-sm text-red-700 mt-1">Cette demande entraîne l'annulation de votre couverture :</p>
                <ul class="text-sm text-red-700 mt-2 list-disc list-inside space-y-1">
                  <li>Assurance Maladie (CNAM)</li>
                  <li>Capital Décès</li>
                </ul>
                <p class="text-sm text-red-700 mt-2">Les cotisations futures seront recalculées en conséquence.</p>
              </div>
            </div>
          </div>

          <!-- Formulaire -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
              </svg>
              Formulaire d'annulation
            </h2>
            <div class="space-y-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Impact estimé sur les cotisations (TND)</label>
                <input type="number" [(ngModel)]="impactCotisation" step="0.001" min="0"
                       class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none"
                       placeholder="Réduction estimée sur les cotisations futures">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Motif de la demande *</label>
                <textarea [(ngModel)]="motif" rows="4"
                          class="w-full border-2 rounded-lg px-4 py-3 focus:border-pink-500 focus:outline-none"
                          placeholder="Expliquez le motif de l'annulation de l'assurance maladie et capital décès..."></textarea>
              </div>
              <div class="flex items-start gap-2">
                <input type="checkbox" [(ngModel)]="confirmed" id="confirm" class="mt-1">
                <label for="confirm" class="text-sm text-gray-700">
                  Je confirme vouloir annuler ma couverture assurance maladie et capital décès. Je comprends que cette action est soumise à validation.
                </label>
              </div>
            </div>
          </div>

          <div class="flex justify-between">
            <a routerLink="/cooperant/espace" class="px-6 py-3 bg-white text-gray-600 rounded-lg shadow hover:bg-gray-50">Annuler</a>
            <button (click)="submit()" [disabled]="loading || !motif || !confirmed"
                    class="px-6 py-3 bg-red-600 text-white rounded-lg shadow hover:bg-red-700 disabled:opacity-50 flex items-center gap-2">
              <span *ngIf="loading" class="animate-spin">⏳</span>
              Confirmer l'annulation
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
          <p class="text-gray-500 mb-6">Votre demande d'annulation est en attente de validation par un agent CNSS.</p>
          <div class="flex justify-center gap-4">
            <a routerLink="/cooperant/espace" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700">Retour</a>
            <a routerLink="/cooperant/mes-demandes" class="px-4 py-2 border border-pink-600 text-pink-600 rounded-lg hover:bg-pink-50">Suivre</a>
          </div>
        </div>
      </main>
    </div>
  `
})
export class DemandeAnnulationComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loadingCoop = true;
  loading = false;
  submitted = false;
  impactCotisation: number = 0;
  motif = '';
  confirmed = false;

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
    if (!this.cooperant?.id || !this.motif || !this.confirmed) return;
    this.loading = true;
    this.demandeService.creerAnnulationAssurance({
      cooperantId: this.cooperant.id,
      motif: this.motif,
      impactCotisation: this.impactCotisation || 0
    }).subscribe({
      next: () => { this.loading = false; this.submitted = true; },
      error: () => { this.loading = false; alert('Erreur lors du dépôt'); }
    });
  }
}
