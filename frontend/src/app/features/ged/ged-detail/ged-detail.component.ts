import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { GedService, GedDocument } from '../../../core/services/ged.service';
import { AiExtractionService, ExtractionResult } from '../../../core/services/ai-extraction.service';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-ged-detail',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="flex h-[calc(100vh-120px)]">
        <!-- Sidebar gauche -->
        <aside class="w-72 bg-white border-r border-gray-200 flex flex-col">
          <div class="p-4">
            <button routerLink="/ged/add" class="w-full bg-pink-600 hover:bg-pink-700 text-white px-4 py-2.5 rounded-lg flex items-center justify-center gap-2 font-medium">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
              </svg>
              Ajouter un document
            </button>
          </div>
          <div class="px-4 pb-4">
            <div class="relative">
              <input type="text" [(ngModel)]="searchTerm" (input)="onSearchChange()" placeholder="Rechercher..." class="w-full border border-gray-300 rounded-lg pl-10 pr-4 py-2 text-sm focus:ring-2 focus:ring-pink-500 focus:border-pink-500">
              <svg class="absolute left-3 top-2.5 w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
              </svg>
            </div>
          </div>
          <div class="flex-1 overflow-y-auto">
            <table class="w-full text-sm">
              <thead class="bg-gray-50 sticky top-0">
                <tr>
                  <th class="px-4 py-2 text-left font-medium text-gray-600">TITRE</th>
                  <th class="px-4 py-2 text-right font-medium text-gray-600">DATE</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let doc of filteredDocs" 
                    class="border-b hover:bg-gray-50 cursor-pointer"
                    [class.bg-pink-50]="doc.id === document?.id"
                    (click)="loadDocument(doc.id)">
                  <td class="px-4 py-3">
                    <a class="text-pink-600 hover:underline">{{ doc.titre }}</a>
                  </td>
                  <td class="px-4 py-3 text-right text-gray-500">{{ formatRelativeDate(doc.dateCreation) }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </aside>

        <!-- Contenu principal -->
        <main class="flex-1 overflow-y-auto bg-gray-50" *ngIf="document">
          <!-- Header -->
          <div class="bg-white border-b border-gray-200 px-8 py-6">
            <div class="flex justify-between items-start">
              <div>
                <h1 class="text-2xl font-bold text-gray-800">{{ document.titre }}</h1>
                <p class="text-gray-500 mt-1">{{ formatDate(document.dateCreation) }} par <span class="text-pink-600">{{ document.creePar }}</span></p>
              </div>
              <div class="flex gap-2">
                <div class="relative">
                  <button (click)="showExportMenu = !showExportMenu" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 flex items-center gap-2">
                    Exporter
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                    </svg>
                  </button>
                  <div *ngIf="showExportMenu" class="absolute right-0 mt-1 w-48 bg-white rounded-lg shadow-lg border z-10">
                    <button (click)="downloadDocument()" class="w-full px-4 py-2 text-left hover:bg-gray-50 text-sm flex items-center gap-2">
                      <span>📥</span> Télécharger
                    </button>
                    <button (click)="downloadAsZip()" class="w-full px-4 py-2 text-left hover:bg-gray-50 text-sm flex items-center gap-2">
                      <span>🗜️</span> Télécharger ZIP
                    </button>
                    <button (click)="showPdfExportModal = true; showExportMenu = false" class="w-full px-4 py-2 text-left hover:bg-gray-50 text-sm flex items-center gap-2">
                      <span>📄</span> Exporter PDF
                    </button>
                  </div>
                </div>
                <button (click)="extractAiData()" [disabled]="extractingAi" 
                        class="px-4 py-2 text-white rounded-lg flex items-center gap-2 text-sm font-medium hover:shadow-md transition-all disabled:opacity-50"
                        style="background: linear-gradient(135deg, #7C3AED, #EC4899);">
                  <span class="material-icons text-base">{{ extractingAi ? 'hourglass_top' : 'auto_awesome' }}</span>
                  {{ extractingAi ? 'Extraction...' : 'Extraire IA' }}
                </button>
                <button (click)="deleteDocument()" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">
                  Supprimer
                </button>
                <button (click)="toggleEditMode()" class="px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600">
                  {{ editMode ? 'Annuler' : 'Modifier' }}
                </button>
              </div>
            </div>

            <!-- Badge Partager -->
            <div class="mt-4">
              <span class="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm">🔒 Partager</span>
            </div>
          </div>

          <!-- Mode Édition -->
          <div *ngIf="editMode" class="bg-white border-b border-gray-200 px-8 py-6">
            <div class="flex justify-between items-center mb-4">
              <h3 class="font-semibold text-gray-800">Métadonnées principales</h3>
              <button (click)="saveChanges()" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700 flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                </svg>
                Enregistrer
              </button>
            </div>
            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Titre</label>
                <input type="text" [(ngModel)]="editForm.titre" class="w-full border border-gray-300 rounded-lg px-3 py-2">
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Catégorie</label>
                <select [(ngModel)]="editForm.categorie" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                  <option value="IDENTITE">Pièces d'identité</option>
                  <option value="CONTRAT">Contrats</option>
                  <option value="ATTESTATION">Attestations</option>
                  <option value="ATCT">Dossiers ATCT</option>
                  <option value="AUTRE">Autres</option>
                </select>
              </div>
              <div class="col-span-2">
                <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                <textarea [(ngModel)]="editForm.description" rows="3" class="w-full border border-gray-300 rounded-lg px-3 py-2"></textarea>
              </div>
            </div>
          </div>

          <!-- Onglets -->
          <div class="bg-white border-b border-gray-200 px-8">
            <div class="flex gap-1">
              <button *ngFor="let tab of tabs" (click)="activeTab = tab.id"
                      class="px-4 py-3 text-sm font-medium border-b-2 transition"
                      [class.border-pink-500]="activeTab === tab.id"
                      [class.text-pink-600]="activeTab === tab.id"
                      [class.border-transparent]="activeTab !== tab.id"
                      [class.text-gray-500]="activeTab !== tab.id">
                {{ tab.icon }} {{ tab.label }}
              </button>
            </div>
          </div>

          <!-- Contenu des onglets -->
          <div class="p-8">
            <!-- Onglet Contenu -->
            <div *ngIf="activeTab === 'contenu'" class="grid grid-cols-3 gap-8">
              <!-- Fichiers -->
              <div class="col-span-2">
                <div class="flex justify-between items-center mb-4">
                  <h3 class="font-semibold text-gray-800">Contributeurs</h3>
                  <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-sm">{{ document.creePar }}</span>
                </div>

                <!-- Vue fichiers -->
                <div class="flex gap-2 mb-4 border border-gray-200 rounded-lg p-1 w-fit">
                  <button (click)="setViewMode('list')" 
                          class="p-2 rounded transition-all"
                          [ngClass]="{'bg-pink-600 text-white': fileViewMode === 'list', 'hover:bg-gray-100 text-gray-600': fileViewMode !== 'list'}">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/>
                    </svg>
                  </button>
                  <button (click)="setViewMode('grid')" 
                          class="p-2 rounded transition-all"
                          [ngClass]="{'bg-pink-600 text-white': fileViewMode === 'grid', 'hover:bg-gray-100 text-gray-600': fileViewMode !== 'grid'}">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
                    </svg>
                  </button>
                </div>

                <!-- Vue Grille - Dossier avec sous-documents -->
                <div *ngIf="document.fichierType === 'folder' && childDocs.length > 0" class="grid grid-cols-2 gap-4 mb-6">
                  <div *ngFor="let child of childDocs" class="bg-white border rounded-lg p-4 hover:shadow-md transition cursor-pointer" (click)="previewChild(child)">
                    <div class="w-full h-32 bg-gray-100 rounded flex items-center justify-center mb-3 overflow-hidden">
                      <img *ngIf="isImage(child.fichierType)" 
                           [src]="getDocumentPreviewUrl(child.id)" 
                           [alt]="child.fichierNom"
                           class="max-w-full max-h-full object-contain"
                           (error)="onImageError($event)">
                      <span *ngIf="!isImage(child.fichierType)" class="text-5xl">{{ getFileIcon(child.fichierType) }}</span>
                    </div>
                    <div>
                      <p class="text-sm font-medium truncate" [title]="child.titre">{{ child.titre }}</p>
                      <p class="text-xs text-gray-500">{{ child.fichierNom }} - {{ formatFileSize(child.fichierTaille) }}</p>
                    </div>
                    <div class="flex gap-2 mt-2">
                      <button (click)="previewChild(child); $event.stopPropagation()" class="flex-1 py-1 bg-pink-600 text-white text-xs rounded hover:bg-pink-700">Aperçu</button>
                      <button (click)="downloadChild(child); $event.stopPropagation()" class="flex-1 py-1 border border-pink-600 text-pink-600 text-xs rounded hover:bg-pink-50">Télécharger</button>
                    </div>
                  </div>
                </div>

                <!-- Vue Grille - Document simple -->
                <div *ngIf="document.fichierType !== 'folder' && fileViewMode === 'grid'" class="grid grid-cols-2 gap-4 mb-6">
                  <div class="bg-white border rounded-lg p-4 hover:shadow-md transition cursor-pointer" (click)="downloadDocument()">
                    <div class="w-full h-32 bg-gray-100 rounded flex items-center justify-center mb-3 overflow-hidden">
                      <img *ngIf="isImage(document.fichierType)" 
                           [src]="getDocumentPreviewUrl(document.id)" 
                           [alt]="document.fichierNom"
                           class="max-w-full max-h-full object-contain"
                           (error)="onImageError($event)">
                      <span *ngIf="!isImage(document.fichierType)" class="text-5xl">{{ getFileIcon(document.fichierType) }}</span>
                    </div>
                    <div class="flex justify-between items-center">
                      <span class="text-sm font-medium truncate" [title]="document.fichierNom">{{ document.fichierNom }}</span>
                      <button class="text-gray-400 hover:text-gray-600" (click)="$event.stopPropagation()">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"/>
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Vue Liste -->
                <div *ngIf="fileViewMode === 'list'" class="space-y-2 mb-6">
                  <div class="bg-white border rounded-lg p-3 hover:shadow-md transition cursor-pointer flex items-center gap-4" (click)="downloadDocument()">
                    <div class="w-12 h-12 bg-gray-100 rounded flex items-center justify-center flex-shrink-0 overflow-hidden">
                      <img *ngIf="isImage(document.fichierType)" 
                           [src]="getDocumentPreviewUrl(document.id)" 
                           [alt]="document.fichierNom"
                           class="w-full h-full object-cover"
                           (error)="onImageError($event)">
                      <span *ngIf="!isImage(document.fichierType)" class="text-2xl">{{ getFileIcon(document.fichierType) }}</span>
                    </div>
                    <div class="flex-1 min-w-0">
                      <p class="text-sm font-medium text-gray-800 truncate">{{ document.fichierNom }}</p>
                      <p class="text-xs text-gray-500">{{ formatFileSize(document.fichierTaille) }} • {{ document.fichierType }}</p>
                    </div>
                    <div class="flex items-center gap-2">
                      <button class="p-2 text-pink-600 hover:bg-pink-50 rounded" (click)="$event.stopPropagation(); downloadDocument()">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                        </svg>
                      </button>
                      <button class="text-gray-400 hover:text-gray-600" (click)="$event.stopPropagation()">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"/>
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Ajouter des fichiers -->
                <input type="file" #fileInput (change)="onFileSelected($event)" multiple class="hidden">
                <button (click)="fileInput.click()" class="w-full py-3 bg-pink-600 text-white rounded-lg hover:bg-pink-700 transition flex items-center justify-center gap-2">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                  </svg>
                  Ajouter des fichiers
                </button>
              </div>

              <!-- Commentaires -->
              <div class="bg-white rounded-lg border p-6">
                <div class="flex items-center gap-2 mb-4">
                  <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"/>
                  </svg>
                  <h3 class="font-semibold text-gray-800">Commentaires</h3>
                </div>
                
                <!-- Liste des commentaires -->
                <div *ngIf="comments.length === 0" class="text-center py-4 text-gray-400 text-sm">
                  Aucun commentaire sur ce document
                </div>
                <div class="space-y-3 max-h-64 overflow-y-auto">
                  <div *ngFor="let comment of comments" class="flex items-start gap-3 p-2 bg-gray-50 rounded">
                    <div class="w-8 h-8 bg-pink-500 text-white rounded-full flex items-center justify-center text-xs">
                      {{ comment.auteur.charAt(0).toUpperCase() }}
                    </div>
                    <div class="flex-1">
                      <div class="flex justify-between">
                        <span class="font-medium text-sm">{{ comment.auteur }}</span>
                        <button (click)="deleteComment(comment.id)" class="text-red-400 hover:text-red-600 text-xs">✕</button>
                      </div>
                      <p class="text-sm text-gray-600">{{ comment.texte }}</p>
                      <p class="text-xs text-gray-400">{{ formatRelativeDate(comment.date) }}</p>
                    </div>
                  </div>
                </div>

                <div class="mt-4 flex gap-2">
                  <input type="text" [(ngModel)]="newComment" (keyup.enter)="addComment()" 
                         placeholder="Ajouter un commentaire..." 
                         class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm min-w-0">
                  <button (click)="addComment()" class="px-4 py-2 bg-pink-600 text-white rounded-lg text-sm hover:bg-pink-700 whitespace-nowrap flex-shrink-0">
                    Envoyer
                  </button>
                </div>
              </div>
            </div>

            <!-- Onglet Workflow -->
            <div *ngIf="activeTab === 'workflow'" class="bg-white rounded-lg p-6">
              <p class="text-gray-600 mb-4">Vérifiez ou validez vos documents avec les personnes de votre organisation en utilisant les workflows.</p>
              
              <!-- Workflow non démarré -->
              <div *ngIf="!workflowStarted">
                <div class="mb-4">
                  <label class="block text-sm font-medium text-gray-700 mb-2">Quel workflow démarrer ?</label>
                  <select [(ngModel)]="selectedWorkflow" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                    <option *ngFor="let wf of workflows" [value]="wf.id">{{ wf.nom }}</option>
                  </select>
                  <a href="#" class="text-pink-600 text-sm hover:underline mt-1 inline-block">Ajouter plus de workflows</a>
                </div>
                <button (click)="startWorkflow()" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700">
                  Démarrer le workflow
                </button>
              </div>

              <!-- Workflow en cours -->
              <div *ngIf="workflowStarted">
                <div class="flex justify-between items-center mb-4">
                  <p class="text-sm"><strong>Document review</strong> a démarré le {{ formatDate(document!.dateCreation) }}</p>
                  <button (click)="cancelWorkflow()" class="px-3 py-1 bg-red-100 text-red-700 rounded hover:bg-red-200 text-sm">
                    Annuler le workflow en cours
                  </button>
                </div>
                <table class="w-full text-sm">
                  <thead class="bg-gray-50">
                    <tr>
                      <th class="px-4 py-2 text-left">Type</th>
                      <th class="px-4 py-2 text-left">Name</th>
                      <th class="px-4 py-2 text-left">For</th>
                      <th class="px-4 py-2 text-left">Validation</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr *ngFor="let step of workflowSteps; let i = index" class="border-b">
                      <td class="px-4 py-3">
                        <span class="flex items-center gap-1">
                          <span [class]="step.status === 'completed' ? 'text-green-500' : 'text-orange-500'">●</span>
                          {{ step.type }}
                        </span>
                      </td>
                      <td class="px-4 py-3">{{ step.nom }}</td>
                      <td class="px-4 py-3">{{ step.groupe }}</td>
                      <td class="px-4 py-3">
                        <button *ngIf="step.status !== 'completed'" (click)="validateStep(i)" 
                                class="px-2 py-1 bg-green-500 text-white rounded text-xs hover:bg-green-600">
                          Valider
                        </button>
                        <span *ngIf="step.status === 'completed'" class="text-green-600">✓ Validé</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Onglet Permissions -->
            <div *ngIf="activeTab === 'permissions'" class="bg-white rounded-lg p-6">
              <p class="text-gray-600 text-sm mb-4">Les permissions peuvent être appliquées directement sur ce document, ou provenir de tags.</p>
              
              <h3 class="font-semibold text-gray-800 mb-4">Permissions sur ce document</h3>
              
              <!-- Propriétaire -->
              <table class="w-full text-sm mb-6">
                <thead class="bg-gray-50">
                  <tr>
                    <th class="px-4 py-2 text-left">Pour</th>
                    <th class="px-4 py-2 text-left">Permission</th>
                    <th class="px-4 py-2"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="border-b">
                    <td class="px-4 py-3">
                      <span class="text-pink-600">Utilisateur</span> {{ document.creePar }}
                    </td>
                    <td class="px-4 py-3">
                      <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs mr-1">Lecture</span>
                      <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs">Écriture</span>
                    </td>
                    <td class="px-4 py-3 text-gray-400 text-xs">Propriétaire</td>
                  </tr>
                  <tr *ngFor="let perm of permissions" class="border-b">
                    <td class="px-4 py-3">
                      <span class="text-pink-600">Utilisateur</span> {{ perm.utilisateur }}
                    </td>
                    <td class="px-4 py-3">
                      <span class="px-2 py-1 rounded text-xs"
                            [class.bg-blue-100]="perm.permission === 'Lecture'"
                            [class.text-blue-700]="perm.permission === 'Lecture'"
                            [class.bg-green-100]="perm.permission === 'Écriture'"
                            [class.text-green-700]="perm.permission === 'Écriture'">
                        {{ perm.permission }}
                      </span>
                    </td>
                    <td class="px-4 py-3">
                      <button (click)="removePermission(perm.utilisateur)" class="text-red-500 hover:text-red-700 text-xs">Supprimer</button>
                    </td>
                  </tr>
                </tbody>
              </table>

              <!-- Ajouter une permission -->
              <h4 class="font-medium text-gray-700 mb-3">Ajouter une permission</h4>
              <div class="grid grid-cols-3 gap-4">
                <div>
                  <label class="block text-sm text-gray-600 mb-1">Pour</label>
                  <input type="text" [(ngModel)]="newPermissionUser" placeholder="Rechercher un utilisateur ou un groupe..." 
                         class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm">
                </div>
                <div>
                  <label class="block text-sm text-gray-600 mb-1">Permission</label>
                  <select [(ngModel)]="newPermissionType" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm">
                    <option value="Lecture">Lecture</option>
                    <option value="Écriture">Écriture</option>
                  </select>
                </div>
                <div class="flex items-end">
                  <button (click)="addPermission()" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700 text-sm">
                    + Ajouter
                  </button>
                </div>
              </div>
            </div>

            <!-- Onglet Activité -->
            <div *ngIf="activeTab === 'activite'" class="bg-white rounded-lg p-6">
              <p class="text-gray-600 text-sm mb-4">Toutes les actions sur ce document sont consignées ici.</p>
              
              <table class="w-full text-sm">
                <tbody>
                  <!-- Activité de création -->
                  <tr class="border-b hover:bg-gray-50">
                    <td class="px-4 py-3 text-gray-500">{{ formatRelativeDate(document.dateCreation) }}</td>
                    <td class="px-4 py-3">
                      <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs">{{ document.creePar }}</span>
                    </td>
                    <td class="px-4 py-3">
                      Document créé : <a class="text-pink-600 hover:underline">{{ document.titre }}</a>
                    </td>
                  </tr>
                  <!-- Activités dynamiques -->
                  <tr *ngFor="let act of activities" class="border-b hover:bg-gray-50">
                    <td class="px-4 py-3 text-gray-500">{{ formatRelativeDate(act.date) }}</td>
                    <td class="px-4 py-3">
                      <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs">{{ act.auteur }}</span>
                    </td>
                    <td class="px-4 py-3">
                      <span *ngIf="act.type === 'ACL_AJOUTE'" class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs mr-2">ACL créé</span>
                      <span *ngIf="act.type === 'ACL_SUPPRIME'" class="px-2 py-1 bg-red-100 text-red-700 rounded text-xs mr-2">ACL supprimé</span>
                      <span *ngIf="act.type === 'WORKFLOW_DEMARRE'" class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs mr-2">Workflow créé</span>
                      <span *ngIf="act.type === 'WORKFLOW_ANNULE'" class="px-2 py-1 bg-orange-100 text-orange-700 rounded text-xs mr-2">Workflow supprimé</span>
                      <span *ngIf="act.type === 'COMMENTAIRE'" class="px-2 py-1 bg-purple-100 text-purple-700 rounded text-xs mr-2">Commentaire créé</span>
                      <span *ngIf="act.type === 'FICHIER_AJOUTE'" class="px-2 py-1 bg-pink-100 text-pink-700 rounded text-xs mr-2">Fichier créé</span>
                      <span *ngIf="act.type === 'MODIFICATION'" class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs mr-2">Modifié</span>
                      {{ act.description }}
                    </td>
                  </tr>
                </tbody>
              </table>

              <div *ngIf="activities.length === 0" class="text-center py-8 text-gray-400">
                Aucune activité récente
              </div>
            </div>
          </div>
        </main>

        <!-- État de chargement -->
        <main *ngIf="!document && loading" class="flex-1 flex items-center justify-center bg-gray-50">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-pink-600"></div>
        </main>
      </div>

      <!-- Modal Exporter PDF -->
      <div *ngIf="showPdfExportModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-xl shadow-xl w-full max-w-md mx-4">
          <div class="p-6 border-b border-gray-200">
            <h2 class="text-xl font-semibold text-gray-800">Exporter en PDF</h2>
          </div>
          <div class="p-6 space-y-4">
            <label class="flex items-center gap-3 cursor-pointer">
              <input type="checkbox" [(ngModel)]="pdfExportOptions.metadata" class="w-4 h-4 text-pink-600 rounded">
              <span class="text-sm text-gray-700">Exporter les métadonnées</span>
            </label>
            <label class="flex items-center gap-3 cursor-pointer">
              <input type="checkbox" [(ngModel)]="pdfExportOptions.comments" class="w-4 h-4 text-pink-600 rounded">
              <span class="text-sm text-gray-700">Exporter les commentaires</span>
            </label>
            <label class="flex items-center gap-3 cursor-pointer">
              <input type="checkbox" [(ngModel)]="pdfExportOptions.fitImages" class="w-4 h-4 text-pink-600 rounded">
              <span class="text-sm text-gray-700">Ajuster les images à la page</span>
            </label>
            <div>
              <label class="block text-sm text-gray-700 mb-2">Marge</label>
              <div class="flex items-center gap-2">
                <input type="number" [(ngModel)]="pdfExportOptions.margin" min="0" max="50" 
                       class="w-20 border border-gray-300 rounded-lg px-3 py-2 text-sm">
                <span class="text-sm text-gray-500">mm</span>
              </div>
            </div>
          </div>
          <div class="p-6 border-t border-gray-200 flex justify-end gap-3">
            <button (click)="showPdfExportModal = false" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
              Annuler
            </button>
            <button (click)="exportPdf()" class="px-4 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700">
              Exporter
            </button>
          </div>
        </div>
      </div>

      <!-- AI Extraction Result Modal -->
      @if (showAiModal && aiExtractionResult) {
        <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[85vh] overflow-hidden">
            <div class="px-6 py-4 flex items-center justify-between" style="background: linear-gradient(135deg, #7C3AED, #EC4899);">
              <div class="flex items-center gap-3">
                <span class="material-icons text-white text-2xl">auto_awesome</span>
                <div>
                  <h2 class="text-lg font-bold text-white">Résultat Extraction IA</h2>
                  <p class="text-pink-200 text-xs">{{ document?.titre || aiExtractionResult.document_type }}</p>
                </div>
              </div>
              <button (click)="closeAiModal()" class="text-white hover:text-pink-200 text-2xl leading-none">&times;</button>
            </div>
            <div class="p-6 overflow-y-auto max-h-[60vh]">
              <div class="mb-5">
                <div class="flex items-center justify-between mb-1">
                  <span class="text-sm font-semibold text-gray-700">Confiance</span>
                  <span class="text-sm font-bold" [ngClass]="{
                    'text-green-600': aiExtractionResult.confidence >= 60,
                    'text-yellow-600': aiExtractionResult.confidence >= 30 && aiExtractionResult.confidence < 60,
                    'text-red-600': aiExtractionResult.confidence < 30
                  }">{{ aiExtractionResult.confidence | number:'1.0-0' }}%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2.5">
                  <div class="h-2.5 rounded-full transition-all" 
                       [style.width.%]="aiExtractionResult.confidence"
                       [ngClass]="{
                         'bg-green-500': aiExtractionResult.confidence >= 60,
                         'bg-yellow-500': aiExtractionResult.confidence >= 30 && aiExtractionResult.confidence < 60,
                         'bg-red-500': aiExtractionResult.confidence < 30
                       }"></div>
                </div>
              </div>
              @if (aiExtractionResult.warnings && aiExtractionResult.warnings.length > 0) {
                <div class="mb-4 p-3 bg-amber-50 border border-amber-200 rounded-lg">
                  <div *ngFor="let warn of aiExtractionResult.warnings" class="flex items-start gap-2 text-sm text-amber-700">
                    <span class="material-icons text-sm mt-0.5">warning</span>
                    <span>{{ warn }}</span>
                  </div>
                </div>
              }
              @if (aiExtractionResult.error) {
                <div class="mb-4 p-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700 flex items-start gap-2">
                  <span class="material-icons text-sm mt-0.5">error</span>
                  <span>{{ aiExtractionResult.error }}</span>
                </div>
              }
              @if (aiExtractionResult.success && getAiFieldKeys().length > 0) {
                <h3 class="font-bold text-gray-800 mb-3 flex items-center gap-2">
                  <span class="material-icons text-purple-500">data_object</span>
                  Données extraites
                </h3>
                <div class="space-y-2 mb-5">
                  <div *ngFor="let key of getAiFieldKeys()" 
                       class="flex justify-between items-start p-3 bg-gray-50 rounded-lg border border-gray-100">
                    <span class="text-sm text-gray-500 font-medium">{{ getAiFieldLabel(key) }}</span>
                    <span class="text-sm font-semibold text-gray-800 text-right ml-4 max-w-[60%]">{{ aiExtractionResult.extracted_data[key] }}</span>
                  </div>
                </div>
              } @else if (!aiExtractionResult.error) {
                <div class="text-center py-6 text-gray-400">
                  <span class="material-icons text-4xl mb-2 block">search_off</span>
                  <p>Aucune donnée structurée extraite</p>
                </div>
              }
              @if (aiExtractionResult.raw_text) {
                <details class="mt-4">
                  <summary class="cursor-pointer text-sm font-semibold text-gray-600 hover:text-gray-800 flex items-center gap-1">
                    <span class="material-icons text-sm">code</span>
                    Texte brut OCR
                  </summary>
                  <pre class="mt-2 p-3 bg-gray-900 text-green-400 rounded-lg text-xs overflow-x-auto max-h-48 whitespace-pre-wrap font-mono">{{ aiExtractionResult.raw_text }}</pre>
                </details>
              }
            </div>
            <div class="px-6 py-4 bg-gray-50 border-t flex justify-end">
              <button (click)="closeAiModal()" class="px-6 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 text-sm font-medium">Fermer</button>
            </div>
          </div>
        </div>
      }
    </app-main-layout>
