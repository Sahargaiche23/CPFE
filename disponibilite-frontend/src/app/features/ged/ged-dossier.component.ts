import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { InstitutionService } from '../../services/institution.service';
import { AgentService, AgentPublic } from '../../services/agent.service';
import { DocumentService, DocumentGed, ExtractionResult } from '../../services/document.service';
import { GedSharedDataService } from '../../services/ged-shared-data.service';

@Component({
  selector: 'app-ged-dossier',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="space-y-6">

      <!-- Header -->
      <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
          <div class="flex items-center gap-3">
            <span class="material-icons text-3xl">folder_special</span>
            <div>
              <h2 class="font-bold text-lg">إدارة الوثائق الإلكترونية</h2>
              <p class="text-rose-200 text-sm">Gestion Électronique des Documents - GED</p>
            </div>
          </div>
        </div>

        <!-- Mode Tabs -->
        <div class="flex border-b border-gray-200">
          <button (click)="mode = 'existing'; resetNewAgent()" class="flex-1 px-4 py-3 text-sm font-medium flex items-center justify-center gap-2 transition-colors"
                  [class.bg-white]="mode === 'existing'" [class.text-rose-700]="mode === 'existing'" [class.border-b-2]="mode === 'existing'" [class.border-rose-600]="mode === 'existing'"
                  [class.bg-gray-50]="mode !== 'existing'" [class.text-gray-500]="mode !== 'existing'">
            <span class="material-icons text-sm">person_search</span>
            مضمون موجود / Assuré existant
          </button>
          <button (click)="mode = 'new'" class="flex-1 px-4 py-3 text-sm font-medium flex items-center justify-center gap-2 transition-colors"
                  [class.bg-white]="mode === 'new'" [class.text-green-700]="mode === 'new'" [class.border-b-2]="mode === 'new'" [class.border-green-600]="mode === 'new'"
                  [class.bg-gray-50]="mode !== 'new'" [class.text-gray-500]="mode !== 'new'">
            <span class="material-icons text-sm">person_add</span>
            مضمون جديد / Nouveau assuré
          </button>
        </div>

        <!-- EXISTING: Search Section -->
        <div *ngIf="mode === 'existing'" class="p-6 border-b border-gray-200 bg-gray-50">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 items-end">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">رقم الإنخراط / N° Affiliation</label>
              <div class="flex gap-2">
                <input [(ngModel)]="institutionNum" type="text" placeholder="64759"
                       class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-center"
                       (blur)="loadByAffiliation()">
                <input [(ngModel)]="branche" type="text" placeholder="60" maxlength="2"
                       class="w-16 border border-gray-300 rounded-lg px-3 py-2 text-center"
                       (blur)="loadByAffiliation()">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">المضمون / Assuré</label>
              <select [(ngModel)]="selectedAgentId" (change)="onAgentChange()" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                <option value="">-- اختيار المضمون --</option>
                <option *ngFor="let a of agents" [value]="a.id">{{ a.prenom }} {{ a.nom }} — {{ a.numInscription }}</option>
              </select>
            </div>
            <div>
              <button (click)="loadDocuments()" [disabled]="!selectedAgentId || loading"
                      class="w-full bg-rose-600 hover:bg-rose-500 text-white px-6 py-2 rounded-lg flex items-center justify-center gap-2 disabled:opacity-50">
                <span class="material-icons" [class.animate-spin]="loading">{{ loading ? 'sync' : 'search' }}</span>
                بحث
              </button>
            </div>
          </div>
          <div *ngIf="selectedInstitution" class="mt-3 text-sm text-gray-600">
            <span class="font-medium text-rose-700">{{ selectedInstitution.raisonSociale }}</span>
            <span class="mx-2">·</span>
            <span>{{ selectedInstitution.adresse }}</span>
          </div>
        </div>

        <!-- NEW: Scan first, then fill form -->
        <div *ngIf="mode === 'new'" class="p-6 bg-green-50 border-b border-green-200">
          <p class="text-sm text-green-800 mb-4 flex items-center gap-2">
            <span class="material-icons">info</span>
            أودع وثائق المضمون الجديد (بطاقة تعريف، شهادة أجر، مقرر إلحاق...) ثم استخرج البيانات تلقائيا
          </p>

          <!-- Institution -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 items-end mb-4">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">رقم الإنخراط / N° Affiliation</label>
              <div class="flex gap-2">
                <input [(ngModel)]="institutionNum" type="text" placeholder="64759"
                       class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-center"
                       (keyup.enter)="loadByAffiliation()" (blur)="loadByAffiliation()">
                <input [(ngModel)]="branche" type="text" placeholder="60" maxlength="2"
                       class="w-16 border border-gray-300 rounded-lg px-3 py-2 text-center"
                       (keyup.enter)="loadByAffiliation()" (blur)="loadByAffiliation()">
                <button (click)="loadByAffiliation()" class="bg-rose-600 hover:bg-rose-500 text-white px-3 py-2 rounded-lg">
                  <span class="material-icons text-sm">search</span>
                </button>
              </div>
            </div>
            <div *ngIf="selectedInstitution" class="text-sm text-gray-600 py-2">
              <span class="material-icons text-green-600 text-sm align-middle">check_circle</span>
              <span class="font-medium text-rose-700">{{ selectedInstitution.raisonSociale }}</span>
              <span class="mx-1">·</span>
              <span>{{ selectedInstitution.adresse }}</span>
            </div>
          </div>

          <!-- Add documents -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 items-end mb-4">
            <div>
              <label class="block text-sm font-medium text-gray-600 mb-1">ملفات / Fichiers (CIN, Attestation, Moqarer...)</label>
              <input type="file" #fileInput (change)="onMultiFileSelected($event)" accept="image/*,.pdf" multiple
                     class="w-full border border-gray-300 rounded-lg px-3 py-1.5 text-sm bg-white file:mr-3 file:py-1 file:px-3 file:rounded file:border-0 file:bg-green-50 file:text-green-700 file:text-sm file:font-medium">
              <p class="text-xs text-purple-600 mt-1 flex items-center gap-1">
                <span class="material-icons text-xs">smart_toy</span>
                النوع يتم كشفه تلقائيا بالذكاء الاصطناعي / Type détecté automatiquement par IA
              </p>
            </div>
            <div>
              <button (click)="addFilesToPending()" [disabled]="selectedFiles.length === 0"
                      class="w-full bg-teal-600 hover:bg-teal-500 text-white px-4 py-2 rounded-lg flex items-center justify-center gap-2 disabled:opacity-50 text-sm">
                <span class="material-icons text-sm">add_circle</span>
                إضافة {{ selectedFiles.length }} ملف / Ajouter
              </button>
            </div>
          </div>

          <!-- Pending files list -->
          <div *ngIf="pendingFiles.length > 0" class="mb-4 bg-white rounded-lg border border-green-200 overflow-hidden">
            <div class="bg-green-100 px-4 py-2 text-sm font-medium text-green-800 flex items-center gap-2">
              <span class="material-icons text-sm">attach_file</span>
              الوثائق المرفقة / Documents joints ({{ pendingFiles.length }})
            </div>
            <div class="divide-y divide-gray-100">
              <div *ngFor="let pf of pendingFiles; let i = index" class="flex items-center justify-between px-4 py-2 text-sm">
                <div class="flex items-center gap-2">
                  <span class="material-icons text-green-600 text-sm">check_circle</span>
                  <span class="font-medium">{{ pf.file.name }}</span>
                  <span class="bg-rose-100 text-rose-700 px-2 py-0.5 rounded text-xs">{{ getTypeLabel(pf.type) }}</span>
                  <span class="text-gray-400 text-xs">{{ formatSize(pf.file.size) }}</span>
                </div>
                <button (click)="pendingFiles.splice(i, 1)" class="text-red-400 hover:text-red-600">
                  <span class="material-icons text-sm">close</span>
                </button>
              </div>
            </div>
          </div>

          <!-- Scan all button -->
          <button (click)="scanAllPending()" [disabled]="pendingFiles.length === 0 || extracting"
                  class="bg-purple-600 hover:bg-purple-500 text-white px-6 py-2.5 rounded-lg flex items-center gap-2 disabled:opacity-50">
            <span class="material-icons" [class.animate-spin]="extracting">{{ extracting ? 'sync' : 'document_scanner' }}</span>
            مسح واستخراج البيانات من {{ pendingFiles.length }} وثيقة / Scanner {{ pendingFiles.length }} document(s)
          </button>

          <div *ngIf="uploadMessage" class="mt-3 p-2 rounded text-sm"
               [class.bg-green-100]="!uploadError" [class.text-green-700]="!uploadError"
               [class.bg-red-50]="uploadError" [class.text-red-700]="uploadError">
            {{ uploadMessage }}
          </div>
        </div>
      </div>

      <!-- NEW AGENT: Dossier Form (auto-filled from AI) -->
      <div *ngIf="mode === 'new' && showNewForm" class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-green-700 text-white px-5 py-3 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <span class="material-icons">assignment_ind</span>
            <span class="font-bold">استمارة تسجيل مضمون جديد / Formulaire nouveau dossier</span>
          </div>
          <div *ngIf="extractionResult" class="text-xs bg-green-600 px-3 py-1 rounded-full flex items-center gap-1">
            <span class="material-icons text-xs">smart_toy</span>
            IA: {{ extractionResult.confidence | number:'1.0-0' }}%
          </div>
        </div>
        <div class="p-6">
          <!-- Section: Assure Info -->
          <div class="mb-4">
            <h3 class="text-sm font-bold text-gray-700 mb-3 flex items-center gap-2">
              <span class="material-icons text-sm text-blue-600">person</span>
              معلومات المضمون / Informations de l'assuré
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">رقم التسجيل / N° Inscription *</label>
                <input [(ngModel)]="newAgent.numInscription" type="text" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.numInscription" [class.bg-green-50]="newAgent.numInscription">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">الاسم / Nom *</label>
                <input [(ngModel)]="newAgent.nom" type="text" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.nom" [class.bg-green-50]="newAgent.nom">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">اللقب / Prénom *</label>
                <input [(ngModel)]="newAgent.prenom" type="text" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.prenom" [class.bg-green-50]="newAgent.prenom">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">ب.ت.و / CIN</label>
                <input [(ngModel)]="newAgent.cin" type="text" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.cin" [class.bg-green-50]="newAgent.cin">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">تاريخ الولادة / Date Naissance</label>
                <input [(ngModel)]="newAgent.dateNaissance" type="date" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.dateNaissance" [class.bg-green-50]="newAgent.dateNaissance">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">تاريخ الإلحاق / Date Ilhaq</label>
                <input [(ngModel)]="newAgent.dateDebutIlhaq" type="date" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.dateDebutIlhaq" [class.bg-green-50]="newAgent.dateDebutIlhaq">
              </div>
              <div class="md:col-span-2">
                <label class="block text-xs font-medium text-gray-500 mb-1">العنوان / Adresse</label>
                <input [(ngModel)]="newAgent.adresse" type="text" class="w-full border rounded-lg px-3 py-2 text-sm"
                       [class.border-green-400]="newAgent.adresse" [class.bg-green-50]="newAgent.adresse">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">الهاتف / Téléphone</label>
                <input [(ngModel)]="newAgent.telephone" type="text" class="w-full border rounded-lg px-3 py-2 text-sm">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1 flex items-center gap-1">
                  <span class="material-icons text-xs text-blue-500">email</span>
                  البريد الإلكتروني للمضمون / Email assuré
                </label>
                <input [(ngModel)]="newAgent.email" type="email" placeholder="assure@email.com" class="w-full border rounded-lg px-3 py-2 text-sm">
              </div>
            </div>
          </div>

          <!-- Section: Employer Info -->
          <div class="mb-4 pt-4 border-t border-gray-200">
            <h3 class="text-sm font-bold text-gray-700 mb-3 flex items-center gap-2">
              <span class="material-icons text-sm text-orange-600">business</span>
              معلومات المشغّل / Informations employeur
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">المؤسسة / Institution</label>
                <input [value]="extractedInstitution.raisonSociale || selectedInstitution?.raisonSociale || ''" readonly
                       class="w-full border rounded-lg px-3 py-2 text-sm bg-gray-50 text-gray-600">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">رقم الإنخراط / N° Affiliation</label>
                <input [value]="institutionNum + (branche ? '/' + branche : '')" readonly
                       class="w-full border rounded-lg px-3 py-2 text-sm bg-gray-50 text-gray-600">
              </div>
              <div>
                <label class="block text-xs font-medium text-gray-500 mb-1 flex items-center gap-1">
                  <span class="material-icons text-xs text-orange-500">email</span>
                  البريد الإلكتروني للمشغّل / Email employeur
                </label>
                <input [(ngModel)]="employerEmail" type="email" placeholder="employeur@email.com" class="w-full border rounded-lg px-3 py-2 text-sm">
              </div>
            </div>
          </div>

          <!-- SAVE SECTION - prominent -->
          <div class="mt-4 p-4 bg-green-50 border-2 border-green-300 rounded-xl">
            <div class="flex flex-wrap items-center justify-between gap-3">
              <div class="text-sm text-green-800">
                <span class="material-icons text-sm align-middle">info</span>
                اضغط على "حفظ" لتسجيل البيانات والوثائق / Cliquez sur "Enregistrer" pour sauvegarder
              </div>
              <div class="flex items-center gap-3">
                <button (click)="saveAndStay()" [disabled]="saving || (!newAgent.nom && !newAgent.prenom)"
                        class="bg-green-700 hover:bg-green-600 text-white px-10 py-3 rounded-lg flex items-center gap-2 disabled:opacity-50 font-bold text-base shadow-lg">
                  <span class="material-icons" [class.animate-spin]="saving">{{ saving ? 'sync' : 'save' }}</span>
                  {{ saving ? 'جاري الحفظ...' : 'حفظ / Enregistrer' }}
                </button>
                <button (click)="openDossier()" [disabled]="saving || (!newAgent.nom && !newAgent.prenom)"
                        class="bg-rose-700 hover:bg-rose-600 text-white px-6 py-3 rounded-lg flex items-center gap-2 disabled:opacity-50 font-medium">
                  <span class="material-icons">description</span>
                  فتح قرار إحالة
                </button>
                <button (click)="resetNewAgent()" [disabled]="saving" class="bg-gray-200 hover:bg-gray-300 text-gray-700 px-4 py-3 rounded-lg text-sm">
                  إلغاء
                </button>
              </div>
            </div>
          </div>
          <!-- Save status message -->
          <div *ngIf="saveMessage" class="mt-3 p-3 rounded-lg text-sm font-medium"
               [class.bg-green-50]="!saveError" [class.text-green-700]="!saveError"
               [class.bg-red-50]="saveError" [class.text-red-700]="saveError">
            {{ saveMessage }}
          </div>
        </div>
      </div>

      <!-- Agent Info + Upload Panel -->
      <div *ngIf="selectedAgent" class="grid grid-cols-1 lg:grid-cols-3 gap-6">

        <!-- Agent Card (Editable) -->
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
          <div class="bg-gray-800 text-white px-4 py-3 flex items-center justify-between">
            <div class="flex items-center gap-2">
              <span class="material-icons">person</span>
              <span class="font-bold">بطاقة المضمون</span>
            </div>
            <button (click)="saveSelectedAgent()" class="bg-green-600 hover:bg-green-500 text-white px-3 py-1 rounded text-xs flex items-center gap-1">
              <span class="material-icons text-xs">save</span> حفظ
            </button>
          </div>
          <div class="p-4 space-y-2 text-sm" dir="rtl">
            <div>
              <label class="text-xs text-gray-500">رقم التسجيل</label>
              <input [(ngModel)]="selectedAgent.numInscription" class="w-full border rounded px-2 py-1 text-sm font-mono font-bold text-rose-700">
            </div>
            <div class="grid grid-cols-2 gap-2">
              <div>
                <label class="text-xs text-gray-500">اللقب / Nom</label>
                <input [(ngModel)]="selectedAgent.nom" class="w-full border rounded px-2 py-1 text-sm">
              </div>
              <div>
                <label class="text-xs text-gray-500">الاسم / Prénom</label>
                <input [(ngModel)]="selectedAgent.prenom" class="w-full border rounded px-2 py-1 text-sm">
              </div>
            </div>
            <div>
              <label class="text-xs text-gray-500">ب.ت.و / CIN</label>
              <input [(ngModel)]="selectedAgent.cin" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div>
              <label class="text-xs text-gray-500">تاريخ الولادة</label>
              <input [(ngModel)]="selectedAgent.dateNaissance" type="date" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div>
              <label class="text-xs text-gray-500">تاريخ الإلحاق</label>
              <input [(ngModel)]="selectedAgent.dateDebutIlhaq" type="date" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div>
              <label class="text-xs text-gray-500">العنوان / Adresse</label>
              <input [(ngModel)]="selectedAgent.adresse" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div>
              <label class="text-xs text-gray-500 flex items-center gap-1">
                <span class="material-icons text-xs text-blue-500">email</span> البريد / Email assuré
              </label>
              <input [(ngModel)]="selectedAgent.email" type="email" placeholder="assure@email.com" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div>
              <label class="text-xs text-gray-500 flex items-center gap-1">
                <span class="material-icons text-xs text-blue-500">phone</span> الهاتف / Téléphone
              </label>
              <input [(ngModel)]="selectedAgent.telephone" type="text" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <!-- Employer email -->
            <div class="pt-2 border-t">
              <label class="text-xs text-gray-500 flex items-center gap-1">
                <span class="material-icons text-xs text-orange-500">email</span> بريد المشغّل / Email employeur
              </label>
              <input [(ngModel)]="selectedAgent.institution.email" type="email" placeholder="employeur@email.com"
                     *ngIf="selectedAgent.institution" class="w-full border rounded px-2 py-1 text-sm">
            </div>
            <div class="flex justify-between items-center pt-1 border-t">
              <span class="text-gray-500">الوثائق</span>
              <span class="bg-rose-100 text-rose-700 px-2 py-0.5 rounded-full text-xs font-bold">{{ documents.length }}</span>
            </div>
          </div>
        </div>

        <!-- Upload Panel -->
        <div class="lg:col-span-2 bg-white rounded-xl shadow-lg overflow-hidden">
          <div class="bg-teal-700 text-white px-4 py-3 flex items-center gap-2">
            <span class="material-icons">cloud_upload</span>
            <span class="font-bold">إيداع وثيقة جديدة / Déposer un document</span>
          </div>
          <div class="p-5">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <label class="block text-sm font-medium text-gray-600 mb-1">نوع الوثيقة / Type</label>
                <select [(ngModel)]="uploadType" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                  <option value="DECLARATION">إعلام - Déclaration</option>
                  <option value="ATTESTATION_SALAIRE">شهادة في الأجر - Attestation Salaire</option>
                  <option value="MOGARER_IAALEM">مقرر الإعلام - Mogarer</option>
                  <option value="ARRETE_DISPONIBILITE">قرار عدم المباشرة - Arrêté</option>
                  <option value="CIN">بطاقة التعريف - CIN</option>
                  <option value="AUTRE">أخرى - Autre</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-600 mb-1">الملف / Fichier</label>
                <input type="file" (change)="onFileSelected($event)" accept="image/*,.pdf"
                       class="w-full border border-gray-300 rounded-lg px-3 py-1.5 text-sm file:mr-3 file:py-1 file:px-3 file:rounded file:border-0 file:bg-rose-50 file:text-rose-700 file:text-sm file:font-medium">
              </div>
            </div>

            <!-- Buttons row -->
            <div class="flex flex-wrap gap-3">
              <button (click)="uploadDocument()" [disabled]="!selectedFile || uploading"
                      class="bg-teal-600 hover:bg-teal-500 text-white px-5 py-2 rounded-lg flex items-center gap-2 disabled:opacity-50 text-sm">
                <span class="material-icons text-sm" [class.animate-spin]="uploading">{{ uploading ? 'sync' : 'cloud_upload' }}</span>
                إيداع / Déposer
              </button>
              <button (click)="uploadAndExtract()" [disabled]="!selectedFile || extracting"
                      class="bg-purple-600 hover:bg-purple-500 text-white px-5 py-2 rounded-lg flex items-center gap-2 disabled:opacity-50 text-sm">
                <span class="material-icons text-sm" [class.animate-spin]="extracting">{{ extracting ? 'sync' : 'smart_toy' }}</span>
                إيداع + استخراج IA / Déposer + Extraire
              </button>
            </div>

            <!-- Upload message -->
            <div *ngIf="uploadMessage" class="mt-3 p-2 rounded text-sm"
                 [class.bg-green-50]="!uploadError" [class.text-green-700]="!uploadError"
                 [class.bg-red-50]="uploadError" [class.text-red-700]="uploadError">
              {{ uploadMessage }}
            </div>
          </div>
        </div>
      </div>

      <!-- AI Extraction Result -->
      <div *ngIf="extractionResult" class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-purple-700 text-white px-4 py-3 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <span class="material-icons">smart_toy</span>
            <span class="font-bold">نتائج الاستخراج الذكي / Résultats IA</span>
          </div>
          <div class="flex items-center gap-3">
            <span class="text-sm bg-purple-600 px-3 py-1 rounded-full">
              {{ extractionResult.document_type }} · {{ extractionResult.confidence | number:'1.0-0' }}%
            </span>
            <button (click)="applyExtraction()" class="bg-green-500 hover:bg-green-400 text-white px-4 py-1.5 rounded-lg text-sm flex items-center gap-1">
              <span class="material-icons text-sm">auto_fix_high</span>
              تطبيق / Appliquer
            </button>
            <button (click)="extractionResult = null" class="bg-gray-500 hover:bg-gray-400 text-white px-3 py-1.5 rounded-lg text-sm">✕</button>
          </div>
        </div>
        <div class="p-5">
          <!-- Warnings -->
          <div *ngIf="extractionResult.warnings.length > 0" class="mb-3 p-2 bg-yellow-50 border border-yellow-200 rounded text-yellow-700 text-sm">
            <span class="material-icons text-sm align-middle">warning</span>
            <span *ngFor="let w of extractionResult.warnings">{{ w }}</span>
          </div>
          <!-- Extracted fields -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
            <div *ngFor="let field of extractedFields" class="border rounded-lg p-3 bg-gray-50">
              <div class="text-xs text-gray-500 mb-1">{{ field.label }}</div>
              <div class="font-medium text-gray-800">{{ field.value }}</div>
            </div>
          </div>
          <!-- Raw text preview -->
          <details class="mt-4">
            <summary class="text-sm text-gray-500 cursor-pointer hover:text-gray-700">النص الخام / Texte brut OCR</summary>
            <pre class="mt-2 p-3 bg-gray-100 rounded text-xs overflow-auto max-h-40 whitespace-pre-wrap" dir="ltr">{{ extractionResult.raw_text }}</pre>
          </details>
        </div>
      </div>

      <!-- Combined Extraction Results -->
      <div *ngIf="combinedExtraction && selectedAgent" class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-indigo-700 text-white px-4 py-3 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <span class="material-icons">auto_awesome</span>
            <span class="font-bold">نتائج الاستخراج الشامل / Extraction complète ({{ combinedExtraction.docCount }} documents)</span>
          </div>
          <div class="flex items-center gap-2">
            <button (click)="applyCombinedExtraction()" class="bg-green-500 hover:bg-green-400 text-white px-4 py-1.5 rounded-lg text-sm flex items-center gap-1">
              <span class="material-icons text-sm">auto_fix_high</span>
              تطبيق الكل / Appliquer tout
            </button>
            <button (click)="combinedExtraction = null" class="bg-gray-500 hover:bg-gray-400 text-white px-3 py-1.5 rounded-lg text-sm">✕</button>
          </div>
        </div>
        <div class="p-5">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
            <div *ngFor="let field of combinedExtraction.fields" class="border rounded-lg p-3"
                 [class.bg-blue-50]="field.source === 'cin'" [class.border-blue-200]="field.source === 'cin'"
                 [class.bg-green-50]="field.source === 'attestation_salaire'" [class.border-green-200]="field.source === 'attestation_salaire'"
                 [class.bg-purple-50]="field.source === 'decision_affectation'" [class.border-purple-200]="field.source === 'decision_affectation'"
                 [class.bg-orange-50]="field.source === 'attestation_affiliation'" [class.border-orange-200]="field.source === 'attestation_affiliation'"
                 [class.bg-gray-50]="!field.source">
              <div class="text-xs text-gray-500 mb-1 flex items-center gap-1">
                {{ field.label }}
                <span class="text-[10px] px-1.5 py-0.5 rounded-full"
                      [class.bg-blue-200]="field.source === 'cin'"
                      [class.bg-green-200]="field.source === 'attestation_salaire'"
                      [class.bg-purple-200]="field.source === 'decision_affectation'"
                      [class.bg-orange-200]="field.source === 'attestation_affiliation'">
                  {{ field.sourceLabel }}
                </span>
              </div>
              <div class="font-medium text-gray-800">{{ field.value }}</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Documents List -->
      <div *ngIf="selectedAgent" class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-blue-800 text-white px-4 py-3 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <span class="material-icons">inventory_2</span>
            <span class="font-bold">الوثائق المودعة / Documents déposés</span>
            <span class="bg-blue-600 px-2 py-0.5 rounded-full text-xs mr-2">{{ documents.length }}</span>
          </div>
          <button *ngIf="documents.length > 0" (click)="scanAllDocuments()" [disabled]="scanningAll"
                  class="bg-purple-600 hover:bg-purple-500 text-white px-4 py-1.5 rounded-lg text-sm flex items-center gap-1 disabled:opacity-50">
            <span class="material-icons text-sm" [class.animate-spin]="scanningAll">{{ scanningAll ? 'sync' : 'smart_toy' }}</span>
            {{ scanningAll ? 'جاري المسح...' : 'مسح واستخراج الكل / Scanner tout IA' }}
          </button>
        </div>

        <div *ngIf="documents.length === 0" class="p-8 text-center text-gray-400">
          <span class="material-icons text-5xl mb-2">folder_off</span>
          <p>لا توجد وثائق مودعة لهذا المضمون</p>
          <p class="text-sm">Aucun document déposé pour cet assuré</p>
        </div>

        <div class="divide-y divide-gray-100">
          <div *ngFor="let doc of documents; let i = index"
               class="flex items-center justify-between px-5 py-3 hover:bg-gray-50 transition-colors">
            <div class="flex items-center gap-3">
              <div class="w-10 h-10 rounded-lg flex items-center justify-center"
                   [class.bg-blue-100]="doc.contentType?.includes('pdf')"
                   [class.text-blue-600]="doc.contentType?.includes('pdf')"
                   [class.bg-green-100]="doc.contentType?.includes('image')"
                   [class.text-green-600]="doc.contentType?.includes('image')"
                   [class.bg-gray-100]="!doc.contentType?.includes('pdf') && !doc.contentType?.includes('image')"
                   [class.text-gray-600]="!doc.contentType?.includes('pdf') && !doc.contentType?.includes('image')">
                <span class="material-icons">{{ doc.contentType?.includes('pdf') ? 'picture_as_pdf' : 'image' }}</span>
              </div>
              <div>
                <p class="font-medium text-gray-800 text-sm">{{ doc.nomFichier }}</p>
                <div class="flex items-center gap-2 text-xs text-gray-500">
                  <span class="bg-rose-100 text-rose-700 px-2 py-0.5 rounded">{{ getTypeLabel(doc.typeDocument) }}</span>
                  <span>{{ formatSize(doc.taille) }}</span>
                  <span>{{ doc.createdAt | date:'yyyy-MM-dd HH:mm' }}</span>
                </div>
              </div>
            </div>
            <div class="flex items-center gap-1">
              <button (click)="previewDocument(doc)" class="p-2 text-blue-600 hover:bg-blue-50 rounded-lg" title="معاينة">
                <span class="material-icons text-sm">visibility</span>
              </button>
              <button (click)="downloadDocument(doc)" class="p-2 text-green-600 hover:bg-green-50 rounded-lg" title="تحميل">
                <span class="material-icons text-sm">download</span>
              </button>
              <button (click)="extractFromDocument(doc)" class="p-2 text-purple-600 hover:bg-purple-50 rounded-lg" title="استخراج IA">
                <span class="material-icons text-sm">smart_toy</span>
              </button>
              <button (click)="deleteDocument(doc, i)" class="p-2 text-red-600 hover:bg-red-50 rounded-lg" title="حذف">
                <span class="material-icons text-sm">delete</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Error -->
      <div *ngIf="error" class="p-3 bg-red-50 border border-red-200 rounded-lg text-red-700 text-sm">{{ error }}</div>
    </div>
  `
})
export class GedDossierComponent {
  mode: 'existing' | 'new' = 'existing';
  institutionNum = '';
  branche = '';
  selectedInstitution: any = null;
  agents: AgentPublic[] = [];
  selectedAgentId = '';
  selectedAgent: AgentPublic | null = null;
  documents: DocumentGed[] = [];
  loading = false;
  error = '';

  // Upload
  uploadType = 'DECLARATION';
  selectedFile: File | null = null;
  uploading = false;
  uploadMessage = '';
  uploadError = false;

  // AI
  extracting = false;
  extractionResult: ExtractionResult | null = null;
  extractedFields: { label: string; value: string }[] = [];
  scanningAll = false;
  combinedExtraction: { fields: { label: string; value: string; source: string; sourceLabel: string; key: string }[]; data: any; docCount: number } | null = null;

  // New agent mode
  showNewForm = false;
  saving = false;
  saveMessage = '';
  saveError = false;
  pendingFiles: { file: File; type: string }[] = [];
  selectedFiles: File[] = [];
  newAgent: Partial<AgentPublic> = this.emptyAgent();
  extractedSalary: { salaire?: string; dateEffet?: string; periode?: string; employeur?: string } = {};
  extractedInstitution: { raisonSociale?: string; numAffiliation?: string; branche?: string } = {};
  employerEmail = '';

  private typeLabels: { [key: string]: string } = {
    'DECLARATION': 'إعلام',
    'ATTESTATION_SALAIRE': 'شهادة في الأجر',
    'MOGARER_IAALEM': 'مقرر الإعلام',
    'ARRETE_DISPONIBILITE': 'قرار عدم المباشرة',
    'CIN': 'بطاقة التعريف',
    'AUTRE': 'أخرى',
    'AUTO': 'تلقائي - Auto'
  };

  private fieldLabels: { [key: string]: string } = {
    'numeroCIN': 'رقم ب.ت.و / N° CIN',
    'nomPrenom': 'الاسم واللقب / Nom Prénom',
    'dateNaissance': 'تاريخ الولادة / Date Naissance',
    'lieuNaissance': 'مكان الولادة / Lieu Naissance',
    'adresse': 'العنوان / Adresse',
    'numAffiliation': 'رقم الإنخراط / N° Affiliation',
    'numInscription': 'رقم التسجيل / N° Inscription',
    'salaireBrut': 'الأجر الخام / Salaire Brut',
    'salaireNet': 'الأجر الصافي / Salaire Net',
    'employeur': 'المشغل / Employeur',
    'periode': 'الفترة / Période',
    'dateEffet': 'تاريخ المفعول / Date Effet',
    'dateDocument': 'تاريخ الوثيقة / Date Document',
    'matricule': 'المعرّف / Matricule',
    'dates_trouvees': 'تواريخ / Dates',
    'montants_trouves': 'مبالغ / Montants',
    'numeros_trouves': 'أرقام / Numéros',
    'salaire': 'الأجر / Salaire',
    'institution': 'المؤسسة / Institution'
  };

  constructor(
    private institutionService: InstitutionService,
    private agentService: AgentService,
    private documentService: DocumentService,
    private router: Router,
    private gedSharedData: GedSharedDataService
  ) {}

  loadByAffiliation(): void {
    if (!this.institutionNum) return;
    this.error = '';
    this.institutionService.findAll().subscribe({
      next: (institutions: any[]) => {
        let filtered = institutions.filter(i => i.numAffiliation === this.institutionNum);
        if (this.branche) filtered = filtered.filter(i => i.brancheSociale === this.branche);
        if (filtered.length > 0) {
          this.selectedInstitution = filtered[0];
          this.agentService.findByInstitution(this.selectedInstitution.id).subscribe({
            next: (agents) => { this.agents = agents; },
            error: () => { this.error = 'خطأ في تحميل الأعوان'; }
          });
        } else {
          this.error = 'مؤسسة غير موجودة';
          this.selectedInstitution = null;
          this.agents = [];
        }
      },
      error: () => { this.error = 'خطأ في البحث'; }
    });
  }

  onAgentChange(): void {
    if (this.selectedAgentId) {
      this.selectedAgent = this.agents.find(a => a.id === +this.selectedAgentId) || null;
      this.loadDocuments();
    } else {
      this.selectedAgent = null;
      this.documents = [];
    }
  }

  loadDocuments(): void {
    if (!this.selectedAgent?.id) return;
    this.loading = true;
    this.documentService.findByAgent(this.selectedAgent.id).subscribe({
      next: (docs) => {
        this.documents = docs;
        this.loading = false;
      },
      error: () => {
        this.error = 'خطأ في تحميل الوثائق';
        this.loading = false;
      }
    });
  }

  onFileSelected(event: any): void {
    this.selectedFile = event.target.files?.[0] || null;
    this.uploadMessage = '';
  }

  uploadDocument(): void {
    if (!this.selectedFile || !this.selectedAgent?.id) return;
    this.uploading = true;
    this.uploadMessage = '';
    this.uploadError = false;

    this.documentService.upload(this.selectedAgent.id, this.uploadType, this.selectedFile).subscribe({
      next: (doc) => {
        this.documents.unshift(doc);
        this.uploadMessage = 'تم إيداع الوثيقة بنجاح - Document déposé avec succès';
        this.uploading = false;
        this.selectedFile = null;
      },
      error: (err) => {
        this.uploadMessage = 'خطأ في الإيداع - Erreur de dépôt';
        this.uploadError = true;
        this.uploading = false;
        console.error(err);
      }
    });
  }

  uploadAndExtract(): void {
    if (!this.selectedFile || !this.selectedAgent?.id) return;
    this.uploading = true;
    this.extracting = true;
    this.uploadMessage = '';
    this.uploadError = false;
    this.extractionResult = null;

    const file = this.selectedFile;
    const aiDocType = this.mapTypeToAI(this.uploadType);

    // Upload first
    this.documentService.upload(this.selectedAgent.id, this.uploadType, file).subscribe({
      next: (doc) => {
        this.documents.unshift(doc);
        this.uploadMessage = 'تم الإيداع - جاري الاستخراج... / Déposé - Extraction en cours...';
        this.uploading = false;

        // Then extract
        this.documentService.extractFromFile(file, aiDocType).subscribe({
          next: (result) => {
            this.extractionResult = result;
            this.extractedFields = this.buildFieldList(result.extracted_data);
            this.extracting = false;
            this.uploadMessage = 'تم الإيداع والاستخراج بنجاح';
          },
          error: () => {
            this.extracting = false;
            this.uploadMessage = 'تم الإيداع - فشل الاستخراج / Déposé - Extraction échouée';
            this.uploadError = true;
          }
        });
      },
      error: () => {
        this.uploadMessage = 'خطأ في الإيداع';
        this.uploadError = true;
        this.uploading = false;
        this.extracting = false;
      }
    });
  }

  extractFromDocument(doc: DocumentGed): void {
    if (!doc.id) return;
    this.extracting = true;
    this.extractionResult = null;

    this.documentService.download(doc.id).subscribe({
      next: (blob) => {
        const file = new File([blob], doc.nomFichier, { type: doc.contentType || 'application/octet-stream' });
        const aiDocType = this.mapTypeToAI(doc.typeDocument);

        this.documentService.extractFromFile(file, aiDocType).subscribe({
          next: (result) => {
            this.extractionResult = result;
            this.extractedFields = this.buildFieldList(result.extracted_data);
            this.extracting = false;
          },
          error: () => {
            this.error = 'فشل الاستخراج الذكي';
            this.extracting = false;
          }
        });
      },
      error: () => {
        this.error = 'خطأ في تحميل الوثيقة';
        this.extracting = false;
      }
    });
  }

  applyExtraction(): void {
    if (!this.extractionResult || !this.selectedAgent) return;
    const data = this.extractionResult.extracted_data;

    // Auto-fill agent fields from extraction
    if (data['numeroCIN']) this.selectedAgent.cin = data['numeroCIN'];
    if (data['adresse']) this.selectedAgent.adresse = data['adresse'];
    if (data['dateNaissance']) {
      this.selectedAgent.dateNaissance = this.convertDate(data['dateNaissance']);
    }
    if (data['nomPrenom']) {
      const parts = data['nomPrenom'].split(' ');
      if (parts.length >= 2) {
        this.selectedAgent.prenom = parts[0];
        this.selectedAgent.nom = parts.slice(1).join(' ');
      }
    }
    if (data['numInscription']) this.selectedAgent.numInscription = data['numInscription'];
    if (data['dateEffet']) {
      this.selectedAgent.dateDebutIlhaq = this.convertDate(data['dateEffet']);
    }

    this.saveSelectedAgent();
  }

  saveSelectedAgent(): void {
    if (!this.selectedAgent?.id) return;
    // Build a clean DTO without computed/transient fields
    const dto: any = {
      numInscription: this.selectedAgent.numInscription || '',
      nom: this.selectedAgent.nom || '',
      prenom: this.selectedAgent.prenom || '',
      nomFr: this.selectedAgent.nom || '',
      prenomFr: this.selectedAgent.prenom || '',
      cin: this.selectedAgent.cin || '',
      dateNaissance: this.selectedAgent.dateNaissance || null,
      adresse: this.selectedAgent.adresse || '',
      email: this.selectedAgent.email || '',
      telephone: this.selectedAgent.telephone || '',
      dateDebutIlhaq: this.selectedAgent.dateDebutIlhaq || null,
      dateFinIlhaq: this.selectedAgent.dateFinIlhaq || null,
      actif: this.selectedAgent.actif ?? true,
      institution: this.selectedAgent.institution ? { id: this.selectedAgent.institution.id } : null
    };
    // Save institution email if changed
    if (this.selectedAgent.institution?.id && this.selectedAgent.institution.email) {
      const instDto: any = {
        numAffiliation: this.selectedAgent.institution.numAffiliation || '',
        brancheSociale: this.selectedAgent.institution.brancheSociale || '',
        raisonSociale: this.selectedAgent.institution.raisonSociale || '',
        adresse: this.selectedAgent.institution.adresse || '',
        telephone: this.selectedAgent.institution.telephone || '',
        email: this.selectedAgent.institution.email || '',
        gouvernorat: this.selectedAgent.institution.gouvernorat || '',
        actif: this.selectedAgent.institution.actif ?? true
      };
      this.institutionService.update(this.selectedAgent.institution.id, instDto).subscribe();
    }
    this.agentService.update(this.selectedAgent.id, dto).subscribe({
      next: (updated) => {
        this.selectedAgent = updated;
        // Refresh agent in the list
        const idx = this.agents.findIndex(a => a.id === updated.id);
        if (idx >= 0) this.agents[idx] = updated;
        this.uploadMessage = 'تم حفظ البيانات بنجاح - Données sauvegardées';
        this.uploadError = false;
      },
      error: (err) => {
        console.error('Agent update error:', err);
        this.uploadMessage = 'فشل الحفظ / Erreur de sauvegarde: ' + (err.error?.message || err.message || '');
        this.uploadError = true;
      }
    });
  }

  scanAllDocuments(): void {
    if (!this.selectedAgent || this.documents.length === 0) return;
    this.scanningAll = true;
    this.combinedExtraction = null;
    this.uploadMessage = 'جاري مسح جميع الوثائق... / Scan de tous les documents en cours...';
    this.uploadError = false;

    const sourceLabels: { [key: string]: string } = {
      'cin': 'بطاقة التعريف / CIN',
      'attestation_salaire': 'شهادة في الأجر / Att. Salaire',
      'decision_affectation': 'قرار إحالة / Décision',
      'attestation_affiliation': 'إعلام / Déclaration',
      'contrat': 'عقد / Contrat',
      'generic': 'أخرى / Autre'
    };

    const allData: { [key: string]: { value: string; source: string; sourceLabel: string } } = {};
    let processed = 0;
    let errors = 0;
    const total = this.documents.length;

    const finalize = () => {
      if (processed + errors < total) return;
      this.scanningAll = false;
      // Build combined fields
      const fields = Object.entries(allData).map(([key, info]) => ({
        key,
        label: this.fieldLabels[key] || key,
        value: info.value,
        source: info.source,
        sourceLabel: info.sourceLabel
      }));
      this.combinedExtraction = { fields, data: allData, docCount: processed };
      this.uploadMessage = `تم مسح ${processed} وثيقة بنجاح` + (errors > 0 ? ` (${errors} خطأ)` : '') + ` / ${processed} document(s) scanné(s)`;
      this.uploadError = errors > 0 && processed === 0;
    };

    this.documents.forEach(doc => {
      if (!doc.id) { errors++; finalize(); return; }
      this.documentService.download(doc.id).subscribe({
        next: (blob) => {
          const file = new File([blob], doc.nomFichier, { type: doc.contentType || 'application/octet-stream' });
          const aiDocType = this.mapTypeToAI(doc.typeDocument);
          this.documentService.extractFromFile(file, aiDocType).subscribe({
            next: (result) => {
              const docType = result.document_type || 'generic';
              const srcLabel = sourceLabels[docType] || docType;
              // Merge extracted data - don't overwrite if already present from a more specific source
              Object.entries(result.extracted_data).forEach(([key, val]) => {
                const strVal = Array.isArray(val) ? val.join(', ') : String(val || '');
                if (strVal && (!allData[key] || !allData[key].value)) {
                  allData[key] = { value: strVal, source: docType, sourceLabel: srcLabel };
                }
              });
              processed++;
              finalize();
            },
            error: () => { errors++; finalize(); }
          });
        },
        error: () => { errors++; finalize(); }
      });
    });
  }

  applyCombinedExtraction(): void {
    if (!this.combinedExtraction || !this.selectedAgent) return;
    const d = this.combinedExtraction.data;

    if (d['numeroCIN']?.value) this.selectedAgent.cin = d['numeroCIN'].value;
    if (d['adresse']?.value) this.selectedAgent.adresse = d['adresse'].value;
    if (d['dateNaissance']?.value) this.selectedAgent.dateNaissance = this.convertDate(d['dateNaissance'].value);
    if (d['nomPrenom']?.value) {
      const parts = d['nomPrenom'].value.split(' ');
      if (parts.length >= 2) {
        this.selectedAgent.prenom = parts[0];
        this.selectedAgent.nom = parts.slice(1).join(' ');
      }
    }
    if (d['numInscription']?.value) this.selectedAgent.numInscription = d['numInscription'].value;
    if (d['dateEffet']?.value) this.selectedAgent.dateDebutIlhaq = this.convertDate(d['dateEffet'].value);

    this.saveSelectedAgent();
  }

  previewDocument(doc: DocumentGed): void {
    if (!doc.id) return;
    this.documentService.download(doc.id).subscribe({
      next: (blob) => {
        const url = URL.createObjectURL(blob);
        window.open(url, '_blank');
      }
    });
  }

  downloadDocument(doc: DocumentGed): void {
    if (!doc.id) return;
    this.documentService.download(doc.id).subscribe({
      next: (blob) => {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = doc.nomFichier;
        a.click();
        URL.revokeObjectURL(url);
      }
    });
  }

  deleteDocument(doc: DocumentGed, index: number): void {
    if (!doc.id || !confirm('هل أنت متأكد من حذف هذه الوثيقة؟')) return;
    this.documentService.delete(doc.id).subscribe({
      next: () => { this.documents.splice(index, 1); },
      error: () => { this.error = 'خطأ في حذف الوثيقة'; }
    });
  }

  getTypeLabel(type: string): string {
    return this.typeLabels[type] || type;
  }

  formatSize(bytes?: number): string {
    if (!bytes) return '';
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1048576) return (bytes / 1024).toFixed(1) + ' KB';
    return (bytes / 1048576).toFixed(1) + ' MB';
  }

  private emptyAgent(): Partial<AgentPublic> {
    return { numInscription: '', nom: '', prenom: '', cin: '', adresse: '', dateNaissance: '', dateDebutIlhaq: '', telephone: '', email: '', actif: true };
  }

  scanForNewAgent(): void {
    if (!this.selectedFile || !this.selectedInstitution) return;
    this.extracting = true;
    this.error = '';

    const file = this.selectedFile;
    const type = this.uploadType;
    const aiDocType = this.mapTypeToAI(type);

    // Keep track of the file for later upload
    this.pendingFiles.push({ file, type });

    // Extract data from file via AI
    this.documentService.extractFromFile(file, aiDocType).subscribe({
      next: (result) => {
        this.extractionResult = result;
        this.extractedFields = this.buildFieldList(result.extracted_data);
        this.showNewForm = true;
        this.extracting = false;

        // Auto-fill form from extraction
        const data = result.extracted_data;
        if (data['numeroCIN'] && !this.newAgent.cin) this.newAgent.cin = data['numeroCIN'];
        if (data['adresse'] && !this.newAgent.adresse) this.newAgent.adresse = data['adresse'];
        if (data['numInscription'] && !this.newAgent.numInscription) this.newAgent.numInscription = data['numInscription'];
        if (data['numAffiliation'] && !this.newAgent.numInscription) this.newAgent.numInscription = data['numAffiliation'];
        if (data['dateNaissance'] && !this.newAgent.dateNaissance) this.newAgent.dateNaissance = data['dateNaissance'];
        if (data['dateEffet'] && !this.newAgent.dateDebutIlhaq) this.newAgent.dateDebutIlhaq = data['dateEffet'];
        if (data['nomPrenom']) {
          const parts = data['nomPrenom'].split(' ');
          if (parts.length >= 2) {
            if (!this.newAgent.prenom) this.newAgent.prenom = parts[0];
            if (!this.newAgent.nom) this.newAgent.nom = parts.slice(1).join(' ');
          }
        }
        if (data['telephones_trouves'] && !this.newAgent.telephone) {
          this.newAgent.telephone = Array.isArray(data['telephones_trouves']) ? data['telephones_trouves'][0] : data['telephones_trouves'];
        }

        this.selectedFile = null;
        this.uploadMessage = 'تم استخراج البيانات بنجاح - Données extraites avec succès';
        this.uploadError = false;
      },
      error: () => {
        this.extracting = false;
        this.showNewForm = true;
        this.selectedFile = null;
        this.uploadMessage = 'فشل الاستخراج - يرجى ملء البيانات يدويا';
        this.uploadError = true;
      }
    });
  }

  saveNewAgent(): void {
    if (!this.newAgent.numInscription || !this.newAgent.nom || !this.newAgent.prenom || !this.selectedInstitution) return;
    this.saving = true;
    this.error = '';

    const agentToCreate: AgentPublic = {
      numInscription: this.newAgent.numInscription!,
      nom: this.newAgent.nom!,
      prenom: this.newAgent.prenom!,
      cin: this.newAgent.cin || '',
      adresse: this.newAgent.adresse || '',
      dateNaissance: this.newAgent.dateNaissance || '',
      dateDebutIlhaq: this.newAgent.dateDebutIlhaq || '',
      telephone: this.newAgent.telephone || '',
      email: this.newAgent.email || '',
      institution: { id: this.selectedInstitution.id },
      actif: true
    };

    this.agentService.create(agentToCreate).subscribe({
      next: (created) => {
        // Now upload all pending documents for this agent
        if (this.pendingFiles.length > 0 && created.id) {
          let uploaded = 0;
          for (const pf of this.pendingFiles) {
            this.documentService.upload(created.id, pf.type, pf.file).subscribe({
              next: (doc) => {
                this.documents.push(doc);
                uploaded++;
                if (uploaded === this.pendingFiles.length) {
                  this.finishSave(created);
                }
              },
              error: () => {
                uploaded++;
                if (uploaded === this.pendingFiles.length) {
                  this.finishSave(created);
                }
              }
            });
          }
        } else {
          this.finishSave(created);
        }
      },
      error: (err) => {
        this.saving = false;
        this.error = 'خطأ في تسجيل المضمون: ' + (err.error?.message || err.message || 'خطأ');
      }
    });
  }

  private finishSave(created: AgentPublic): void {
    this.saving = false;
    this.showNewForm = false;
    this.pendingFiles = [];
    this.newAgent = this.emptyAgent();

    // Navigate to Dossiers page with pre-filled data
    const params: any = {
      numInscription: created.numInscription,
      nom: created.nom,
      prenom: created.prenom,
      adresse: created.adresse || '',
      dateDebutIlhaq: created.dateDebutIlhaq || '',
      cin: created.cin || ''
    };
    if (this.selectedInstitution) {
      params.numAffiliation = this.selectedInstitution.numAffiliation || this.institutionNum;
      params.brancheSociale = this.selectedInstitution.brancheSociale || this.branche;
    }
    this.router.navigate(['/app/dossiers'], { queryParams: params });
  }

  onMultiFileSelected(event: any): void {
    const files = event.target.files;
    this.selectedFiles = [];
    if (files) {
      for (let i = 0; i < files.length; i++) {
        this.selectedFiles.push(files[i]);
      }
    }
  }

  addFilesToPending(): void {
    for (const f of this.selectedFiles) {
      this.pendingFiles.push({ file: f, type: 'AUTO' });
    }
    this.selectedFiles = [];
  }

  scanAllPending(): void {
    if (this.pendingFiles.length === 0) return;
    this.extracting = true;
    this.error = '';
    this.uploadMessage = 'جاري استخراج البيانات... / Extraction en cours...';
    this.showNewForm = true;

    let completed = 0;
    let successes = 0;
    const total = this.pendingFiles.length;

    const finalize = () => {
      completed++;
      if (completed === total) {
        this.extracting = false;
        if (successes === total) {
          this.uploadMessage = 'تم استخراج البيانات من ' + total + ' وثيقة بنجاح / ' + total + ' documents extraits avec succès';
          this.uploadError = false;
        } else if (successes > 0) {
          this.uploadMessage = 'تم استخراج ' + successes + ' من ' + total + ' وثيقة - يرجى التحقق';
          this.uploadError = false;
        } else {
          this.uploadMessage = 'فشل الاستخراج - تحقق من اتصال خدمة الذكاء الاصطناعي / Échec extraction - vérifiez le service AI (port 8090)';
          this.uploadError = true;
        }
      }
    };

    for (const pf of this.pendingFiles) {
      // Don't pass document type - let AI auto-detect
      this.documentService.extractFromFile(pf.file).subscribe({
        next: (result) => {
          successes++;
          this.extractionResult = result;
          this.extractedFields = this.buildFieldList(result.extracted_data);

          // Update file type from AI detection
          pf.type = this.mapAITypeToBackend(result.document_type);

          // Merge extracted data into form (don't overwrite already filled fields)
          const data = result.extracted_data;
          if (data['numeroCIN'] && !this.newAgent.cin) this.newAgent.cin = data['numeroCIN'];
          if (data['adresse'] && !this.newAgent.adresse) this.newAgent.adresse = data['adresse'];
          if (data['numInscription'] && !this.newAgent.numInscription) this.newAgent.numInscription = data['numInscription'];
          if (data['numAffiliation'] && !this.institutionNum) {
            const affNum = data['numAffiliation'];
            // Parse "60-64759" → branche=60, numAffiliation=64759
            if (affNum.includes('-')) {
              const parts = affNum.split('-');
              this.branche = parts[0];
              this.institutionNum = parts.slice(1).join('-');
            } else {
              this.institutionNum = affNum;
            }
          }
          if (data['institution']) {
            this.extractedInstitution.raisonSociale = data['institution'];
          }
          // Store salary data from attestation_salaire
          if (data['salaire'] && !this.extractedSalary.salaire) this.extractedSalary.salaire = data['salaire'];
          if (data['dateEffet'] && !this.extractedSalary.dateEffet) this.extractedSalary.dateEffet = data['dateEffet'];
          if (data['periode'] && !this.extractedSalary.periode) this.extractedSalary.periode = data['periode'];
          if (data['employeur'] && !this.extractedSalary.employeur) this.extractedSalary.employeur = data['employeur'];
          if (data['dateNaissance'] && !this.newAgent.dateNaissance) this.newAgent.dateNaissance = this.convertDate(data['dateNaissance']);
          if (data['dateEffet'] && !this.newAgent.dateDebutIlhaq) this.newAgent.dateDebutIlhaq = this.convertDate(data['dateEffet']);
          if (data['dateDocument'] && !this.newAgent.dateDebutIlhaq) this.newAgent.dateDebutIlhaq = this.convertDate(data['dateDocument']);
          if (data['nomPrenom']) {
            const parts = data['nomPrenom'].split(' ');
            if (parts.length >= 2) {
              if (!this.newAgent.prenom) this.newAgent.prenom = parts[0];
              if (!this.newAgent.nom) this.newAgent.nom = parts.slice(1).join(' ');
            }
          }
          if (data['telephones_trouves'] && !this.newAgent.telephone) {
            this.newAgent.telephone = Array.isArray(data['telephones_trouves']) ? data['telephones_trouves'][0] : data['telephones_trouves'];
          }

          finalize();
        },
        error: (err) => {
          console.error('AI extraction failed for', pf.file.name, err);
          finalize();
        }
      });
    }
  }

  saveAndStay(): void {
    this.saving = true;
    this.saveMessage = 'جاري حفظ البيانات والوثائق... / Enregistrement en cours...';
    this.saveError = false;

    const instData: any = {
      numAffiliation: this.institutionNum || '',
      brancheSociale: this.branche || '',
      raisonSociale: this.extractedInstitution.raisonSociale || '',
      adresse: '',
      telephone: '',
      email: this.employerEmail || '',
      gouvernorat: '',
      actif: true
    };

    this.institutionService.findByAffiliation(this.institutionNum, '').subscribe({
      next: (list) => {
        const found = this.branche ? list.find(i => i.brancheSociale === this.branche) : list[0];
        if (found) {
          // Update employer email if provided
          if (this.employerEmail && found.email !== this.employerEmail) {
            found.email = this.employerEmail;
            this.institutionService.update(found.id!, found).subscribe({
              next: (updated) => this.saveAgentAndDocsStay(updated.id!, updated),
              error: () => this.saveAgentAndDocsStay(found.id!, found)
            });
          } else {
            this.saveAgentAndDocsStay(found.id!, found);
          }
        } else {
          this.institutionService.create(instData).subscribe({
            next: (inst) => this.saveAgentAndDocsStay(inst.id!, inst),
            error: (err) => {
              this.saving = false;
              this.saveMessage = 'خطأ في حفظ المؤسسة / Erreur: ' + (err.error?.message || 'Erreur');
              this.saveError = true;
            }
          });
        }
      },
      error: () => {
        this.institutionService.create(instData).subscribe({
          next: (inst) => this.saveAgentAndDocsStay(inst.id!, inst),
          error: () => {
            this.saving = false;
            this.saveMessage = 'خطأ في حفظ المؤسسة / Erreur institution';
            this.saveError = true;
          }
        });
      }
    });
  }

  private saveAgentAndDocsStay(institutionId: number, institution: any): void {
    const agentData: any = {
      numInscription: this.newAgent.numInscription || '',
      nom: this.newAgent.nom || '',
      prenom: this.newAgent.prenom || '',
      nomFr: this.newAgent.nom || '',
      prenomFr: this.newAgent.prenom || '',
      cin: this.newAgent.cin || '',
      dateNaissance: this.newAgent.dateNaissance || null,
      adresse: this.newAgent.adresse || '',
      telephone: this.newAgent.telephone || '',
      email: this.newAgent.email || '',
      dateDebutIlhaq: this.newAgent.dateDebutIlhaq || null,
      dateFinIlhaq: null,
      actif: true,
      institution: { id: institutionId }
    };

    const doSave = (saveObs: any) => {
      saveObs.subscribe({
        next: (savedAgent: AgentPublic) => {
          this.saveMessage = 'تم حفظ المضمون بنجاح / Agent enregistré';
          // Upload documents
          if (this.pendingFiles.length > 0) {
            this.uploadDocsStay(savedAgent, institution);
          } else {
            this.switchToExistingMode(savedAgent, institution);
          }
        },
        error: (err: any) => {
          this.saving = false;
          this.saveMessage = 'خطأ في حفظ المضمون / Erreur agent: ' + (err.error?.message || err.message || 'Erreur');
          this.saveError = true;
        }
      });
    };

    if (this.newAgent.numInscription) {
      this.agentService.searchByNumInscription(this.newAgent.numInscription).subscribe({
        next: (existing) => {
          if (existing.length > 0) {
            doSave(this.agentService.update(existing[0].id!, agentData));
          } else {
            doSave(this.agentService.create(agentData));
          }
        },
        error: () => doSave(this.agentService.create(agentData))
      });
    } else {
      doSave(this.agentService.create(agentData));
    }
  }

  private uploadDocsStay(agent: AgentPublic, institution: any): void {
    let uploaded = 0;
    let errors = 0;
    const total = this.pendingFiles.length;

    this.pendingFiles.forEach(pf => {
      const docType = pf.type === 'AUTO' ? 'AUTRE' : pf.type;
      this.documentService.upload(agent.id!, docType, pf.file).subscribe({
        next: () => {
          uploaded++;
          if (uploaded + errors === total) {
            this.saveMessage = `تم الحفظ بنجاح: مضمون + ${uploaded} وثيقة / Agent + ${uploaded} document(s) enregistré(s)`;
            this.switchToExistingMode(agent, institution);
          }
        },
        error: () => {
          errors++;
          if (uploaded + errors === total) {
            this.saveMessage = `تم حفظ المضمون + ${uploaded} وثيقة، ${errors} خطأ / Agent OK, ${uploaded} doc(s), ${errors} erreur(s)`;
            this.switchToExistingMode(agent, institution);
          }
        }
      });
    });
  }

  private switchToExistingMode(agent: AgentPublic, institution: any): void {
    this.saving = false;
    // Switch to existing assure mode
    this.mode = 'existing';
    this.selectedInstitution = institution;
    this.institutionNum = institution.numAffiliation || this.institutionNum;
    this.branche = institution.brancheSociale || this.branche;
    // Merge full institution into agent (backend returns partial { id } only)
    agent.institution = institution;
    this.selectedAgent = agent;
    this.selectedAgentId = String(agent.id);
    this.agents = [agent];
    this.showNewForm = false;
    // Load documents for the agent
    this.loadDocuments();
  }

  openDossier(): void {
    this.saving = true;
    this.uploadMessage = 'جاري حفظ البيانات والوثائق... / Enregistrement en cours...';
    this.uploadError = false;

    // Step 1: Save or find institution
    const instData: any = {
      numAffiliation: this.institutionNum || '',
      brancheSociale: this.branche || '',
      raisonSociale: this.extractedInstitution.raisonSociale || '',
      adresse: '',
      telephone: '',
      email: this.employerEmail || '',
      gouvernorat: '',
      actif: true
    };

    // Search for existing institution first
    this.institutionService.findByAffiliation(this.institutionNum, '').subscribe({
      next: (list) => {
        const found = this.branche ? list.find(i => i.brancheSociale === this.branche) : list[0];
        if (found) {
          if (this.employerEmail && found.email !== this.employerEmail) {
            found.email = this.employerEmail;
            this.institutionService.update(found.id!, found).subscribe({
              next: (updated) => this.saveAgentAndDocs(updated.id!, updated),
              error: () => this.saveAgentAndDocs(found.id!, found)
            });
          } else {
            this.saveAgentAndDocs(found.id!, found);
          }
        } else {
          // Create institution
          this.institutionService.create(instData).subscribe({
            next: (inst) => this.saveAgentAndDocs(inst.id!, inst),
            error: (err) => {
              this.saving = false;
              this.uploadMessage = 'خطأ في حفظ المؤسسة / Erreur institution: ' + (err.error?.message || err.message || 'Erreur');
              this.uploadError = true;
            }
          });
        }
      },
      error: () => {
        // Search failed, try create
        this.institutionService.create(instData).subscribe({
          next: (inst) => this.saveAgentAndDocs(inst.id!, inst),
          error: () => {
            this.saving = false;
            this.uploadMessage = 'خطأ في حفظ المؤسسة / Erreur institution';
            this.uploadError = true;
          }
        });
      }
    });
  }

  private saveAgentAndDocs(institutionId: number, institution: any): void {
    const names = ((this.newAgent.prenom || '') + ' ' + (this.newAgent.nom || '')).split(' ');
    const agentData: any = {
      numInscription: this.newAgent.numInscription || '',
      nom: this.newAgent.nom || '',
      prenom: this.newAgent.prenom || '',
      nomFr: this.newAgent.nom || '',
      prenomFr: this.newAgent.prenom || '',
      cin: this.newAgent.cin || '',
      dateNaissance: this.newAgent.dateNaissance || null,
      adresse: this.newAgent.adresse || '',
      telephone: this.newAgent.telephone || '',
      email: this.newAgent.email || '',
      dateDebutIlhaq: this.newAgent.dateDebutIlhaq || null,
      dateFinIlhaq: null,
      actif: true,
      institution: { id: institutionId }
    };

    // Check if agent exists
    if (this.newAgent.numInscription) {
      this.agentService.searchByNumInscription(this.newAgent.numInscription).subscribe({
        next: (existing) => {
          if (existing.length > 0) {
            this.agentService.update(existing[0].id!, agentData).subscribe({
              next: (sa) => this.uploadDocsAndNavigate(sa.id!, institution),
              error: (err) => this.onSaveError('Agent update error', err)
            });
          } else {
            this.agentService.create(agentData).subscribe({
              next: (sa) => this.uploadDocsAndNavigate(sa.id!, institution),
              error: (err) => this.onSaveError('Agent create error', err)
            });
          }
        },
        error: () => {
          this.agentService.create(agentData).subscribe({
            next: (sa) => this.uploadDocsAndNavigate(sa.id!, institution),
            error: (err) => this.onSaveError('Agent create error', err)
          });
        }
      });
    } else {
      this.agentService.create(agentData).subscribe({
        next: (sa) => this.uploadDocsAndNavigate(sa.id!, institution),
        error: (err) => this.onSaveError('Agent error', err)
      });
    }
  }

  private uploadDocsAndNavigate(agentId: number, institution: any): void {
    if (this.pendingFiles.length === 0) {
      this.finishAndNavigate(agentId, institution);
      return;
    }

    let uploaded = 0;
    let uploadErrors = 0;
    const total = this.pendingFiles.length;

    this.pendingFiles.forEach(pf => {
      // Ensure valid backend type (AUTO is not a valid TypeDocument enum)
      const docType = pf.type === 'AUTO' ? 'AUTRE' : pf.type;
      this.documentService.upload(agentId, docType, pf.file).subscribe({
        next: () => {
          uploaded++;
          if (uploaded + uploadErrors === total) {
            this.uploadMessage = `تم حفظ ${uploaded} وثيقة بنجاح / ${uploaded} document(s) enregistré(s)`;
            this.finishAndNavigate(agentId, institution);
          }
        },
        error: (err) => {
          console.error('Doc upload error:', pf.file.name, pf.type, err);
          uploadErrors++;
          if (uploaded + uploadErrors === total) {
            this.uploadMessage = `${uploaded} doc(s) OK, ${uploadErrors} erreur(s)`;
            this.finishAndNavigate(agentId, institution);
          }
        }
      });
    });
  }

  private finishAndNavigate(agentId: number, institution: any): void {
    this.saving = false;
    // Store salary data in shared service for salaires page
    this.gedSharedData.extractedSalary = { ...this.extractedSalary };
    this.gedSharedData.agentNumInscription = this.newAgent.numInscription || '';

    const params: any = {
      nom: this.newAgent.nom || '',
      prenom: this.newAgent.prenom || '',
      numInscription: this.newAgent.numInscription || '',
      cin: this.newAgent.cin || '',
      adresse: this.newAgent.adresse || '',
      dateNaissance: this.newAgent.dateNaissance || '',
      dateDebutIlhaq: this.newAgent.dateDebutIlhaq || '',
      telephone: this.newAgent.telephone || '',
      email: this.newAgent.email || '',
      numAffiliation: institution.numAffiliation || this.institutionNum || '',
      brancheSociale: institution.brancheSociale || this.branche || '',
      raisonSociale: institution.raisonSociale || this.extractedInstitution.raisonSociale || '',
      salaire: this.extractedSalary.salaire || '',
      salaireDate: this.extractedSalary.dateEffet ? this.convertDate(this.extractedSalary.dateEffet) : '',
      salairePeriode: this.extractedSalary.periode || ''
    };
    this.router.navigate(['/app/dossiers'], { queryParams: params });
  }

  private onSaveError(context: string, err: any): void {
    this.saving = false;
    this.uploadMessage = 'خطأ / Erreur: ' + context + ' - ' + (err.error?.message || err.message || 'Unknown');
    this.uploadError = true;
    console.error(context, err);
  }

  resetNewAgent(): void {
    this.showNewForm = false;
    this.newAgent = this.emptyAgent();
    this.pendingFiles = [];
    this.extractionResult = null;
    this.extractedFields = [];
    this.uploadMessage = '';
    this.selectedFile = null;
    this.employerEmail = '';
  }

  private mapAITypeToBackend(aiType: string): string {
    const map: { [key: string]: string } = {
      'cin': 'CIN',
      'attestation_salaire': 'ATTESTATION_SALAIRE',
      'attestation_affiliation': 'DECLARATION',
      'decision_affectation': 'ARRETE_DISPONIBILITE',
      'contrat': 'MOGARER_IAALEM',
      'generic': 'AUTRE'
    };
    return map[aiType] || 'AUTRE';
  }

  private convertDate(dateStr: string): string {
    if (!dateStr) return '';
    // Already yyyy-mm-dd
    if (/^\d{4}-\d{2}-\d{2}$/.test(dateStr)) return dateStr;
    // Convert dd/mm/yyyy or dd-mm-yyyy or dd.mm.yyyy to yyyy-mm-dd
    const m = dateStr.match(/(\d{1,2})[/\-.](\d{1,2})[/\-.](\d{4})/);
    if (m) return `${m[3]}-${m[2].padStart(2, '0')}-${m[1].padStart(2, '0')}`;
    return dateStr;
  }

  private mapTypeToAI(type: string): string {
    const map: { [key: string]: string } = {
      'CIN': 'cin',
      'ATTESTATION_SALAIRE': 'attestation_salaire',
      'DECLARATION': 'attestation_affiliation',
      'ARRETE_DISPONIBILITE': 'decision_affectation',
      'MOGARER_IAALEM': 'generic',
      'AUTRE': 'generic'
    };
    return map[type] || 'generic';
  }

  private buildFieldList(data: { [key: string]: any }): { label: string; value: string }[] {
    return Object.entries(data).map(([key, val]) => ({
      label: this.fieldLabels[key] || key,
      value: Array.isArray(val) ? val.join(', ') : String(val)
    }));
  }
}
