import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';
import { DebitService, Debit } from '../../../core/services/debit.service';
import { PaymentService } from '../../../core/services/payment.service';

interface DossierATCT {
  id: number;
  nomFr: string;
  prenomFr: string;
  email: string;
  statut: string;
  dateCreation: string;
  dateValidation?: string;
  motifRejet?: string;
  matriculeEmployeurComplet?: string;
}

@Component({
  selector: 'app-suivi-dossier',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-700 via-pink-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <a routerLink="/cooperant/espace" class="text-pink-600 hover:text-pink-800">← Retour</a>
        </div>
      </header>

      <main class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6">Suivi de mon dossier</h2>
          
          <div *ngIf="dossierAtct || cooperant" class="space-y-6">
            <!-- Info coopérant -->
            <div class="bg-pink-50 p-4 rounded-lg mb-4">
              <p class="font-semibold text-pink-800">{{ getNom() }}</p>
              <p class="text-sm text-pink-600" *ngIf="dossierAtct?.matriculeEmployeurComplet">Matricule: {{ dossierAtct?.matriculeEmployeurComplet }}</p>
            </div>
            
            <!-- Timeline -->
            <div class="relative">
              <!-- Dépôt -->
              <div class="flex items-start gap-4 mb-8">
                <div class="w-10 h-10 rounded-full bg-green-500 flex items-center justify-center text-white font-bold">✓</div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Dossier déposé</h4>
                  <p class="text-sm text-gray-500">{{ getDateCreation() | date:'dd/MM/yyyy à HH:mm' }}</p>
                  <p class="text-sm text-gray-600 mt-1">Votre dossier a été enregistré avec succès</p>
                </div>
              </div>

              <!-- En cours de traitement -->
              <div class="flex items-start gap-4 mb-8">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="getStatut() === 'EN_ATTENTE' ? 'bg-yellow-500 text-white animate-pulse' : 'bg-green-500 text-white'">
                  {{ getStatut() === 'EN_ATTENTE' ? '⏳' : '✓' }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Examen du dossier</h4>
                  <p class="text-sm text-gray-500" *ngIf="getStatut() === 'EN_ATTENTE'">En cours...</p>
                  <p class="text-sm text-gray-500" *ngIf="getStatut() !== 'EN_ATTENTE'">Traité</p>
                  <p class="text-sm text-gray-600 mt-1">Votre dossier est examiné par nos services</p>
                </div>
              </div>

              <!-- Décision -->
              <div class="flex items-start gap-4 mb-8">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="{
                       'bg-green-500 text-white': getStatut() === 'VALIDE',
                       'bg-red-500 text-white': getStatut() === 'REJETE',
                       'bg-gray-300 text-gray-500': getStatut() === 'EN_ATTENTE'
                     }">
                  {{ getStatut() === 'VALIDE' ? '✓' : getStatut() === 'REJETE' ? '✗' : '?' }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Décision</h4>
                  <p class="text-sm text-gray-500" *ngIf="dossierAtct?.dateValidation || cooperant?.dateValidation">{{ (dossierAtct?.dateValidation || cooperant?.dateValidation) | date:'dd/MM/yyyy à HH:mm' }}</p>
                  <p class="text-sm text-gray-500" *ngIf="!dossierAtct?.dateValidation && !cooperant?.dateValidation">En attente</p>
                  
                  <div class="mt-2 p-3 rounded-lg" *ngIf="getStatut() !== 'EN_ATTENTE'"
                       [ngClass]="getStatut() === 'VALIDE' ? 'bg-green-50' : 'bg-red-50'">
                    <p class="font-medium" [ngClass]="getStatut() === 'VALIDE' ? 'text-green-700' : 'text-red-700'">
                      {{ getStatut() === 'VALIDE' ? 'Votre dossier a été validé !' : 'Votre dossier a été rejeté' }}
                    </p>
                    <p class="text-sm mt-1" *ngIf="dossierAtct?.motifRejet || cooperant?.motifRejet">Motif: {{ dossierAtct?.motifRejet || cooperant?.motifRejet }}</p>
                  </div>
                </div>
              </div>

              <!-- Affiliation -->
              <div class="flex items-start gap-4 mb-8" *ngIf="getStatut() === 'VALIDE' && cooperant">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="cooperant?.numAffiliation ? 'bg-green-500 text-white' : 'bg-yellow-500 text-white animate-pulse'">
                  {{ cooperant?.numAffiliation ? '✓' : '⏳' }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Affiliation</h4>
                  <p class="text-sm text-gray-500" *ngIf="cooperant?.numAffiliation">Complétée</p>
                  <p class="text-sm text-gray-500" *ngIf="!cooperant?.numAffiliation">En cours...</p>
                  <div class="mt-2 p-3 rounded-lg bg-blue-50" *ngIf="cooperant?.numAffiliation">
                    <p class="font-medium text-blue-700">N° Affiliation: {{ cooperant?.cleAffiliation }}-{{ cooperant?.numAffiliation }}</p>
                    <p class="text-sm text-blue-600 mt-1">Votre attestation d'affiliation a été générée</p>
                  </div>
                  <p class="text-sm text-gray-600 mt-1" *ngIf="!cooperant?.numAffiliation">Attribution du numéro d'affiliation CNSS</p>
                </div>
              </div>

              <!-- Débit / Cotisation -->
              <div class="flex items-start gap-4" *ngIf="getStatut() === 'VALIDE' && cooperant?.numAffiliation">
                <div class="w-10 h-10 rounded-full flex items-center justify-center font-bold"
                     [ngClass]="getDebitStatusClass()">
                  {{ getDebitStatusIcon() }}
                </div>
                <div class="flex-1">
                  <h4 class="font-semibold text-gray-800">Débit / Cotisation</h4>
                  <p class="text-sm text-gray-500">{{ getDebitStatusText() }}</p>
                  
                  <!-- Liste des débits -->
                  <div *ngIf="debits.length > 0" class="mt-2 space-y-2">
                    <div *ngFor="let debit of debits" class="p-3 rounded-lg border"
                         [ngClass]="debit.paye ? 'bg-green-50 border-green-200' : 'bg-orange-50 border-orange-200'">
                      <div class="flex justify-between items-center">
                        <span class="font-medium" [ngClass]="debit.paye ? 'text-green-700' : 'text-orange-700'">
                          {{ debit.trimestre }}
                        </span>
                        <span class="text-sm px-2 py-1 rounded-full"
                              [ngClass]="debit.paye ? 'bg-green-200 text-green-800' : 'bg-orange-200 text-orange-800'">
                          {{ debit.paye ? 'Payé' : 'En attente' }}
                        </span>
                      </div>
                      <p class="text-sm mt-1">Montant: {{ debit.montantCotisation | number:'1.3-3' }} TND</p>
                      <p class="text-xs text-gray-500" *ngIf="debit.createdAt">Généré le: {{ debit.createdAt | date:'dd/MM/yyyy' }}</p>
                    </div>
                  </div>
                  
                  <div *ngIf="debits.length === 0" class="mt-2 p-3 rounded-lg bg-gray-50">
                    <p class="text-gray-600">Aucun débit généré pour le moment</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div *ngIf="!cooperant && !dossierAtct && !loading" class="text-center py-8 text-gray-500">
            Aucun dossier trouvé
          </div>
        </div>
      </main>
    </div>
  `
})
export class SuiviDossierComponent implements OnInit {
  cooperant: Cooperant | null = null;
  dossierAtct: DossierATCT | null = null;
  debits: Debit[] = [];
  loading = true;

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService,
    private debitService: DebitService,
    private paymentService: PaymentService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    const username = user?.username || '';
    
    // Charger le dossier ATCT d'abord
    this.http.get<DossierATCT[]>('/api/atct').subscribe({
      next: (dossiers) => {
        this.dossierAtct = dossiers.find(d => d.email === username) || null;
        
        // Aussi charger les données coopérant pour l'affiliation
        this.cooperantService.getAll().subscribe({
          next: (cooperants) => {
            this.cooperant = cooperants.find(c => c.email === username) || null;
            this.loading = false;
            if (this.cooperant?.numAffiliation) {
              this.loadDebits();
            }
          },
          error: () => this.loading = false
        });
      },
      error: () => {
        // Fallback sur coopérant classique
        this.cooperantService.getAll().subscribe({
          next: (cooperants) => {
            this.cooperant = cooperants.find(c => c.email === username) || null;
            this.loading = false;
            if (this.cooperant?.numAffiliation) {
              this.loadDebits();
            }
          },
          error: () => this.loading = false
        });
      }
    });
  }

  getStatut(): string {
    const statut = this.dossierAtct?.statut || this.cooperant?.statutValidation || 'EN_ATTENTE';
    // AFFILIE est considéré comme VALIDE pour l'affichage
    if (statut === 'AFFILIE') return 'VALIDE';
    return statut;
  }

  getDateCreation(): string {
    return this.dossierAtct?.dateCreation || this.cooperant?.createdAt || '';
  }

  getNom(): string {
    if (this.dossierAtct) return `${this.dossierAtct.prenomFr} ${this.dossierAtct.nomFr}`;
    if (this.cooperant) return `${this.cooperant.prenomFr} ${this.cooperant.nomFr}`;
    return '';
  }

  loadDebits() {
    if (!this.cooperant?.numAffiliation) return;
    
    const numAff = `${this.cooperant.cleAffiliation}-${this.cooperant.numAffiliation}`;
    this.debitService.getAll().subscribe({
      next: (debits) => {
        this.debits = debits.filter(d => d.numAffiliation === numAff);
      }
    });
  }

  getDebitStatusClass(): string {
    if (this.debits.length === 0) return 'bg-gray-400 text-white';
    const allPaid = this.debits.every(d => d.paye);
    const somePaid = this.debits.some(d => d.paye);
    if (allPaid) return 'bg-green-500 text-white';
    if (somePaid) return 'bg-yellow-500 text-white';
    return 'bg-orange-500 text-white';
  }

  getDebitStatusIcon(): string {
    if (this.debits.length === 0) return '?';
    const allPaid = this.debits.every(d => d.paye);
    if (allPaid) return '✓';
    return '💳';
  }

  getDebitStatusText(): string {
    if (this.debits.length === 0) return 'Aucun débit';
    const paid = this.debits.filter(d => d.paye).length;
    const total = this.debits.length;
    if (paid === total) return `Toutes les cotisations payées (${total})`;
    return `${paid}/${total} cotisations payées`;
  }
}
