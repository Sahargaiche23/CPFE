import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCT, ATCTStats } from '../../../core/services/atct.service';

@Component({
  selector: 'app-atct-list',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-6">
        <!-- Logo ATCT -->
        <div class="flex items-center gap-4 mb-6">
          <img src="https://www.atct.tn/sites/default/files/logofr_0.png" alt="ATCT Logo" class="h-16 w-auto object-contain">
          <div class="border-l-2 border-teal-600 pl-4">
            <h2 class="text-lg font-bold text-teal-700">Agence Tunisienne de Coopération Technique</h2>
            <p class="text-sm text-gray-600">Module de gestion des dossiers ATCT</p>
          </div>
        </div>

        <!-- Header -->
        <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-6">
          <div>
            <h1 class="text-2xl font-bold text-gray-900">Module ATCT - Coopération Technique</h1>
            <p class="text-gray-600 mt-1">Gestion des dossiers de coopération technique</p>
          </div>
          <div class="mt-4 md:mt-0 flex gap-3">
            <a routerLink="/atct/validation" 
               class="inline-flex items-center px-4 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition">
              <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
              Validation ({{ stats.en_attente || 0 }})
            </a>
            <a routerLink="/atct/new" 
               class="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">
              <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
              </svg>
              Nouveau Dossier
            </a>
          </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
          <div class="bg-white rounded-lg shadow p-4 border-l-4 border-blue-500">
            <div class="text-sm text-gray-500">Total Dossiers</div>
            <div class="text-2xl font-bold text-blue-600">{{ stats.total || 0 }}</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 border-l-4 border-yellow-500">
            <div class="text-sm text-gray-500">En Attente</div>
            <div class="text-2xl font-bold text-yellow-600">{{ stats.en_attente || 0 }}</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 border-l-4 border-green-500">
            <div class="text-sm text-gray-500">Validés</div>
            <div class="text-2xl font-bold text-green-600">{{ stats.valides || 0 }}</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 border-l-4 border-red-500">
            <div class="text-sm text-gray-500">Rejetés</div>
            <div class="text-2xl font-bold text-red-600">{{ stats.rejetes || 0 }}</div>
          </div>
        </div>

        <!-- Filters -->
        <div class="bg-white rounded-lg shadow p-4 mb-6">
          <div class="flex flex-col md:flex-row gap-4">
            <div class="flex-1">
              <input type="text" 
                     [(ngModel)]="searchQuery"
                     (input)="onSearch()"
                     placeholder="Rechercher par nom, email, N° sécurité sociale..."
                     class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <select [(ngModel)]="filterStatut" (change)="onFilterChange()"
                      class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                <option value="">Tous les statuts</option>
                <option value="EN_ATTENTE">En attente</option>
                <option value="VALIDE">Validé</option>
                <option value="REJETE">Rejeté</option>
                <option value="AFFILIE">Affilié</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Table -->
        <div class="bg-white rounded-lg shadow overflow-hidden">
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Coopérant</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Contact</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Détachement</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Régime</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                @if (loading) {
                  <tr>
                    <td colspan="7" class="px-6 py-12 text-center">
                      <div class="flex justify-center items-center">
                        <svg class="animate-spin h-8 w-8 text-blue-600" fill="none" viewBox="0 0 24 24">
                          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        <span class="ml-2 text-gray-600">Chargement...</span>
                      </div>
                    </td>
                  </tr>
                } @else if (dossiers.length === 0) {
                  <tr>
                    <td colspan="7" class="px-6 py-12 text-center text-gray-500">
                      Aucun dossier trouvé
                    </td>
                  </tr>
                } @else {
                  @for (dossier of dossiers; track dossier.id) {
                    <tr class="hover:bg-gray-50">
                      <td class="px-6 py-4">
                        <div class="font-medium text-gray-900">{{ dossier.nomCompletFr }}</div>
                        @if (dossier.nomCompletAr) {
                          <div class="text-sm text-gray-500 text-right" dir="rtl">{{ dossier.nomCompletAr }}</div>
                        }
                        <div class="text-xs text-gray-400">{{ dossier.numSecuSociale }}</div>
                      </td>
                      <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">{{ dossier.email }}</div>
                        <div class="text-sm text-gray-500">{{ dossier.telephone }}</div>
                      </td>
                      <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">{{ dossier.paysEtranger }}</div>
                        <div class="text-xs text-gray-500">
                          {{ dossier.dateDebutDetachement | date:'dd/MM/yyyy' }}
                          @if (dossier.dateFinDetachement) {
                            - {{ dossier.dateFinDetachement | date:'dd/MM/yyyy' }}
                          }
                        </div>
                      </td>
                      <td class="px-6 py-4">
                        <span class="px-2 py-1 text-xs rounded-full"
                              [ngClass]="{
                                'bg-blue-100 text-blue-800': dossier.codeRegime === '500',
                                'bg-purple-100 text-purple-800': dossier.codeRegime === '510',
                                'bg-teal-100 text-teal-800': dossier.codeRegime === '515'
                              }">
                          {{ dossier.codeRegime }}
                        </span>
                      </td>
                      <td class="px-6 py-4">
                        <span class="px-2 py-1 text-xs rounded-full"
                              [ngClass]="{
                                'bg-yellow-100 text-yellow-800': dossier.statut === 'EN_ATTENTE',
                                'bg-green-100 text-green-800': dossier.statut === 'VALIDE',
                                'bg-red-100 text-red-800': dossier.statut === 'REJETE',
                                'bg-blue-100 text-blue-800': dossier.statut === 'AFFILIE'
                              }">
                          {{ getStatutLabel(dossier.statut) }}
                        </span>
                        @if (dossier.emailEnvoye) {
                          <span class="ml-1 text-green-500" title="Email envoyé">✉️</span>
                        }
                      </td>
                      <td class="px-6 py-4 text-sm text-gray-500">
                        {{ dossier.dateCreation | date:'dd/MM/yyyy' }}
                      </td>
                      <td class="px-6 py-4 text-right">
                        <div class="flex justify-end gap-2">
                          <a [routerLink]="['/atct/detail', dossier.id]"
                             class="text-blue-600 hover:text-blue-800" title="Voir">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                            </svg>
                          </a>
                          @if (dossier.statut === 'EN_ATTENTE') {
                            <a [routerLink]="['/atct/edit', dossier.id]"
                               class="text-yellow-600 hover:text-yellow-800" title="Modifier">
                              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                              </svg>
                            </a>
                          }
                        </div>
                      </td>
                    </tr>
                  }
                }
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class AtctListComponent implements OnInit {
  dossiers: DossierATCT[] = [];
  allDossiers: DossierATCT[] = [];
  stats: ATCTStats = {};
  loading = false;
  searchQuery = '';
  filterStatut = '';

  constructor(private atctService: AtctService) {}

  ngOnInit(): void {
    this.loadData();
    this.loadStats();
  }

  loadData(): void {
    this.loading = true;
    this.atctService.getAll().subscribe({
      next: (data) => {
        this.allDossiers = data;
        this.dossiers = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
      }
    });
  }

  loadStats(): void {
    this.atctService.getStats().subscribe({
      next: (data) => this.stats = data,
      error: (err) => console.error('Erreur stats:', err)
    });
  }

  onSearch(): void {
    if (this.searchQuery.trim()) {
      this.atctService.search(this.searchQuery).subscribe({
        next: (data) => this.dossiers = data,
        error: () => this.dossiers = []
      });
    } else {
      this.applyFilters();
    }
  }

  onFilterChange(): void {
    this.applyFilters();
  }

  applyFilters(): void {
    let filtered = [...this.allDossiers];
    
    if (this.filterStatut) {
      filtered = filtered.filter(d => d.statut === this.filterStatut);
    }
    
    this.dossiers = filtered;
  }

  getStatutLabel(statut?: string): string {
    const labels: {[key: string]: string} = {
      'EN_ATTENTE': 'En attente',
      'VALIDE': 'Validé',
      'REJETE': 'Rejeté',
      'AFFILIE': 'Affilié',
      'EN_COURS': 'En cours'
    };
    return labels[statut || ''] || statut || '';
  }
}
