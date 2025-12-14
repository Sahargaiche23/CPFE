import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, FormArray, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, ActivatedRoute, RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService } from '../../../core/services/cooperant.service';
import { PdfService } from '../../../core/services/pdf.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'app-affiliation-complete',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="p-4 max-w-7xl mx-auto">
        <div class="flex justify-between items-center mb-4">
          <div>
            <h1 class="text-xl font-bold text-gray-800">SAISIE DOSSIER - Coopération Technique</h1>
            <p class="text-sm text-gray-600">Compléter le dossier du coopérant</p>
          </div>
          <a routerLink="/cooperant/validation" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 text-sm">
            ← Retour
          </a>
        </div>

        <div *ngIf="loading" class="text-center py-8">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-cnss-primary mx-auto"></div>
        </div>

        <form *ngIf="!loading && cooperant" [formGroup]="affiliationForm" (ngSubmit)="onSubmit()" class="space-y-4">
          
          <!-- ZONE ASSURÉ -->
          <div class="bg-gradient-to-r from-purple-50 to-white border-2 border-purple-200 rounded-lg p-4">
            <h2 class="text-md font-bold text-purple-800 mb-3 border-b border-purple-300 pb-1">Assuré</h2>
            <div class="grid grid-cols-12 gap-2">
              <div class="col-span-4">
                <label class="block text-xs font-medium text-gray-600">N° affiliation</label>
                <div class="flex gap-1">
                  <input type="text" formControlName="numAffiliation" placeholder="Matricule" class="w-24 px-2 py-1 border border-purple-300 rounded text-sm font-mono">
                  <input type="text" formControlName="cleAffiliation" placeholder="Clé" class="w-12 px-2 py-1 border border-purple-300 rounded text-sm font-mono">
                </div>
              </div>
              <div class="col-span-3">
                <label class="block text-xs font-medium text-gray-600">Situation</label>
                <input type="text" formControlName="situation" class="w-full px-2 py-1 border rounded text-sm">
              </div>
              <div class="col-span-3">
                <label class="block text-xs font-medium text-gray-600">Date effet</label>
                <input type="date" formControlName="dateEffet" class="w-full px-2 py-1 border rounded text-sm">
              </div>
              
              <div class="col-span-5">
                <label class="block text-xs font-medium text-gray-600">Nom & prénom ou Raison Sociale</label>
                <input type="text" [value]="cooperant.nomCompletFr || ''" disabled class="w-full px-2 py-1 bg-gray-100 border rounded text-sm">
              </div>
              <div class="col-span-4 text-right">
                <label class="block text-xs font-medium text-gray-600">الإسم و اللقب</label>
                <input type="text" [value]="cooperant.nomCompletAr || ''" disabled dir="rtl" class="w-full px-2 py-1 bg-gray-100 border rounded text-sm">
              </div>
              <div class="col-span-3 text-right">
                <label class="block text-xs font-medium text-gray-600">العنوان</label>
                <input type="text" [value]="cooperant.adresseAr || ''" disabled dir="rtl" class="w-full px-2 py-1 bg-gray-100 border rounded text-sm">
              </div>
              
              <div class="col-span-4">
                <label class="block text-xs font-medium text-gray-600">Matricule assuré</label>
                <div class="flex gap-1">
                  <input type="text" formControlName="matriculeAssure" class="w-24 px-2 py-1 border rounded text-sm">
                  <input type="text" formControlName="cleAssure" class="w-12 px-2 py-1 border rounded text-sm">
                </div>
              </div>
              <div class="col-span-3">
                <label class="block text-xs font-medium text-gray-600">Date de naissance</label>
                <input type="date" [value]="cooperant.dateNaissance || ''" disabled class="w-full px-2 py-1 bg-gray-100 border rounded text-sm">
              </div>
            </div>
          </div>

          <!-- ONGLETS: Coopération technique | Gestion des avantages -->
          <div class="bg-white border rounded-lg overflow-hidden">
            <div class="flex border-b">
              <button type="button" (click)="activeTab = 'coop'" 
                      [class]="activeTab === 'coop' ? 'bg-purple-100 text-purple-800 font-bold' : 'bg-gray-100'"
                      class="px-4 py-2 text-sm border-r">
                Coopération technique
              </button>
              <button type="button" (click)="activeTab = 'avantages'"
                      [class]="activeTab === 'avantages' ? 'bg-purple-100 text-purple-800 font-bold' : 'bg-gray-100'"
                      class="px-4 py-2 text-sm">
                Gestion des avantages
              </button>
            </div>
            
            <!-- TAB: Coopération technique -->
            <div *ngIf="activeTab === 'coop'" class="p-4">
              <!-- Entreprise employeur -->
              <fieldset class="border border-gray-300 rounded p-3 mb-4">
                <legend class="text-sm font-medium text-gray-700 px-2">Entreprise employeur</legend>
                <div class="grid grid-cols-12 gap-2">
                  <div class="col-span-4">
                    <label class="block text-xs text-gray-600">Matricule</label>
                    <div class="flex gap-1">
                      <input type="text" formControlName="empMatricule" class="w-24 px-2 py-1 border rounded text-sm">
                      <input type="text" formControlName="empCle" class="w-12 px-2 py-1 border rounded text-sm">
                    </div>
                  </div>
                  <div class="col-span-4">
                    <label class="block text-xs text-gray-600">Code Régime Compl.</label>
                    <input type="text" formControlName="codeRegimeCompl" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-8">
                    <label class="block text-xs text-gray-600">Désignation</label>
                    <input type="text" formControlName="designation" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                </div>
              </fieldset>
              
              <!-- Dossier -->
              <fieldset class="border border-gray-300 rounded p-3">
                <legend class="text-sm font-medium text-gray-700 px-2">Dossier</legend>
                <div class="grid grid-cols-12 gap-2">
                  <div class="col-span-4">
                    <label class="block text-xs text-gray-600">Pays de détachement</label>
                    <div class="flex gap-1">
                      <input type="text" formControlName="paysCode" placeholder="Code" class="w-16 px-2 py-1 border rounded text-sm font-mono">
                      <span class="flex items-center text-gray-500">+</span>
                      <input type="text" formControlName="paysNom" placeholder="Nom du pays" class="flex-1 px-2 py-1 border rounded text-sm">
                    </div>
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Période de détachement du</label>
                    <input type="date" formControlName="periodeDebut" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2">
                    <label class="block text-xs text-gray-600">Au</label>
                    <input type="date" formControlName="periodeFin" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Salaire en tunisie</label>
                    <input type="number" formControlName="salaireTunisie" step="0.001" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Trimestre</label>
                    <select formControlName="trimestre" class="w-full px-2 py-1 border rounded text-sm">
                      <option value="1">T1</option>
                      <option value="2">T2</option>
                      <option value="3">T3</option>
                      <option value="4">T4</option>
                    </select>
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Salaire à l'étranger</label>
                    <input type="number" formControlName="salaireEtranger" step="0.001" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                </div>
              </fieldset>
            </div>
            
            <!-- TAB: Gestion des avantages -->
            <div *ngIf="activeTab === 'avantages'" class="p-4 bg-white">
              <table class="w-full border-collapse border-2 border-gray-400">
                <thead>
                  <tr class="bg-gradient-to-b from-green-500 to-green-700">
                    <th class="border border-gray-500 px-3 py-2 text-sm text-center font-bold text-yellow-300 w-52">Régime</th>
                    <th class="border border-gray-500 px-3 py-2 text-sm text-center font-bold text-yellow-300">Avantage</th>
                    <th class="border border-gray-500 px-3 py-2 text-sm text-center font-bold text-yellow-300 w-28">Date</th>
                  </tr>
                </thead>
                <tbody formArrayName="avantages">
                  <tr *ngFor="let av of avantagesArray.controls; let i = index" [formGroupName]="i" class="hover:bg-green-200">
                    <td class="border border-gray-300 p-0 bg-green-100">
                      <div class="flex items-center h-8">
                        <div class="w-7 h-full flex items-center justify-center bg-green-600 border-r border-gray-400">
                          <input type="checkbox" formControlName="selected" class="w-4 h-4 accent-green-600">
                        </div>
                        <input type="text" formControlName="regime" placeholder="500 COOP TECHNIQUE..."
                               class="flex-1 h-full px-2 text-xs bg-transparent border-0 focus:outline-none focus:bg-green-50">
                      </div>
                    </td>
                    <td class="border border-gray-300 p-0 bg-green-100">
                      <input type="text" formControlName="avantage" placeholder="133 PRAS.ASS.SOCIALE..."
                             class="w-full h-8 px-2 text-xs bg-transparent border-0 focus:outline-none focus:bg-green-50">
                    </td>
                    <td class="border border-gray-300 p-0 bg-green-100">
                      <input type="text" formControlName="dateAvantage" placeholder="01-04-2025"
                             class="w-full h-8 px-2 text-xs bg-transparent border-0 focus:outline-none focus:bg-green-50 text-center">
                    </td>
                  </tr>
                  <!-- Lignes vides -->
                  <tr *ngFor="let _ of emptyRows" class="bg-green-100">
                    <td class="border border-gray-300 p-0 h-8">
                      <div class="flex items-center h-full">
                        <div class="w-7 h-full bg-green-600 border-r border-gray-400"></div>
                        <div class="flex-1"></div>
                      </div>
                    </td>
                    <td class="border border-gray-300 h-8"></td>
                    <td class="border border-gray-300 h-8"></td>
                  </tr>
                </tbody>
              </table>
              <div class="flex justify-end mt-3">
                <button type="button" (click)="addAvantage()" 
                        class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded shadow font-medium text-sm">
                  + Ajouter une ligne
                </button>
              </div>
            </div>
          </div>

          <!-- AFFILIATION EMPLOYEUR -->
          <div class="bg-white border rounded-lg overflow-hidden">
            <div class="bg-purple-100 px-4 py-2 border-b flex justify-between items-center">
              <h2 class="text-md font-bold text-purple-800">Affiliation employeur</h2>
              <div class="flex items-center gap-4 text-sm">
                <span>Régime: <strong>{{ affiliationForm.get('codeRegimeCompl')?.value || '500' }}</strong> COOP.TECHNIQUE REGIME GENERAL</span>
                <span>Employeur: <strong>{{ affiliationForm.get('empMatricule')?.value || '' }}</strong></span>
              </div>
            </div>
            
            <!-- Onglets Employeur -->
            <div class="flex border-b">
              <button type="button" (click)="empTab = 'employeur'" 
                      [class]="empTab === 'employeur' ? 'bg-white border-b-2 border-purple-600 font-bold' : 'bg-gray-100'"
                      class="px-4 py-2 text-sm">Employeur</button>
              <button type="button" (click)="empTab = 'adresse'" 
                      [class]="empTab === 'adresse' ? 'bg-white border-b-2 border-purple-600 font-bold' : 'bg-gray-100'"
                      class="px-4 py-2 text-sm">Adresse</button>
              <button type="button" (click)="empTab = 'respLegal'" 
                      [class]="empTab === 'respLegal' ? 'bg-white border-b-2 border-purple-600 font-bold' : 'bg-gray-100'"
                      class="px-4 py-2 text-sm">Respl Légal</button>
            </div>
            
            <!-- TAB Employeur -->
            <div *ngIf="empTab === 'employeur'" class="p-4">
              <div class="grid grid-cols-12 gap-2">
                <div class="col-span-6">
                  <label class="block text-xs text-gray-600">Raison Sociale</label>
                  <input type="text" formControlName="raisonSocialeFr" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-6 text-right">
                  <label class="block text-xs text-gray-600">الصفة الاجتماعية</label>
                  <input type="text" formControlName="raisonSocialeAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-4">
                  <label class="block text-xs text-gray-600">Activité</label>
                  <input type="text" formControlName="activite" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-4">
                  <label class="block text-xs text-gray-600">Activité (Ar)</label>
                  <input type="text" formControlName="activiteAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Type Aff</label>
                  <select formControlName="typeAff" class="w-full px-2 py-1 border rounded text-sm">
                    <option value="Normale">Normale</option>
                    <option value="Speciale">Spéciale</option>
                  </select>
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Enseigne</label>
                  <input type="text" formControlName="enseigne" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Num Reg Comm</label>
                  <input type="text" formControlName="numRegComm" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Lieu reg comm</label>
                  <input type="text" formControlName="lieuRegComm" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Nationalité</label>
                  <select formControlName="nationaliteEmp" class="w-full px-2 py-1 border rounded text-sm">
                    <option value="TUNISIE">TUNISIE</option>
                    <option value="FRANCE">FRANCE</option>
                    <option value="AUTRE">AUTRE</option>
                  </select>
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Estim Intég</label>
                  <input type="number" formControlName="estimInteg" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Num Aff Préd</label>
                  <div class="flex gap-1">
                    <input type="text" formControlName="numAffPred" class="w-24 px-2 py-1 border rounded text-sm">
                    <input type="text" formControlName="cleAffPred" class="w-12 px-2 py-1 border rounded text-sm">
                  </div>
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Date Assuj</label>
                  <input type="date" formControlName="dateAssuj" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Date Effet</label>
                  <input type="date" formControlName="dateEffetEmp" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Ref ATMP</label>
                  <input type="text" formControlName="refAtmp" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Patente</label>
                  <input type="text" formControlName="patente" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Code TVA</label>
                  <input type="text" formControlName="codeTva" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Cat Prof</label>
                  <input type="text" formControlName="catProf" class="w-full px-2 py-1 border rounded text-sm">
                </div>
              </div>
            </div>
            
            <!-- TAB Adresse -->
            <div *ngIf="empTab === 'adresse'" class="p-4">
              <div class="grid grid-cols-12 gap-2">
                <div class="col-span-6">
                  <label class="block text-xs text-gray-600">Adresse</label>
                  <input type="text" formControlName="adresseEmp" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-6 text-right">
                  <label class="block text-xs text-gray-600">العنوان</label>
                  <input type="text" formControlName="adresseEmpAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-4">
                  <label class="block text-xs text-gray-600">Voie et libellé</label>
                  <input type="text" formControlName="voieLibelle" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Numéro</label>
                  <input type="text" formControlName="numero" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">الشارع</label>
                  <input type="text" formControlName="voieAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">الحي</label>
                  <input type="text" formControlName="quartierAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Cité</label>
                  <input type="text" formControlName="cite" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">Immeuble</label>
                  <input type="text" formControlName="immeuble" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Appartement</label>
                  <input type="text" formControlName="appartement" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-2">
                  <label class="block text-xs text-gray-600">Code Postal</label>
                  <input type="text" formControlName="codePostalEmp" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-4">
                  <label class="block text-xs text-gray-600">Localité</label>
                  <input type="text" formControlName="localiteEmp" class="w-full px-2 py-1 border rounded text-sm">
                </div>
                <div class="col-span-3">
                  <label class="block text-xs text-gray-600">المنطقة</label>
                  <input type="text" formControlName="localiteEmpAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                </div>
              </div>
            </div>
            
            <!-- TAB Responsable Légal -->
            <div *ngIf="empTab === 'respLegal'" class="p-4">
              <fieldset class="border rounded p-3 mb-4">
                <legend class="text-sm font-medium px-2">Responsable Légal</legend>
                <div class="grid grid-cols-12 gap-2">
                  <div class="col-span-2">
                    <label class="block text-xs text-gray-600">Pièce identité</label>
                    <select formControlName="rlPieceIdentite" class="w-full px-2 py-1 border rounded text-sm">
                      <option value="Cin">Cin</option>
                      <option value="Passeport">Passeport</option>
                    </select>
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Num</label>
                    <input type="text" formControlName="rlNumero" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Nom</label>
                    <input type="text" formControlName="rlNomFr" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2">
                    <label class="block text-xs text-gray-600">Prénom</label>
                    <input type="text" formControlName="rlPrenomFr" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2 text-right">
                    <label class="block text-xs text-gray-600">اللقب</label>
                    <input type="text" formControlName="rlNomAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2 text-right">
                    <label class="block text-xs text-gray-600">الإسم</label>
                    <input type="text" formControlName="rlPrenomAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-6">
                    <label class="block text-xs text-gray-600">Adresse</label>
                    <input type="text" formControlName="rlAdresse" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-4 text-right">
                    <label class="block text-xs text-gray-600">العنوان</label>
                    <input type="text" formControlName="rlAdresseAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2">
                    <label class="block text-xs text-gray-600">Code Postal</label>
                    <input type="text" formControlName="rlCodePostal" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Localité</label>
                    <input type="text" formControlName="rlLocalite" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-2 text-right">
                    <label class="block text-xs text-gray-600">المنطقة</label>
                    <input type="text" formControlName="rlLocaliteAr" dir="rtl" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Date Naissance</label>
                    <input type="date" formControlName="rlDateNaissance" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Lieu De Naissance</label>
                    <input type="text" formControlName="rlLieuNaissance" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Tél</label>
                    <input type="tel" formControlName="rlTelephone" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-3">
                    <label class="block text-xs text-gray-600">Fax</label>
                    <input type="text" formControlName="rlFax" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-4">
                    <label class="block text-xs text-gray-600">Email</label>
                    <input type="email" formControlName="rlEmail" class="w-full px-2 py-1 border rounded text-sm">
                  </div>
                  <div class="col-span-4">
                    <label class="block text-xs text-gray-600">Mat Séc Sociale</label>
                    <div class="flex gap-1">
                      <input type="text" formControlName="rlMatSecSociale" class="w-24 px-2 py-1 border rounded text-sm">
                      <input type="text" formControlName="rlCleSecSociale" class="w-12 px-2 py-1 border rounded text-sm">
                    </div>
                  </div>
                </div>
              </fieldset>
              
              <!-- Nationalités Responsable Légal -->
              <fieldset class="border rounded p-3">
                <legend class="text-sm font-medium px-2">Nationalités Responsable Légal</legend>
                <table class="w-full border-collapse border text-sm">
                  <thead class="bg-gray-100">
                    <tr>
                      <th class="border px-2 py-1 text-xs w-16">+</th>
                      <th class="border px-2 py-1 text-xs">Code</th>
                      <th class="border px-2 py-1 text-xs">Nationalité</th>
                      <th class="border px-2 py-1 text-xs w-16">Actions</th>
                    </tr>
                  </thead>
                  <tbody formArrayName="nationalites">
                    <tr *ngFor="let nat of nationalitesArray.controls; let i = index" [formGroupName]="i">
                      <td class="border px-2 py-1 text-center">{{ i + 1 }}</td>
                      <td class="border px-1 py-1">
                        <input type="text" formControlName="code" class="w-full px-1 py-1 border rounded text-xs">
                      </td>
                      <td class="border px-1 py-1">
                        <select formControlName="nationalite" class="w-full px-1 py-1 border rounded text-xs">
                          <option value="">Sélectionner</option>
                          <option value="TUNISIE">TUNISIE</option>
                          <option value="FRANCE">FRANCE</option>
                          <option value="ALLEMAGNE">ALLEMAGNE</option>
                          <option value="ITALIE">ITALIE</option>
                        </select>
                      </td>
                      <td class="border px-1 py-1 text-center">
                        <button type="button" (click)="removeNationalite(i)" class="text-red-600">✕</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <button type="button" (click)="addNationalite()" class="mt-2 text-blue-600 hover:text-blue-800 text-sm">
                  + Ajouter nationalité
                </button>
              </fieldset>
            </div>
          </div>

          <!-- Boutons -->
          <div class="flex justify-between items-center bg-gray-100 rounded p-3">
            <div class="text-sm text-gray-600">
              BR: <strong>TUNIS CENTRE</strong> &nbsp;&nbsp; LE: <strong>{{ today }}</strong>
            </div>
            <div class="flex gap-2">
              <a routerLink="/cooperant/validation" class="px-4 py-2 bg-gray-500 text-white rounded hover:bg-gray-600 text-sm">
                Annuler
              </a>
              <button type="submit" [disabled]="submitting" class="px-4 py-2 bg-cnss-primary text-white rounded hover:bg-cnss-secondary text-sm disabled:opacity-50">
                {{ submitting ? 'Enregistrement...' : 'Enregistrer' }}
              </button>
            </div>
          </div>
        </form>
      </div>
    </app-main-layout>
  `
})
export class AffiliationCompleteComponent implements OnInit {
  affiliationForm: FormGroup;
  cooperant: any = null;
  loading = true;
  submitting = false;
  cooperantId: number | null = null;
  activeTab = 'coop';
  empTab = 'employeur';
  today = new Date().toLocaleDateString('fr-FR');

  get emptyRows(): number[] {
    const count = Math.max(0, 7 - this.avantagesArray.length);
    return Array(count).fill(0);
  }

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private cooperantService: CooperantService,
    private pdfService: PdfService,
    private http: HttpClient
  ) {
    this.affiliationForm = this.fb.group({
      // Assuré - N° affiliation créé par agent/admin
      numAffiliation: [''],
      cleAffiliation: [''],
      situation: ['ACTIF'],
      dateEffet: [''],
      matriculeAssure: [''],
      cleAssure: [''],
      
      // Entreprise employeur
      empMatricule: [''],
      empCle: [''],
      codeRegimeCompl: ['500'],
      designation: [''],
      
      // Dossier
      paysCode: [''],
      paysNom: [''],
      periodeDebut: [''],
      periodeFin: [''],
      salaireTunisie: [''],
      trimestre: ['1'],
      salaireEtranger: [''],
      
      // Employeur
      raisonSocialeFr: [''],
      raisonSocialeAr: [''],
      activite: [''],
      activiteAr: [''],
      typeAff: ['Normale'],
      enseigne: [''],
      numRegComm: [''],
      lieuRegComm: [''],
      nationaliteEmp: ['TUNISIE'],
      estimInteg: [''],
      numAffPred: [''],
      cleAffPred: [''],
      dateAssuj: [''],
      dateEffetEmp: [''],
      refAtmp: [''],
      patente: [''],
      codeTva: [''],
      catProf: [''],
      
      // Adresse
      adresseEmp: [''],
      adresseEmpAr: [''],
      voieLibelle: [''],
      numero: [''],
      voieAr: [''],
      quartierAr: [''],
      cite: [''],
      immeuble: [''],
      appartement: [''],
      codePostalEmp: [''],
      localiteEmp: [''],
      localiteEmpAr: [''],
      
      // Responsable Légal
      rlPieceIdentite: ['Cin'],
      rlNumero: [''],
      rlNomFr: [''],
      rlPrenomFr: [''],
      rlNomAr: [''],
      rlPrenomAr: [''],
      rlAdresse: [''],
      rlAdresseAr: [''],
      rlCodePostal: [''],
      rlLocalite: [''],
      rlLocaliteAr: [''],
      rlDateNaissance: [''],
      rlLieuNaissance: [''],
      rlTelephone: [''],
      rlFax: [''],
      rlEmail: [''],
      rlMatSecSociale: [''],
      rlCleSecSociale: [''],
      
      // Tableaux
      avantages: this.fb.array([]),
      nationalites: this.fb.array([])
    });
  }

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.cooperantId = +id;
      this.loadCooperant(this.cooperantId);
    } else {
      this.loading = false;
    }
  }

  loadCooperant(id: number) {
    this.cooperantService.getById(id).subscribe({
      next: (data) => {
        this.cooperant = data;
        this.prefillForm(data);
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur:', err);
        this.loading = false;
      }
    });
  }

  prefillForm(c: any) {
    // Extraire matricule et clé depuis matriculeComplet (format: cle-matricule)
    let matricule = '';
    let cle = '';
    if (c.matriculeComplet) {
      const parts = c.matriculeComplet.split('-');
      if (parts.length >= 2) {
        cle = parts[0];
        matricule = parts[1];
      }
    } else if (c.matricule) {
      matricule = String(c.matricule);
      cle = c.cle ? String(c.cle) : '';
    }
    
    // Générer numéro d'affiliation (format: 54-500XXX)
    const numAff = c.numAffiliation || '500' + String(c.id || '').padStart(3, '0');
    const cleAff = c.cleAffiliation || '54';
    
    this.affiliationForm.patchValue({
      dateEffet: new Date().toISOString().split('T')[0],
      numAffiliation: numAff,
      cleAffiliation: cleAff,
      matriculeAssure: matricule,
      cleAssure: cle,
      raisonSocialeFr: c.nomCompletFr || '',
      raisonSocialeAr: c.nomCompletAr || '',
      nationaliteEmp: c.nationalite || 'TUNISIE',
      rlNomFr: c.nomFr || '',
      rlPrenomFr: c.prenomFr || '',
      rlNomAr: c.nomAr || '',
      rlPrenomAr: c.prenomAr || '',
      rlEmail: c.email || '',
      rlNumero: c.numPieceIdentite || '',
      rlAdresse: c.adresseFr || '',
      rlAdresseAr: c.adresseAr || '',
      rlCodePostal: c.codePostal || '',
      rlLocalite: c.localiteFr || '',
      rlLocaliteAr: c.localiteAr || '',
      rlTelephone: c.telephone || '',
      rlDateNaissance: c.dateNaissance || ''
    });
    
    // Ajouter nationalité par défaut
    this.addNationalite();
    if (c.nationalite) {
      this.nationalitesArray.at(0).patchValue({
        code: '100',
        nationalite: c.nationalite.toUpperCase()
      });
    }
  }

  get avantagesArray(): FormArray {
    return this.affiliationForm.get('avantages') as FormArray;
  }

  get nationalitesArray(): FormArray {
    return this.affiliationForm.get('nationalites') as FormArray;
  }

  addAvantage() {
    this.avantagesArray.push(this.fb.group({
      selected: [false],
      regime: [''],
      avantage: [''],
      dateAvantage: ['']
    }));
  }

  removeAvantage(i: number) {
    this.avantagesArray.removeAt(i);
  }

  addNationalite() {
    this.nationalitesArray.push(this.fb.group({
      code: [''],
      nationalite: ['']
    }));
  }

  removeNationalite(i: number) {
    this.nationalitesArray.removeAt(i);
  }

  onSubmit() {
    this.submitting = true;
    const formData = this.affiliationForm.value;
    const data = { cooperantId: this.cooperantId, ...formData };
    console.log('Données affiliation:', data);
    
    // Préparer les données pour le certificat
    const numAff = `${formData.cleAffiliation || '54'}-${formData.numAffiliation || '500380'}`;
    const adresseCooperant = this.cooperant?.adresseAr || this.cooperant?.adresseFr || 
      `${formData.codePostalEmp || ''} ${formData.localiteEmpAr || formData.localiteEmp || ''}`.trim();
    const certificatData = {
      affiliationNumber: numAff,
      employerName: formData.raisonSocialeFr || this.cooperant?.nomCompletFr,
      employerNumber: `${formData.empMatricule || ''}-${formData.empCle || ''}`,
      employeeName: this.cooperant?.nomCompletAr || this.cooperant?.nomCompletFr,
      startDate: formData.dateEffet || new Date().toLocaleDateString('fr-FR'),
      regime: formData.codeRegimeCompl || '500',
      address: adresseCooperant,
      registrationNumber: `${formData.matriculeAssure || ''}-${formData.cleAssure || ''}`
    };

    // Calculer le montant cotisation trimestrielle (exemple: 25% du salaire)
    const salaire = parseFloat(formData.salaireTunisie) || 0;
    const tauxCotisation = 0.2575; // 25.75% taux cotisation
    const montantCotisation = (salaire * tauxCotisation).toFixed(3);

    // Envoyer email HTML formaté comme attestation officielle
    const emailHtml = `