`
})
export class GedDetailComponent implements OnInit {
  document: GedDocument | null = null;
  allDocs: any[] = [];
  filteredDocs: any[] = [];
  childDocs: GedDocument[] = [];
  loading = false;
  searchTerm = '';

  filterDocs(): void {
    if (!this.searchTerm.trim()) {
      this.filteredDocs = [...this.allDocs];
    } else {
      const term = this.searchTerm.toLowerCase();
      this.filteredDocs = this.allDocs.filter(d => 
        d.titre?.toLowerCase().includes(term) || 
        d.fichierNom?.toLowerCase().includes(term)
      );
    }
  }

  activeTab = 'contenu';
  editMode = false;
  showExportMenu = false;
  showPdfExportModal = false;
  fileViewMode: 'list' | 'grid' = 'grid';
  newComment = '';
  
  // Options export PDF
  pdfExportOptions = {
    metadata: true,
    comments: true,
    fitImages: true,
    margin: 10
  };

  tabs = [
    { id: 'contenu', label: 'Contenu', icon: '📄' },
    { id: 'workflow', label: 'Workflow', icon: '⚡' },
    { id: 'permissions', label: 'Permissions', icon: '🔒' },
    { id: 'activite', label: 'Activité', icon: '📋' }
  ];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private gedService: GedService,
    private aiExtractionService: AiExtractionService
  ) {}

  ngOnInit(): void {
    this.loadAllDocs();
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.loadDocument(+params['id']);
      }
    });
  }

  loadAllDocs(): void {
    this.gedService.getDocuments().subscribe({
      next: (docs) => {
        // Ne montrer que les documents racine (pas les enfants)
        this.allDocs = docs.filter(d => !d.parentId);
        this.filterDocs();
      },
      error: () => {}
    });
  }

  onSearchChange(): void {
    this.filterDocs();
  }

  setViewMode(mode: 'list' | 'grid'): void {
    this.fileViewMode = mode;
  }

  loadDocument(id: number): void {
    this.loading = true;
    this.childDocs = [];
    this.gedService.getDocumentById(id).subscribe({
      next: (doc) => {
        this.document = doc;
        this.loading = false;
        // Si c'est un dossier, charger les sous-documents
        if (doc.fichierType === 'folder') {
          this.gedService.getChildren(doc.id).subscribe({
            next: (children) => this.childDocs = children,
            error: () => {}
          });
        }
      },
      error: () => {
        this.loading = false;
      }
    });
  }

  downloadDocument(): void {
    if (!this.document) return;
    this.gedService.downloadDocument(this.document.id).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = this.document!.fichierNom;
        a.click();
        window.URL.revokeObjectURL(url);
      }
    });
    this.showExportMenu = false;
  }

  deleteDocument(): void {
    if (!this.document || !confirm('Supprimer ce document ?')) return;
    this.gedService.deleteDocument(this.document.id).subscribe({
      next: () => this.router.navigate(['/ged']),
      error: () => alert('Erreur lors de la suppression')
    });
  }

  previewChild(child: GedDocument): void {
    this.gedService.downloadDocument(child.id).subscribe({
      next: (blob) => {
        const url = URL.createObjectURL(blob);
        window.open(url, '_blank');
      },
      error: () => alert('Erreur lors de l\'ouverture du document')
    });
  }

  downloadChild(child: GedDocument): void {
    this.gedService.downloadDocument(child.id).subscribe({
      next: (blob) => {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = child.fichierNom;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
      },
      error: () => alert('Erreur lors du téléchargement')
    });
  }

  getFileIcon(type: string): string {
    if (type?.includes('pdf')) return '📄';
    if (type?.includes('image')) return '🖼️';
    if (type?.includes('word')) return '📝';
    if (type?.includes('excel')) return '📊';
    return '📁';
  }

  isImage(type: string): boolean {
    return type?.includes('image') || false;
  }

  getDocumentPreviewUrl(id: number): string {
    return `/api/ged/documents/${id}/download`;
  }

  onImageError(event: Event): void {
    const img = event.target as HTMLImageElement;
    img.style.display = 'none';
    // Afficher l'icône à la place
    const parent = img.parentElement;
    if (parent) {
      const span = document.createElement('span');
      span.className = 'text-5xl';
      span.textContent = '🖼️';
      parent.appendChild(span);
    }
  }

  formatDate(dateStr: string): string {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('fr-FR', {
      day: '2-digit', month: '2-digit', year: 'numeric'
    });
  }

  formatFileSize(bytes: number): string {
    if (!bytes) return 'N/A';
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
    return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
  }

  formatRelativeDate(dateStr: string): string {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);
    if (minutes < 60) return `Il y a ${minutes} min`;
    const hours = Math.floor(minutes / 60);
    if (hours < 24) return `Il y a ${hours}h`;
    const days = Math.floor(hours / 24);
    return `Il y a ${days} jour(s)`;
  }

  // Upload de fichiers
  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0 && this.document) {
      const files = Array.from(input.files);
      files.forEach(file => {
        this.gedService.uploadDocument(file, { titre: this.document!.titre, categorie: this.document!.categorie }).subscribe({
          next: () => {
            this.addActivity('FICHIER_AJOUTE', `Fichier ajouté: ${file.name}`);
            this.loadDocument(this.document!.id);
          },
          error: () => alert('Erreur lors de l\'upload')
        });
      });
    }
  }

  // Commentaires
  comments: Array<{id: number, texte: string, auteur: string, date: string}> = [];

  addComment(): void {
    if (!this.newComment.trim() || !this.document) return;
    const comment = {
      id: Date.now(),
      texte: this.newComment,
      auteur: 'system',
      date: new Date().toISOString()
    };
    this.comments.push(comment);
    this.addActivity('COMMENTAIRE', `Commentaire ajouté`);
    this.newComment = '';
  }

  deleteComment(id: number): void {
    this.comments = this.comments.filter(c => c.id !== id);
  }

  // Activités
  activities: Array<{type: string, description: string, auteur: string, date: string}> = [];

  addActivity(type: string, description: string): void {
    this.activities.unshift({
      type,
      description,
      auteur: this.document?.creePar || 'system',
      date: new Date().toISOString()
    });
  }

  // Permissions
  permissions: Array<{utilisateur: string, permission: string}> = [];
  newPermissionUser = '';
  newPermissionType = 'Lecture';

  addPermission(): void {
    if (!this.newPermissionUser.trim()) return;
    this.permissions.push({
      utilisateur: this.newPermissionUser,
      permission: this.newPermissionType
    });
    this.addActivity('ACL_AJOUTE', `Permission ${this.newPermissionType} ajoutée pour ${this.newPermissionUser}`);
    this.newPermissionUser = '';
  }

  removePermission(utilisateur: string): void {
    this.permissions = this.permissions.filter(p => p.utilisateur !== utilisateur);
    this.addActivity('ACL_SUPPRIME', `Permission supprimée pour ${utilisateur}`);
  }

  // Workflow
  workflows = [
    { id: 'review', nom: 'Document review' },
    { id: 'approval', nom: 'Approval workflow' },
    { id: 'validation', nom: 'Validation process' }
  ];
  selectedWorkflow = 'review';
  workflowStarted = false;
  workflowSteps: Array<{type: string, nom: string, groupe: string, status: string}> = [];

  startWorkflow(): void {
    this.workflowStarted = true;
    this.workflowSteps = [
      { type: 'Validation', nom: 'Check the document\'s metadata', groupe: 'Groupe administrators', status: 'pending' },
      { type: 'Validation', nom: 'Add relevant files to the document', groupe: 'Groupe administrators', status: 'pending' },
      { type: 'Approbation', nom: 'Approve the document', groupe: 'Groupe administrators', status: 'pending' }
    ];
    this.addActivity('WORKFLOW_DEMARRE', `Workflow "${this.selectedWorkflow}" démarré`);
  }

  cancelWorkflow(): void {
    this.workflowStarted = false;
    this.workflowSteps = [];
    this.addActivity('WORKFLOW_ANNULE', 'Workflow annulé');
  }

  validateStep(index: number): void {
    this.workflowSteps[index].status = 'completed';
    this.addActivity('WORKFLOW_ETAPE', `Étape validée: ${this.workflowSteps[index].nom}`);
  }

  // Mode édition
  editForm = { titre: '', description: '', categorie: '' };

  toggleEditMode(): void {
    this.editMode = !this.editMode;
    if (this.editMode && this.document) {
      this.editForm = {
        titre: this.document.titre,
        description: this.document.description || '',
        categorie: this.document.categorie || ''
      };
    }
  }

  saveChanges(): void {
    if (!this.document) return;
    this.gedService.updateDocument(this.document.id, {
      ...this.document,
      titre: this.editForm.titre,
      description: this.editForm.description,
      categorie: this.editForm.categorie
    }).subscribe({
      next: (doc) => {
        this.document = doc;
        this.editMode = false;
        this.addActivity('MODIFICATION', 'Document modifié');
      },
      error: () => alert('Erreur lors de la sauvegarde')
    });
  }

  // Télécharger en ZIP
  downloadAsZip(): void {
    if (!this.document) return;
    this.gedService.downloadDocumentAsZip(this.document.id).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        const fileName = this.document!.fichierNom.replace(/\.[^/.]+$/, '') + '.zip';
        a.download = fileName;
        a.click();
        window.URL.revokeObjectURL(url);
        this.addActivity('TELECHARGEMENT', 'Document téléchargé en ZIP');
      },
      error: () => alert('Erreur lors du téléchargement')
    });
    this.showExportMenu = false;
  }

  // ==================== AI EXTRACTION ====================
  extractingAi = false;
  aiExtractionResult: ExtractionResult | null = null;
  showAiModal = false;

  extractAiData(): void {
    if (!this.document || this.document.fichierType === 'folder') return;
    this.extractingAi = true;
    
    // Auto-detect document type from categorie/tags
    let docType = 'generic';
    const cat = (this.document.categorie || '').toLowerCase();
    const tags = (this.document.tags || []).join(' ').toLowerCase();
    if (tags.includes('cin') || cat === 'identite') docType = 'cin';
    else if (tags.includes('attestation-salaire') || cat === 'attestation') docType = 'attestation_salaire';
    else if (tags.includes('contrat') || cat === 'contrat') docType = 'contrat';
    else if (tags.includes('attestation-affiliation')) docType = 'attestation_affiliation';
    
    this.aiExtractionService.extractFromDocument(this.document.id, docType).subscribe({
      next: (result) => {
        this.aiExtractionResult = result;
        this.showAiModal = true;
        this.extractingAi = false;
      },
      error: (err) => {
        console.error('Erreur extraction IA:', err);
        this.aiExtractionResult = {
          success: false, document_type: docType, confidence: 0,
          extracted_data: {}, raw_text: '',
          warnings: ['Service AI non disponible. Vérifiez que le service est démarré sur le port 8090.'],
          error: err.message
        };
        this.showAiModal = true;
        this.extractingAi = false;
      }
    });
  }

  getAiFieldKeys(): string[] {
    if (!this.aiExtractionResult?.extracted_data) return [];
    return Object.keys(this.aiExtractionResult.extracted_data);
  }

  getAiFieldLabel(field: string): string {
    return this.aiExtractionService.getFieldLabel(field);
  }

  closeAiModal(): void {
    this.showAiModal = false;
    this.aiExtractionResult = null;
  }

  // Exporter en PDF
  exportPdf(): void {
    if (!this.document) return;
    this.gedService.exportDocumentAsPdf(this.document.id, this.pdfExportOptions).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        const fileName = this.document!.fichierNom.replace(/\.[^/.]+$/, '') + '.pdf';
        a.download = fileName;
        a.click();
        window.URL.revokeObjectURL(url);
        this.addActivity('EXPORT_PDF', 'Document exporté en PDF');
      },
      error: () => alert('Erreur lors de l\'export PDF')
    });
    this.showPdfExportModal = false;
  }
}
