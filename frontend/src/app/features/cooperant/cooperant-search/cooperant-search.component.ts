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
      <div class="fade-in max-w-5xl mx-auto">
        <!-- Header -->
        <div class="mb-8">
          <a routerLink="/dashboard" class="text-cnss-primary hover:underline inline-flex items-center mb-4">
            <span class="material-icons mr-1">arrow_back</span>
            Retour au tableau de bord
          </a>
          <h1 class="text-3xl font-bold text-cnss-dark">Recherche Historique Coopérant</h1>
          <p class="text-gray-600 mt-2">Consultez l'extrait et l'historique d'un coopérant par numéro d'affiliation</p>
        </div>

        <!-- Search Box -->
        <div class="card mb-6">
          <h2 class="text-xl font-bold text-cnss-dark mb-4 flex items-center">
            <span class="material-icons mr-2 text-cnss-primary">search</span>
            Recherche par N° Affiliation
          </h2>
          <div class="flex gap-4">
            <div class="flex-1">
              <label class="block text-sm font-semibold text-gray-700 mb-2">
                Numéro d'Affiliation <span class="text-red-500">*</span>
              </label>
              <input type="text" [(ngModel)]="searchQuery" 
                     placeholder="Ex: 54-500049 ou 500049" 
                     class="form-field font-mono text-lg"
                     (keyup.enter)="search()">
              <p class="text-xs text-gray-500 mt-1">Format: clé-numéro (ex: 54-500049) ou juste le numéro</p>
            </div>
            <div class="flex items-end">
              <button (click)="search()" 
                      [disabled]="searching || !searchQuery"
                      class="px-6 py-3 bg-cnss-primary text-white rounded-lg hover:bg-opacity-90 transition-all font-semibold disabled:opacity-50 flex items-center">
                <span *ngIf="searching" class="animate-spin mr-2">⏳</span>
                <span class="material-icons mr-2" *ngIf="!searching">search</span>
                Rechercher
              </button>
            </div>
          </div>
        </div>

        <!-- Error Message -->
        <div *ngIf="error" class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6">
          <div class="flex items-center">
            <span class="material-icons mr-2">error</span>
            {{ error }}
          </div>
        </div>

        <!-- Results -->
        <div *ngIf="cooperant" class="space-y-6">
          <!-- Extrait Coopérant -->
          <div class="card border-2 border-cnss-primary">
            <div class="bg-gradient-to-r from-cnss-primary to-cnss-secondary text-white p-4 -m-6 mb-4 rounded-t-lg">
              <div class="flex justify-between items-center">
                <h2 class="text-xl font-bold flex items-center">
                  <span class="material-icons mr-2">badge</span>
                  Extrait du Coopérant
                </h2>
                <button (click)="printExtrait()" 
                        class="bg-white text-cnss-primary px-4 py-2 rounded-lg hover:bg-gray-100 flex items-center text-sm font-semibold">
                  <span class="material-icons mr-1">print</span>
                  Imprimer
                </button>
              </div>
            </div>
            
            <div class="grid grid-cols-2 md:grid-cols-3 gap-4 mt-4">
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">N° Affiliation</span>
                <p class="font-bold text-cnss-primary text-lg">{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Matricule</span>
                <p class="font-bold">{{ cooperant.matriculeComplet }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Régime</span>
                <p class="font-bold">{{ cooperant.codeRegime }} - {{ cooperant.libelleRegime }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Nom & Prénom (FR)</span>
                <p class="font-semibold">{{ cooperant.nomCompletFr }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">الإسم و اللقب (AR)</span>
                <p class="font-semibold" dir="rtl">{{ cooperant.nomCompletAr || '-' }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Date de Naissance</span>
                <p class="font-semibold">{{ cooperant.dateNaissance | date:'dd/MM/yyyy' }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Adresse</span>
                <p class="font-semibold">{{ cooperant.adresseFr }}, {{ cooperant.codePostal }} {{ cooperant.localiteFr }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Téléphone</span>
                <p class="font-semibold">{{ cooperant.telephone || '-' }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Email</span>
                <p class="font-semibold">{{ cooperant.email || '-' }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Pièce d'identité</span>
                <p class="font-semibold">{{ cooperant.typePieceIdentite }}: {{ cooperant.numPieceIdentite }}</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Salaire</span>
                <p class="font-bold text-green-600">{{ cooperant.salaire | number:'1.3-3' }} TND</p>
              </div>
              <div class="border-b pb-2">
                <span class="text-gray-500 text-sm">Date Effet Affiliation</span>
                <p class="font-semibold">{{ cooperant.dateEffetAffiliation | date:'dd/MM/yyyy' }}</p>
              </div>
            </div>
            
            <div class="mt-4 pt-4 border-t flex justify-between items-center">
              <div>
                <span class="text-gray-500 text-sm">Statut:</span>
                <span class="ml-2 px-3 py-1 rounded-full text-sm font-semibold"
                      [ngClass]="{
                        'bg-green-100 text-green-800': cooperant.statutValidation === 'VALIDE',
                        'bg-yellow-100 text-yellow-800': cooperant.statutValidation === 'EN_ATTENTE',
                        'bg-red-100 text-red-800': cooperant.statutValidation === 'REJETE'
                      }">
                  {{ cooperant.statutValidation }}
                </span>
              </div>
              <div class="text-sm text-gray-500">
                Créé le: {{ cooperant.createdAt | date:'dd/MM/yyyy HH:mm' }}
              </div>
            </div>
          </div>

          <!-- Historique des Débits -->
          <div class="card">
            <h2 class="text-xl font-bold text-cnss-dark mb-4 flex items-center">
              <span class="material-icons mr-2 text-orange-500">receipt_long</span>
              Historique des Débits
            </h2>
            
            <div *ngIf="loadingDebits" class="text-center py-8">
              <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-cnss-primary mx-auto"></div>
            </div>
            
            <div *ngIf="!loadingDebits && debits.length === 0" class="text-center py-8 text-gray-500">
              <span class="material-icons text-4xl mb-2 block">receipt_long</span>
              Aucun débit trouvé pour ce coopérant
            </div>
            
            <table *ngIf="!loadingDebits && debits.length > 0" class="w-full">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-600">Période</th>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-600">Date Génération</th>
                  <th class="px-4 py-3 text-right text-sm font-semibold text-gray-600">Montant</th>
                  <th class="px-4 py-3 text-center text-sm font-semibold text-gray-600">Statut</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let debit of debits" class="border-b hover:bg-gray-50">
                  <td class="px-4 py-3 font-mono">{{ debit.trimestre }}</td>
                  <td class="px-4 py-3">{{ debit.createdAt | date:'dd/MM/yyyy' }}</td>
                  <td class="px-4 py-3 text-right font-bold text-cnss-primary">{{ debit.montantCotisation | number:'1.3-3' }} TND</td>
                  <td class="px-4 py-3 text-center">
                    <span class="px-2 py-1 rounded-full text-xs font-semibold"
                          [ngClass]="debit.paye ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'">
                      {{ debit.paye ? 'Payé' : 'En attente' }}
                    </span>
                  </td>
                </tr>
              </tbody>
              <tfoot class="bg-gray-100">
                <tr>
                  <td colspan="2" class="px-4 py-3 font-bold">Total</td>
                  <td class="px-4 py-3 text-right font-bold text-cnss-primary">{{ getTotalDebits() | number:'1.3-3' }} TND</td>
                  <td></td>
                </tr>
              </tfoot>
            </table>
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

  printExtrait() {
    if (this.cooperant) {
      this.pdfService.generateCooperantExtrait(this.cooperant, this.debits);
    }
  }
}
