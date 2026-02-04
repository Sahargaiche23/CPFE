import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';

interface DossierATCT {
  id: number;
  nomFr: string;
  prenomFr: string;
  email: string;
  matriculeEmployeurComplet: string;
  statut: string;
  dateCreation: string;
  codeRegime: string;
}

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
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-14" />
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
          <h2 class="text-2xl font-bold text-gray-800 mb-2">Bienvenue, {{ getNom() }}</h2>
          <p class="text-gray-600">Matricule: <strong class="text-teal-600">{{ getMatricule() }}</strong></p>
        </div>

        <!-- Dashboard Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6 mb-8">
          <!-- Déposer Dossier -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer border-2 border-teal-500" 
               [routerLink]="['/cooperant/depot-documents']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
              </div>
              <span class="px-3 py-1 bg-teal-500 text-white rounded-full text-sm font-medium">Nouveau</span>
            </div>
            <h3 class="font-semibold text-gray-800">Déposer Dossier</h3>
            <p class="text-sm text-gray-500">Nouvelle demande ATCT</p>
          </div>

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
              <span *ngIf="nbReclamations > 0" class="px-3 py-1 bg-red-500 text-white rounded-full text-sm font-medium">
                {{ nbReclamations }}
              </span>
            </div>
            <h3 class="font-semibold text-gray-800">Réclamations</h3>
            <p class="text-sm text-gray-500">{{ nbReclamations > 0 ? nbReclamations + ' en attente' : 'Aucune réclamation' }}</p>
          </div>

          <!-- Mes Dépôts -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/mes-depots']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-indigo-600">{{ nbDocuments }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">Mes Dépôts</h3>
            <p class="text-sm text-gray-500">Tous mes documents</p>
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
  dossierAtct: DossierATCT | null = null;
  username = '';
  loading = true;
  nbReclamations = 0;
  nbDocuments = 0;

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    this.username = user?.username || '';
    this.loadMyDossier();
    this.loadReclamations();
    this.loadDocuments();
  }

  loadMyDossier() {
    // Charger le dossier ATCT du coopérant connecté par son email
    this.http.get<DossierATCT[]>('/api/atct').subscribe({
      next: (dossiers) => {
        this.dossierAtct = dossiers.find(d => d.email === this.username) || null;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement dossier ATCT:', err);
        // Fallback sur coopérant classique
        this.cooperantService.getAll().subscribe({
          next: (cooperants) => {
            this.cooperant = cooperants.find(c => c.email === this.username) || null;
            this.loading = false;
          },
          error: () => this.loading = false
        });
      }
    });
  }

  loadReclamations() {
    this.http.get<any[]>(`/api/reclamations/cooperant/${this.username}/en-attente`).subscribe({
      next: (recs) => this.nbReclamations = recs.length,
      error: () => {}
    });
  }

  loadDocuments() {
    this.http.get<any[]>(`/api/documents/cooperant/${this.username}`).subscribe({
      next: (docs) => this.nbDocuments = docs.length,
      error: () => {}
    });
  }

  getStatutClass(): string {
    const statut = this.dossierAtct?.statut || this.cooperant?.statutValidation;
    switch (statut) {
      case 'VALIDE': return 'bg-green-100 text-green-800';
      case 'REJETE': return 'bg-red-100 text-red-800';
      default: return 'bg-yellow-100 text-yellow-800';
    }
  }

  getStatutLabel(): string {
    const statut = this.dossierAtct?.statut || this.cooperant?.statutValidation;
    switch (statut) {
      case 'VALIDE': return 'Validé';
      case 'REJETE': return 'Rejeté';
      case 'EN_ATTENTE': return 'En attente';
      default: return statut || 'En attente';
    }
  }

  getNom(): string {
    if (this.dossierAtct) {
      return `${this.dossierAtct.prenomFr} ${this.dossierAtct.nomFr}`;
    }
    if (this.cooperant) {
      return `${this.cooperant.prenomFr} ${this.cooperant.nomFr}`;
    }
    return '';
  }

  getMatricule(): string {
    return this.dossierAtct?.matriculeEmployeurComplet || this.cooperant?.matriculeComplet || '';
  }

  logout() {
    this.authService.logout();
  }
}
