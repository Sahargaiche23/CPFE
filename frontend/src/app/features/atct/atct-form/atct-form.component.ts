import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCTRequest } from '../../../core/services/atct.service';

@Component({
  selector: 'app-atct-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-6">
        <!-- Header -->
        <div class="mb-6">
          <nav class="flex items-center text-sm text-gray-500 mb-2">
            <a routerLink="/atct" class="hover:text-blue-600">ATCT</a>
            <span class="mx-2">/</span>
            <span class="text-gray-900">{{ isEditMode ? 'Modifier' : 'Nouveau' }} Dossier</span>
          </nav>
          <h1 class="text-2xl font-bold text-gray-900">
            {{ isEditMode ? 'Modifier le dossier' : 'Créer un nouveau dossier ATCT' }}
          </h1>
          <p class="text-gray-600 mt-1">تسوية فترات إلحاق في إطار التعاون الفني</p>
        </div>

        <!-- Form -->
        <form [formGroup]="form" (ngSubmit)="onSubmit()" class="space-y-6">
          
          <!-- Section: Informations Personnelles -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">1</span>
              Informations Personnelles / المعلومات الشخصية
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">N° Sécurité Sociale</label>
                <input type="text" formControlName="numSecuSociale"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Nom (FR) *</label>
                <input type="text" formControlName="nomFr"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                       [class.border-red-500]="form.get('nomFr')?.invalid && form.get('nomFr')?.touched">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Prénom (FR) *</label>
                <input type="text" formControlName="prenomFr"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                       [class.border-red-500]="form.get('prenomFr')?.invalid && form.get('prenomFr')?.touched">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">الاسم (AR)</label>
                <input type="text" formControlName="nomAr" dir="rtl"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">اللقب (AR)</label>
                <input type="text" formControlName="prenomAr" dir="rtl"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Date de naissance</label>
                <input type="date" formControlName="dateNaissance"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Lieu de naissance</label>
                <input type="text" formControlName="lieuNaissanceFr"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Sexe</label>
                <select formControlName="sexe"
                        class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  <option value="">Sélectionner</option>
                  <option value="M">Masculin</option>
                  <option value="F">Féminin</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Nationalité</label>
                <input type="text" formControlName="nationalite" value="Tunisienne"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">N° CIN</label>
                <input type="text" formControlName="numCin"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">N° Passeport</label>
                <input type="text" formControlName="numPasseport"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
            </div>
          </div>

          <!-- Section: Adresses -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">2</span>
              Adresses / العناوين
            </h2>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <!-- Adresse Tunisie -->
              <div class="p-4 bg-gray-50 rounded-lg">
                <h3 class="font-medium text-gray-800 mb-3">📍 Adresse en Tunisie</h3>
                <div class="space-y-3">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Adresse</label>
                    <input type="text" formControlName="adresseTunisie"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                  <div class="grid grid-cols-2 gap-3">
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Code Postal</label>
                      <input type="text" formControlName="codePostalTunisie"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Ville</label>
                      <input type="text" formControlName="villeTunisie"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                  </div>
                </div>
              </div>
              <!-- Adresse Étranger -->
              <div class="p-4 bg-blue-50 rounded-lg">
                <h3 class="font-medium text-gray-800 mb-3">🌍 Adresse à l'Étranger</h3>
                <div class="space-y-3">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Adresse</label>
                    <input type="text" formControlName="adresseEtranger"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                  <div class="grid grid-cols-2 gap-3">
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Code Postal</label>
                      <input type="text" formControlName="codePostalEtranger"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Ville</label>
                      <input type="text" formControlName="villeEtranger"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Pays *</label>
                    <select formControlName="paysCode"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                      <option value="">Sélectionner un pays</option>
                      @for (pays of paysList; track pays.code) {
                        <option [value]="pays.code">{{ pays.nom }}</option>
                      }
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Section: Contact -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">3</span>
              Contact / الاتصال
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email *</label>
                <input type="email" formControlName="email"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                       [class.border-red-500]="form.get('email')?.invalid && form.get('email')?.touched">
                <p class="text-xs text-gray-500 mt-1">L'email sera utilisé pour l'envoi des identifiants de connexion</p>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Téléphone</label>
                <input type="tel" formControlName="telephone"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
            </div>
          </div>

          <!-- Section: Établissement & Mission -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">4</span>
              Établissement & Mission / المؤسسة والمهمة
            </h2>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <div class="p-4 bg-gray-50 rounded-lg">
                <h3 class="font-medium text-gray-800 mb-3">🏢 Établissement d'origine (Tunisie)</h3>
                <div class="space-y-3">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nom de l'établissement</label>
                    <input type="text" formControlName="etablissementOrigine"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                  <div class="grid grid-cols-2 gap-3">
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Matricule Employeur</label>
                      <input type="number" formControlName="matriculeEmployeur"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-1">Clé</label>
                      <input type="number" formControlName="cleEmployeur"
                             class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                  </div>
                </div>
              </div>
              <div class="p-4 bg-blue-50 rounded-lg">
                <h3 class="font-medium text-gray-800 mb-3">🌐 Organisme à l'étranger</h3>
                <div class="space-y-3">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nom de l'organisme</label>
                    <input type="text" formControlName="organismeEtranger"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mission / Poste</label>
                    <input type="text" formControlName="missionPoste"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Section: Période de Détachement -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">5</span>
              Période de Détachement / فترة الإلحاق
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Date début *</label>
                <input type="date" formControlName="dateDebutDetachement"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                       [class.border-red-500]="form.get('dateDebutDetachement')?.invalid && form.get('dateDebutDetachement')?.touched">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Date fin</label>
                <input type="date" formControlName="dateFinDetachement"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Date renouvellement</label>
                <input type="date" formControlName="dateRenouvellement"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
            </div>
          </div>

          <!-- Section: Salaires -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">6</span>
              Salaires / الأجور
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Salaire Tunisie (TND)</label>
                <input type="number" formControlName="salaireTunisie" step="0.001"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Salaire Étranger</label>
                <input type="number" formControlName="salaireEtranger" step="0.01"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Devise</label>
                <select formControlName="deviseEtranger"
                        class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  <option value="">Sélectionner</option>
                  <option value="EUR">EUR - Euro</option>
                  <option value="USD">USD - Dollar US</option>
                  <option value="GBP">GBP - Livre Sterling</option>
                  <option value="AED">AED - Dirham EAU</option>
                  <option value="SAR">SAR - Riyal Saoudien</option>
                  <option value="QAR">QAR - Riyal Qatari</option>
                  <option value="KWD">KWD - Dinar Koweïtien</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Équivalent TND</label>
                <input type="number" formControlName="salaireConvertiTnd" step="0.001"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
              </div>
            </div>
          </div>

          <!-- Section: Régime & Options -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">7</span>
              Régime & Options / النظام والخيارات
            </h2>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Régime</label>
                <div class="space-y-2">
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('codeRegime')?.value === '500'"
                         [class.bg-blue-50]="form.get('codeRegime')?.value === '500'">
                    <input type="radio" formControlName="codeRegime" value="500" class="mr-3">
                    <span><strong>500</strong> - Coopération Technique Régime Général</span>
                  </label>
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('codeRegime')?.value === '510'"
                         [class.bg-blue-50]="form.get('codeRegime')?.value === '510'">
                    <input type="radio" formControlName="codeRegime" value="510" class="mr-3">
                    <span><strong>510</strong> - Coopération Technique Régime Spécial</span>
                  </label>
                </div>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Mode de Paiement</label>
                <div class="space-y-2">
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('modePaiement')?.value === 'MENSUEL'">
                    <input type="radio" formControlName="modePaiement" value="MENSUEL" class="mr-3">
                    <span>شهريا - Mensuel</span>
                  </label>
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('modePaiement')?.value === 'TRIMESTRIEL'">
                    <input type="radio" formControlName="modePaiement" value="TRIMESTRIEL" class="mr-3">
                    <span>بصفة دورية مرة في نهاية كل ثلاثة أشهر - Trimestriel</span>
                  </label>
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('modePaiement')?.value === 'ANNUEL'">
                    <input type="radio" formControlName="modePaiement" value="ANNUEL" class="mr-3">
                    <span>بصفة دورية مرة في نهاية كل سنة - Annuel</span>
                  </label>
                  <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50"
                         [class.border-blue-500]="form.get('modePaiement')?.value === 'ANTICIPE'">
                    <input type="radio" formControlName="modePaiement" value="ANTICIPE" class="mr-3">
                    <span>مسبقا و قبل حلول أجلها - Par anticipation</span>
                  </label>
                </div>
              </div>
            </div>

            <!-- Options Assurance -->
            <div class="mt-6 p-4 bg-yellow-50 rounded-lg border border-yellow-200">
              <h3 class="font-medium text-gray-800 mb-3">🏥 Options Assurance Maladie</h3>
              <div class="space-y-3">
                <label class="flex items-center">
                  <input type="checkbox" formControlName="assuranceMaladie" class="mr-3 h-5 w-5">
                  <span>أرغب في الانتفاع بنظام التغطية الاجتماعية - Assurance Maladie</span>
                </label>
                <label class="flex items-center">
                  <input type="checkbox" formControlName="capitalDeces" class="mr-3 h-5 w-5">
                  <span>نظام رأس المال عند الوفاة - Capital Décès</span>
                </label>
                @if (form.get('assuranceMaladie')?.value) {
                  <div class="ml-8">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Date d'effet assurance</label>
                    <input type="date" formControlName="dateEffetAssurance"
                           class="w-64 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                  </div>
                }
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-end gap-4">
            <a routerLink="/atct" 
               class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition">
              Annuler
            </a>
            <button type="submit" 
                    [disabled]="form.invalid || loading"
                    class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition disabled:opacity-50 disabled:cursor-not-allowed">
              @if (loading) {
                <span class="flex items-center">
                  <svg class="animate-spin h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                  </svg>
                  Enregistrement...
                </span>
              } @else {
                {{ isEditMode ? 'Mettre à jour' : 'Créer le dossier' }}
              }
            </button>
          </div>
        </form>
      </div>
    </app-main-layout>
  `
})
export class AtctFormComponent implements OnInit {
  form: FormGroup;
  loading = false;
  isEditMode = false;
  id: number | null = null;

  paysList = [
    { code: 784, nom: 'Émirats Arabes Unis' },
    { code: 682, nom: 'Arabie Saoudite' },
    { code: 634, nom: 'Qatar' },
    { code: 414, nom: 'Koweït' },
    { code: 48, nom: 'Bahreïn' },
    { code: 512, nom: 'Oman' },
    { code: 250, nom: 'France' },
    { code: 276, nom: 'Allemagne' },
    { code: 380, nom: 'Italie' },
    { code: 724, nom: 'Espagne' },
    { code: 826, nom: 'Royaume-Uni' },
    { code: 56, nom: 'Belgique' },
    { code: 756, nom: 'Suisse' },
    { code: 124, nom: 'Canada' },
    { code: 840, nom: 'États-Unis' },
    { code: 12, nom: 'Algérie' },
    { code: 434, nom: 'Libye' },
    { code: 504, nom: 'Maroc' }
  ];

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private atctService: AtctService
  ) {
    this.form = this.fb.group({
      numSecuSociale: [''],
      nomFr: ['', Validators.required],
      prenomFr: ['', Validators.required],
      nomAr: [''],
      prenomAr: [''],
      dateNaissance: [''],
      lieuNaissanceFr: [''],
      sexe: [''],
      nationalite: ['Tunisienne'],
      numCin: [''],
      numPasseport: [''],

      adresseTunisie: [''],
      codePostalTunisie: [''],
      villeTunisie: [''],

      adresseEtranger: [''],
      codePostalEtranger: [''],
      villeEtranger: [''],
      paysEtranger: [''],
      paysCode: [''],

      telephone: [''],
      email: ['', [Validators.required, Validators.email]],

      etablissementOrigine: [''],
      matriculeEmployeur: [''],
      cleEmployeur: [''],

      organismeEtranger: [''],
      missionPoste: [''],

      dateDebutDetachement: ['', Validators.required],
      dateFinDetachement: [''],
      dateRenouvellement: [''],

      salaireTunisie: [''],
      salaireEtranger: [''],
      deviseEtranger: [''],
      salaireConvertiTnd: [''],

      modePaiement: ['TRIMESTRIEL'],
      paiementAnticipe: [false],

      codeRegime: ['500'],

      assuranceMaladie: [false],
      capitalDeces: [false],
      dateEffetAssurance: ['']
    });
  }

  ngOnInit(): void {
    const idParam = this.route.snapshot.paramMap.get('id');
    if (idParam) {
      this.isEditMode = true;
      this.id = parseInt(idParam, 10);
      this.loadDossier();
    }

    // Update paysEtranger when paysCode changes
    this.form.get('paysCode')?.valueChanges.subscribe(code => {
      const pays = this.paysList.find(p => p.code === parseInt(code));
      if (pays) {
        this.form.patchValue({ paysEtranger: pays.nom });
      }
    });
  }

  loadDossier(): void {
    if (!this.id) return;
    this.loading = true;
    this.atctService.getById(this.id).subscribe({
      next: (dossier) => {
        this.form.patchValue(dossier);
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
        alert('Erreur lors du chargement du dossier');
      }
    });
  }

  onSubmit(): void {
    if (this.form.invalid) return;
    this.loading = true;

    const payload: DossierATCTRequest = this.form.value;

    if (this.isEditMode && this.id) {
      this.atctService.update(this.id, payload).subscribe({
        next: () => {
          this.loading = false;
          this.router.navigate(['/atct']);
        },
        error: (err) => {
          console.error('Erreur mise à jour:', err);
          this.loading = false;
          alert('Erreur lors de la mise à jour');
        }
      });
    } else {
      this.atctService.create(payload).subscribe({
        next: (result) => {
          this.loading = false;
          alert('Dossier créé avec succès ! ID: ' + result.id);
          this.router.navigate(['/atct']);
        },
        error: (err) => {
          console.error('Erreur création:', err);
          this.loading = false;
          alert('Erreur lors de la création: ' + (err.error?.error || err.message));
        }
      });
    }
  }
}
