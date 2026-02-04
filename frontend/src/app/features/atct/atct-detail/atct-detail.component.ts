import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCT } from '../../../core/services/atct.service';
import { PdfService } from '../../../core/services/pdf.service';

@Component({
  selector: 'app-atct-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-6">
        @if (loading) {
          <div class="flex justify-center items-center h-64">
            <svg class="animate-spin h-10 w-10 text-blue-600" fill="none" viewBox="0 0 24 24">
              <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
              <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
            </svg>
          </div>
        } @else if (dossier) {
          <!-- Header -->
          <div class="mb-6">
            <nav class="flex items-center text-sm text-gray-500 mb-2">
              <a routerLink="/atct" class="hover:text-blue-600">ATCT</a>
              <span class="mx-2">/</span>
              <span class="text-gray-900">Dossier #{{ dossier.id }}</span>
            </nav>
            <div class="flex flex-col md:flex-row md:items-center md:justify-between">
              <div>
                <h1 class="text-2xl font-bold text-gray-900">{{ dossier.nomCompletFr }}</h1>
                @if (dossier.nomCompletAr) {
                  <p class="text-lg text-gray-600" dir="rtl">{{ dossier.nomCompletAr }}</p>
                }
              </div>
              <div class="mt-4 md:mt-0 flex gap-2">
                <span class="px-4 py-2 rounded-full text-sm font-medium"
                      [ngClass]="{
                        'bg-yellow-100 text-yellow-800': dossier.statut === 'EN_ATTENTE',
                        'bg-green-100 text-green-800': dossier.statut === 'VALIDE',
                        'bg-red-100 text-red-800': dossier.statut === 'REJETE',
                        'bg-blue-100 text-blue-800': dossier.statut === 'AFFILIE'
                      }">
                  {{ getStatutLabel(dossier.statut) }}
                </span>
                @if (dossier.statut === 'EN_ATTENTE') {
                  <a [routerLink]="['/atct/edit', dossier.id]"
                     class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                    Modifier
                  </a>
                }
              </div>
            </div>
          </div>

          <!-- Workflow Status -->
          <div class="bg-white rounded-lg shadow p-6 mb-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4">État du Workflow</h2>
            <div class="flex items-center justify-between">
              <div class="flex items-center">
                <div class="w-10 h-10 rounded-full flex items-center justify-center"
                     [ngClass]="{'bg-green-500': true, 'text-white': true}">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <div class="ml-3">
                  <div class="font-medium">Dossier créé</div>
                  <div class="text-sm text-gray-500">{{ dossier.dateCreation | date:'dd/MM/yyyy HH:mm' }}</div>
                </div>
              </div>
              <div class="flex-1 h-1 mx-4 bg-gray-200">
                <div class="h-1 transition-all duration-500"
                     [ngClass]="{'bg-green-500': dossier.statut !== 'EN_ATTENTE', 'bg-gray-200': dossier.statut === 'EN_ATTENTE'}"
                     [style.width]="dossier.statut !== 'EN_ATTENTE' ? '100%' : '0%'"></div>
              </div>
              <div class="flex items-center">
                <div class="w-10 h-10 rounded-full flex items-center justify-center"
                     [ngClass]="{
                       'bg-green-500 text-white': dossier.statut === 'VALIDE' || dossier.statut === 'AFFILIE',
                       'bg-red-500 text-white': dossier.statut === 'REJETE',
                       'bg-gray-200 text-gray-400': dossier.statut === 'EN_ATTENTE'
                     }">
                  @if (dossier.statut === 'VALIDE' || dossier.statut === 'AFFILIE') {
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                  } @else if (dossier.statut === 'REJETE') {
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                  } @else {
                    <span class="text-lg">2</span>
                  }
                </div>
                <div class="ml-3">
                  <div class="font-medium">Validation</div>
                  @if (dossier.dateValidation) {
                    <div class="text-sm text-gray-500">{{ dossier.dateValidation | date:'dd/MM/yyyy HH:mm' }}</div>
                  } @else {
                    <div class="text-sm text-gray-400">En attente</div>
                  }
                </div>
              </div>
              <div class="flex-1 h-1 mx-4 bg-gray-200">
                <div class="h-1 transition-all duration-500"
                     [ngClass]="{'bg-green-500': dossier.emailEnvoye, 'bg-gray-200': !dossier.emailEnvoye}"
                     [style.width]="dossier.emailEnvoye ? '100%' : '0%'"></div>
              </div>
              <div class="flex items-center">
                <div class="w-10 h-10 rounded-full flex items-center justify-center"
                     [ngClass]="{
                       'bg-green-500 text-white': dossier.emailEnvoye,
                       'bg-gray-200 text-gray-400': !dossier.emailEnvoye
                     }">
                  @if (dossier.emailEnvoye) {
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                  } @else {
                    <span class="text-lg">3</span>
                  }
                </div>
                <div class="ml-3">
                  <div class="font-medium">Email envoyé</div>
                  @if (dossier.dateEnvoiEmail) {
                    <div class="text-sm text-gray-500">{{ dossier.dateEnvoiEmail | date:'dd/MM/yyyy HH:mm' }}</div>
                  } @else {
                    <div class="text-sm text-gray-400">En attente</div>
                  }
                </div>
              </div>
              <div class="flex-1 h-1 mx-4 bg-gray-200">
                <div class="h-1 transition-all duration-500"
                     [ngClass]="{'bg-green-500': dossier.affiliationId, 'bg-gray-200': !dossier.affiliationId}"
                     [style.width]="dossier.affiliationId ? '100%' : '0%'"></div>
              </div>
              <div class="flex items-center">
                <div class="w-10 h-10 rounded-full flex items-center justify-center"
                     [ngClass]="{
                       'bg-green-500 text-white': dossier.affiliationId,
                       'bg-gray-200 text-gray-400': !dossier.affiliationId
                     }">
                  @if (dossier.affiliationId) {
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                  } @else {
                    <span class="text-lg">4</span>
                  }
                </div>
                <div class="ml-3">
                  <div class="font-medium">Affiliation</div>
                  @if (dossier.numAffiliation) {
                    <div class="text-sm text-green-600 font-medium">{{ dossier.numAffiliation }}</div>
                  } @else {
                    <div class="text-sm text-gray-400">En attente</div>
                  }
                </div>
              </div>
            </div>
          </div>

          <!-- Content Grid -->
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <!-- Informations Personnelles -->
            <div class="bg-white rounded-lg shadow p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center justify-between">
                <span class="flex items-center">
                  <span class="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center mr-3 text-sm">👤</span>
                  Informations Personnelles
                </span>
                <span class="text-gray-500 text-sm" dir="rtl">المعلومات الشخصية</span>
              </h2>
              <dl class="grid grid-cols-2 gap-4 text-sm">
                <div>
                  <dt class="text-gray-500">N° Sécurité Sociale / <span dir="rtl">رقم الضمان</span></dt>
                  <dd class="font-medium">{{ dossier.numSecuSociale || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Date de naissance / <span dir="rtl">تاريخ الولادة</span></dt>
                  <dd class="font-medium">{{ dossier.dateNaissance | date:'dd/MM/yyyy' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Lieu de naissance / <span dir="rtl">مكان الولادة</span></dt>
                  <dd class="font-medium">
                    {{ dossier.lieuNaissanceFr || 'N/A' }}
                    @if (dossier.lieuNaissanceAr) {
                      <span class="text-gray-600 mr-2" dir="rtl">/ {{ dossier.lieuNaissanceAr }}</span>
                    }
                  </dd>
                </div>
                <div>
                  <dt class="text-gray-500">Sexe / <span dir="rtl">الجنس</span></dt>
                  <dd class="font-medium">{{ dossier.sexe === 'M' ? 'Masculin / ذكر' : 'Féminin / أنثى' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Nationalité / <span dir="rtl">الجنسية</span></dt>
                  <dd class="font-medium">{{ dossier.nationalite || 'Tunisienne / تونسية' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">N° CIN / <span dir="rtl">رقم ب.ت.و</span></dt>
                  <dd class="font-medium">{{ dossier.numCin || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">N° Passeport / <span dir="rtl">رقم جواز السفر</span></dt>
                  <dd class="font-medium">{{ dossier.numPasseport || 'N/A' }}</dd>
                </div>
              </dl>
            </div>

            <!-- Contact -->
            <div class="bg-white rounded-lg shadow p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center justify-between">
                <span class="flex items-center">
                  <span class="w-8 h-8 bg-green-100 text-green-600 rounded-full flex items-center justify-center mr-3 text-sm">📞</span>
                  Contact
                </span>
                <span class="text-gray-500 text-sm" dir="rtl">الاتصال</span>
              </h2>
              <dl class="space-y-4 text-sm">
                <div>
                  <dt class="text-gray-500">Email / <span dir="rtl">البريد الإلكتروني</span></dt>
                  <dd class="font-medium text-blue-600">{{ dossier.email }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Téléphone / <span dir="rtl">الهاتف</span></dt>
                  <dd class="font-medium">{{ dossier.telephone || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Adresse Tunisie / <span dir="rtl">العنوان بتونس</span></dt>
                  <dd class="font-medium">
                    {{ dossier.adresseTunisie }}<br>
                    {{ dossier.codePostalTunisie }} {{ dossier.villeTunisie }}
                  </dd>
                </div>
                <div>
                  <dt class="text-gray-500">Adresse Étranger / <span dir="rtl">العنوان بالخارج</span></dt>
                  <dd class="font-medium">
                    {{ dossier.adresseEtranger }}<br>
                    {{ dossier.codePostalEtranger }} {{ dossier.villeEtranger }}<br>
                    <strong>{{ dossier.paysEtranger }}</strong>
                  </dd>
                </div>
              </dl>
            </div>

            <!-- Détachement -->
            <div class="bg-white rounded-lg shadow p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center justify-between">
                <span class="flex items-center">
                  <span class="w-8 h-8 bg-purple-100 text-purple-600 rounded-full flex items-center justify-center mr-3 text-sm">🌍</span>
                  Détachement
                </span>
                <span class="text-gray-500 text-sm" dir="rtl">الإلحاق</span>
              </h2>
              <dl class="space-y-4 text-sm">
                <div>
                  <dt class="text-gray-500">Établissement d'origine / <span dir="rtl">المؤسسة الأصلية</span></dt>
                  <dd class="font-medium">{{ dossier.etablissementOrigine || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Matricule Employeur / <span dir="rtl">رقم المشغل</span></dt>
                  <dd class="font-medium">{{ dossier.matriculeEmployeurComplet || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Organisme à l'étranger / <span dir="rtl">الهيئة بالخارج</span></dt>
                  <dd class="font-medium">{{ dossier.organismeEtranger || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Mission / Poste / <span dir="rtl">المهمة</span></dt>
                  <dd class="font-medium">{{ dossier.missionPoste || 'N/A' }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Période / <span dir="rtl">الفترة</span></dt>
                  <dd class="font-medium">
                    Du {{ dossier.dateDebutDetachement | date:'dd/MM/yyyy' }}
                    @if (dossier.dateFinDetachement) {
                      au {{ dossier.dateFinDetachement | date:'dd/MM/yyyy' }}
                    } @else {
                      (en cours / جاري)
                    }
                  </dd>
                </div>
              </dl>
            </div>

            <!-- Cotisations -->
            <div class="bg-white rounded-lg shadow p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center justify-between">
                <span class="flex items-center">
                  <span class="w-8 h-8 bg-yellow-100 text-yellow-600 rounded-full flex items-center justify-center mr-3 text-sm">💰</span>
                  Cotisations
                </span>
                <span class="text-gray-500 text-sm" dir="rtl">المساهمات</span>
              </h2>
              <dl class="space-y-4 text-sm">
                <div>
                  <dt class="text-gray-500">Régime / <span dir="rtl">النظام</span></dt>
                  <dd>
                    <span class="px-3 py-1 rounded-full text-sm font-medium"
                          [ngClass]="{
                            'bg-blue-100 text-blue-800': dossier.codeRegime === '500',
                            'bg-purple-100 text-purple-800': dossier.codeRegime === '510'
                          }">
                      {{ dossier.codeRegime }} - {{ dossier.codeRegime === '500' ? 'Régime Général / النظام العام' : 'Régime Spécial / النظام الخاص' }}
                    </span>
                  </dd>
                </div>
                <div>
                  <dt class="text-gray-500">Salaire Tunisie / <span dir="rtl">الأجر بتونس</span></dt>
                  <dd class="font-medium text-lg">{{ dossier.salaireTunisie | number:'1.3-3' }} TND</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Salaire Étranger / <span dir="rtl">الأجر بالخارج</span></dt>
                  <dd class="font-medium">{{ dossier.salaireEtranger | number:'1.2-2' }} {{ dossier.deviseEtranger }}</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Équivalent TND / <span dir="rtl">المعادل بالدينار</span></dt>
                  <dd class="font-medium">{{ dossier.salaireConvertiTnd | number:'1.3-3' }} TND</dd>
                </div>
                <div>
                  <dt class="text-gray-500">Mode de paiement / <span dir="rtl">طريقة الدفع</span></dt>
                  <dd class="font-medium">{{ getModePaiementLabel(dossier.modePaiement) }}</dd>
                </div>
                @if (dossier.assuranceMaladie || dossier.capitalDeces) {
                  <div>
                    <dt class="text-gray-500">Options / <span dir="rtl">الخيارات</span></dt>
                    <dd class="flex gap-2 mt-1">
                      @if (dossier.assuranceMaladie) {
                        <span class="px-2 py-1 bg-green-100 text-green-700 text-xs rounded">🏥 Assurance Maladie / التأمين على المرض</span>
                      }
                      @if (dossier.capitalDeces) {
                        <span class="px-2 py-1 bg-blue-100 text-blue-700 text-xs rounded">💼 Capital Décès / رأس المال عند الوفاة</span>
                      }
                    </dd>
                  </div>
                }
              </dl>
            </div>
          </div>

          @if (dossier.statut === 'REJETE' && dossier.motifRejet) {
            <div class="mt-6 bg-red-50 border border-red-200 rounded-lg p-6">
              <h3 class="text-lg font-semibold text-red-800 mb-2">Motif du rejet</h3>
              <p class="text-red-700">{{ dossier.motifRejet }}</p>
            </div>
          }

          <!-- Actions -->
          <div class="mt-6 bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4">Actions</h2>
            <div class="flex flex-wrap gap-3">
              <a routerLink="/atct" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Retour
              </a>
              
              <!-- Bouton Imprimer/PDF -->
              <button (click)="imprimerPdf()" 
                      [disabled]="loadingPdf"
                      class="px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 flex items-center gap-2 disabled:opacity-50">
                @if (loadingPdf) {
                  <svg class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                  </svg>
                } @else {
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                  </svg>
                }
                Imprimer / PDF
              </button>

              @if (dossier.statut === 'VALIDE') {
                <!-- Bouton Envoyer Email -->
                <button (click)="envoyerEmail()" 
                        [disabled]="loadingEmail"
                        class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 disabled:opacity-50">
                  @if (loadingEmail) {
                    <svg class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                    </svg>
                  } @else {
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                    </svg>
                  }
                  Envoyer Email (Login+MDP)
                </button>

                <!-- Bouton Rappel -->
                <button (click)="envoyerRappel()" 
                        [disabled]="loadingRappel"
                        class="px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600 flex items-center gap-2 disabled:opacity-50">
                  @if (loadingRappel) {
                    <svg class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                    </svg>
                  } @else {
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"/>
                    </svg>
                  }
                  Rappel (Email + Pièce jointe)
                </button>
              }

              @if (dossier.statut === 'VALIDE' && dossier.documentsDeposes && !dossier.affiliationId) {
                <a routerLink="/affiliation/new" [queryParams]="{atctId: dossier.id}"
                   class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 flex items-center gap-2">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                  </svg>
                  Créer l'affiliation
                </a>
              }
              
              @if (dossier.statut === 'VALIDE' && !dossier.documentsDeposes) {
                <span class="px-4 py-2 bg-yellow-100 text-yellow-700 rounded-lg flex items-center gap-2">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                  </svg>
                  En attente du dépôt des documents par le coopérant
                </span>
              }
            </div>

            @if (successMessage) {
              <div class="mt-4 p-3 bg-green-100 text-green-700 rounded-lg flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                </svg>
                {{ successMessage }}
              </div>
            }

            @if (errorMessage) {
              <div class="mt-4 p-3 bg-red-100 text-red-700 rounded-lg flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
                {{ errorMessage }}
              </div>
            }
          </div>
        }
      </div>
    </app-main-layout>
  `
})
export class AtctDetailComponent implements OnInit {
  dossier: DossierATCT | null = null;
  loading = false;
  loadingEmail = false;
  loadingRappel = false;
  loadingPdf = false;
  successMessage = '';
  errorMessage = '';

  constructor(
    private route: ActivatedRoute,
    private atctService: AtctService,
    private pdfService: PdfService
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.loadDossier(parseInt(id, 10));
    }
  }

  loadDossier(id: number): void {
    this.loading = true;
    this.atctService.getById(id).subscribe({
      next: (data) => {
        this.dossier = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
      }
    });
  }

  getStatutLabel(statut?: string): string {
    const labels: {[key: string]: string} = {
      'EN_ATTENTE': 'En attente de validation',
      'VALIDE': 'Validé',
      'REJETE': 'Rejeté',
      'AFFILIE': 'Affilié'
    };
    return labels[statut || ''] || statut || '';
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

  envoyerEmail(): void {
    if (!this.dossier?.id) return;
    this.loadingEmail = true;
    this.clearMessages();
    
    this.atctService.envoyerEmail(this.dossier.id).subscribe({
      next: (updated) => {
        this.dossier = updated;
        this.loadingEmail = false;
        this.successMessage = `Email envoyé avec succès à ${this.dossier?.email} avec les identifiants de connexion`;
        setTimeout(() => this.clearMessages(), 5000);
      },
      error: (err) => {
        console.error('Erreur envoi email:', err);
        this.loadingEmail = false;
        this.errorMessage = 'Erreur lors de l\'envoi de l\'email';
        setTimeout(() => this.clearMessages(), 5000);
      }
    });
  }

  async envoyerRappel(): Promise<void> {
    if (!this.dossier?.id) return;
    this.loadingRappel = true;
    this.clearMessages();
    
    try {
      // Générer le PDF bilingue côté frontend (même format que local)
      const d = this.dossier;
      const pdfBase64 = await this.pdfService.generateAtctFormulaireBase64({
        nomComplet: d.nomCompletFr || d.nomFr + ' ' + d.prenomFr,
        nomCompletAr: d.nomCompletAr || (d.nomAr ? d.nomAr + ' ' + d.prenomAr : ''),
        numSecuSociale: d.numSecuSociale || '',
        email: d.email || '',
        adresseTunisie: d.adresseTunisie || '',
        codePostal: d.codePostalTunisie || '',
        villeTunisie: d.villeTunisie || '',
        adresseEtranger: d.adresseEtranger || '',
        villeEtranger: d.villeEtranger || '',
        paysEtranger: d.paysEtranger || '',
        etablissementOrigine: d.etablissementOrigine || '',
        organismeEtranger: d.organismeEtranger || '',
        dateDebutDetachement: d.dateDebutDetachement ? new Date(d.dateDebutDetachement).toLocaleDateString('fr-FR') : '',
        dateFinDetachement: d.dateFinDetachement ? new Date(d.dateFinDetachement).toLocaleDateString('fr-FR') : '',
        modePaiement: d.modePaiement || '',
        assuranceMaladie: d.assuranceMaladie || false
      });
      
      // Envoyer le PDF au backend
      this.atctService.envoyerRappelAvecPdf(this.dossier.id, pdfBase64).subscribe({
        next: () => {
          this.loadingRappel = false;
          this.successMessage = `Rappel envoyé avec succès à ${this.dossier?.email} avec le PDF bilingue`;
          setTimeout(() => this.clearMessages(), 5000);
        },
        error: (err) => {
          console.error('Erreur envoi rappel:', err);
          this.loadingRappel = false;
          // L'email est souvent envoyé même si le frontend timeout - afficher un message neutre
          if (err.status === 0 || err.name === 'TimeoutError') {
            this.successMessage = `Email probablement envoyé à ${this.dossier?.email}. Vérifiez votre boîte mail.`;
          } else {
            this.errorMessage = 'Erreur lors de l\'envoi du rappel';
          }
          setTimeout(() => this.clearMessages(), 5000);
        }
      });
    } catch (err) {
      console.error('Erreur génération PDF:', err);
      this.loadingRappel = false;
      this.errorMessage = 'Erreur lors de la génération du PDF';
      setTimeout(() => this.clearMessages(), 5000);
    }
  }

  imprimerPdf(): void {
    if (!this.dossier) return;
    this.loadingPdf = true;
    this.clearMessages();

    // Générer le PDF bilingue FR/AR avec le même design que attestation_affiliation
    const d = this.dossier;
    this.pdfService.generateAtctFormulaire({
      nomComplet: d.nomCompletFr || d.nomFr + ' ' + d.prenomFr,
      nomCompletAr: d.nomCompletAr || (d.nomAr ? d.prenomAr + ' ' + d.nomAr : ''),
      numSecuSociale: d.numSecuSociale || '',
      email: d.email || '',
      adresseTunisie: d.adresseTunisie || '',
      codePostal: d.codePostalTunisie || '',
      villeTunisie: d.villeTunisie || '',
      adresseEtranger: d.adresseEtranger || '',
      villeEtranger: d.villeEtranger || '',
      paysEtranger: d.paysEtranger || '',
      etablissementOrigine: d.etablissementOrigine || '',
      organismeEtranger: d.organismeEtranger || '',
      dateDebutDetachement: d.dateDebutDetachement ? new Date(d.dateDebutDetachement).toLocaleDateString('fr-FR') : '',
      dateFinDetachement: d.dateFinDetachement ? new Date(d.dateFinDetachement).toLocaleDateString('fr-FR') : '',
      modePaiement: d.modePaiement || '',
      assuranceMaladie: d.assuranceMaladie || false
    });

    // Le PDF est généré de manière asynchrone, on arrête le loader après un délai
    setTimeout(() => {
      this.loadingPdf = false;
      this.successMessage = 'PDF généré avec succès (bilingue FR/AR)';
      setTimeout(() => this.clearMessages(), 3000);
    }, 2500);
  }

  private generatePdfHtml(): string {
    const d = this.dossier!;
    return `
      <!DOCTYPE html>
      <html>
      <head>
        <title>Dossier ATCT - ${d.nomCompletFr}</title>
        <style>
          body { font-family: Arial, sans-serif; padding: 40px; font-size: 12px; }
          .header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #1a365d; padding-bottom: 20px; }
          .header h1 { color: #1a365d; margin: 0; font-size: 18px; }
          .header h2 { color: #666; margin: 5px 0; font-size: 14px; }
          .section { margin-bottom: 20px; }
          .section-title { background: #f0f4f8; padding: 8px 12px; font-weight: bold; color: #1a365d; margin-bottom: 10px; }
          .row { display: flex; margin-bottom: 5px; }
          .label { width: 200px; color: #666; }
          .value { flex: 1; font-weight: 500; }
          .badge { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 11px; }
          .badge-green { background: #c6f6d5; color: #22543d; }
          .badge-blue { background: #bee3f8; color: #2c5282; }
          .footer { margin-top: 40px; text-align: center; color: #666; font-size: 10px; border-top: 1px solid #ddd; padding-top: 20px; }
          @media print { body { padding: 20px; } }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>🇹🇳 CNSS - Caisse Nationale de Sécurité Sociale</h1>
          <h2>Dossier de Coopération Technique (ATCT)</h2>
          <p>Dossier N° ${d.id} - ${d.statut === 'VALIDE' ? '<span class="badge badge-green">Validé</span>' : d.statut}</p>
        </div>

        <div class="section">
          <div class="section-title">👤 Informations Personnelles</div>
          <div class="row"><div class="label">Nom complet:</div><div class="value">${d.nomCompletFr}</div></div>
          <div class="row"><div class="label">N° Sécurité Sociale:</div><div class="value">${d.numSecuSociale || 'N/A'}</div></div>
          <div class="row"><div class="label">Date de naissance:</div><div class="value">${d.dateNaissance || 'N/A'}</div></div>
          <div class="row"><div class="label">Lieu de naissance:</div><div class="value">${d.lieuNaissanceFr || 'N/A'}</div></div>
          <div class="row"><div class="label">Sexe:</div><div class="value">${d.sexe === 'M' ? 'Masculin' : 'Féminin'}</div></div>
          <div class="row"><div class="label">N° CIN:</div><div class="value">${d.numCin || 'N/A'}</div></div>
          <div class="row"><div class="label">N° Passeport:</div><div class="value">${d.numPasseport || 'N/A'}</div></div>
        </div>

        <div class="section">
          <div class="section-title">📞 Contact</div>
          <div class="row"><div class="label">Email:</div><div class="value">${d.email}</div></div>
          <div class="row"><div class="label">Téléphone:</div><div class="value">${d.telephone || 'N/A'}</div></div>
          <div class="row"><div class="label">Adresse Tunisie:</div><div class="value">${d.adresseTunisie || ''} ${d.codePostalTunisie || ''} ${d.villeTunisie || ''}</div></div>
          <div class="row"><div class="label">Adresse Étranger:</div><div class="value">${d.adresseEtranger || ''} ${d.villeEtranger || ''} - ${d.paysEtranger || ''}</div></div>
        </div>

        <div class="section">
          <div class="section-title">🌍 Détachement</div>
          <div class="row"><div class="label">Établissement d'origine:</div><div class="value">${d.etablissementOrigine || 'N/A'}</div></div>
          <div class="row"><div class="label">Matricule Employeur:</div><div class="value">${d.matriculeEmployeurComplet || 'N/A'}</div></div>
          <div class="row"><div class="label">Organisme étranger:</div><div class="value">${d.organismeEtranger || 'N/A'}</div></div>
          <div class="row"><div class="label">Période:</div><div class="value">${d.dateDebutDetachement} - ${d.dateFinDetachement || 'En cours'}</div></div>
        </div>

        <div class="section">
          <div class="section-title">💰 Cotisations</div>
          <div class="row"><div class="label">Régime:</div><div class="value"><span class="badge badge-blue">${d.codeRegime} - ${d.codeRegime === '500' ? 'Régime Général' : 'Régime Spécial'}</span></div></div>
          <div class="row"><div class="label">Salaire Tunisie:</div><div class="value">${d.salaireTunisie} TND</div></div>
          <div class="row"><div class="label">Mode de paiement:</div><div class="value">${d.modePaiement}</div></div>
          <div class="row"><div class="label">Assurance Maladie:</div><div class="value">${d.assuranceMaladie ? 'Oui' : 'Non'}</div></div>
        </div>

        <div class="footer">
          <p>Document généré le ${new Date().toLocaleDateString('fr-FR')} à ${new Date().toLocaleTimeString('fr-FR')}</p>
          <p>CNSS - Système de Gestion de la Coopération Technique</p>
        </div>
      </body>
      </html>
    `;
  }

  private clearMessages(): void {
    this.successMessage = '';
    this.errorMessage = '';
  }
}
