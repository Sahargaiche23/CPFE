import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCT } from '../../../core/services/atct.service';
import { PdfService } from '../../../core/services/pdf.service';
import { GedService, GedDocument } from '../../../core/services/ged.service';
import { AiExtractionService, ExtractionResult } from '../../../core/services/ai-extraction.service';

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
                        'bg-orange-100 text-orange-800': dossier.statut === 'RECLAMATION',
                        'bg-blue-100 text-blue-800': dossier.statut === 'AFFILIE'
                      }">
                  {{ getStatutLabel(dossier.statut) }}
                </span>
                @if (dossier.statut === 'EN_ATTENTE' || dossier.statut === 'RECLAMATION') {
                  <a [routerLink]="['/atct/edit', dossier.id]"
                     class="px-4 py-2 text-white rounded-lg"
                     [class.bg-blue-600]="dossier.statut === 'EN_ATTENTE'" [class.hover:bg-blue-700]="dossier.statut === 'EN_ATTENTE'"
                     [class.bg-orange-600]="dossier.statut === 'RECLAMATION'" [class.hover:bg-orange-700]="dossier.statut === 'RECLAMATION'">
                    {{ dossier.statut === 'RECLAMATION' ? 'Corriger & Re-déposer' : 'Modifier' }}
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
                       'bg-orange-500 text-white': dossier.statut === 'RECLAMATION',
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
                  } @else if (dossier.statut === 'RECLAMATION') {
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"/>
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

          <!-- Documents du dossier -->
          <div class="mt-6 bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-pink-100 text-pink-600 rounded-full flex items-center justify-center mr-3 text-sm">📋</span>
              Documents du dossier / وثائق الملف
            </h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <!-- Décision d'Affectation (auto-généré du formulaire) -->
              <div class="border rounded-lg p-4 bg-blue-50 border-blue-200">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">📋</span>
                    <div>
                      <p class="font-medium text-blue-800">Décision d'Affectation</p>
                      <p class="text-xs text-blue-600">مقرر الإلحاق - Généré du formulaire</p>
                    </div>
                  </div>
                  <span class="px-2 py-0.5 bg-blue-200 text-blue-800 rounded text-xs">Auto ✓</span>
                </div>
                <div class="text-xs text-gray-600 space-y-1 mb-3 bg-white rounded p-3">
                  <p><strong>Coopérant:</strong> {{ dossier.nomCompletFr }}</p>
                  <p><strong>N° Sécu:</strong> {{ dossier.numSecuSociale || 'N/A' }}</p>
                  <p><strong>Établissement:</strong> {{ dossier.etablissementOrigine || 'N/A' }}</p>
                  <p><strong>Pays:</strong> {{ dossier.paysEtranger }}</p>
                  <p><strong>Période:</strong> {{ dossier.dateDebutDetachement | date:'dd/MM/yyyy' }} 
                    @if (dossier.dateFinDetachement) { - {{ dossier.dateFinDetachement | date:'dd/MM/yyyy' }} }
                  </p>
                  <p><strong>Régime:</strong> {{ dossier.codeRegime }}</p>
                </div>
                <div class="flex gap-2">
                  <button (click)="imprimerPdf()" class="flex-1 py-1.5 bg-blue-600 text-white text-xs rounded hover:bg-blue-700 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Télécharger PDF
                  </button>
                  <button (click)="previewDecision()" class="flex-1 py-1.5 border border-blue-600 text-blue-600 text-xs rounded hover:bg-blue-50 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                    </svg>
                    Aperçu
                  </button>
                </div>
              </div>

              <!-- Contrat de coopérant -->
              <div class="border rounded-lg p-4" [class.bg-green-50]="gedDocuments.contrat" [class.border-green-200]="gedDocuments.contrat" [class.bg-gray-50]="!gedDocuments.contrat" [class.border-gray-200]="!gedDocuments.contrat">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">📄</span>
                    <div>
                      <p class="font-medium" [class.text-green-800]="gedDocuments.contrat" [class.text-gray-600]="!gedDocuments.contrat">Contrat de Coopérant</p>
                      <p class="text-xs" [class.text-green-600]="gedDocuments.contrat" [class.text-gray-400]="!gedDocuments.contrat">عقد التعاون الفني</p>
                    </div>
                  </div>
                  <span *ngIf="gedDocuments.contrat" class="px-2 py-0.5 bg-green-200 text-green-800 rounded text-xs">Déposé ✓</span>
                  <span *ngIf="!gedDocuments.contrat && !gedLoaded" class="px-2 py-0.5 bg-yellow-200 text-yellow-800 rounded text-xs">Chargement...</span>
                  <span *ngIf="!gedDocuments.contrat && gedLoaded" class="px-2 py-0.5 bg-gray-200 text-gray-600 rounded text-xs">Non déposé</span>
                </div>
                @if (gedDocuments.contrat) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ gedDocuments.contrat.fichierNom }} ({{ formatSize(gedDocuments.contrat.fichierTaille) }})</p>
                  <div class="flex gap-2">
                    <button (click)="previewDocument('contrat')" class="flex-1 py-1.5 bg-green-600 text-white text-xs rounded hover:bg-green-700 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                      Aperçu
                    </button>
                    <button (click)="downloadDocument('contrat')" class="flex-1 py-1.5 border border-green-600 text-green-600 text-xs rounded hover:bg-green-50 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                      Télécharger
                    </button>
                  </div>
                  <button (click)="extractAiData('contrat', 'contrat')" [disabled]="extractingDoc === 'contrat'" class="w-full mt-2 py-1.5 bg-gradient-to-r from-purple-600 to-pink-500 text-white text-xs rounded hover:from-purple-700 hover:to-pink-600 flex items-center justify-center gap-1 disabled:opacity-50">
                    <span class="material-icons text-sm">{{ extractingDoc === 'contrat' ? 'hourglass_top' : 'auto_awesome' }}</span>
                    {{ extractingDoc === 'contrat' ? 'Extraction IA en cours...' : 'Extraire données IA' }}
                  </button>
                }
              </div>

              <!-- Attestation de salaire -->
              <div class="border rounded-lg p-4" [class.bg-green-50]="gedDocuments.attestationSalaire" [class.border-green-200]="gedDocuments.attestationSalaire" [class.bg-gray-50]="!gedDocuments.attestationSalaire" [class.border-gray-200]="!gedDocuments.attestationSalaire">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">💰</span>
                    <div>
                      <p class="font-medium" [class.text-green-800]="gedDocuments.attestationSalaire" [class.text-gray-600]="!gedDocuments.attestationSalaire">Attestation de Salaire</p>
                      <p class="text-xs" [class.text-green-600]="gedDocuments.attestationSalaire" [class.text-gray-400]="!gedDocuments.attestationSalaire">شهادة في الأجر</p>
                    </div>
                  </div>
                  <span *ngIf="gedDocuments.attestationSalaire" class="px-2 py-0.5 bg-green-200 text-green-800 rounded text-xs">Déposé ✓</span>
                  <span *ngIf="!gedDocuments.attestationSalaire && !gedLoaded" class="px-2 py-0.5 bg-yellow-200 text-yellow-800 rounded text-xs">Chargement...</span>
                  <span *ngIf="!gedDocuments.attestationSalaire && gedLoaded" class="px-2 py-0.5 bg-gray-200 text-gray-600 rounded text-xs">Non déposé</span>
                </div>
                @if (gedDocuments.attestationSalaire) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ gedDocuments.attestationSalaire.fichierNom }} ({{ formatSize(gedDocuments.attestationSalaire.fichierTaille) }})</p>
                  <div class="flex gap-2">
                    <button (click)="previewDocument('attestationSalaire')" class="flex-1 py-1.5 bg-green-600 text-white text-xs rounded hover:bg-green-700 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                      Aperçu
                    </button>
                    <button (click)="downloadDocument('attestationSalaire')" class="flex-1 py-1.5 border border-green-600 text-green-600 text-xs rounded hover:bg-green-50 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                      Télécharger
                    </button>
                  </div>
                  <button (click)="extractAiData('attestationSalaire', 'attestation_salaire')" [disabled]="extractingDoc === 'attestationSalaire'" class="w-full mt-2 py-1.5 bg-gradient-to-r from-purple-600 to-pink-500 text-white text-xs rounded hover:from-purple-700 hover:to-pink-600 flex items-center justify-center gap-1 disabled:opacity-50">
                    <span class="material-icons text-sm">{{ extractingDoc === 'attestationSalaire' ? 'hourglass_top' : 'auto_awesome' }}</span>
                    {{ extractingDoc === 'attestationSalaire' ? 'Extraction IA en cours...' : 'Extraire données IA' }}
                  </button>
                }
              </div>

              <!-- CIN -->
              <div class="border rounded-lg p-4" [class.bg-green-50]="gedDocuments.cin" [class.border-green-200]="gedDocuments.cin" [class.bg-gray-50]="!gedDocuments.cin" [class.border-gray-200]="!gedDocuments.cin">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">🪪</span>
                    <div>
                      <p class="font-medium" [class.text-green-800]="gedDocuments.cin" [class.text-gray-600]="!gedDocuments.cin">Carte d'Identité Nationale</p>
                      <p class="text-xs" [class.text-green-600]="gedDocuments.cin" [class.text-gray-400]="!gedDocuments.cin">بطاقة التعريف الوطنية</p>
                    </div>
                  </div>
                  <span *ngIf="gedDocuments.cin" class="px-2 py-0.5 bg-green-200 text-green-800 rounded text-xs">Déposé ✓</span>
                  <span *ngIf="!gedDocuments.cin && !gedLoaded" class="px-2 py-0.5 bg-yellow-200 text-yellow-800 rounded text-xs">Chargement...</span>
                  <span *ngIf="!gedDocuments.cin && gedLoaded" class="px-2 py-0.5 bg-gray-200 text-gray-600 rounded text-xs">Non déposé</span>
                </div>
                <p class="text-xs text-gray-500 mb-2">N° CIN: {{ dossier.numCin || 'N/A' }}</p>
                @if (gedDocuments.cin) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ gedDocuments.cin.fichierNom }} ({{ formatSize(gedDocuments.cin.fichierTaille) }})</p>
                  <div class="flex gap-2">
                    <button (click)="previewDocument('cin')" class="flex-1 py-1.5 bg-green-600 text-white text-xs rounded hover:bg-green-700 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                      Aperçu
                    </button>
                    <button (click)="downloadDocument('cin')" class="flex-1 py-1.5 border border-green-600 text-green-600 text-xs rounded hover:bg-green-50 flex items-center justify-center gap-1">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                      Télécharger
                    </button>
                  </div>
                  <button (click)="extractAiData('cin', 'cin')" [disabled]="extractingDoc === 'cin'" class="w-full mt-2 py-1.5 bg-gradient-to-r from-purple-600 to-pink-500 text-white text-xs rounded hover:from-purple-700 hover:to-pink-600 flex items-center justify-center gap-1 disabled:opacity-50">
                    <span class="material-icons text-sm">{{ extractingDoc === 'cin' ? 'hourglass_top' : 'auto_awesome' }}</span>
                    {{ extractingDoc === 'cin' ? 'Extraction IA en cours...' : 'Extraire données IA' }}
                  </button>
                }
              </div>
            </div>

            <!-- Autre Document -->
            @if (gedDocuments.autre) {
              <div class="mt-4 border rounded-lg p-4 bg-purple-50 border-purple-200">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">📎</span>
                    <div>
                      <p class="font-medium text-purple-800">Autre Document</p>
                      <p class="text-xs text-purple-600">وثيقة أخرى</p>
                    </div>
                  </div>
                  <span class="px-2 py-0.5 bg-purple-200 text-purple-800 rounded text-xs">Déposé ✓</span>
                </div>
                <p class="text-xs text-purple-700 bg-purple-100 rounded px-2 py-1 mb-2">📎 {{ gedDocuments.autre.fichierNom }} ({{ formatSize(gedDocuments.autre.fichierTaille) }})</p>
                <div class="flex gap-2">
                  <button (click)="previewDocument('autre')" class="flex-1 py-1.5 bg-purple-600 text-white text-xs rounded hover:bg-purple-700 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                    Aperçu
                  </button>
                  <button (click)="downloadDocument('autre')" class="flex-1 py-1.5 border border-purple-600 text-purple-600 text-xs rounded hover:bg-purple-50 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                    Télécharger
                  </button>
                </div>
              </div>
            }

            <!-- Attestation d'Affiliation -->
            @if (gedDocuments.attestationAffiliation) {
              <div class="mt-4 border rounded-lg p-4 bg-blue-50 border-blue-200">
                <div class="flex items-center justify-between mb-3">
                  <div class="flex items-center gap-2">
                    <span class="text-xl">📄</span>
                    <div>
                      <p class="font-medium text-blue-800">Attestation d'Affiliation</p>
                      <p class="text-xs text-blue-600">شهادة الإنخراط</p>
                    </div>
                  </div>
                  <span class="px-2 py-0.5 bg-blue-200 text-blue-800 rounded text-xs">Déposé ✓</span>
                </div>
                <p class="text-xs text-blue-700 bg-blue-100 rounded px-2 py-1 mb-2">📎 {{ gedDocuments.attestationAffiliation.fichierNom }} ({{ formatSize(gedDocuments.attestationAffiliation.fichierTaille) }})</p>
                <div class="flex gap-2">
                  <button (click)="previewDocument('attestationAffiliation')" class="flex-1 py-1.5 bg-blue-600 text-white text-xs rounded hover:bg-blue-700 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                    Aperçu
                  </button>
                  <button (click)="downloadDocument('attestationAffiliation')" class="flex-1 py-1.5 border border-blue-600 text-blue-600 text-xs rounded hover:bg-blue-50 flex items-center justify-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                    Télécharger
                  </button>
                </div>
                <button (click)="extractAiData('attestationAffiliation', 'attestation_affiliation')" [disabled]="extractingDoc === 'attestationAffiliation'" class="w-full mt-2 py-1.5 bg-gradient-to-r from-purple-600 to-pink-500 text-white text-xs rounded hover:from-purple-700 hover:to-pink-600 flex items-center justify-center gap-1 disabled:opacity-50">
                  <span class="material-icons text-sm">{{ extractingDoc === 'attestationAffiliation' ? 'hourglass_top' : 'auto_awesome' }}</span>
                  {{ extractingDoc === 'attestationAffiliation' ? 'Extraction IA en cours...' : 'Extraire données IA' }}
                </button>
              </div>
            }

            <!-- Aperçu Décision d'Affectation -->
            @if (showDecisionPreview) {
              <div class="mt-4 border-2 border-blue-300 rounded-lg overflow-hidden">
                <div class="bg-blue-600 text-white px-4 py-2 flex items-center justify-between">
                  <span class="font-medium text-sm">Aperçu - Décision d'Affectation / مقرر الإلحاق</span>
                  <button (click)="showDecisionPreview = false" class="text-white hover:text-blue-200">✕</button>
                </div>
                <div class="p-6 bg-white text-sm">
                  <div class="text-center mb-6">
                    <h3 class="text-lg font-bold text-gray-900">CNSS - Caisse Nationale de Sécurité Sociale</h3>
                    <p class="text-gray-600">Décision d'Affectation - Coopération Technique</p>
                    <p class="text-gray-500 text-xs mt-1">الصندوق الوطني للضمان الاجتماعي - مقرر الإلحاق</p>
                  </div>
                  
                  <div class="grid grid-cols-2 gap-x-8 gap-y-2 border-t pt-4">
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Nom complet:</span> <strong>{{ dossier.nomCompletFr }}</strong></div>
                    <div class="py-1 border-b border-gray-100 text-right" dir="rtl"><span class="text-gray-500">الاسم الكامل:</span> <strong>{{ dossier.nomCompletAr || '-' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">N° Sécu Sociale:</span> <strong>{{ dossier.numSecuSociale || 'N/A' }}</strong></div>
                    <div class="py-1 border-b border-gray-100 text-right" dir="rtl"><span class="text-gray-500">رقم الضمان:</span> <strong>{{ dossier.numSecuSociale || '-' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">N° CIN:</span> <strong>{{ dossier.numCin || 'N/A' }}</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Nationalité:</span> <strong>{{ dossier.nationalite || 'Tunisienne' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Établissement:</span> <strong>{{ dossier.etablissementOrigine || 'N/A' }}</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Organisme étranger:</span> <strong>{{ dossier.organismeEtranger || 'N/A' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Pays détachement:</span> <strong>{{ dossier.paysEtranger }}</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Mission/Poste:</span> <strong>{{ dossier.missionPoste || 'N/A' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Début détachement:</span> <strong>{{ dossier.dateDebutDetachement | date:'dd/MM/yyyy' }}</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Fin détachement:</span> <strong>{{ dossier.dateFinDetachement ? (dossier.dateFinDetachement | date:'dd/MM/yyyy') : 'En cours' }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Salaire TND:</span> <strong>{{ dossier.salaireTunisie | number:'1.3-3' }} TND</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Salaire étranger:</span> <strong>{{ dossier.salaireEtranger | number:'1.2-2' }} {{ dossier.deviseEtranger }}</strong></div>
                    
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Régime:</span> <strong>{{ dossier.codeRegime }}</strong></div>
                    <div class="py-1 border-b border-gray-100"><span class="text-gray-500">Mode paiement:</span> <strong>{{ getModePaiementLabel(dossier.modePaiement) }}</strong></div>
                  </div>

                  @if (dossier.assuranceMaladie || dossier.capitalDeces) {
                    <div class="mt-3 flex gap-2">
                      @if (dossier.assuranceMaladie) { <span class="px-2 py-1 bg-green-100 text-green-700 text-xs rounded">🏥 Assurance Maladie</span> }
                      @if (dossier.capitalDeces) { <span class="px-2 py-1 bg-blue-100 text-blue-700 text-xs rounded">💼 Capital Décès</span> }
                    </div>
                  }

                  <div class="mt-4 text-center text-xs text-gray-400 border-t pt-3">
                    Dossier N° {{ dossier.id }} • Créé le {{ dossier.dateCreation | date:'dd/MM/yyyy HH:mm' }} • CNSS - Système de Gestion
                  </div>
                </div>
              </div>
            }
          </div>

          @if (dossier.statut === 'RECLAMATION' && dossier.motifRejet) {
            <div class="mt-6 bg-orange-50 border border-orange-200 rounded-lg p-6">
              <h3 class="text-lg font-semibold text-orange-800 mb-2 flex items-center gap-2">
                <span>⚠️</span> Réclamation CNSS - Documents manquants
              </h3>
              <p class="text-orange-700 mb-3">{{ dossier.motifRejet }}</p>
              <a [routerLink]="['/atct/edit', dossier.id]"
                 class="inline-flex items-center gap-2 px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700">
                <span>📝</span> Corriger & Re-déposer les documents
              </a>
            </div>
          }

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

              @if (dossier.statut === 'VALIDE' || dossier.statut === 'AFFILIE') {
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

              @if ((dossier.statut === 'VALIDE' || dossier.statut === 'AFFILIE') && dossier.documentsDeposes && !dossier.affiliationId) {
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

      <!-- AI Extraction Result Modal -->
      @if (showExtractionModal && extractionResult) {
        <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[85vh] overflow-hidden">
            <!-- Header -->
            <div class="px-6 py-4 flex items-center justify-between" style="background: linear-gradient(135deg, #7C3AED, #EC4899);">
              <div class="flex items-center gap-3">
                <span class="material-icons text-white text-2xl">auto_awesome</span>
                <div>
                  <h2 class="text-lg font-bold text-white">Résultat Extraction IA</h2>
                  <p class="text-pink-200 text-xs">{{ extractionResult.document_titre || extractionResult.document_type }}</p>
                </div>
              </div>
              <button (click)="closeExtractionModal()" class="text-white hover:text-pink-200 text-2xl leading-none">&times;</button>
            </div>

            <div class="p-6 overflow-y-auto max-h-[60vh]">
              <!-- Confidence Bar -->
              <div class="mb-5">
                <div class="flex items-center justify-between mb-1">
                  <span class="text-sm font-semibold text-gray-700">Confiance</span>
                  <span class="text-sm font-bold" [ngClass]="{
                    'text-green-600': extractionResult.confidence >= 60,
                    'text-yellow-600': extractionResult.confidence >= 30 && extractionResult.confidence < 60,
                    'text-red-600': extractionResult.confidence < 30
                  }">{{ extractionResult.confidence | number:'1.0-0' }}%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2.5">
                  <div class="h-2.5 rounded-full transition-all" 
                       [style.width.%]="extractionResult.confidence"
                       [ngClass]="{
                         'bg-green-500': extractionResult.confidence >= 60,
                         'bg-yellow-500': extractionResult.confidence >= 30 && extractionResult.confidence < 60,
                         'bg-red-500': extractionResult.confidence < 30
                       }"></div>
                </div>
              </div>

              <!-- Warnings -->
              @if (extractionResult.warnings && extractionResult.warnings.length > 0) {
                <div class="mb-4 p-3 bg-amber-50 border border-amber-200 rounded-lg">
                  <div *ngFor="let warn of extractionResult.warnings" class="flex items-start gap-2 text-sm text-amber-700">
                    <span class="material-icons text-sm mt-0.5">warning</span>
                    <span>{{ warn }}</span>
                  </div>
                </div>
              }

              <!-- Error -->
              @if (extractionResult.error) {
                <div class="mb-4 p-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700 flex items-start gap-2">
                  <span class="material-icons text-sm mt-0.5">error</span>
                  <span>{{ extractionResult.error }}</span>
                </div>
              }

              <!-- Extracted Data -->
              @if (extractionResult.success && getExtractionFieldKeys().length > 0) {
                <h3 class="font-bold text-gray-800 mb-3 flex items-center gap-2">
                  <span class="material-icons text-purple-500">data_object</span>
                  Données extraites
                </h3>
                <div class="space-y-2 mb-5">
                  <div *ngFor="let key of getExtractionFieldKeys()" 
                       class="flex justify-between items-start p-3 bg-gray-50 rounded-lg border border-gray-100">
                    <span class="text-sm text-gray-500 font-medium">{{ getAiFieldLabel(key) }}</span>
                    <span class="text-sm font-semibold text-gray-800 text-right ml-4 max-w-[60%]">
                      {{ extractionResult.extracted_data[key] }}
                    </span>
                  </div>
                </div>
              } @else if (!extractionResult.error) {
                <div class="text-center py-6 text-gray-400">
                  <span class="material-icons text-4xl mb-2 block">search_off</span>
                  <p>Aucune donnée structurée extraite</p>
                </div>
              }

              <!-- Raw Text Preview -->
              @if (extractionResult.raw_text) {
                <details class="mt-4">
                  <summary class="cursor-pointer text-sm font-semibold text-gray-600 hover:text-gray-800 flex items-center gap-1">
                    <span class="material-icons text-sm">code</span>
                    Texte brut OCR (cliquer pour afficher)
                  </summary>
                  <pre class="mt-2 p-3 bg-gray-900 text-green-400 rounded-lg text-xs overflow-x-auto max-h-48 whitespace-pre-wrap font-mono">{{ extractionResult.raw_text }}</pre>
                </details>
              }
            </div>

            <!-- Footer -->
            <div class="px-6 py-4 bg-gray-50 border-t flex justify-end">
              <button (click)="closeExtractionModal()" 
                      class="px-6 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 text-sm font-medium">
                Fermer
              </button>
            </div>
          </div>
        </div>
      }
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
  showDecisionPreview = false;

  // Documents GED liés au dossier
  gedDocuments: {decisionAffectation?: GedDocument, contrat?: GedDocument, attestationSalaire?: GedDocument, cin?: GedDocument, autre?: GedDocument, attestationAffiliation?: GedDocument} = {};
  gedLoaded = false;

  // AI Extraction
  extractingDoc: string | null = null;
  extractionResult: ExtractionResult | null = null;
  showExtractionModal = false;

  constructor(
    private route: ActivatedRoute,
    private atctService: AtctService,
    private pdfService: PdfService,
    private gedService: GedService,
    private aiExtractionService: AiExtractionService
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
        this.loadGedDocuments(id);
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
      }
    });
  }

  loadGedDocuments(dossierId: number): void {
    // Chercher tous les dossiers parents (type=folder) par catégorie "Dossiers ATCT"
    this.gedService.getDocuments(undefined, 'Dossiers ATCT').subscribe({
      next: (docs) => {
        const idStr = String(dossierId);
        // Trouver TOUS les dossiers parents liés à ce dossier ATCT
        const folders = docs.filter(d =>
          d.fichierType === 'folder' &&
          ((d.tags || []).join(' ').includes(`dossier-${idStr}`) ||
           (d.description || '').includes(`N°${idStr}`))
        );
        if (folders.length > 0) {
          // Charger les sous-documents de tous les dossiers et les fusionner
          let allChildren: GedDocument[] = [];
          let loaded = 0;
          folders.forEach(folder => {
            this.gedService.getChildren(folder.id).subscribe({
              next: (children) => {
                allChildren = allChildren.concat(children);
                loaded++;
                if (loaded === folders.length) {
                  this.matchDocuments(allChildren);
                  this.gedLoaded = true;
                }
              },
              error: () => {
                loaded++;
                if (loaded === folders.length) {
                  this.matchDocuments(allChildren);
                  this.gedLoaded = true;
                }
              }
            });
          });
        } else {
          this.gedLoaded = true;
        }
      },
      error: () => { this.gedLoaded = true; }
    });
  }

  private matchDocuments(docs: GedDocument[]): void {
    docs.forEach(doc => {
      const titre = (doc.titre || '').toLowerCase();
      const tagsStr = (doc.tags || []).join(' ').toLowerCase();

      if (titre.includes('decision') || titre.includes('décision') || tagsStr.includes('decision-affectation')) {
        this.gedDocuments.decisionAffectation = doc;
      } else if (titre.includes('contrat') || tagsStr.includes('contrat')) {
        this.gedDocuments.contrat = doc;
      } else if (tagsStr.includes('attestation-affiliation') || (titre.includes('attestation') && titre.includes('affiliation'))) {
        this.gedDocuments.attestationAffiliation = doc;
      } else if (titre.includes('attestation') || titre.includes('salaire') || tagsStr.includes('attestation-salaire')) {
        this.gedDocuments.attestationSalaire = doc;
      } else if (titre.includes('cin') || tagsStr.includes('cin')) {
        this.gedDocuments.cin = doc;
      } else if (titre.includes('autre') || tagsStr.includes('autre-document')) {
        this.gedDocuments.autre = doc;
      }
    });
  }

  getStatutLabel(statut?: string): string {
    const labels: {[key: string]: string} = {
      'EN_ATTENTE': 'En attente de validation',
      'VALIDE': 'Validé',
      'REJETE': 'Rejeté',
      'RECLAMATION': 'Réclamation',
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

  // ==================== AI EXTRACTION ====================
  extractAiData(docKey: string, aiDocType: string): void {
    const gedDoc = (this.gedDocuments as any)[docKey] as GedDocument | undefined;
    if (!gedDoc) return;
    
    this.extractingDoc = docKey;
    this.aiExtractionService.extractFromDocument(gedDoc.id, aiDocType).subscribe({
      next: (result) => {
        this.extractionResult = result;
        this.showExtractionModal = true;
        this.extractingDoc = null;
      },
      error: (err) => {
        console.error('Erreur extraction IA:', err);
        this.extractionResult = {
          success: false,
          document_type: aiDocType,
          confidence: 0,
          extracted_data: {},
          raw_text: '',
          warnings: ['Erreur de connexion au service IA. Vérifiez que le service AI extraction est démarré sur le port 8090.'],
          error: err.message
        };
        this.showExtractionModal = true;
        this.extractingDoc = null;
      }
    });
  }

  getExtractionFieldKeys(): string[] {
    if (!this.extractionResult?.extracted_data) return [];
    return Object.keys(this.extractionResult.extracted_data);
  }

  getAiFieldLabel(field: string): string {
    return this.aiExtractionService.getFieldLabel(field);
  }

  closeExtractionModal(): void {
    this.showExtractionModal = false;
    this.extractionResult = null;
  }

  private getDecisionData() {
    const d = this.dossier!;
    return {
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
    };
  }

  previewDecision(): void {
    if (!this.dossier) return;
    this.pdfService.previewAtctFormulaire(this.getDecisionData());
  }

  imprimerPdf(): void {
    if (!this.dossier) return;
    this.loadingPdf = true;
    this.clearMessages();

    this.pdfService.generateAtctFormulaire(this.getDecisionData());

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

  previewDocument(docType: string): void {
    const gedDoc = (this.gedDocuments as any)[docType] as GedDocument | undefined;
    if (gedDoc) {
      this.gedService.downloadDocument(gedDoc.id).subscribe({
        next: (blob) => {
          const url = URL.createObjectURL(blob);
          window.open(url, '_blank');
        },
        error: () => alert('Erreur lors de l\'ouverture du document')
      });
    } else {
      alert('Document non trouvé dans la GED. Veuillez re-déposer le dossier.');
    }
  }

  downloadDocument(docType: string): void {
    const gedDoc = (this.gedDocuments as any)[docType] as GedDocument | undefined;
    if (gedDoc) {
      this.gedService.downloadDocument(gedDoc.id).subscribe({
        next: (blob) => {
          const url = URL.createObjectURL(blob);
          const a = document.createElement('a');
          a.href = url;
          a.download = gedDoc.fichierNom || `${docType}.pdf`;
          document.body.appendChild(a);
          a.click();
          document.body.removeChild(a);
          URL.revokeObjectURL(url);
        },
        error: () => alert('Erreur lors du téléchargement')
      });
    } else {
      alert('Document non trouvé dans la GED. Veuillez re-déposer le dossier.');
    }
  }

  formatSize(bytes: number): string {
    if (!bytes) return '0 B';
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
    return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
  }

  private clearMessages(): void {
    this.successMessage = '';
    this.errorMessage = '';
  }
}
