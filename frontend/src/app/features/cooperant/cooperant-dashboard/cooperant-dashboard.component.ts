import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-cooperant-dashboard',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <!-- Header -->
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <img src="assets/images/logo.png" alt="CNSS" class="h-12" />
            <div>
              <h1 class="text-xl font-bold text-gray-800">Espace Coopérant</h1>
              <p class="text-sm text-gray-500">CNSS - Coopération Technique</p>
            </div>
          </div>
          <div class="flex items-center gap-4">
            <span class="text-gray-600">{{ username }}</span>
            <button (click)="logout()" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
              Déconnexion
            </button>
          </div>
        </div>
      </header>

      <!-- Main Content -->
      <main class="max-w-7xl mx-auto px-4 py-8">
        <!-- Welcome Banner -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-8">
          <h2 class="text-2xl font-bold text-gray-800 mb-2">Bienvenue, {{ cooperant?.prenomFr }} {{ cooperant?.nomFr }}</h2>
          <p class="text-gray-600">Matricule: <strong class="text-teal-600">{{ cooperant?.matriculeComplet }}</strong></p>
        </div>

        <!-- Dashboard Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <!-- Mon Dossier -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer" 
               [routerLink]="['/cooperant/mon-dossier']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-blue-600">1</span>
            </div>
            <h3 class="font-semibold text-gray-800">Mon Dossier</h3>
            <p class="text-sm text-gray-500">Voir ma demande</p>
          </div>

          <!-- Suivi Dossier -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/suivi']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path>
                </svg>
              </div>
              <span class="px-3 py-1 rounded-full text-sm font-medium" 
                    [ngClass]="getStatutClass()">
                {{ getStatutLabel() }}
              </span>
            </div>
            <h3 class="font-semibold text-gray-800">Suivi Dossier</h3>
            <p class="text-sm text-gray-500">État de ma demande</p>
          </div>

          <!-- Historique -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/historique']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
            </div>
            <h3 class="font-semibold text-gray-800">Historique</h3>
            <p class="text-sm text-gray-500">Mes demandes passées</p>
          </div>

          <!-- Réclamations -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/reclamations']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path>
                </svg>
              </div>
            </div>
            <h3 class="font-semibold text-gray-800">Réclamations</h3>
            <p class="text-sm text-gray-500">Soumettre une réclamation</p>
          </div>
        </div>

        <!-- Détails du dossier -->
        <div class="bg-white rounded-xl shadow-lg p-6" *ngIf="cooperant">
          <h3 class="text-lg font-bold text-gray-800 mb-4">Informations du dossier</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <p class="text-sm text-gray-500">Régime</p>
              <p class="font-medium">{{ cooperant.codeRegime === '500' ? 'Coopérant Général' : cooperant.codeRegime === '510' ? 'Coopérant Agricole Amélioré' : 'Régime Agricole' }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Email</p>
              <p class="font-medium">{{ cooperant.email }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Date de dépôt</p>
              <p class="font-medium">{{ cooperant.createdAt | date:'dd/MM/yyyy' }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Statut</p>
              <span class="px-3 py-1 rounded-full text-sm font-medium" [ngClass]="getStatutClass()">
                {{ getStatutLabel() }}
              </span>
            </div>
          </div>
        </div>
      </main>
    </div>
  `
})
export class CooperantDashboardComponent implements OnInit {
  cooperant: Cooperant | null = null;
  username = '';
  loading = true;

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    this.username = user?.username || '';
    this.loadMyDossier();
  }

  loadMyDossier() {
    // Charger le dossier du coopérant connecté par son email
    this.cooperantService.getAll().subscribe({
      next: (cooperants) => {
        this.cooperant = cooperants.find(c => c.email === this.username) || null;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement dossier:', err);
        this.loading = false;
      }
    });
  }

  getStatutClass(): string {
    switch (this.cooperant?.statutValidation) {
      case 'VALIDE': return 'bg-green-100 text-green-800';
      case 'REJETE': return 'bg-red-100 text-red-800';
      default: return 'bg-yellow-100 text-yellow-800';
    }
  }

  getStatutLabel(): string {
    switch (this.cooperant?.statutValidation) {
      case 'VALIDE': return 'Validé';
      case 'REJETE': return 'Rejeté';
      default: return 'En attente';
    }
  }

  logout() {
    this.authService.logout();
  }
}
