import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AtctService, DossierATCTRequest } from '../../../core/services/atct.service';
import { GedService, GedDocument } from '../../../core/services/ged.service';
import { PdfService } from '../../../core/services/pdf.service';
import { lastValueFrom } from 'rxjs';

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
            {{ isReclamation ? 'Corriger le dossier - Réclamation CNSS' : (isEditMode ? 'Modifier le dossier' : 'Créer un nouveau dossier ATCT') }}
          </h1>
          <p class="text-gray-600 mt-1">تسوية فترات إلحاق في إطار التعاون الفني</p>
        </div>

        @if (isReclamation) {
          <div class="mb-6 bg-orange-50 border-l-4 border-orange-500 rounded-lg p-4">
            <div class="flex items-start gap-3">
              <span class="text-2xl">⚠️</span>
              <div>
                <h3 class="font-semibold text-orange-800 text-lg">Réclamation CNSS - Documents manquants</h3>
                <p class="text-orange-700 mt-1">{{ motifReclamation }}</p>
                <p class="text-orange-600 text-sm mt-2">Veuillez corriger les informations et/ou déposer les documents manquants, puis re-déposer le dossier.</p>
              </div>
            </div>
          </div>
        }

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

          <!-- Section: Documents Requis -->
          <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
              <span class="w-8 h-8 bg-red-100 text-red-600 rounded-full flex items-center justify-center mr-3 text-sm">8</span>
              Documents Requis / الوثائق المطلوبة
            </h2>
            <p class="text-sm text-gray-600 mb-4">Ces documents sont obligatoires pour le dépôt à la CNSS</p>

            <!-- Décision d'Affectation - Générée automatiquement -->
            <div class="border-2 border-blue-300 bg-blue-50 rounded-lg p-4 mb-4">
              <div class="flex items-center justify-between">
                <div class="flex items-center gap-3">
                  <span class="text-2xl">📋</span>
                  <div>
                    <p class="font-medium text-blue-800">Décision d'Affectation / مقرر الإلحاق</p>
                    <p class="text-xs text-blue-600">Générée automatiquement à partir du formulaire rempli</p>
                  </div>
                </div>
                <span class="px-3 py-1 bg-blue-200 text-blue-800 rounded-full text-xs font-semibold">Auto-généré ✓</span>
              </div>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <!-- Contrat de coopérant -->
              <div class="border-2 border-dashed rounded-lg p-4" 
                   [class.border-green-500]="documents.contrat || existingDocs.contrat"
                   [class.bg-green-50]="documents.contrat || existingDocs.contrat"
                   [class.border-gray-300]="!documents.contrat && !existingDocs.contrat">
                <div class="flex items-center justify-between mb-2">
                  <div class="flex items-center gap-2">
                    <span class="text-2xl">📄</span>
                    <div>
                      <p class="font-medium text-gray-800">Contrat de Coopérant</p>
                      <p class="text-xs text-gray-500">عقد التعاون الفني</p>
                    </div>
                  </div>
                  <span *ngIf="documents.contrat || existingDocs.contrat" class="text-green-600 text-xl">✓</span>
                </div>
                @if (existingDocs.contrat && !documents.contrat) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ existingDocs.contrat.fichierNom }} ({{ formatSize(existingDocs.contrat.fichierTaille) }}) - Déjà déposé</p>
                }
                <input type="file" #contratInput (change)="onDocumentSelected($event, 'contrat')" accept=".pdf,.jpg,.png" class="hidden">
                <button type="button" (click)="contratInput.click()" 
                        class="w-full py-2 border border-gray-300 rounded text-sm hover:bg-gray-50"
                        [class.bg-green-100]="documents.contrat">
                  {{ documents.contrat ? documents.contrat.name : (existingDocs.contrat ? 'Remplacer le fichier' : 'Sélectionner le fichier') }}
                </button>
              </div>

              <!-- Attestation de salaire -->
              <div class="border-2 border-dashed rounded-lg p-4"
                   [class.border-green-500]="documents.attestationSalaire || existingDocs.attestationSalaire"
                   [class.bg-green-50]="documents.attestationSalaire || existingDocs.attestationSalaire"
                   [class.border-gray-300]="!documents.attestationSalaire && !existingDocs.attestationSalaire">
                <div class="flex items-center justify-between mb-2">
                  <div class="flex items-center gap-2">
                    <span class="text-2xl">💰</span>
                    <div>
                      <p class="font-medium text-gray-800">Attestation de Salaire</p>
                      <p class="text-xs text-gray-500">شهادة في الأجر</p>
                    </div>
                  </div>
                  <span *ngIf="documents.attestationSalaire || existingDocs.attestationSalaire" class="text-green-600 text-xl">✓</span>
                </div>
                @if (existingDocs.attestationSalaire && !documents.attestationSalaire) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ existingDocs.attestationSalaire.fichierNom }} ({{ formatSize(existingDocs.attestationSalaire.fichierTaille) }}) - Déjà déposé</p>
                }
                <input type="file" #salaireInput (change)="onDocumentSelected($event, 'attestationSalaire')" accept=".pdf,.jpg,.png" class="hidden">
                <button type="button" (click)="salaireInput.click()"
                        class="w-full py-2 border border-gray-300 rounded text-sm hover:bg-gray-50"
                        [class.bg-green-100]="documents.attestationSalaire">
                  {{ documents.attestationSalaire ? documents.attestationSalaire.name : (existingDocs.attestationSalaire ? 'Remplacer le fichier' : 'Sélectionner le fichier') }}
                </button>
              </div>

              <!-- CIN -->
              <div class="border-2 border-dashed rounded-lg p-4"
                   [class.border-green-500]="documents.cin || existingDocs.cin"
                   [class.bg-green-50]="documents.cin || existingDocs.cin"
                   [class.border-gray-300]="!documents.cin && !existingDocs.cin">
                <div class="flex items-center justify-between mb-2">
                  <div class="flex items-center gap-2">
                    <span class="text-2xl">🪪</span>
                    <div>
                      <p class="font-medium text-gray-800">Carte d'Identité Nationale</p>
                      <p class="text-xs text-gray-500">بطاقة التعريف الوطنية</p>
                    </div>
                  </div>
                  <span *ngIf="documents.cin || existingDocs.cin" class="text-green-600 text-xl">✓</span>
                </div>
                @if (existingDocs.cin && !documents.cin) {
                  <p class="text-xs text-green-700 bg-green-100 rounded px-2 py-1 mb-2">📎 {{ existingDocs.cin.fichierNom }} ({{ formatSize(existingDocs.cin.fichierTaille) }}) - Déjà déposé</p>
                }
                <input type="file" #cinInput (change)="onDocumentSelected($event, 'cin')" accept=".pdf,.jpg,.png" class="hidden">
                <button type="button" (click)="cinInput.click()"
                        class="w-full py-2 border border-gray-300 rounded text-sm hover:bg-gray-50"
                        [class.bg-green-100]="documents.cin">
                  {{ documents.cin ? documents.cin.name : (existingDocs.cin ? 'Remplacer le fichier' : 'Sélectionner le fichier') }}
                </button>
              </div>

              <!-- Autre document -->
              <div class="border-2 border-dashed rounded-lg p-4"
                   [class.border-purple-500]="documents.autre"
                   [class.bg-purple-50]="documents.autre"
                   [class.border-gray-300]="!documents.autre">
                <div class="flex items-center justify-between mb-2">
                  <div class="flex items-center gap-2">
                    <span class="text-2xl">📎</span>
                    <div>
                      <p class="font-medium text-gray-800">Autre Document</p>
                      <p class="text-xs text-gray-500">وثيقة أخرى (اختياري)</p>
                    </div>
                  </div>
                  <span *ngIf="documents.autre" class="text-purple-600 text-xl">✓</span>
                </div>
                <input type="file" #autreInput (change)="onDocumentSelected($event, 'autre')" accept=".pdf,.jpg,.png,.doc,.docx" class="hidden">
                <button type="button" (click)="autreInput.click()"
                        class="w-full py-2 border border-gray-300 rounded text-sm hover:bg-gray-50"
                        [class.bg-purple-100]="documents.autre">
                  {{ documents.autre ? documents.autre.name : 'Sélectionner le fichier (optionnel)' }}
                </button>
              </div>
            </div>

            <!-- Résumé documents -->
            <div class="mt-4 p-3 rounded-lg" 
                 [class.bg-green-100]="allDocumentsUploaded() || isReclamation"
                 [class.bg-yellow-100]="!allDocumentsUploaded() && !isReclamation">
              <p class="text-sm font-medium" 
                 [class.text-green-800]="allDocumentsUploaded() || isReclamation" 
                 [class.text-yellow-800]="!allDocumentsUploaded() && !isReclamation">
                {{ getDocumentsCount() }}/3 documents ajoutés
                @if (documents.autre) { <span> + 1 autre document</span> }
                <span *ngIf="!allDocumentsUploaded() && !isReclamation"> - Tous les documents sont requis pour le dépôt</span>
                <span *ngIf="allDocumentsUploaded()"> - Dossier complet ✓</span>
                <span *ngIf="isReclamation && !allDocumentsUploaded()"> - Ajoutez les documents manquants</span>
              </p>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-between items-center">
            <div class="text-sm text-gray-500">
              <span *ngIf="!allDocumentsUploaded()" class="text-yellow-600">⚠️ Ajoutez tous les documents pour pouvoir déposer à la CNSS</span>
            </div>
            <div class="flex gap-4">
              <a routerLink="/atct" 
                 class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                Annuler
              </a>
              <button type="button" 
                      (click)="saveDraft()"
                      [disabled]="form.invalid || loading"
                      class="px-6 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition disabled:opacity-50">
                Enregistrer brouillon
              </button>
              <button type="submit" 
                      [disabled]="form.invalid || loading || (!isReclamation && !allDocumentsUploaded())"
                      class="px-6 py-2 text-white rounded-lg transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
                      [class.bg-pink-600]="!isReclamation" [class.hover:bg-pink-700]="!isReclamation"
                      [class.bg-orange-600]="isReclamation" [class.hover:bg-orange-700]="isReclamation">
                @if (loading) {
                  <svg class="animate-spin h-5 w-5" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                  </svg>
                  Envoi en cours...
                } @else {
                  <span>📤</span>
                  {{ isReclamation ? 'Re-déposer le dossier corrigé' : (isEditMode ? 'Mettre à jour & Déposer' : 'Déposer à la CNSS') }}
                }
              </button>
            </div>
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
  isReclamation = false;
  motifReclamation = '';
  id: number | null = null;

  // Documents requis
  documents: {
    contrat: File | null;
    attestationSalaire: File | null;
    cin: File | null;
    autre: File | null;
  } = {
    contrat: null,
    attestationSalaire: null,
    cin: null,
    autre: null
  };

  // Documents déjà déposés dans GED
  existingDocs: {contrat?: GedDocument, attestationSalaire?: GedDocument, cin?: GedDocument, decisionAffectation?: GedDocument} = {};

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
    private atctService: AtctService,
    private gedService: GedService,
    private pdfService: PdfService
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
        if (dossier.statut === 'RECLAMATION') {
          this.isReclamation = true;
          this.motifReclamation = dossier.motifRejet || 'Documents manquants';
        }
        this.loading = false;
        this.loadExistingDocuments(this.id!);
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
        alert('Erreur lors du chargement du dossier');
      }
    });
  }

  loadExistingDocuments(dossierId: number): void {
    this.gedService.getDocuments(undefined, 'Dossiers ATCT').subscribe({
      next: (docs) => {
        const idStr = String(dossierId);
        const folders = docs.filter(d =>
          d.fichierType === 'folder' &&
          ((d.tags || []).join(' ').includes(`dossier-${idStr}`) ||
           (d.description || '').includes(`N°${idStr}`))
        );
        if (folders.length > 0) {
          let allChildren: any[] = [];
          let loaded = 0;
          folders.forEach(folder => {
            this.gedService.getChildren(folder.id).subscribe({
              next: (children) => {
                allChildren = allChildren.concat(children);
                loaded++;
                if (loaded === folders.length) this.matchExistingDocs(allChildren);
              },
              error: () => { loaded++; if (loaded === folders.length) this.matchExistingDocs(allChildren); }
            });
          });
        }
      },
      error: () => {}
    });
  }

  private matchExistingDocs(children: any[]): void {
    children.forEach(doc => {
      const titre = (doc.titre || '').toLowerCase();
      const tagsStr = (doc.tags || []).join(' ').toLowerCase();
      if (titre.includes('decision') || titre.includes('décision') || tagsStr.includes('decision-affectation')) {
        this.existingDocs.decisionAffectation = doc;
      } else if (titre.includes('contrat') || tagsStr.includes('contrat')) {
        this.existingDocs.contrat = doc;
      } else if (titre.includes('attestation') || titre.includes('salaire') || tagsStr.includes('attestation-salaire')) {
        this.existingDocs.attestationSalaire = doc;
      } else if (titre.includes('cin') || tagsStr.includes('cin')) {
        this.existingDocs.cin = doc;
      }
    });
  }

  formatSize(bytes?: number): string {
    if (!bytes) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];
  }

  // Gestion des documents
  onDocumentSelected(event: Event, docType: 'contrat' | 'attestationSalaire' | 'cin' | 'autre'): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.documents[docType] = input.files[0];
    }
  }

  allDocumentsUploaded(): boolean {
    return !!(this.documents.contrat && this.documents.attestationSalaire && this.documents.cin);
  }

  getDocumentsCount(): number {
    let count = 0;
    if (this.documents.contrat) count++;
    if (this.documents.attestationSalaire) count++;
    if (this.documents.cin) count++;
    return count;
  }

  saveDraft(): void {
    if (this.form.invalid) return;
    this.loading = true;
    const payload: DossierATCTRequest = this.form.value;
    
    if (this.isEditMode && this.id) {
      this.atctService.update(this.id, payload).subscribe({
        next: () => {
          this.loading = false;
          alert('Brouillon enregistré');
        },
        error: () => {
          this.loading = false;
          alert('Erreur lors de l\'enregistrement');
        }
      });
    } else {
      this.atctService.create(payload).subscribe({
        next: (result) => {
          this.loading = false;
          this.id = result.id!;
          this.isEditMode = true;
          alert('Brouillon enregistré ! ID: ' + result.id);
        },
        error: () => {
          this.loading = false;
          alert('Erreur lors de l\'enregistrement');
        }
      });
    }
  }

  onSubmit(): void {
    const needAllDocs = !this.isReclamation;
    if (this.form.invalid || (needAllDocs && !this.allDocumentsUploaded())) return;
    if (this.isReclamation && this.getDocumentsCount() === 0) {
      if (!confirm('Aucun nouveau document sélectionné. Voulez-vous quand même re-déposer le dossier ?')) return;
    }
    this.loading = true;

    const payload: DossierATCTRequest = this.form.value;

    // Créer ou mettre à jour le dossier puis uploader les documents
    const createOrUpdate = this.isEditMode && this.id 
      ? this.atctService.update(this.id, payload)
      : this.atctService.create(payload);

    createOrUpdate.subscribe({
      next: (result) => {
        const dossierId = result.id!;
        // Upload des documents
        this.uploadDocuments(dossierId).then(() => {
          // Marquer comme déposé à CNSS (statut EN_ATTENTE)
          this.atctService.marquerDocumentsDeposes(dossierId).subscribe({
            next: () => {
              this.loading = false;
              alert('✅ Dossier déposé à la CNSS avec succès !\n\nL\'agent CNSS va vérifier votre dossier.');
              this.router.navigate(['/atct']);
            },
            error: () => {
              this.loading = false;
              alert('Dossier créé mais erreur lors du dépôt');
              this.router.navigate(['/atct']);
            }
          });
        }).catch(() => {
          this.loading = false;
          alert('Erreur lors de l\'upload des documents');
        });
      },
      error: (err) => {
        console.error('Erreur:', err);
        this.loading = false;
        alert('Erreur: ' + (err.error?.error || err.message));
      }
    });
  }

  async uploadDocuments(dossierId: number): Promise<void> {
    const nomComplet = `${this.form.value.prenomFr} ${this.form.value.nomFr}`.trim();
    const dossierName = nomComplet || `Cooperant_${dossierId}`;

    // 1. Créer le dossier parent dans la GED
    const folder = await lastValueFrom(this.gedService.createFolder(dossierName, {
      description: `Dossier ATCT N°${dossierId} - ${dossierName} - 4 documents`,
      categorie: 'Dossiers ATCT',
      tags: ['atct', `dossier-${dossierId}`]
    }));
    const parentId = folder.id;

    // 2. Uploader les 4 documents comme enfants du dossier
    const uploads: Promise<any>[] = [];

    // Décision d'Affectation (auto-générée en PDF)
    const decisionPdfBlob = await this.generateDecisionPdf(dossierId);
    const decisionFile = new File([decisionPdfBlob], `Decision_Affectation.pdf`, { type: 'application/pdf' });
    uploads.push(lastValueFrom(this.gedService.uploadDocumentSimple(decisionFile, {
      titre: `Décision d'Affectation`,
      description: `Dossier ATCT N°${dossierId}`,
      categorie: 'Dossiers ATCT',
      tags: ['decision-affectation'],
      parentId: parentId
    })));

    // Contrat de Coopérant
    if (this.documents.contrat) {
      uploads.push(lastValueFrom(this.gedService.uploadDocumentSimple(this.documents.contrat, {
        titre: `Contrat de Coopérant`,
        description: `Dossier ATCT N°${dossierId}`,
        categorie: 'Dossiers ATCT',
        tags: ['contrat'],
        parentId: parentId
      })));
    }

    // Attestation de Salaire
    if (this.documents.attestationSalaire) {
      uploads.push(lastValueFrom(this.gedService.uploadDocumentSimple(this.documents.attestationSalaire, {
        titre: `Attestation de Salaire`,
        description: `Dossier ATCT N°${dossierId}`,
        categorie: 'Dossiers ATCT',
        tags: ['attestation-salaire'],
        parentId: parentId
      })));
    }

    // CIN
    if (this.documents.cin) {
      uploads.push(lastValueFrom(this.gedService.uploadDocumentSimple(this.documents.cin, {
        titre: `CIN`,
        description: `Dossier ATCT N°${dossierId}`,
        categorie: 'Dossiers ATCT',
        tags: ['cin'],
        parentId: parentId
      })));
    }

    // Autre document (optionnel)
    if (this.documents.autre) {
      uploads.push(lastValueFrom(this.gedService.uploadDocumentSimple(this.documents.autre, {
        titre: `Autre Document - ${this.documents.autre.name}`,
        description: `Dossier ATCT N°${dossierId}`,
        categorie: 'Dossiers ATCT',
        tags: ['autre-document'],
        parentId: parentId
      })));
    }

    await Promise.all(uploads);
  }

  private generateDecisionHtml(dossierId: number): string {
    const f = this.form.value;
    const nomComplet = `${f.prenomFr} ${f.nomFr}`.trim();
    const nomCompletAr = `${f.prenomAr || ''} ${f.nomAr || ''}`.trim();
    return this.pdfService.buildAtctFormulaireHtml({
      nomComplet,
      nomCompletAr,
      numSecuSociale: f.numSecuSociale || '',
      email: f.email || '',
      adresseTunisie: f.adresseTunisie || '',
      codePostal: f.codePostalTunisie || '',
      villeTunisie: f.villeTunisie || '',
      adresseEtranger: f.adresseEtranger || '',
      villeEtranger: f.villeEtranger || '',
      paysEtranger: f.paysEtranger || '',
      etablissementOrigine: f.etablissementOrigine || '',
      organismeEtranger: f.organismeEtranger || '',
      dateDebutDetachement: f.dateDebutDetachement ? new Date(f.dateDebutDetachement).toLocaleDateString('fr-FR') : '',
      dateFinDetachement: f.dateFinDetachement ? new Date(f.dateFinDetachement).toLocaleDateString('fr-FR') : '',
      modePaiement: f.modePaiement || '',
      assuranceMaladie: f.assuranceMaladie || false
    });
  }

  private generateDecisionPdf(dossierId: number): Promise<Blob> {
    return new Promise((resolve, reject) => {
      const html = this.generateDecisionHtml(dossierId);
      const iframe = document.createElement('iframe');
      iframe.style.position = 'fixed';
      iframe.style.left = '-9999px';
      iframe.style.width = '794px';
      iframe.style.height = '1123px';
      document.body.appendChild(iframe);

      const iframeDoc = iframe.contentDocument || iframe.contentWindow?.document;
      if (!iframeDoc) { document.body.removeChild(iframe); reject('No iframe doc'); return; }

      iframeDoc.open();
      iframeDoc.write(html);
      iframeDoc.close();

      setTimeout(() => {
        const html2canvas = (window as any).html2canvas;
        if (!html2canvas) { document.body.removeChild(iframe); reject('html2canvas not loaded'); return; }

        html2canvas(iframeDoc.body, {
          scale: 2,
          useCORS: true,
          logging: false,
          backgroundColor: '#ffffff',
          windowWidth: 794,
          windowHeight: 1123
        }).then((canvas: HTMLCanvasElement) => {
          const { jsPDF } = (window as any).jspdf;
          const doc = new jsPDF('p', 'mm', 'a4');
          const imgData = canvas.toDataURL('image/jpeg', 0.95);
          doc.addImage(imgData, 'JPEG', 0, 0, 210, 297);
          const pdfBlob = doc.output('blob');
          document.body.removeChild(iframe);
          resolve(pdfBlob);
        }).catch((err: any) => {
          document.body.removeChild(iframe);
          reject(err);
        });
      }, 500);
    });
  }
}