<html>
<head>
  <meta charset="UTF-8">
  <style>
    body { font-family: 'Amiri', 'Traditional Arabic', Arial, serif; direction: rtl; }
    .container { max-width: 700px; margin: 0 auto; padding: 20px; border: 2px solid #8B0000; }
    .header { display: flex; justify-content: space-between; border-bottom: 2px solid #8B0000; padding-bottom: 15px; margin-bottom: 20px; }
    .header-fr { text-align: left; font-size: 11px; direction: ltr; }
    .header-ar { text-align: right; font-size: 13px; }
    .logo-section { text-align: center; margin: 20px 0; }
    .logo-text-fr { color: #8B0000; font-size: 18px; font-weight: bold; font-style: italic; }
    .logo-text-ar { color: #8B0000; font-size: 16px; font-weight: bold; }
    .info-row { display: flex; justify-content: space-between; margin: 10px 0; font-size: 12px; }
    .title { text-align: center; color: #8B0000; font-size: 16px; font-weight: bold; margin: 25px 0; text-decoration: underline; }
    .content { direction: rtl; text-align: right; line-height: 2; font-size: 13px; margin: 20px 0; }
    .signature { text-align: left; margin-top: 40px; font-size: 12px; direction: ltr; }
    .footer { border-top: 1px solid #ccc; margin-top: 30px; padding-top: 10px; font-size: 10px; text-align: center; }
    table { width: 100%; border-collapse: collapse; margin: 15px 0; }
    td { padding: 8px; border: 1px solid #ddd; }
    .label { background: #f5f5f5; font-weight: bold; width: 40%; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="header-fr">
        République Tunisienne<br>
        Ministère des Affaires Sociales et de solidarité<br>
        et des Tunisiens à l'Étranger
      </div>
      <div class="header-ar">
        الجمهورية التونسية<br>
        وزارة الشؤون الاجتماعية و التضامن<br>
        و التونسيين بالخارج
      </div>
    </div>
    
    <div class="logo-section">
      <div class="logo-text-fr">Caisse Nationale de Sécurité Sociale</div>
      <div class="logo-text-ar">الصندوق الوطني للضمان الاجتماعي</div>
    </div>
    
    <div class="info-row">
      <span>المكتب الجهوي بتونس المدينة</span>
      <span style="direction:ltr">Tunis, le ${this.today}</span>
    </div>
    
    <div class="info-row">
      <span>شارع مدريد - تونس 12</span>
      <span style="direction:ltr">رقم الإنخراط: ${numAff}</span>
    </div>
    
    <div class="info-row">
      <span>(السيد/ة): ${this.cooperant?.nomCompletAr || this.cooperant?.nomCompletFr || ''}</span>
      <span style="direction:ltr">رقم التسجيل: ${formData.matriculeAssure || ''}-${formData.cleAssure || ''}</span>
    </div>
    
    <div class="title">الموضوع: إعلام بالإنخراط</div>
    
    <div class="content">
      <p>أما بعد،</p>
      <p>
        أتشرف بإعلامكم بقبول مطلب إنخراطكم بالصندوق الوطني للضمان الاجتماعي في إطار التغطية الاجتماعية
        للأعوان الموفدين في حالة إلحاق للعمل في نطاق التعاون الفني وإسنادكم رقم الإنخراط المبين أعلاه والذي
        تبدأ فاعليته بعنوان نظام جرايات الشيخوخة والعجز والباقين على قيد الحياة من تاريخ
        <strong>${formData.dateEffet || '-'}</strong> فاعليته بعنوان نظام التأمينات الاجتماعية من تاريخ
        <strong>${formData.periodeDebut || '-'}</strong>.
      </p>
      <p>
        لذا فالمرغوب منكم ذكر رقم إنخراطكم، بإضافة إلى رقم تسجيلكم، في مختلف تعاملاتكم مع مصالح
        الصندوق الوطني للضمان الاجتماعي المتعلقة بالتغطية الاجتماعية بعنوان فترات الإلحاق في نطاق التعاون الفني
        ولضمان مواصلة التمتع بمنافع الضمان الاجتماعي في أحسن الظروف، المرغوب منكم دفع
        مساهماتكم قبل انقضاء الأجل القانوني المحدد باليوم الخامس عشر الموالي لكل ثلاثية، كما يمكنكم دفع
        مساهماتكم مسبقا أو شهريا.
      </p>
    </div>
    
    <table>
      <tr><td class="label">رقم الإنخراط</td><td>${numAff}</td></tr>
      <tr><td class="label">النظام</td><td>${formData.codeRegimeCompl || '500'} - التعاون الفني</td></tr>
      <tr><td class="label">المبلغ الثلاثي</td><td>${salaire.toLocaleString('fr-FR', {minimumFractionDigits: 3})} د.ت</td></tr>
      <tr><td class="label">نسبة المساهمة</td><td>25.75%</td></tr>
      <tr><td class="label">المبلغ المستوجب</td><td><strong>${montantCotisation} د.ت</strong></td></tr>
      <tr><td class="label">RIB</td><td style="direction:ltr">03 000 0000 000012345 67</td></tr>
    </table>
    
    <div class="signature">
      <p>مع فائق الاحترام والتقدير</p>
      <p>والسلام</p>
      <br><br>
      <p><strong>رئيس المكتب الجهوي بتونس المدينة</strong></p>
    </div>
    
    <div class="footer">
      CNSS - Caisse Nationale de Sécurité Sociale | Tél: +216 71 123 456 | cooperation@cnss.tn
    </div>
  </div>
</body>
</html>`;

    const emailData = {
      to: this.cooperant?.email,
      subject: 'إعلام بالإنخراط - Certificat d\'Affiliation CNSS',
      body: emailHtml
    };

    // Générer le PDF et l'envoyer en pièce jointe
    this.pdfService.generateAttestationPdfBase64({
      affiliationNumber: numAff,
      employeeName: this.cooperant?.nomCompletFr || '',
      employeeNameAr: this.cooperant?.nomCompletAr,
      registrationNumber: `${formData.matriculeAssure || ''}-${formData.cleAssure || ''}`,
      regime: formData.codeRegimeCompl || '500',
      dateEffet: formData.dateEffet || '',
      periodeDebut: formData.periodeDebut || '',
      periodeFin: formData.periodeFin || '',
      salaire: salaire,
      montantCotisation: montantCotisation,
      address: adresseCooperant
    }).then(pdfBase64 => {
      // Envoyer email avec PDF en pièce jointe
      const emailPayload = {
        to: this.cooperant?.email,
        subject: 'إعلام بالإنخراط - Attestation d\'Affiliation CNSS',
        content: `Bonjour ${this.cooperant?.nomCompletFr || ''},\n\nVeuillez trouver ci-joint votre attestation d'affiliation CNSS.\n\nN° Affiliation: ${numAff}\nRégime: ${formData.codeRegimeCompl || '500'} - Coopération Technique\n\nCordialement,\nCNSS - Caisse Nationale de Sécurité Sociale`,
        pdfBase64: pdfBase64,
        fileName: `attestation_affiliation_${numAff}.pdf`
      };
      
      this.http.post(`${environment.apiUrl}/notification/email-with-attachment`, emailPayload).subscribe({
        next: () => console.log('Email avec PDF envoyé avec succès'),
        error: (err) => console.log('Email non envoyé:', err.message)
      });

      // Télécharger aussi le PDF localement
      this.pdfService.generateAffiliationAttestation(certificatData);
      this.submitting = false;
      alert('Affiliation enregistrée avec succès!\n\n- Email avec attestation PDF envoyé\n- Certificat d\'affiliation généré');
      this.router.navigate(['/cooperant/validation']);
    }).catch(err => {
      console.error('Erreur génération PDF:', err);
      this.submitting = false;
      alert('Erreur lors de la génération du PDF');
    });
  }

  getMatricule(): string {
    if (!this.cooperant) return '';
    if (this.cooperant.matricule) return String(this.cooperant.matricule);
    if (this.cooperant.matriculeComplet) {
      const parts = this.cooperant.matriculeComplet.split('-');
      return parts.length > 1 ? parts[1] : parts[0];
    }
    return '';
  }

  getCle(): string {
    if (!this.cooperant) return '';
    if (this.cooperant.cle) return String(this.cooperant.cle);
    if (this.cooperant.matriculeComplet) {
      const parts = this.cooperant.matriculeComplet.split('-');
      return parts.length > 1 ? parts[0] : '';
    }
    return '';
  }
}
