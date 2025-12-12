import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-suivi-dossier',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4">
          <a routerLink="/cooperant" class="text-teal-600 hover:text-teal-800">← Retour</a>
        </div>
      </header>

      <main class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6">Suivi de mon dossier</h2>
          
          <div *ngIf="cooperant" class="space-y-6">
            <!-- Timeline -->
            <div class="relative">
              <!-- Dépôt -->
              <div class="flex items-start gap-4 mb-8">
                <div class="w-10 h-10 rounded-full bg-green-500 flex items-center justify-center text-white font-bold">✓</div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Dossier déposé</h4>
                  <p class="text-sm text-gray-500">{{ cooperant.createdAt | date:'dd/MM/yyyy à HH:mm' }}</p>
                  <p class="text-sm text-gray-600 mt-1">Votre dossier a été enregistré avec succès</p>
                </div>
              </div>

              <!-- En cours de traitement -->
              <div class="flex items-start gap-4 mb-8">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="cooperant.statutValidation === 'EN_ATTENTE' ? 'bg-yellow-500 text-white animate-pulse' : 'bg-green-500 text-white'">
                  {{ cooperant.statutValidation === 'EN_ATTENTE' ? '⏳' : '✓' }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Examen du dossier</h4>
                  <p class="text-sm text-gray-500" *ngIf="cooperant.statutValidation === 'EN_ATTENTE'">En cours...</p>
                  <p class="text-sm text-gray-500" *ngIf="cooperant.statutValidation !== 'EN_ATTENTE'">Traité</p>
                  <p class="text-sm text-gray-600 mt-1">Votre dossier est examiné par nos services</p>
                </div>
              </div>

              <!-- Décision -->
              <div class="flex items-start gap-4">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="{
                       'bg-green-500 text-white': cooperant.statutValidation === 'VALIDE',
                       'bg-red-500 text-white': cooperant.statutValidation === 'REJETE',
                       'bg-gray-300 text-gray-500': cooperant.statutValidation === 'EN_ATTENTE'
                     }">
                  {{ cooperant.statutValidation === 'VALIDE' ? '✓' : cooperant.statutValidation === 'REJETE' ? '✗' : '?' }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Décision</h4>
                  <p class="text-sm text-gray-500" *ngIf="cooperant.dateValidation">{{ cooperant.dateValidation | date:'dd/MM/yyyy à HH:mm' }}</p>
                  <p class="text-sm text-gray-500" *ngIf="!cooperant.dateValidation">En attente</p>
                  
                  <div class="mt-2 p-3 rounded-lg" *ngIf="cooperant.statutValidation !== 'EN_ATTENTE'"
                       [ngClass]="cooperant.statutValidation === 'VALIDE' ? 'bg-green-50' : 'bg-red-50'">
                    <p class="font-medium" [ngClass]="cooperant.statutValidation === 'VALIDE' ? 'text-green-700' : 'text-red-700'">
                      {{ cooperant.statutValidation === 'VALIDE' ? 'Votre dossier a été validé !' : 'Votre dossier a été rejeté' }}
                    </p>
                    <p class="text-sm mt-1" *ngIf="cooperant.motifRejet">Motif: {{ cooperant.motifRejet }}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div *ngIf="!cooperant && !loading" class="text-center py-8 text-gray-500">
            Aucun dossier trouvé
          </div>
        </div>
      </main>
    </div>
  `
})
export class SuiviDossierComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loading = true;

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService
  ) {}

  ngOnInit() {
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
}
