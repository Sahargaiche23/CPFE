import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService, DemandeCooperant } from '../../../core/services/demande.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-mes-demandes',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-700 via-pink-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <h1 class="text-lg font-bold text-gray-800">Suivi de mes Demandes</h1>
          <a routerLink="/cooperant/espace" class="ml-auto text-pink-600 hover:text-pink-800 text-sm">← Retour</a>
        </div>
      </header>

      <main class="max-w-5xl mx-auto px-4 py-8">
        <!-- Stats -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
          <div class="bg-white rounded-xl shadow p-4 border-l-4 border-blue-500">
            <div class="text-2xl font-bold text-blue-600">{{ demandes.length }}</div>
            <div class="text-xs text-gray-500">Total</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4 border-l-4 border-yellow-500">
            <div class="text-2xl font-bold text-yellow-600">{{ getCountByStatut('EN_ATTENTE') }}</div>
            <div class="text-xs text-gray-500">En attente</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4 border-l-4 border-green-500">
            <div class="text-2xl font-bold text-green-600">{{ getCountByStatut('VALIDEE') }}</div>
            <div class="text-xs text-gray-500">Validées</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4 border-l-4 border-red-500">
            <div class="text-2xl font-bold text-red-600">{{ getCountByStatut('REJETEE') }}</div>
            <div class="text-xs text-gray-500">Rejetées</div>
          </div>
        </div>

        <!-- Loading -->
        <div *ngIf="loading" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-pink-600 mx-auto"></div>
          <p class="mt-4 text-gray-500">Chargement de vos demandes...</p>
        </div>

        <!-- Liste -->
        <div *ngIf="!loading" class="space-y-4">
          <div *ngIf="demandes.length === 0" class="bg-white rounded-xl shadow-lg p-8 text-center">
            <svg class="w-16 h-16 text-gray-300 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
            </svg>
            <p class="text-gray-500">Aucune demande déposée</p>
            <a routerLink="/cooperant/espace" class="text-pink-600 text-sm mt-2 inline-block hover:underline">Déposer une demande →</a>
          </div>

          <div *ngFor="let d of demandes" class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition">
            <div class="flex items-start justify-between">
              <div class="flex items-start gap-4">
                <!-- Icône type -->
                <div class="w-12 h-12 rounded-full flex items-center justify-center flex-shrink-0"
                     [ngClass]="getTypeBg(d.typeDemande)">
                  <svg class="w-6 h-6" [ngClass]="getTypeColor(d.typeDemande)" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path *ngIf="d.typeDemande === 'ACTUALISATION_SALAIRE'" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    <path *ngIf="d.typeDemande === 'SORTIE_REGIME_MALADIE'" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                    <path *ngIf="d.typeDemande === 'ANNULATION_ASSURANCE'" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                    <path *ngIf="d.typeDemande === 'RACHAT_LOI105'" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
                  </svg>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800">{{ getTypeLabel(d.typeDemande) }}</h3>
                  <p class="text-xs text-gray-500 mt-1">Demande #{{ d.id }} — {{ d.createdAt | date:'dd/MM/yyyy à HH:mm' }}</p>
                  <!-- Détails par type -->
                  <div class="mt-2 text-sm text-gray-600" *ngIf="d.typeDemande === 'ACTUALISATION_SALAIRE'">
                    Salaire: {{ d.ancienSalaire | number:'1.3-3' }} → {{ d.nouveauSalaire | number:'1.3-3' }} TND
                  </div>
                  <div class="mt-2 text-sm text-gray-600" *ngIf="d.typeDemande === 'SORTIE_REGIME_MALADIE'">
                    Régime: {{ d.regimeConcerne }}
                  </div>
                  <div class="mt-2 text-sm text-gray-600" *ngIf="d.typeDemande === 'ANNULATION_ASSURANCE'">
                    Impact cotisation: {{ d.impactCotisation | number:'1.3-3' }} TND
                  </div>
                  <div class="mt-2 text-sm text-gray-600" *ngIf="d.typeDemande === 'RACHAT_LOI105'">
                    {{ d.trimestreDebit }} — Montant: {{ d.montantOriginal | number:'1.3-3' }} → Rachat: {{ d.montantRachat | number:'1.3-3' }} TND
                    <span class="text-green-600 font-medium">(réduction {{ d.reduction | number:'1.3-3' }} TND)</span>
                  </div>
                  <!-- Motif rejet -->
                  <div class="mt-2 text-sm text-red-600 bg-red-50 rounded p-2" *ngIf="d.statut === 'REJETEE' && d.motifRejet">
                    Motif: {{ d.motifRejet }}
                  </div>
                  <div class="mt-2 text-sm text-green-600 bg-green-50 rounded p-2" *ngIf="d.statut === 'VALIDEE' && d.commentaire">
                    {{ d.commentaire }}
                  </div>
                </div>
              </div>
              <!-- Badge statut -->
              <span class="px-3 py-1 rounded-full text-xs font-semibold flex-shrink-0"
                    [ngClass]="getStatutClass(d.statut || '')">
                {{ getStatutLabel(d.statut || '') }}
              </span>
            </div>
          </div>
        </div>
      </main>
    </div>
  `
})
export class MesDemandesComponent implements OnInit {
  cooperant: Cooperant | null = null;
  demandes: DemandeCooperant[] = [];
  loading = true;

  constructor(
    private cooperantService: CooperantService,
    private demandeService: DemandeService,
    private authService: AuthService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    const email = user?.username || '';
    this.cooperantService.getAll().subscribe({
      next: (list) => {
        this.cooperant = list.find(c => c.email === email) || null;
        if (this.cooperant?.id) {
          this.demandeService.findByCooperant(this.cooperant.id).subscribe({
            next: (data) => { this.demandes = data; this.loading = false; },
            error: () => this.loading = false
          });
        } else {
          this.loading = false;
        }
      },
      error: () => this.loading = false
    });
  }

  getCountByStatut(statut: string): number {
    return this.demandes.filter(d => d.statut === statut).length;
  }

  getTypeLabel(type: string): string {
    const labels: any = {
      'ACTUALISATION_SALAIRE': 'Actualisation Salaire',
      'SORTIE_REGIME_MALADIE': 'Sortie Régime Maladie',
      'ANNULATION_ASSURANCE': 'Annulation Assurance Maladie & Capital Décès',
      'RACHAT_LOI105': 'Rachat Loi 105 (Taux 95%)'
    };
    return labels[type] || type;
  }

  getTypeBg(type: string): string {
    switch (type) {
      case 'ACTUALISATION_SALAIRE': return 'bg-emerald-100';
      case 'SORTIE_REGIME_MALADIE': return 'bg-blue-100';
      case 'ANNULATION_ASSURANCE': return 'bg-red-100';
      case 'RACHAT_LOI105': return 'bg-amber-100';
      default: return 'bg-gray-100';
    }
  }

  getTypeColor(type: string): string {
    switch (type) {
      case 'ACTUALISATION_SALAIRE': return 'text-emerald-600';
      case 'SORTIE_REGIME_MALADIE': return 'text-blue-600';
      case 'ANNULATION_ASSURANCE': return 'text-red-600';
      case 'RACHAT_LOI105': return 'text-amber-600';
      default: return 'text-gray-600';
    }
  }

  getStatutClass(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return 'bg-yellow-100 text-yellow-800';
      case 'VALIDEE': return 'bg-green-100 text-green-800';
      case 'REJETEE': return 'bg-red-100 text-red-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  }

  getStatutLabel(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return 'En attente';
      case 'VALIDEE': return 'Validée';
      case 'REJETEE': return 'Rejetée';
      default: return statut;
    }
  }
}
