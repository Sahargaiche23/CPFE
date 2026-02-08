import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../../core/services/auth.service';

interface Reclamation {
  id: number;
  emailCooperant: string;
  motif: string;
  documentsManquants: string[];
  agentId: number;
  dateCreation: string;
  statut: string;
  dateTraitement: string;
  commentaireCooperant: string;
}

@Component({
  selector: 'app-mes-reclamations',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
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
            <span class="text-gray-600">{{ userEmail }}</span>
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
          <!-- Déposer documents -->
          <a routerLink="/cooperant/depot-documents" class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer border-2 border-teal-500">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
              </div>
              <span class="px-3 py-1 bg-teal-500 text-white rounded-full text-sm font-medium">Nouveau</span>
            </div>
            <h3 class="font-semibold text-gray-800">Déposer Documents</h3>
            <p class="text-sm text-gray-500">Ajouter des pièces</p>
          </a>

          <!-- En attente -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-yellow-600">{{ countByStatut('EN_ATTENTE') }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">En attente</h3>
            <p class="text-sm text-gray-500">À corriger</p>
          </div>

          <!-- Corrigées -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-blue-600">{{ countByStatut('CORRIGE') }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">Corrigées</h3>
            <p class="text-sm text-gray-500">En vérification</p>
          </div>

          <!-- Traitées -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-green-600">{{ countByStatut('TRAITE') }}</span>
            </div>
            <h3 class="font-semibold text-gray-800">Traitées</h3>
            <p class="text-sm text-gray-500">Validées</p>
          </div>
        </div>

        <!-- Liste des réclamations -->
        <div class="bg-white rounded-xl shadow-lg p-6">
          <h3 class="text-xl font-bold text-gray-800 mb-6">Liste des réclamations</h3>

          <div *ngIf="loading" class="flex justify-center py-12">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-teal-600"></div>
          </div>

          <div *ngIf="!loading && reclamations.length === 0" class="text-center py-12">
            <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
              </svg>
            </div>
            <h4 class="text-lg font-semibold text-gray-800 mb-2">Aucune réclamation en attente</h4>
            <p class="text-gray-500">Tous vos documents sont conformes.</p>
          </div>

          <div *ngIf="!loading && reclamations.length > 0" class="space-y-4">
            <div *ngFor="let rec of reclamations" class="border rounded-lg p-4 hover:shadow-md transition"
                 [ngClass]="{'border-l-4 border-l-yellow-500': rec.statut === 'EN_ATTENTE', 'border-l-4 border-l-blue-500': rec.statut === 'CORRIGE', 'border-l-4 border-l-green-500': rec.statut === 'TRAITE'}">
              
              <div class="flex items-start justify-between mb-3">
                <div>
                  <span class="px-3 py-1 rounded-full text-sm font-medium"
                        [ngClass]="{'bg-yellow-100 text-yellow-800': rec.statut === 'EN_ATTENTE', 'bg-blue-100 text-blue-800': rec.statut === 'CORRIGE', 'bg-green-100 text-green-800': rec.statut === 'TRAITE'}">
                    {{ getStatutLabel(rec.statut) }}
                  </span>
                  <span class="text-gray-500 text-sm ml-3">{{ formatDate(rec.dateCreation) }}</span>
                </div>
                <span class="text-gray-400 text-sm">#{{ rec.id }}</span>
              </div>

              <div *ngIf="rec.documentsManquants && rec.documentsManquants.length > 0" class="mb-3">
                <p class="font-medium text-gray-700 mb-2">Documents manquants:</p>
                <div class="flex flex-wrap gap-2">
                  <span *ngFor="let doc of rec.documentsManquants" class="px-2 py-1 bg-red-100 text-red-700 rounded text-sm">
                    {{ getDocumentLabel(doc) }}
                  </span>
                </div>
              </div>

              <div *ngIf="rec.motif" class="mb-3 p-3 bg-gray-50 rounded">
                <p class="text-sm text-gray-600">{{ rec.motif }}</p>
              </div>

              <div *ngIf="rec.statut === 'EN_ATTENTE'" class="mt-4 p-4 bg-yellow-50 rounded-lg">
                <div class="mb-3">
                  <textarea [(ngModel)]="commentaires[rec.id]" rows="2" 
                            class="w-full border rounded-lg px-3 py-2 text-sm"
                            placeholder="Commentaire sur les corrections..."></textarea>
                </div>
                <div class="flex gap-3">
                  <a routerLink="/cooperant/depot-documents" class="px-4 py-2 bg-blue-600 text-white rounded-lg text-sm hover:bg-blue-700">
                    Déposer documents
                  </a>
                  <button (click)="marquerCorrige(rec)" class="px-4 py-2 bg-green-600 text-white rounded-lg text-sm hover:bg-green-700">
                    Marquer corrigé
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  `,
  styles: []
})
export class MesReclamationsComponent implements OnInit {
  reclamations: Reclamation[] = [];
  loading = true;
  commentaires: { [key: number]: string } = {};
  userEmail = '';

  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    // Récupérer l'email de l'utilisateur connecté depuis le localStorage
    const userStr = localStorage.getItem('user');
    if (userStr) {
      const user = JSON.parse(userStr);
      this.userEmail = user.username || user.email || '';
    }
    this.loadReclamations();
  }

  loadReclamations() {
    if (!this.userEmail) {
      this.loading = false;
      return;
    }
    
    this.http.get<Reclamation[]>(`/api/reclamations/cooperant/${this.userEmail}`).subscribe({
      next: (data) => {
        this.reclamations = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement réclamations:', err);
        this.loading = false;
      }
    });
  }

  marquerCorrige(rec: Reclamation) {
    const commentaire = this.commentaires[rec.id] || '';
    
    this.http.put(`/api/reclamations/${rec.id}/corriger`, { commentaire }).subscribe({
      next: () => {
        alert('Réclamation marquée comme corrigée. Un agent va vérifier vos documents.');
        this.loadReclamations();
      },
      error: (err) => {
        console.error('Erreur:', err);
        alert('Erreur lors de la mise à jour');
      }
    });
  }

  getStatutLabel(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return '⏳ En attente de correction';
      case 'CORRIGE': return '📤 Corrigé - En vérification';
      case 'TRAITE': return '✓ Traité';
      default: return statut;
    }
  }

  getDocumentLabel(type: string): string {
    switch (type?.toLowerCase()) {
      case 'identite': return 'Pièce d\'identité';
      case 'contrat': return 'Contrat de travail';
      case 'diplome': return 'Diplômes';
      case 'attestation': return 'Attestation';
      case 'atct': return 'Formulaire ATCT';
      case 'autres': return 'Autres';
      default: return type;
    }
  }

  formatDate(dateStr: string): string {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('fr-FR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  countByStatut(statut: string): number {
    return this.reclamations.filter(r => r.statut === statut).length;
  }

  logout() {
    this.authService.logout();
  }
}
