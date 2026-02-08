import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-reclamations',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <!-- Header -->
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-14" />
            <div>
              <h1 class="text-xl font-bold text-gray-800">Espace Réclamations</h1>
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
          <div class="flex justify-between items-center">
            <div>
              <h2 class="text-2xl font-bold text-gray-800 mb-2">Mes Réclamations</h2>
              <p class="text-gray-600">Gérez vos réclamations et suivez leur traitement</p>
            </div>
            <a routerLink="/cooperant/espace" class="text-teal-600 hover:text-teal-800 flex items-center gap-2">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
              </svg>
              Retour à l'espace
            </a>
          </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <!-- Nouvelle Réclamation -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer border-2 border-teal-500"
               (click)="showForm = true">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
              </div>
              <span class="px-3 py-1 bg-teal-500 text-white rounded-full text-sm font-medium">Nouveau</span>
            </div>
            <h3 class="font-semibold text-gray-800">Nouvelle Réclamation</h3>
            <p class="text-sm text-gray-500">Soumettre une demande</p>
          </div>

          <!-- En attente -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-yellow-600">{{ stats.enAttente }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">En attente</h3>
            <p class="text-sm text-gray-500">Réclamations en cours</p>
          </div>

          <!-- Traitées -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-green-600">{{ stats.traitees }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">Traitées</h3>
            <p class="text-sm text-gray-500">Réclamations résolues</p>
          </div>

          <!-- Total -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-blue-600">{{ stats.total }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">Total</h3>
            <p class="text-sm text-gray-500">Toutes les réclamations</p>
          </div>
        </div>

        <!-- Formulaire de réclamation (modal style) -->
        <div *ngIf="showForm" class="bg-white rounded-xl shadow-lg p-6 mb-8">
          <div class="flex justify-between items-center mb-6">
            <h3 class="text-xl font-bold text-gray-800">Nouvelle Réclamation</h3>
            <button (click)="showForm = false" class="text-gray-400 hover:text-gray-600">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
              </svg>
            </button>
          </div>
          
          <div *ngIf="!submitted" class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Objet de la réclamation *</label>
              <select [(ngModel)]="reclamation.objet" class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                <option value="">-- Sélectionner --</option>
                <option value="dossier">Problème avec mon dossier</option>
                <option value="validation">Délai de validation</option>
                <option value="documents">Documents manquants</option>
                <option value="correction">Demande de correction</option>
                <option value="paiement">Problème de paiement</option>
                <option value="autre">Autre</option>
              </select>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Description *</label>
              <textarea [(ngModel)]="reclamation.description" rows="5" 
                        class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                        placeholder="Décrivez votre réclamation en détail..."></textarea>
            </div>

            <div class="flex gap-4">
              <button (click)="showForm = false" 
                      class="flex-1 bg-gray-200 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-300">
                Annuler
              </button>
              <button (click)="submit()" 
                      [disabled]="!reclamation.objet || !reclamation.description"
                      class="flex-1 bg-teal-600 text-white py-3 rounded-lg font-semibold hover:bg-teal-700 disabled:bg-gray-300 disabled:cursor-not-allowed">
                Envoyer
              </button>
            </div>
          </div>

          <!-- Message de succès -->
          <div *ngIf="submitted" class="text-center py-8">
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-2">Réclamation envoyée !</h3>
            <p class="text-gray-600 mb-4">Votre réclamation a été enregistrée. Nous vous répondrons dans les plus brefs délais.</p>
            <button (click)="reset()" class="text-teal-600 hover:underline">Soumettre une autre réclamation</button>
          </div>
        </div>

        <!-- Liste des réclamations -->
        <div class="bg-white rounded-xl shadow-lg p-6">
          <h3 class="text-xl font-bold text-gray-800 mb-6">Historique des réclamations</h3>
          
          <div *ngIf="reclamations.length === 0" class="text-center py-12">
            <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
              </svg>
            </div>
            <h4 class="text-lg font-semibold text-gray-800 mb-2">Aucune réclamation</h4>
            <p class="text-gray-500">Vous n'avez pas encore soumis de réclamation</p>
          </div>

          <div *ngIf="reclamations.length > 0" class="space-y-4">
            <div *ngFor="let rec of reclamations" class="border rounded-lg p-4 hover:shadow-md transition">
              <div class="flex justify-between items-start mb-2">
                <div>
                  <h4 class="font-semibold text-gray-800">{{ getObjetLabel(rec.objet) }}</h4>
                  <p class="text-sm text-gray-500">{{ rec.dateCreation | date:'dd/MM/yyyy à HH:mm' }}</p>
                </div>
                <span class="px-3 py-1 rounded-full text-sm font-medium"
                      [ngClass]="getStatutClass(rec.statut)">
                  {{ getStatutLabel(rec.statut) }}
                </span>
              </div>
              <p class="text-gray-600 text-sm">{{ rec.description }}</p>
              <div *ngIf="rec.reponse" class="mt-3 p-3 bg-blue-50 rounded-lg">
                <p class="text-sm font-medium text-blue-800">Réponse:</p>
                <p class="text-sm text-blue-700">{{ rec.reponse }}</p>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  `
})
export class ReclamationsComponent implements OnInit {
  username = '';
  reclamation = { objet: '', description: '' };
  submitted = false;
  showForm = false;
  reclamations: any[] = [];
  stats = { enAttente: 0, traitees: 0, total: 0 };

  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    this.username = user?.username || '';
    this.loadReclamations();
  }

  loadReclamations() {
    this.http.get<any[]>(`/api/reclamations/cooperant/${this.username}`).subscribe({
      next: (recs) => {
        this.reclamations = recs;
        this.stats.total = recs.length;
        this.stats.enAttente = recs.filter(r => r.statut === 'EN_ATTENTE').length;
        this.stats.traitees = recs.filter(r => r.statut === 'TRAITEE' || r.statut === 'RESOLUE').length;
      },
      error: () => {}
    });
  }

  submit() {
    const payload = {
      ...this.reclamation,
      email: this.username,
      dateCreation: new Date().toISOString(),
      statut: 'EN_ATTENTE'
    };
    
    this.http.post('/api/reclamations', payload).subscribe({
      next: () => {
        this.submitted = true;
        this.loadReclamations();
      },
      error: () => {
        this.submitted = true;
      }
    });
  }

  reset() {
    this.reclamation = { objet: '', description: '' };
    this.submitted = false;
    this.showForm = false;
  }

  logout() {
    this.authService.logout();
  }

  getObjetLabel(objet: string): string {
    const labels: Record<string, string> = {
      'dossier': 'Problème avec mon dossier',
      'validation': 'Délai de validation',
      'documents': 'Documents manquants',
      'correction': 'Demande de correction',
      'paiement': 'Problème de paiement',
      'autre': 'Autre'
    };
    return labels[objet] || objet;
  }

  getStatutClass(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return 'bg-yellow-100 text-yellow-800';
      case 'EN_COURS': return 'bg-blue-100 text-blue-800';
      case 'TRAITEE':
      case 'RESOLUE': return 'bg-green-100 text-green-800';
      case 'REJETEE': return 'bg-red-100 text-red-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  }

  getStatutLabel(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return 'En attente';
      case 'EN_COURS': return 'En cours';
      case 'TRAITEE': return 'Traitée';
      case 'RESOLUE': return 'Résolue';
      case 'REJETEE': return 'Rejetée';
      default: return statut;
    }
  }
}
