import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'app-mon-dossier',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
            <a routerLink="/cooperant/espace" class="text-teal-600 hover:text-teal-800">
              ← Retour au tableau de bord
            </a>
          </div>
        </div>
      </header>

      <main class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6" *ngIf="cooperant">
          <h2 class="text-2xl font-bold text-gray-800 mb-6">Mon Dossier</h2>
          
          <!-- Statut -->
          <div class="mb-6 p-4 rounded-lg" [ngClass]="getStatutBgClass()">
            <div class="flex items-center gap-3">
              <span class="text-lg font-semibold">Statut:</span>
              <span class="px-4 py-2 rounded-full font-bold" [ngClass]="getStatutClass()">
                {{ getStatutLabel() }}
              </span>
            </div>
            <p class="mt-2 text-sm" *ngIf="cooperant.motifRejet">
              <strong>Motif:</strong> {{ cooperant.motifRejet }}
            </p>
          </div>

          <!-- Informations personnelles -->
          <div class="mb-6">
            <h3 class="text-lg font-semibold text-gray-700 mb-3 border-b pb-2">Informations personnelles</h3>
            <div class="grid grid-cols-2 gap-4">
              <div><span class="text-gray-500">Matricule:</span> <strong>{{ cooperant.matriculeComplet }}</strong></div>
              <div><span class="text-gray-500">Régime:</span> {{ getRegimeLabel() }}</div>
              <div><span class="text-gray-500">Nom (FR):</span> {{ cooperant.nomFr }} {{ cooperant.prenomFr }}</div>
              <div><span class="text-gray-500">Nom (AR):</span> {{ cooperant.nomAr }} {{ cooperant.prenomAr }}</div>
              <div><span class="text-gray-500">Email:</span> {{ cooperant.email }}</div>
              <div><span class="text-gray-500">Téléphone:</span> {{ cooperant.telephone || '-' }}</div>
              <div><span class="text-gray-500">Date de naissance:</span> {{ cooperant.dateNaissance | date:'dd/MM/yyyy' }}</div>
              <div><span class="text-gray-500">Nationalité:</span> {{ cooperant.nationalite }}</div>
            </div>
          </div>

          <!-- Documents -->
          <div class="mb-6">
            <h3 class="text-lg font-semibold text-gray-700 mb-3 border-b pb-2">Documents déposés</h3>
            <div class="space-y-3">
              <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg" *ngIf="cooperant.fichierDossier">
                <span>📄 Dossier</span>
                <a [href]="getDownloadUrl(cooperant.fichierDossier)" target="_blank" 
                   class="text-teal-600 hover:underline">Télécharger</a>
              </div>
              <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg" *ngIf="cooperant.fichierIdentite">
                <span>🪪 Pièce d'identité</span>
                <a [href]="getDownloadUrl(cooperant.fichierIdentite)" target="_blank"
                   class="text-teal-600 hover:underline">Télécharger</a>
              </div>
              <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg" *ngIf="cooperant.fichierAutre">
                <span>📎 Autre document</span>
                <a [href]="getDownloadUrl(cooperant.fichierAutre)" target="_blank"
                   class="text-teal-600 hover:underline">Télécharger</a>
              </div>
            </div>
          </div>

          <!-- Dates -->
          <div>
            <h3 class="text-lg font-semibold text-gray-700 mb-3 border-b pb-2">Dates</h3>
            <div class="grid grid-cols-2 gap-4">
              <div><span class="text-gray-500">Date de dépôt:</span> {{ cooperant.createdAt | date:'dd/MM/yyyy HH:mm' }}</div>
              <div *ngIf="cooperant.dateValidation">
                <span class="text-gray-500">Date de traitement:</span> {{ cooperant.dateValidation | date:'dd/MM/yyyy HH:mm' }}
              </div>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-xl shadow-lg p-6 text-center" *ngIf="!cooperant && !loading">
          <p class="text-gray-500">Aucun dossier trouvé</p>
        </div>
      </main>
    </div>
  `
})
export class MonDossierComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loading = true;

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.loadMyDossier();
  }

  loadMyDossier() {
    const user = this.authService.getCurrentUser();
    const username = user?.username || '';
    
    this.cooperantService.getAll().subscribe({
      next: (cooperants) => {
        this.cooperant = cooperants.find(c => c.email === username) || null;
        this.loading = false;
      },
      error: () => this.loading = false
    });
  }

  getDownloadUrl(filePath: string): string {
    const filename = filePath.includes('/') ? filePath.split('/').pop() : filePath;
    return `${environment.apiUrl}/cooperants/${this.cooperant?.id}/files/${filename}`;
  }

  getStatutClass(): string {
    switch (this.cooperant?.statutValidation) {
      case 'VALIDE': return 'bg-green-500 text-white';
      case 'REJETE': return 'bg-red-500 text-white';
      default: return 'bg-yellow-500 text-white';
    }
  }

  getStatutBgClass(): string {
    switch (this.cooperant?.statutValidation) {
      case 'VALIDE': return 'bg-green-50';
      case 'REJETE': return 'bg-red-50';
      default: return 'bg-yellow-50';
    }
  }

  getStatutLabel(): string {
    switch (this.cooperant?.statutValidation) {
      case 'VALIDE': return '✓ Validé';
      case 'REJETE': return '✗ Rejeté';
      default: return '⏳ En attente de validation';
    }
  }

  getRegimeLabel(): string {
    switch (this.cooperant?.codeRegime) {
      case '500': return 'Coopérant Général';
      case '510': return 'Coopérant Agricole Amélioré';
      case '515': return 'Régime Agricole';
      default: return this.cooperant?.codeRegime || '-';
    }
  }
}
