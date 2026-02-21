import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DebitService } from '../../../core/services/debit.service';
import { PdfService } from '../../../core/services/pdf.service';

@Component({
  selector: 'app-cooperant-search',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <!-- Search Box -->
        <div class="bg-white rounded-xl shadow-md p-6 mb-6">
          <div class="flex items-center gap-4">
            <a routerLink="/dashboard" class="w-10 h-10 rounded-full bg-pink-100 flex items-center justify-center hover:bg-pink-200 transition">
              <span class="material-icons text-cnss-primary">arrow_back</span>
            </a>
            <div class="flex-1">
              <h1 class="text-xl font-bold text-gray-800">Recherche Historique Coopérant</h1>
              <p class="text-sm text-gray-500">Consultez l'extrait et l'historique par numéro d'affiliation</p>
            </div>
          </div>
          <div class="mt-4 flex gap-3">
            <div class="flex-1 relative">
              <span class="material-icons absolute left-3 top-3 text-gray-400">search</span>
              <input type="text" [(ngModel)]="searchQuery" 
                     placeholder="Ex: 54-500049 ou 500049" 
                     class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl font-mono text-lg focus:ring-2 focus:ring-pink-300 focus:border-pink-400 transition bg-gray-50"
                     (keyup.enter)="search()">
            </div>
            <button (click)="search()" 
                    [disabled]="searching || !searchQuery"
                    class="px-8 py-3 bg-cnss-primary text-white rounded-xl hover:bg-opacity-90 transition-all font-semibold disabled:opacity-50 flex items-center shadow-md">
              <span *ngIf="searching" class="animate-spin mr-2">⏳</span>
              <span class="material-icons mr-2" *ngIf="!searching">search</span>
              Rechercher
            </button>
          </div>
        </div>

        <!-- Error Message -->
        <div *ngIf="error" class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 flex items-center">
          <span class="material-icons mr-2">error</span>
          {{ error }}
        </div>

        <!-- ===== RESULTS - Portail Social Style ===== -->
        <div *ngIf="cooperant">

          <!-- Cooperant Header Bar -->
          <div class="bg-white rounded-xl shadow-md p-5 mb-4 flex items-center justify-between">
            <div class="flex items-center gap-4">
              <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center shadow-md">
                <span class="material-icons text-white text-2xl">person</span>
              </div>
              <div>
                <h2 class="text-xl font-bold text-gray-800">{{ cooperant.nomCompletFr }}</h2>
                <p class="text-sm text-gray-500">{{ cooperant.codeRegime }} - {{ cooperant.libelleRegime }}</p>
              </div>
            </div>
            <div class="flex items-center gap-3">
              <span class="px-4 py-1.5 rounded-full text-sm font-bold"
                    [ngClass]="{
                      'bg-green-100 text-green-700': cooperant.statutValidation === 'VALIDE',
                      'bg-yellow-100 text-yellow-700': cooperant.statutValidation === 'EN_ATTENTE',
                      'bg-red-100 text-red-700': cooperant.statutValidation === 'REJETE'
                    }">
                {{ cooperant.statutValidation }}
              </span>
              <button (click)="printExtrait()" 
                      class="px-4 py-2 bg-cnss-primary text-white rounded-lg hover:bg-opacity-90 flex items-center text-sm font-semibold shadow-md transition">
                <span class="material-icons mr-1 text-base">print</span>
                Imprimer
              </button>
            </div>
          </div>

          <!-- Key Info Row (like Portail Social matricule bar) -->
          <div class="bg-white rounded-xl shadow-md p-4 mb-4 flex flex-wrap items-center divide-x divide-gray-200">
            <div class="px-5 py-1">
              <p class="text-xs text-gray-400 uppercase font-semibold tracking-wider">Matricule Affiliation</p>
              <p class="font-bold text-cnss-primary text-lg mt-0.5">{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</p>
            </div>
            <div class="px-5 py-1">
              <p class="text-xs text-gray-400 uppercase font-semibold tracking-wider">Matricule</p>
              <p class="font-bold text-gray-800 mt-0.5">{{ cooperant.matriculeComplet }}</p>
            </div>
            <div class="px-5 py-1">
              <p class="text-xs text-gray-400 uppercase font-semibold tracking-wider">Date Effet</p>
              <p class="font-bold text-gray-800 mt-0.5">{{ cooperant.dateEffetAffiliation | date:'dd/MM/yyyy' }}</p>
            </div>
            <div class="px-5 py-1">
              <p class="text-xs text-gray-400 uppercase font-semibold tracking-wider">Régime</p>
              <p class="font-bold text-gray-800 mt-0.5">{{ cooperant.codeRegime }}</p>
            </div>
            <div class="px-5 py-1">
              <p class="text-xs text-gray-400 uppercase font-semibold tracking-wider">Créé le</p>
              <p class="font-bold text-gray-800 mt-0.5">{{ cooperant.createdAt | date:'dd/MM/yyyy' }}</p>
            </div>
          </div>

          <!-- Colorful Stat Cards Row -->
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
            <!-- Salaire -->
            <div class="bg-white rounded-xl shadow-md p-4 flex items-center gap-4">
              <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-green-400 to-green-500 flex items-center justify-center shadow">
                <span class="material-icons text-white">payments</span>
              </div>
              <div>
                <p class="text-xs text-gray-400 uppercase font-semibold">Salaire</p>
                <p class="text-lg font-bold text-green-600">{{ cooperant.salaire | number:'1.3-3' }} DT</p>
              </div>
            </div>

            <!-- Total Débits -->
            <div class="bg-white rounded-xl shadow-md p-4 flex items-center gap-4">
              <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-red-400 to-pink-500 flex items-center justify-center shadow">
                <span class="material-icons text-white">receipt_long</span>
              </div>
              <div>
                <p class="text-xs text-gray-400 uppercase font-semibold">Total Débits</p>
                <p class="text-lg font-bold text-red-600">{{ getTotalDebits() | number:'1.3-3' }} DT</p>
              </div>
            </div>

            <!-- Débits En Attente -->
            <div class="bg-white rounded-xl shadow-md p-4 flex items-center gap-4">
              <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-amber-400 to-orange-500 flex items-center justify-center shadow">
                <span class="material-icons text-white">hourglass_empty</span>
              </div>
              <div>
                <p class="text-xs text-gray-400 uppercase font-semibold">En Attente</p>
                <p class="text-lg font-bold text-orange-600">{{ getDebitsEnAttente() }} DT</p>
              </div>
            </div>

            <!-- Débits Payés -->
            <div class="bg-white rounded-xl shadow-md p-4 flex items-center gap-4">
              <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-purple-400 to-purple-600 flex items-center justify-center shadow">
                <span class="material-icons text-white">check_circle</span>
              </div>
              <div>
                <p class="text-xs text-gray-400 uppercase font-semibold">Payés</p>
                <p class="text-lg font-bold text-purple-600">{{ getDebitsPayes() }} DT</p>
              </div>
            </div>
          </div>

          <!-- Section Cards Grid -->
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-6">
            
            <!-- Détails Identité -->
            <div class="bg-white rounded-xl shadow-md p-5">
              <div class="flex items-center gap-2 mb-4">
                <span class="material-icons text-blue-500">badge</span>
                <h3 class="font-bold text-gray-800">Détails Identité</h3>
              </div>
              <div class="space-y-3">
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Nom & Prénom (FR)</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.nomCompletFr }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">الإسم و اللقب</span>
                  <span class="text-sm font-semibold text-gray-800" dir="rtl">{{ cooperant.nomCompletAr || '-' }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Date Naissance</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.dateNaissance | date:'dd/MM/yyyy' }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Pièce Identité</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.typePieceIdentite }}: {{ cooperant.numPieceIdentite }}</span>
                </div>
              </div>
            </div>

            <!-- Détails Régime -->
            <div class="bg-white rounded-xl shadow-md p-5">
              <div class="flex items-center gap-2 mb-4">
                <span class="material-icons text-pink-500">account_balance</span>
                <h3 class="font-bold text-gray-800">Détails Régime</h3>
              </div>
              <div class="space-y-3">
                <div class="flex justify-between items-center">
                  <span class="text-sm text-gray-500">Code Régime</span>
                  <span class="px-3 py-1 rounded-full bg-pink-100 text-pink-700 text-xs font-bold">{{ cooperant.codeRegime }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Libellé Régime</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.libelleRegime }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Date Effet</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.dateEffetAffiliation | date:'dd/MM/yyyy' }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Salaire</span>
                  <span class="text-sm font-bold text-green-600">{{ cooperant.salaire | number:'1.3-3' }} DT</span>
                </div>
              </div>
            </div>

            <!-- Détails Contact -->
            <div class="bg-white rounded-xl shadow-md p-5">
              <div class="flex items-center gap-2 mb-4">
                <span class="material-icons text-purple-500">contact_phone</span>
                <h3 class="font-bold text-gray-800">Détails Contact</h3>
              </div>
              <div class="space-y-3">
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Adresse</span>
                  <span class="text-sm font-semibold text-gray-800 text-right">{{ cooperant.adresseFr }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Code Postal</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.codePostal }} {{ cooperant.localiteFr }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Téléphone</span>
                  <span class="text-sm font-semibold text-gray-800">{{ cooperant.telephone || '-' }}</span>
                </div>
                <div class="flex justify-between">
                  <span class="text-sm text-gray-500">Email</span>
                  <span class="text-sm font-semibold text-cnss-primary">{{ cooperant.email || '-' }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Historique des Débits -->
          <div class="bg-white rounded-xl shadow-md p-5">
            <div class="flex items-center justify-between mb-4">
              <div class="flex items-center gap-2">
                <span class="material-icons text-orange-500">receipt_long</span>
                <h3 class="font-bold text-gray-800">Historique des Débits</h3>
              </div>
              <span class="text-sm text-gray-400">{{ debits.length }} enregistrement(s)</span>
            </div>
            
            <div *ngIf="loadingDebits" class="text-center py-8">
              <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-cnss-primary mx-auto"></div>
            </div>
            
            <div *ngIf="!loadingDebits && debits.length === 0" class="text-center py-8 text-gray-400">
              <span class="material-icons text-5xl mb-2 block">receipt_long</span>
              Aucun débit trouvé
            </div>
            
            <div *ngIf="!loadingDebits && debits.length > 0" class="overflow-hidden rounded-xl border border-gray-100">
              <table class="w-full">
                <thead>
                  <tr class="bg-gray-50">
                    <th class="px-5 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Période</th>
                    <th class="px-5 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Date Génération</th>
                    <th class="px-5 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Montant</th>
                    <th class="px-5 py-3 text-center text-xs font-bold text-gray-500 uppercase tracking-wider">Statut</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                  <tr *ngFor="let debit of debits" class="hover:bg-pink-50/50 transition">
                    <td class="px-5 py-3.5 font-mono font-medium text-gray-800">{{ debit.trimestre }}</td>
                    <td class="px-5 py-3.5 text-gray-600">{{ debit.createdAt | date:'dd/MM/yyyy' }}</td>
                    <td class="px-5 py-3.5 text-right font-bold text-cnss-primary">{{ debit.montantCotisation | number:'1.3-3' }} TND</td>
                    <td class="px-5 py-3.5 text-center">
                      <span class="px-3 py-1 rounded-full text-xs font-bold"
                            [ngClass]="debit.paye ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'">
                        {{ debit.paye ? 'Payé' : 'En attente' }}
                      </span>
                    </td>
                  </tr>
                </tbody>
                <tfoot>
                  <tr class="bg-gray-50 border-t-2 border-gray-200">
                    <td colspan="2" class="px-5 py-3.5 font-bold text-gray-800">Total</td>
                    <td class="px-5 py-3.5 text-right font-bold text-cnss-primary text-lg">{{ getTotalDebits() | number:'1.3-3' }} TND</td>
                    <td></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class CooperantSearchComponent {
  searchQuery = '';
  searching = false;
  error: string | null = null;
  cooperant: Cooperant | null = null;
  debits: any[] = [];
  loadingDebits = false;

  constructor(
    private cooperantService: CooperantService,
    private debitService: DebitService,
    private pdfService: PdfService
  ) {}

  search() {
    if (!this.searchQuery) {
      this.error = 'Veuillez saisir un numéro d\'affiliation';
      return;
    }

    this.searching = true;
    this.error = null;
    this.cooperant = null;
    this.debits = [];

    // Parser le numéro d'affiliation (format: cle-numero ou juste numero)
    const query = this.searchQuery.trim();

    // Rechercher par numéro d'affiliation
    this.cooperantService.getAll().subscribe({
      next: (cooperants) => {
        const found = cooperants.find(c => {
          // Construire le numéro complet du coopérant
          const cooperantFullNum = c.cleAffiliation && c.numAffiliation
            ? `${c.cleAffiliation}-${c.numAffiliation}`
            : c.numAffiliation || '';
          
          // Comparer avec la recherche
          return cooperantFullNum === query || 
                 c.numAffiliation === query ||
                 cooperantFullNum.includes(query) ||
                 (c.numAffiliation && c.numAffiliation.includes(query));
        });

        if (found) {
          this.cooperant = found;
          this.loadDebits(found.numAffiliation!);
        } else {
          this.error = `Aucun coopérant trouvé avec le numéro d'affiliation: ${query}`;
        }
        this.searching = false;
      },
      error: (err) => {
        console.error('Erreur recherche:', err);
        this.error = 'Erreur lors de la recherche';
        this.searching = false;
      }
    });
  }

  loadDebits(numAffiliation: string) {
    this.loadingDebits = true;
    const cleAff = this.cooperant?.cleAffiliation || '';
    this.debitService.getAll().subscribe({
      next: (debits: any[]) => {
        this.debits = debits.filter(d => 
          d.numAffiliation === numAffiliation || 
          d.numAffiliation === `${cleAff}-${numAffiliation}` ||
          d.numAffiliation?.includes(numAffiliation)
        );
        this.debits.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
        this.loadingDebits = false;
      },
      error: (err) => {
        console.error('Erreur chargement débits:', err);
        this.loadingDebits = false;
      }
    });
  }

  getTotalDebits(): number {
    return this.debits.reduce((sum, d) => sum + (d.montantCotisation || 0), 0);
  }

  getDebitsEnAttente(): string {
    const total = this.debits.filter(d => !d.paye).reduce((sum, d) => sum + (d.montantCotisation || 0), 0);
    return total.toFixed(3);
  }

  getDebitsPayes(): string {
    const total = this.debits.filter(d => d.paye).reduce((sum, d) => sum + (d.montantCotisation || 0), 0);
    return total.toFixed(3);
  }

  printExtrait() {
    if (this.cooperant) {
      this.pdfService.generateCooperantExtrait(this.cooperant, this.debits);
    }
  }
}
