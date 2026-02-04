import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <h1 class="text-2xl font-bold text-gray-800">📋 Mes Réclamations</h1>
          <a routerLink="/cooperant/depot-documents" class="px-4 py-2 bg-cnss-primary text-white rounded-lg hover:bg-cnss-secondary">
            📁 Déposer des documents
          </a>
        </div>

        <div *ngIf="loading" class="flex justify-center py-12">
          <div class="spinner"></div>
        </div>

        <div *ngIf="!loading && reclamations.length === 0" class="card text-center py-12">
          <span class="material-icons text-6xl text-green-500 mb-4">check_circle</span>
          <h2 class="text-xl font-semibold text-gray-700">Aucune réclamation en attente</h2>
          <p class="text-gray-500 mt-2">Tous vos documents sont conformes.</p>
        </div>

        <div *ngIf="!loading && reclamations.length > 0" class="space-y-4">
          <div *ngFor="let rec of reclamations" class="card border-l-4"
               [ngClass]="{'border-l-orange-500': rec.statut === 'EN_ATTENTE', 'border-l-blue-500': rec.statut === 'CORRIGE', 'border-l-green-500': rec.statut === 'TRAITE'}">
            
            <div class="flex items-start justify-between mb-4">
              <div>
                <span class="px-3 py-1 rounded-full text-sm font-medium"
                      [ngClass]="{'bg-orange-100 text-orange-800': rec.statut === 'EN_ATTENTE', 'bg-blue-100 text-blue-800': rec.statut === 'CORRIGE', 'bg-green-100 text-green-800': rec.statut === 'TRAITE'}">
                  {{ getStatutLabel(rec.statut) }}
                </span>
                <span class="text-gray-500 text-sm ml-3">{{ formatDate(rec.dateCreation) }}</span>
              </div>
              <span class="text-gray-400 text-sm">Réclamation #{{ rec.id }}</span>
            </div>

            <div *ngIf="rec.documentsManquants && rec.documentsManquants.length > 0" class="mb-4">
              <h3 class="font-semibold text-gray-700 mb-2">📄 Documents manquants ou incorrects:</h3>
              <div class="flex flex-wrap gap-2">
                <span *ngFor="let doc of rec.documentsManquants" 
                      class="px-3 py-1 bg-red-100 text-red-700 rounded-full text-sm">
                  {{ getDocumentLabel(doc) }}
                </span>
              </div>
            </div>

            <div *ngIf="rec.motif" class="mb-4">
              <h3 class="font-semibold text-gray-700 mb-2">💬 Message de l'agent:</h3>
              <p class="text-gray-600 bg-gray-50 p-3 rounded">{{ rec.motif }}</p>
            </div>

            <div *ngIf="rec.statut === 'EN_ATTENTE'" class="mt-4 p-4 bg-orange-50 rounded-lg">
              <h3 class="font-semibold text-orange-800 mb-3">⚠️ Action requise</h3>
              <p class="text-gray-600 mb-4">Veuillez corriger et redéposer les documents manquants, puis marquez la réclamation comme corrigée.</p>
              
              <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-2">Commentaire (optionnel):</label>
                <textarea [(ngModel)]="commentaires[rec.id]" rows="2" 
                          class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-orange-500"
                          placeholder="Expliquez les corrections apportées..."></textarea>
              </div>
              
              <div class="flex gap-3">
                <a routerLink="/cooperant/depot-documents" 
                   class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                  📁 Déposer les documents manquants
                </a>
                <button (click)="marquerCorrige(rec)" 
                        class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                  ✓ Marquer comme corrigé
                </button>
              </div>
            </div>

            <div *ngIf="rec.statut === 'CORRIGE' && rec.commentaireCooperant" class="mt-4 p-4 bg-blue-50 rounded-lg">
              <h3 class="font-semibold text-blue-800 mb-2">📝 Votre commentaire:</h3>
              <p class="text-gray-600">{{ rec.commentaireCooperant }}</p>
            </div>

            <div *ngIf="rec.statut === 'TRAITE'" class="mt-4 p-4 bg-green-50 rounded-lg">
              <span class="text-green-700">✓ Cette réclamation a été traitée et validée.</span>
            </div>
          </div>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class MesReclamationsComponent implements OnInit {
  reclamations: Reclamation[] = [];
  loading = true;
  commentaires: { [key: number]: string } = {};
  userEmail = '';

  constructor(private http: HttpClient) {}

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
}
