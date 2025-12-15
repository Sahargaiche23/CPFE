import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { RegimeService, RegimeCotisation } from '../../../core/services/regime.service';

@Component({
  selector: 'app-regime-management',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-6">
        <div class="flex justify-between items-center mb-6">
          <div>
            <h1 class="text-2xl font-bold text-gray-800">Gestion des Régimes de Cotisation</h1>
            <p class="text-gray-600">إدارة أنظمة الاشتراكات</p>
          </div>
          <button (click)="openModal()" class="bg-red-800 text-white px-4 py-2 rounded-lg hover:bg-red-900 flex items-center gap-2">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
            </svg>
            Ajouter un régime
          </button>
        </div>

        <!-- Loading -->
        <div *ngIf="loading" class="flex justify-center py-12">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-red-800"></div>
        </div>

        <!-- Table des régimes -->
        <div *ngIf="!loading" class="bg-white rounded-xl shadow-lg overflow-hidden">
          <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-red-800 text-white">
              <tr>
                <th class="px-6 py-3 text-right text-xs font-medium uppercase">الرمز</th>
                <th class="px-6 py-3 text-right text-xs font-medium uppercase">النظام (عربي)</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase">Régime (FR)</th>
                <th class="px-6 py-3 text-center text-xs font-medium uppercase">النسبة %</th>
                <th class="px-6 py-3 text-center text-xs font-medium uppercase">Base</th>
                <th class="px-6 py-3 text-center text-xs font-medium uppercase">Coefficient</th>
                <th class="px-6 py-3 text-center text-xs font-medium uppercase">Statut</th>
                <th class="px-6 py-3 text-center text-xs font-medium uppercase">Actions</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
              <tr *ngFor="let regime of regimes" class="hover:bg-gray-50">
                <td class="px-6 py-4 text-right font-mono font-bold text-red-800">{{ regime.code }}</td>
                <td class="px-6 py-4 text-right" dir="rtl">{{ regime.nomAr }}</td>
                <td class="px-6 py-4 text-left">{{ regime.nomFr || '-' }}</td>
                <td class="px-6 py-4 text-center font-bold">{{ regime.taux }}%</td>
                <td class="px-6 py-4 text-center">
                  <span [class]="regime.baseCalcul === 'SALAIRE' ? 'bg-blue-100 text-blue-800' : 'bg-orange-100 text-orange-800'" 
                        class="px-2 py-1 rounded-full text-xs">
                    {{ regime.baseCalcul === 'SALAIRE' ? 'Salaire complet' : 'Salaire plafonné' }}
                  </span>
                </td>
                <td class="px-6 py-4 text-center">{{ regime.coefficientBase }}</td>
                <td class="px-6 py-4 text-center">
                  <span [class]="regime.actif ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'" 
                        class="px-2 py-1 rounded-full text-xs">
                    {{ regime.actif ? 'Actif' : 'Inactif' }}
                  </span>
                </td>
                <td class="px-6 py-4 text-center">
                  <div class="flex justify-center gap-2">
                    <button (click)="editRegime(regime)" class="text-blue-600 hover:text-blue-800" title="Modifier">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                      </svg>
                    </button>
                    <button (click)="deleteRegime(regime)" class="text-red-600 hover:text-red-800" title="Supprimer">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                      </svg>
                    </button>
                  </div>
                </td>
              </tr>
              <tr *ngIf="regimes.length === 0">
                <td colspan="8" class="px-6 py-12 text-center text-gray-500">
                  <p>Aucun régime configuré</p>
                  <button (click)="initDefaultRegimes()" class="mt-4 text-red-800 hover:underline">
                    Initialiser les régimes par défaut
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Modal -->
        <div *ngIf="showModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div class="bg-white rounded-xl shadow-2xl w-full max-w-2xl mx-4">
            <div class="bg-red-800 text-white px-6 py-4 rounded-t-xl">
              <h2 class="text-xl font-bold">{{ editingRegime ? 'Modifier le régime' : 'Ajouter un régime' }}</h2>
            </div>
            <form [formGroup]="regimeForm" (ngSubmit)="saveRegime()" class="p-6">
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Code (الرمز) *</label>
                  <input type="text" formControlName="code" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="Ex: 133">
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Taux (النسبة) % *</label>
                  <input type="number" formControlName="taux" step="0.01" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="Ex: 13.5">
                </div>
                <div class="col-span-2">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Nom en arabe (النظام) *</label>
                  <input type="text" formControlName="nomAr" dir="rtl" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="جرايات الشيخوخة والعجز">
                </div>
                <div class="col-span-2">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Nom en français</label>
                  <input type="text" formControlName="nomFr" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="Pensions de vieillesse">
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Base de calcul *</label>
                  <select formControlName="baseCalcul" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500">
                    <option value="SALAIRE">Salaire complet (100%)</option>
                    <option value="SALAIRE_PLAFONNE">Salaire plafonné (73.5%)</option>
                  </select>
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Coefficient base *</label>
                  <input type="number" formControlName="coefficientBase" step="0.001" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="1.0 ou 0.735">
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Ordre d'affichage</label>
                  <input type="number" formControlName="ordre" class="w-full border rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-500" placeholder="1">
                </div>
                <div class="flex items-center">
                  <label class="flex items-center cursor-pointer">
                    <input type="checkbox" formControlName="actif" class="w-4 h-4 text-red-600 rounded focus:ring-red-500">
                    <span class="ml-2 text-sm text-gray-700">Actif</span>
                  </label>
                </div>
              </div>
              <div class="flex justify-end gap-3 mt-6 pt-4 border-t">
                <button type="button" (click)="closeModal()" class="px-4 py-2 border rounded-lg hover:bg-gray-50">Annuler</button>
                <button type="submit" [disabled]="regimeForm.invalid" class="px-4 py-2 bg-red-800 text-white rounded-lg hover:bg-red-900 disabled:opacity-50">
                  {{ editingRegime ? 'Mettre à jour' : 'Créer' }}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class RegimeManagementComponent implements OnInit {
  regimes: RegimeCotisation[] = [];
  loading = true;
  showModal = false;
  editingRegime: RegimeCotisation | null = null;
  regimeForm: FormGroup;

  constructor(
    private regimeService: RegimeService,
    private fb: FormBuilder
  ) {
    this.regimeForm = this.fb.group({
      code: ['', Validators.required],
      nomAr: ['', Validators.required],
      nomFr: [''],
      taux: [0, [Validators.required, Validators.min(0)]],
      baseCalcul: ['SALAIRE', Validators.required],
      coefficientBase: [1.0, [Validators.required, Validators.min(0)]],
      actif: [true],
      ordre: [1]
    });
  }

  ngOnInit() {
    this.loadRegimes();
  }

  loadRegimes() {
    this.loading = true;
    this.regimeService.getAllIncludingInactive().subscribe({
      next: (data) => {
        this.regimes = data.sort((a, b) => (a.ordre || 0) - (b.ordre || 0));
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement régimes:', err);
        this.loading = false;
      }
    });
  }

  openModal() {
    this.editingRegime = null;
    this.regimeForm.reset({
      code: '',
      nomAr: '',
      nomFr: '',
      taux: 0,
      baseCalcul: 'SALAIRE',
      coefficientBase: 1.0,
      actif: true,
      ordre: this.regimes.length + 1
    });
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
    this.editingRegime = null;
  }

  editRegime(regime: RegimeCotisation) {
    this.editingRegime = regime;
    this.regimeForm.patchValue({
      code: regime.code,
      nomAr: regime.nomAr,
      nomFr: regime.nomFr || '',
      taux: regime.taux,
      baseCalcul: regime.baseCalcul,
      coefficientBase: regime.coefficientBase,
      actif: regime.actif,
      ordre: regime.ordre
    });
    this.showModal = true;
  }

  saveRegime() {
    if (this.regimeForm.invalid) return;

    const regimeData: RegimeCotisation = this.regimeForm.value;

    if (this.editingRegime) {
      this.regimeService.update(this.editingRegime.id!, regimeData).subscribe({
        next: () => {
          this.closeModal();
          this.loadRegimes();
        },
        error: (err) => {
          console.error('Erreur mise à jour:', err);
          alert('Erreur lors de la mise à jour');
        }
      });
    } else {
      this.regimeService.create(regimeData).subscribe({
        next: () => {
          this.closeModal();
          this.loadRegimes();
        },
        error: (err) => {
          console.error('Erreur création:', err);
          alert(err.error || 'Erreur lors de la création');
        }
      });
    }
  }

  deleteRegime(regime: RegimeCotisation) {
    if (confirm(`Supprimer le régime "${regime.nomAr}" ?`)) {
      this.regimeService.delete(regime.id!).subscribe({
        next: () => this.loadRegimes(),
        error: (err) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression');
        }
      });
    }
  }

  initDefaultRegimes() {
    this.regimeService.initDefaultRegimes().subscribe({
      next: () => this.loadRegimes(),
      error: (err) => console.error('Erreur initialisation:', err)
    });
  }
}
