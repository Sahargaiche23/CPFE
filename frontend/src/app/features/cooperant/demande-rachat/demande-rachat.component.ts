import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService } from '../../../core/services/demande.service';
import { AuthService } from '../../../core/services/auth.service';

interface DebitItem {
  id: number;
  trimestre: string;
  annee: number;
  montantCotisation: number;
  paye: boolean;
  datePaiement?: string;
  createdAt?: string;
  eligible: boolean;
  raison?: string;
}

@Component({
  selector: 'app-demande-rachat',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <h1 class="text-lg font-bold text-gray-800">Demande de Rachat — Loi 105 (Taux 95%)</h1>
          <a routerLink="/cooperant/espace" class="ml-auto text-teal-600 hover:text-teal-800 text-sm">← Retour</a>
        </div>
      </header>

      <main class="max-w-4xl mx-auto px-4 py-8">
        <!-- Loading -->
        <div *ngIf="loadingCoop" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-amber-600 mx-auto"></div>
          <p class="mt-4 text-gray-500">Chargement de vos informations et débits...</p>
        </div>

        <div *ngIf="cooperant && !loadingCoop && !submitted" class="space-y-6">
          <!-- Info coopérant -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
              <div><span class="text-gray-500">Nom:</span><br><strong>{{ cooperant.prenomFr }} {{ cooperant.nomFr }}</strong></div>
              <div><span class="text-gray-500">Matricule:</span><br><strong class="text-teal-600">{{ cooperant.matriculeComplet }}</strong></div>
              <div><span class="text-gray-500">N° Affiliation:</span><br><strong>{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</strong></div>
              <div><span class="text-gray-500">Salaire:</span><br><strong>{{ cooperant.salaire | number:'1.3-3' }} TND</strong></div>
            </div>
          </div>

          <!-- Explications Loi 105 -->
          <div class="bg-amber-50 border-2 border-amber-200 rounded-xl p-6">
            <h3 class="font-bold text-amber-800 flex items-center gap-2 mb-3">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              Rachat selon la Loi 105
            </h3>
            <div class="text-sm text-amber-900 space-y-2">
              <p><strong>Formule :</strong> Montant à Payer = Montant Débit Original × <strong>95%</strong> (Réduction = 5%)</p>
              <p><strong>Workflow :</strong> Dépôt → Vérification par Agent CNSS → Calcul automatique → Validation → Bordereau → Notification</p>
            </div>
          </div>

          <!-- Débits du coopérant -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
              </svg>
              Débits du coopérant
              <span class="ml-auto text-sm font-normal">
                <span class="text-green-600 font-medium">{{ getEligibleCount() }} éligible(s)</span>
                <span class="text-gray-400 mx-1">·</span>
                <span class="text-gray-500">{{ allDebits.length }} total</span>
              </span>
            </h2>

            <div *ngIf="loadingDebits" class="text-center py-4">
              <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-amber-600 mx-auto"></div>
            </div>

            <div *ngIf="!loadingDebits && allDebits.length === 0" class="bg-gray-50 rounded-lg p-6 text-center">
              <svg class="w-12 h-12 text-gray-400 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              <p class="text-gray-600 font-medium">Aucun débit trouvé</p>
              <p class="text-sm text-gray-500 mt-1">Vous n'avez aucun débit généré pour votre affiliation.</p>
            </div>

            <div *ngIf="!loadingDebits && allDebits.length > 0" class="space-y-3">
              <div *ngFor="let debit of allDebits" 
                   class="border-2 rounded-lg p-4 transition-all"
                   [ngClass]="getDebitCardClass(debit)"
                   (click)="selectDebit(debit)"
                   class="cursor-pointer">
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center text-sm font-bold"
                         [ngClass]="getDebitIconClass(debit)">
                      {{ selectedDebit?.id === debit.id ? '✓' : '○' }}
                    </div>
                    <div>
                      <div class="font-semibold text-gray-800">{{ debit.trimestre }}</div>
                      <div class="text-xs text-gray-500">
                        <span [ngClass]="debit.paye ? 'text-green-600' : 'text-orange-500'">{{ debit.paye ? '✓ Payé' : '⏳ En attente' }}</span>
                        <span *ngIf="debit.createdAt"> · {{ debit.createdAt | date:'dd/MM/yyyy' }}</span>
                      </div>
                    </div>
                  </div>
                  <div class="text-right">
                    <div class="font-bold text-gray-800">{{ debit.montantCotisation | number:'1.3-3' }} TND</div>
                    <div class="text-xs text-amber-600">Rachat: {{ debit.montantCotisation * 0.95 | number:'1.3-3' }} TND</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Calcul du rachat -->
          <div *ngIf="selectedDebit" class="bg-white rounded-xl shadow-lg p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
              <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
              </svg>
              Bordereau de Rachat
            </h2>

            <!-- Bordereau détaillé -->
            <div class="border-2 border-gray-200 rounded-lg overflow-hidden">
              <div class="bg-gray-800 text-white p-3 text-center text-sm font-semibold">
                BORDEREAU DE RACHAT — LOI 105
              </div>
              <div class="p-4 space-y-3">
                <div class="grid grid-cols-2 gap-2 text-sm">
                  <div class="text-gray-500">Coopérant:</div>
                  <div class="font-medium">{{ cooperant.prenomFr }} {{ cooperant.nomFr }}</div>
                  <div class="text-gray-500">Matricule:</div>
                  <div class="font-medium">{{ cooperant.matriculeComplet }}</div>
                  <div class="text-gray-500">N° Affiliation:</div>
                  <div class="font-medium">{{ cooperant.cleAffiliation }}-{{ cooperant.numAffiliation }}</div>
                  <div class="text-gray-500">Trimestre:</div>
                  <div class="font-medium">{{ selectedDebit.trimestre }}</div>
                </div>
                <hr>
                <div class="grid grid-cols-3 gap-4 text-center py-4">
                  <div class="bg-gray-50 rounded-lg p-3">
                    <div class="text-xs text-gray-500 mb-1">Montant Original</div>
                    <div class="text-xl font-bold text-gray-800">{{ selectedDebit.montantCotisation | number:'1.3-3' }}</div>
                    <div class="text-xs text-gray-500">TND</div>
                  </div>
                  <div class="bg-green-50 rounded-lg p-3">
                    <div class="text-xs text-gray-500 mb-1">Montant Rachat (95%)</div>
                    <div class="text-xl font-bold text-green-700">{{ getMontantRachat() | number:'1.3-3' }}</div>
                    <div class="text-xs text-gray-500">TND</div>
                  </div>
                  <div class="bg-red-50 rounded-lg p-3">
                    <div class="text-xs text-gray-500 mb-1">Réduction (5%)</div>
                    <div class="text-xl font-bold text-red-600">-{{ getReduction() | number:'1.3-3' }}</div>
                    <div class="text-xs text-gray-500">TND</div>
                  </div>
                </div>
                <hr>
                <div class="flex justify-between items-center bg-amber-50 rounded-lg p-4">
                  <span class="font-semibold text-gray-800">Montant à payer:</span>
                  <span class="text-2xl font-bold text-amber-700">{{ getMontantRachat() | number:'1.3-3' }} TND</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Boutons -->
          <div *ngIf="selectedDebit" class="flex justify-between">
            <a routerLink="/cooperant/espace" class="px-6 py-3 bg-white text-gray-600 rounded-lg shadow hover:bg-gray-50">Annuler</a>
            <button (click)="submit()" [disabled]="loading"
                    class="px-6 py-3 bg-amber-600 text-white rounded-lg shadow hover:bg-amber-700 disabled:opacity-50 flex items-center gap-2">
              <span *ngIf="loading" class="animate-spin">⏳</span>
              Déposer la demande de rachat
            </button>
          </div>
        </div>

        <!-- Succès -->
        <div *ngIf="submitted" class="bg-white rounded-xl shadow-lg p-8 text-center">
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
            </svg>
          </div>
          <h2 class="text-xl font-bold text-gray-800 mb-2">Demande de rachat déposée !</h2>
          <p class="text-gray-500 mb-2">Trimestre: <strong>{{ selectedDebit?.trimestre }}</strong></p>
          <p class="text-gray-500 mb-2">Montant rachat: <strong class="text-amber-700">{{ getMontantRachat() | number:'1.3-3' }} TND</strong></p>
          <p class="text-gray-500 mb-6">Réduction: <strong class="text-green-600">{{ getReduction() | number:'1.3-3' }} TND</strong></p>
          <p class="text-sm text-gray-400 mb-6">Votre demande sera traitée par un agent CNSS. Vous recevrez une notification par email.</p>
          <div class="flex justify-center gap-4">
            <a routerLink="/cooperant/espace" class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700">Retour à l'espace</a>
            <a routerLink="/cooperant/mes-demandes" class="px-4 py-2 border border-teal-600 text-teal-600 rounded-lg hover:bg-teal-50">Suivre mes demandes</a>
          </div>
        </div>
      </main>
    </div>
  `
})
export class DemandeRachatComponent implements OnInit {
  cooperant: Cooperant | null = null;
  loadingCoop = true;
  loadingDebits = true;
  loading = false;
  submitted = false;
  allDebits: DebitItem[] = [];
  selectedDebit: DebitItem | null = null;

  constructor(
    private cooperantService: CooperantService,
    private demandeService: DemandeService,
    private authService: AuthService,
    private http: HttpClient,
    private router: Router
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    const email = user?.username || '';
    this.cooperantService.getAll().subscribe({
      next: (list) => {
        this.cooperant = list.find(c => c.email === email) || null;
        this.loadingCoop = false;
        if (this.cooperant) {
          this.loadDebitsEligibles();
        }
      },
      error: () => { this.loadingCoop = false; this.loadingDebits = false; }
    });
  }

  loadDebitsEligibles() {
    if (!this.cooperant?.numAffiliation) { this.loadingDebits = false; return; }
    const numAff = `${this.cooperant.cleAffiliation}-${this.cooperant.numAffiliation}`;
    this.http.get<any[]>('/api/debits').subscribe({
      next: (debits) => {
        const now = new Date();
        const oneYearAgo = new Date(now.getFullYear() - 1, now.getMonth(), now.getDate());
        this.allDebits = debits
          .filter(d => d.numAffiliation === numAff)
          .map(d => {
            const dateRef = d.datePaiement || d.createdAt;
            const isOldEnough = dateRef ? new Date(dateRef) <= oneYearAgo : false;
            let raison = '';
            if (!d.paye) raison = 'Débit non payé — paiement requis';
            else if (!isOldEnough) raison = 'Payé depuis moins d\'1 an';
            return {
              ...d,
              eligible: d.paye && isOldEnough,
              raison
            };
          })
          .sort((a: DebitItem, b: DebitItem) => {
            if (a.eligible && !b.eligible) return -1;
            if (!a.eligible && b.eligible) return 1;
            if (a.paye && !b.paye) return -1;
            if (!a.paye && b.paye) return 1;
            return 0;
          });
        this.loadingDebits = false;
      },
      error: () => { this.loadingDebits = false; }
    });
  }

  selectDebit(debit: DebitItem) {
    this.selectedDebit = debit;
  }

  getEligibleCount(): number {
    return this.allDebits.filter(d => d.eligible).length;
  }

  getDebitCardClass(debit: DebitItem): string {
    if (this.selectedDebit?.id === debit.id) return 'border-amber-500 bg-amber-50 shadow-md';
    return 'border-gray-200 hover:border-amber-300';
  }

  getDebitIconClass(debit: DebitItem): string {
    if (this.selectedDebit?.id === debit.id) return 'bg-amber-500 text-white';
    return 'bg-gray-200 text-gray-600';
  }

  getMontantRachat(): number {
    return this.selectedDebit ? this.selectedDebit.montantCotisation * 0.95 : 0;
  }

  getReduction(): number {
    return this.selectedDebit ? this.selectedDebit.montantCotisation * 0.05 : 0;
  }

  submit() {
    if (!this.cooperant?.id || !this.selectedDebit) return;
    this.loading = true;
    this.demandeService.creerDemandeRachat({
      cooperantId: this.cooperant.id,
      debitId: this.selectedDebit.id,
      trimestreDebit: this.selectedDebit.trimestre,
      montantOriginal: this.selectedDebit.montantCotisation
    }).subscribe({
      next: () => { this.loading = false; this.submitted = true; },
      error: () => { this.loading = false; alert('Erreur lors du dépôt de la demande de rachat'); }
    });
  }
}
