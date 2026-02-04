import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCT } from '../../../core/services/atct.service';

@Component({
  selector: 'app-atct-validation',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-6">
        <!-- Header -->
        <div class="mb-6">
          <nav class="flex items-center text-sm text-gray-500 mb-2">
            <a routerLink="/atct" class="hover:text-blue-600">ATCT</a>
            <span class="mx-2">/</span>
            <span class="text-gray-900">Validation</span>
          </nav>
          <h1 class="text-2xl font-bold text-gray-900">Validation des Dossiers ATCT</h1>
          <p class="text-gray-600 mt-1">Dossiers en attente de validation par l'agent</p>
        </div>

        <!-- Stats -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
          <div class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <div class="text-sm text-yellow-700">En attente</div>
            <div class="text-3xl font-bold text-yellow-600">{{ dossiers.length }}</div>
          </div>
          <div class="bg-green-50 border border-green-200 rounded-lg p-4">
            <div class="text-sm text-green-700">Validés aujourd'hui</div>
            <div class="text-3xl font-bold text-green-600">{{ validatedToday }}</div>
          </div>
          <div class="bg-red-50 border border-red-200 rounded-lg p-4">
            <div class="text-sm text-red-700">Rejetés aujourd'hui</div>
            <div class="text-3xl font-bold text-red-600">{{ rejectedToday }}</div>
          </div>
        </div>

        <!-- Liste des dossiers en attente -->
        <div class="space-y-4">
          @if (loading) {
            <div class="bg-white rounded-lg shadow p-12 text-center">
              <svg class="animate-spin h-10 w-10 mx-auto text-blue-600" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
              </svg>
              <p class="mt-4 text-gray-600">Chargement des dossiers...</p>
            </div>
          } @else if (dossiers.length === 0) {
            <div class="bg-white rounded-lg shadow p-12 text-center">
              <svg class="w-16 h-16 mx-auto text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
              <h3 class="mt-4 text-lg font-medium text-gray-900">Aucun dossier en attente</h3>
              <p class="text-gray-500">Tous les dossiers ont été traités</p>
            </div>
          } @else {
            @for (dossier of dossiers; track dossier.id) {
              <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="p-6">
                  <div class="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-4">
                    <!-- Info Coopérant -->
                    <div class="flex-1">
                      <div class="flex items-center gap-3 mb-3">
                        <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                          <span class="text-blue-600 font-bold text-lg">
                            {{ dossier.prenomFr?.charAt(0) }}{{ dossier.nomFr?.charAt(0) }}
                          </span>
                        </div>
                        <div>
                          <h3 class="font-semibold text-gray-900 text-lg">{{ dossier.nomCompletFr }}</h3>
                          @if (dossier.nomCompletAr) {
                            <p class="text-gray-600" dir="rtl">{{ dossier.nomCompletAr }}</p>
                          }
                        </div>
                      </div>
                      
                      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 text-sm">
                        <div>
                          <span class="text-gray-500">N° Sécu:</span>
                          <span class="ml-2 font-medium">{{ dossier.numSecuSociale || 'N/A' }}</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Email:</span>
                          <span class="ml-2 font-medium">{{ dossier.email }}</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Téléphone:</span>
                          <span class="ml-2 font-medium">{{ dossier.telephone || 'N/A' }}</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Pays détachement:</span>
                          <span class="ml-2 font-medium">{{ dossier.paysEtranger }}</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Période:</span>
                          <span class="ml-2 font-medium">
                            {{ dossier.dateDebutDetachement | date:'dd/MM/yyyy' }}
                            @if (dossier.dateFinDetachement) {
                              - {{ dossier.dateFinDetachement | date:'dd/MM/yyyy' }}
                            }
                          </span>
                        </div>
                        <div>
                          <span class="text-gray-500">Régime:</span>
                          <span class="ml-2 px-2 py-0.5 rounded text-xs font-medium"
                                [ngClass]="{
                                  'bg-blue-100 text-blue-800': dossier.codeRegime === '500',
                                  'bg-purple-100 text-purple-800': dossier.codeRegime === '510'
                                }">
                            {{ dossier.codeRegime }}
                          </span>
                        </div>
                        <div>
                          <span class="text-gray-500">Établissement:</span>
                          <span class="ml-2 font-medium">{{ dossier.etablissementOrigine || 'N/A' }}</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Salaire TND:</span>
                          <span class="ml-2 font-medium">{{ dossier.salaireTunisie | number:'1.3-3' }} TND</span>
                        </div>
                        <div>
                          <span class="text-gray-500">Mode paiement:</span>
                          <span class="ml-2 font-medium">{{ getModePaiementLabel(dossier.modePaiement) }}</span>
                        </div>
                      </div>

                      @if (dossier.assuranceMaladie || dossier.capitalDeces) {
                        <div class="mt-3 flex gap-2">
                          @if (dossier.assuranceMaladie) {
                            <span class="px-2 py-1 bg-green-100 text-green-700 text-xs rounded">🏥 Assurance Maladie</span>
                          }
                          @if (dossier.capitalDeces) {
                            <span class="px-2 py-1 bg-blue-100 text-blue-700 text-xs rounded">💼 Capital Décès</span>
                          }
                        </div>
                      }

                      <div class="mt-3 text-xs text-gray-400">
                        Créé le {{ dossier.dateCreation | date:'dd/MM/yyyy à HH:mm' }}
                      </div>
                    </div>

                    <!-- Actions -->
                    <div class="flex flex-col gap-2 lg:w-48">
                      <a [routerLink]="['/atct/detail', dossier.id]"
                         class="w-full px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition text-center">
                        Voir détails
                      </a>
                      <button (click)="valider(dossier)"
                              [disabled]="processing === dossier.id"
                              class="w-full px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition disabled:opacity-50">
                        @if (processing === dossier.id) {
                          <span class="flex items-center justify-center">
                            <svg class="animate-spin h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24">
                              <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                              <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                            </svg>
                            Validation...
                          </span>
                        } @else {
                          ✓ Valider
                        }
                      </button>
                      <button (click)="openRejectModal(dossier)"
                              [disabled]="processing === dossier.id"
                              class="w-full px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition disabled:opacity-50">
                        ✗ Rejeter
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            }
          }
        </div>

        <!-- Modal Rejet -->
        @if (showRejectModal && selectedDossier) {
          <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div class="bg-white rounded-lg shadow-xl w-full max-w-md mx-4">
              <div class="p-6">
                <h3 class="text-lg font-semibold text-gray-900 mb-4">Rejeter le dossier</h3>
                <p class="text-gray-600 mb-4">
                  Vous êtes sur le point de rejeter le dossier de 
                  <strong>{{ selectedDossier.nomCompletFr }}</strong>
                </p>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Motif du rejet *</label>
                  <textarea [(ngModel)]="rejectMotif"
                            rows="4"
                            placeholder="Indiquez le motif du rejet..."
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500"></textarea>
                </div>
              </div>
              <div class="px-6 py-4 bg-gray-50 flex justify-end gap-3 rounded-b-lg">
                <button (click)="closeRejectModal()"
                        class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-100">
                  Annuler
                </button>
                <button (click)="confirmReject()"
                        [disabled]="!rejectMotif.trim() || processing"
                        class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50">
                  Confirmer le rejet
                </button>
              </div>
            </div>
          </div>
        }

        <!-- Toast Success -->
        @if (successMessage) {
          <div class="fixed bottom-4 right-4 bg-green-600 text-white px-6 py-3 rounded-lg shadow-lg flex items-center gap-3 z-50">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            {{ successMessage }}
          </div>
        }
      </div>
    </app-main-layout>
  `
})
export class AtctValidationComponent implements OnInit {
  dossiers: DossierATCT[] = [];
  loading = false;
  processing: number | null = null;
  validatedToday = 0;
  rejectedToday = 0;

  showRejectModal = false;
  selectedDossier: DossierATCT | null = null;
  rejectMotif = '';
  successMessage = '';

  constructor(private atctService: AtctService) {}

  ngOnInit(): void {
    this.loadDossiers();
  }

  loadDossiers(): void {
    this.loading = true;
    this.atctService.getEnAttente().subscribe({
      next: (data) => {
        this.dossiers = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
      }
    });
  }

  valider(dossier: DossierATCT): void {
    if (!dossier.id) return;
    
    if (!confirm(`Voulez-vous valider le dossier de ${dossier.nomCompletFr} ?\n\nUn email avec les identifiants de connexion sera envoyé à ${dossier.email}`)) {
      return;
    }

    this.processing = dossier.id;
    this.atctService.valider(dossier.id).subscribe({
      next: () => {
        this.showSuccess(`Dossier de ${dossier.nomCompletFr} validé ! Email envoyé à ${dossier.email}`);
        this.dossiers = this.dossiers.filter(d => d.id !== dossier.id);
        this.validatedToday++;
        this.processing = null;
      },
      error: (err) => {
        console.error('Erreur validation:', err);
        alert('Erreur lors de la validation: ' + (err.error?.error || err.message));
        this.processing = null;
      }
    });
  }

  openRejectModal(dossier: DossierATCT): void {
    this.selectedDossier = dossier;
    this.rejectMotif = '';
    this.showRejectModal = true;
  }

  closeRejectModal(): void {
    this.showRejectModal = false;
    this.selectedDossier = null;
    this.rejectMotif = '';
  }

  confirmReject(): void {
    if (!this.selectedDossier?.id || !this.rejectMotif.trim()) return;

    this.processing = this.selectedDossier.id;
    this.atctService.rejeter(this.selectedDossier.id, this.rejectMotif).subscribe({
      next: () => {
        this.showSuccess(`Dossier de ${this.selectedDossier!.nomCompletFr} rejeté`);
        this.dossiers = this.dossiers.filter(d => d.id !== this.selectedDossier!.id);
        this.rejectedToday++;
        this.processing = null;
        this.closeRejectModal();
      },
      error: (err) => {
        console.error('Erreur rejet:', err);
        alert('Erreur lors du rejet: ' + (err.error?.error || err.message));
        this.processing = null;
      }
    });
  }

  showSuccess(message: string): void {
    this.successMessage = message;
    setTimeout(() => this.successMessage = '', 5000);
  }

  getModePaiementLabel(mode?: string): string {
    const labels: {[key: string]: string} = {
      'TRIMESTRIEL': 'Trimestriel',
      'ANNUEL': 'Annuel',
      'MENSUEL': 'Mensuel',
      'ANTICIPE': 'Par anticipation'
    };
    return labels[mode || ''] || mode || 'N/A';
  }
}
