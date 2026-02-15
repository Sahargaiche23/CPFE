import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { GedService, GedDocument, GedTag, GedActivite } from '../../core/services/ged.service';
import { FileTransferService } from '../../core/services/file-transfer.service';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-ged',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="flex h-[calc(100vh-120px)]">
        <!-- Sidebar gauche -->
        <aside class="w-72 bg-white border-r border-gray-200 flex flex-col">
          <!-- Bouton Ajouter -->
          <div class="p-4">
            <a routerLink="/ged/add" 
                    class="w-full bg-teal-600 hover:bg-teal-700 text-white px-4 py-2.5 rounded-lg flex items-center justify-center gap-2 font-medium">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
              </svg>
              Ajouter un document
            </a>
          </div>

          <!-- Recherche -->
          <div class="px-4 pb-4">
            <div class="relative">
              <input type="text" [(ngModel)]="searchTerm" (input)="onSearch()"
                     placeholder="Rechercher..."
                     class="w-full border border-gray-300 rounded-lg pl-10 pr-4 py-2 text-sm focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
              <svg class="absolute left-3 top-2.5 w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
              </svg>
            </div>
          </div>

          <!-- Navigation -->
          <nav class="flex-1 overflow-y-auto px-2">
            <div class="space-y-1">
              <button (click)="filterCategorie('')" 
                      class="w-full flex items-center gap-3 px-3 py-2 rounded-lg text-left transition"
                      [class.bg-teal-50]="!categorieActive"
                      [class.text-teal-700]="!categorieActive"
                      [class.text-gray-700]="categorieActive"
                      [class.hover:bg-gray-100]="categorieActive">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                </svg>
                Tous les documents
              </button>
              
              <div class="pt-4 pb-2 px-3">
                <span class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Catégories</span>
              </div>
              
              <button *ngFor="let cat of categories" (click)="filterCategorie(cat.id)"
                      class="w-full flex items-center justify-between gap-3 px-3 py-2 rounded-lg text-left transition"
                      [class.bg-teal-50]="categorieActive === cat.id"
                      [class.text-teal-700]="categorieActive === cat.id"
                      [class.text-gray-700]="categorieActive !== cat.id"
                      [class.hover:bg-gray-100]="categorieActive !== cat.id">
                <div class="flex items-center gap-3">
                  <span [class]="'w-2 h-2 rounded-full ' + cat.couleur"></span>
                  {{ cat.nom }}
                </div>
                <span class="text-xs text-gray-400">{{ cat.count }}</span>
              </button>
            </div>

            <!-- Tags -->
            <div class="mt-6">
              <div class="px-3 pb-2 flex items-center justify-between">
                <span class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Tags</span>
                <button (click)="showTagModal = true" class="text-teal-600 hover:text-teal-700">
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                  </svg>
                </button>
              </div>
              <div class="flex flex-wrap gap-2 px-3">
                <button *ngFor="let tag of tags" (click)="toggleTag(tag.nom)"
                        class="px-2 py-1 rounded text-xs font-medium transition"
                        [class.bg-teal-100]="selectedTags.includes(tag.nom)"
                        [class.text-teal-700]="selectedTags.includes(tag.nom)"
                        [class.bg-gray-100]="!selectedTags.includes(tag.nom)"
                        [class.text-gray-600]="!selectedTags.includes(tag.nom)">
                  {{ tag.nom }}
                </button>
              </div>
            </div>
          </nav>

          <!-- Stats -->
          <div class="p-4 border-t border-gray-200 text-sm text-gray-500">
            <div class="flex justify-between">
              <span>{{ formatSize(totalTaille) }} utilisés</span>
              <span>{{ documents.length }} documents</span>
            </div>
          </div>
        </aside>

        <!-- Contenu principal -->
        <main class="flex-1 flex flex-col overflow-hidden">
          <!-- Header avec options de vue -->
          <div class="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
            <h1 class="text-xl font-semibold text-gray-800">Documents</h1>
            <div class="flex items-center gap-4">
              <!-- Tri -->
              <select [(ngModel)]="sortBy" (change)="sortDocuments()" 
                      class="border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-teal-500">
                <option value="dateCreation">Date de création</option>
                <option value="titre">Titre</option>
                <option value="fichierTaille">Taille</option>
              </select>
              <!-- Vue -->
              <div class="flex border border-gray-300 rounded-lg overflow-hidden">
                <button (click)="viewMode = 'list'" 
                        class="p-2"
                        [class.bg-teal-50]="viewMode === 'list'"
                        [class.text-teal-600]="viewMode === 'list'">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/>
                  </svg>
                </button>
                <button (click)="viewMode = 'grid'" 
                        class="p-2 border-l"
                        [class.bg-teal-50]="viewMode === 'grid'"
                        [class.text-teal-600]="viewMode === 'grid'">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
                  </svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Zone principale avec liste et dropzone -->
          <div class="flex-1 flex overflow-hidden">
            <!-- Liste des documents -->
            <div class="flex-1 overflow-y-auto p-6">
              <!-- Loading -->
              <div *ngIf="loading" class="flex justify-center py-12">
                <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-teal-600"></div>
              </div>

              <!-- Empty state -->
              <div *ngIf="!loading && documents.length === 0" class="text-center py-12">
                <svg class="mx-auto h-16 w-16 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                </svg>
                <h3 class="mt-4 text-lg font-medium text-gray-900">Aucun document</h3>
                <p class="mt-2 text-gray-500">Commencez par ajouter votre premier document</p>
                <button (click)="showUploadModal = true" class="mt-4 bg-teal-600 text-white px-4 py-2 rounded-lg hover:bg-teal-700">
                  Ajouter un document
                </button>
              </div>

              <!-- Vue Liste -->
              <div *ngIf="!loading && documents.length > 0 && viewMode === 'list'" class="bg-white rounded-lg shadow overflow-hidden">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100"
                          (click)="setSortBy('titre')">
                        Titre
                        <span *ngIf="sortBy === 'titre'" class="ml-1">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                      </th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Catégorie</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100"
                          (click)="setSortBy('dateCreation')">
                        Date
                        <span *ngIf="sortBy === 'dateCreation'" class="ml-1">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                      </th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Taille</th>
                      <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr *ngFor="let doc of documents" class="hover:bg-gray-50 cursor-pointer" (click)="selectDocument(doc)">
                      <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                          <div class="w-10 h-10 rounded-lg flex items-center justify-center" [class]="getFileIconClass(doc.fichierType)">
                            {{ getFileIcon(doc.fichierType) }}
                          </div>
                          <div class="ml-4">
                            <div class="text-sm font-medium text-gray-900">{{ doc.titre }}</div>
                            <div class="text-sm text-gray-500">{{ doc.fichierNom }}</div>
                          </div>
                        </div>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 py-1 text-xs rounded-full" [class]="getCategorieClass(doc.categorie)">
                          {{ doc.categorie }}
                        </span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {{ formatDate(doc.dateCreation) }}
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {{ formatSize(doc.fichierTaille) }}
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <button (click)="downloadDoc(doc, $event)" class="text-teal-600 hover:text-teal-900 mr-3">
                          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                          </svg>
                        </button>
                        <button (click)="deleteDoc(doc, $event)" class="text-red-600 hover:text-red-900">
                          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                          </svg>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- Vue Grille -->
              <div *ngIf="!loading && documents.length > 0 && viewMode === 'grid'" class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                <div *ngFor="let doc of documents" 
                     class="bg-white rounded-lg shadow hover:shadow-md transition cursor-pointer p-4"
                     (click)="selectDocument(doc)">
                  <div class="w-full h-24 rounded-lg flex items-center justify-center text-4xl mb-3" [class]="getFileIconClass(doc.fichierType)">
                    {{ getFileIcon(doc.fichierType) }}
                  </div>
                  <h4 class="font-medium text-gray-900 truncate">{{ doc.titre }}</h4>
                  <p class="text-sm text-gray-500 truncate">{{ doc.fichierNom }}</p>
                  <div class="mt-2 flex items-center justify-between text-xs text-gray-400">
                    <span>{{ formatDate(doc.dateCreation) }}</span>
                    <span>{{ formatSize(doc.fichierTaille) }}</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Panneau Envoi Rapide -->
            <div class="w-80 border-l border-gray-200 bg-gray-50 p-6 overflow-y-auto">
              <div class="flex justify-between items-center mb-4">
                <h3 class="text-lg font-semibold text-gray-800">Envoi rapide</h3>
                <button *ngIf="quickUploadFiles.length > 0" (click)="selectAllQuickFiles()" 
                        class="text-xs text-teal-600 hover:underline">
                  ☐ Tout sélectionner
                </button>
              </div>
              
              <!-- Dropzone -->
              <div class="border-2 border-dashed rounded-lg p-6 text-center transition"
                   (dragover)="onDragOver($event)" (drop)="onQuickDrop($event)" (dragleave)="onDragLeave($event)"
                   [class.border-teal-500]="isDragging" [class.bg-teal-50]="isDragging"
                   [class.border-orange-400]="!isDragging && quickUploadFiles.length === 0"
                   [class.bg-orange-50]="!isDragging && quickUploadFiles.length === 0"
                   [class.border-gray-300]="quickUploadFiles.length > 0">
                <svg class="mx-auto h-10 w-10" [class.text-orange-400]="quickUploadFiles.length === 0" [class.text-gray-400]="quickUploadFiles.length > 0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"/>
                </svg>
                <p class="mt-2 text-sm font-medium" [class.text-orange-600]="quickUploadFiles.length === 0" [class.text-gray-600]="quickUploadFiles.length > 0">
                  Glisser & déposer des fichiers ici
                </p>
                <input type="file" #quickFileInput (change)="onQuickFileSelected($event)" class="hidden" multiple>
                <button (click)="quickFileInput.click()" class="mt-3 px-4 py-2 bg-white border border-gray-300 rounded-lg text-sm text-gray-700 hover:bg-gray-50">
                  Ajouter des fichiers
                </button>
              </div>

              <!-- Fichiers en attente d'envoi -->
              <div *ngIf="quickUploadFiles.length > 0" class="mt-4">
                <div class="flex items-center gap-2 mb-2">
                  <span class="text-xs text-gray-500">≡</span>
                  <span class="text-xs text-gray-500">⊞</span>
                </div>
                <div class="grid grid-cols-2 gap-2">
                  <div *ngFor="let file of quickUploadFiles; let i = index" 
                       class="relative bg-white border rounded-lg p-2 cursor-pointer hover:border-teal-500"
                       [class.border-teal-500]="quickUploadSelected[file.name]"
                       [class.ring-2]="quickUploadSelected[file.name]"
                       [class.ring-teal-200]="quickUploadSelected[file.name]"
                       (click)="toggleQuickFileSelection(file.name)">
                    <div class="w-full h-16 bg-gray-100 rounded flex items-center justify-center text-2xl mb-1">
                      {{ getFileIconByName(file.name) }}
                    </div>
                    <p class="text-xs text-gray-600 truncate">{{ file.name }}</p>
                    <div *ngIf="quickUploadSelected[file.name]" 
                         class="absolute top-1 right-1 w-5 h-5 bg-teal-500 rounded flex items-center justify-center">
                      <svg class="w-3 h-3 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"/>
                      </svg>
                    </div>
                    <button (click)="removeQuickFile(i, $event)" class="absolute top-1 left-1 w-5 h-5 bg-red-500 rounded flex items-center justify-center text-white text-xs hover:bg-red-600">
                      ✕
                    </button>
                  </div>
                </div>
                
                <!-- Bouton Ajouter à un document -->
                <button (click)="showDocumentSelector()" 
                        class="mt-4 w-full px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700 text-sm flex items-center justify-center gap-2"
                        [disabled]="!hasSelectedQuickFiles()">
                  <span>+</span> Ajouter à un nouveau document
                </button>
              </div>

              <!-- Upload progress -->
              <div *ngIf="uploadingFiles.length > 0" class="mt-4 space-y-2">
                <div *ngFor="let uf of uploadingFiles" class="bg-white rounded-lg p-3 shadow-sm">
                  <div class="flex items-center justify-between mb-1">
                    <span class="text-sm text-gray-700 truncate">{{ uf.name }}</span>
                    <span class="text-xs text-gray-500">{{ uf.progress }}%</span>
                  </div>
                  <div class="w-full bg-gray-200 rounded-full h-1.5">
                    <div class="bg-teal-600 h-1.5 rounded-full transition-all" [style.width.%]="uf.progress"></div>
                  </div>
                </div>
              </div>

              <!-- Activité récente -->
              <div class="mt-8">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Activité récente</h3>
                <div class="space-y-3">
                  <div *ngFor="let act of activites" class="flex items-start gap-3 text-sm">
                    <div class="w-8 h-8 rounded-full flex items-center justify-center text-xs font-medium"
                         [class.bg-green-100]="act.type === 'CREATION'"
                         [class.text-green-600]="act.type === 'CREATION'"
                         [class.bg-blue-100]="act.type === 'TELECHARGEMENT'"
                         [class.text-blue-600]="act.type === 'TELECHARGEMENT'"
                         [class.bg-red-100]="act.type === 'SUPPRESSION'"
                         [class.text-red-600]="act.type === 'SUPPRESSION'">
                      {{ act.utilisateur.charAt(0).toUpperCase() }}
                    </div>
                    <div class="flex-1">
                      <p class="text-gray-600">
                        <span class="font-medium text-teal-600">{{ act.utilisateur }}</span>
                        {{ getActiviteLabel(act) }}
                      </p>
                      <p class="text-xs text-gray-400">{{ formatRelativeDate(act.dateActivite) }}</p>
                    </div>
                  </div>
                  <div *ngIf="activites.length === 0" class="text-sm text-gray-400 text-center py-4">
                    Aucune activité récente
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>

      <!-- Modal Upload -->
      <div *ngIf="showUploadModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-xl shadow-xl w-full max-w-lg mx-4">
          <div class="p-6 border-b border-gray-200">
            <h2 class="text-xl font-semibold text-gray-800">Ajouter un document</h2>
          </div>
          <div class="p-6 space-y-4">
            <!-- Fichiers pré-sélectionnés -->
            <div *ngIf="preselectedFiles.length > 0">
              <label class="block text-sm font-medium text-gray-700 mb-2">Fichiers sélectionnés ({{ preselectedFiles.length }})</label>
              <div class="border border-gray-200 rounded-lg p-3 bg-gray-50 max-h-32 overflow-y-auto">
                <div *ngFor="let file of preselectedFiles; let i = index" class="flex items-center justify-between py-1">
                  <div class="flex items-center gap-2">
                    <span class="text-lg">{{ getFileIconByName(file.name) }}</span>
                    <span class="text-sm text-gray-700 truncate max-w-xs">{{ file.name }}</span>
                    <span class="text-xs text-gray-400">({{ formatSize(file.size) }})</span>
                  </div>
                  <button (click)="removePreselectedFile(i)" class="text-red-500 hover:text-red-700 text-sm">✕</button>
                </div>
              </div>
            </div>
            
            <!-- Input fichier si pas de fichiers pré-sélectionnés -->
            <div *ngIf="preselectedFiles.length === 0">
              <label class="block text-sm font-medium text-gray-700 mb-1">Fichier</label>
              <input type="file" #modalFileInput (change)="onModalFileSelected($event)" 
                     class="w-full border border-gray-300 rounded-lg px-3 py-2">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Titre</label>
              <input type="text" [(ngModel)]="newDocument.titre" 
                     class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-500">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
              <textarea [(ngModel)]="newDocument.description" rows="3"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-500"></textarea>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Catégorie</label>
              <select [(ngModel)]="newDocument.categorie" 
                      class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-500">
                <option *ngFor="let cat of categories" [value]="cat.id">{{ cat.nom }}</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Tags</label>
              <div class="flex flex-wrap gap-2">
                <button *ngFor="let tag of tags" (click)="toggleNewDocTag(tag.nom)"
                        class="px-3 py-1 rounded-full text-sm"
                        [class.bg-teal-100]="newDocument.tags?.includes(tag.nom)"
                        [class.text-teal-700]="newDocument.tags?.includes(tag.nom)"
                        [class.bg-gray-100]="!newDocument.tags?.includes(tag.nom)"
                        [class.text-gray-600]="!newDocument.tags?.includes(tag.nom)">
                  {{ tag.nom }}
                </button>
              </div>
            </div>
          </div>
          <div class="p-6 border-t border-gray-200 flex justify-end gap-3">
            <button (click)="closeUploadModal()" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
              Annuler
            </button>
            <button (click)="uploadNewDocument()" [disabled]="!selectedFile && preselectedFiles.length === 0"
                    class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700 disabled:opacity-50">
              Téléverser
            </button>
          </div>
        </div>
      </div>

      <!-- Modal Détail Document -->
      <div *ngIf="selectedDocument" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-xl shadow-xl w-full max-w-2xl mx-4 max-h-[90vh] overflow-y-auto">
          <div class="p-6 border-b border-gray-200 flex items-center justify-between">
            <h2 class="text-xl font-semibold text-gray-800">{{ selectedDocument.titre }}</h2>
            <button (click)="selectedDocument = null" class="text-gray-400 hover:text-gray-600">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
              </svg>
            </button>
          </div>
          <div class="p-6">
            <div class="flex items-center gap-4 mb-6">
              <div class="w-16 h-16 rounded-lg flex items-center justify-center text-3xl" [class]="getFileIconClass(selectedDocument.fichierType)">
                {{ getFileIcon(selectedDocument.fichierType) }}
              </div>
              <div>
                <p class="text-gray-500">{{ selectedDocument.fichierNom }}</p>
                <p class="text-sm text-gray-400">{{ formatSize(selectedDocument.fichierTaille) }}</p>
              </div>
            </div>
            
            <div class="grid grid-cols-2 gap-4 text-sm">
              <div>
                <span class="text-gray-500">Catégorie:</span>
                <span class="ml-2 font-medium">{{ selectedDocument.categorie }}</span>
              </div>
              <div>
                <span class="text-gray-500">Créé par:</span>
                <span class="ml-2 font-medium">{{ selectedDocument.creePar }}</span>
              </div>
              <div>
                <span class="text-gray-500">Date création:</span>
                <span class="ml-2 font-medium">{{ formatDate(selectedDocument.dateCreation) }}</span>
              </div>
              <div *ngIf="selectedDocument.dateModification">
                <span class="text-gray-500">Dernière modification:</span>
                <span class="ml-2 font-medium">{{ formatDate(selectedDocument.dateModification) }}</span>
              </div>
            </div>
            
            <div *ngIf="selectedDocument.description" class="mt-4">
              <span class="text-gray-500 text-sm">Description:</span>
              <p class="mt-1 text-gray-700">{{ selectedDocument.description }}</p>
            </div>
            
            <div *ngIf="selectedDocument.tags?.length" class="mt-4">
              <span class="text-gray-500 text-sm">Tags:</span>
              <div class="flex flex-wrap gap-2 mt-2">
                <span *ngFor="let tag of selectedDocument.tags" class="px-2 py-1 bg-gray-100 text-gray-600 rounded text-sm">
                  {{ tag }}
                </span>
              </div>
            </div>
          </div>
          <div class="p-6 border-t border-gray-200 flex justify-end gap-3">
            <button (click)="downloadDoc(selectedDocument, $event)" class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700 flex items-center gap-2">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
              </svg>
              Télécharger
            </button>
            <button (click)="deleteDoc(selectedDocument, $event); selectedDocument = null" class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 flex items-center gap-2">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
              </svg>
              Supprimer
            </button>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class GedComponent implements OnInit {
  documents: GedDocument[] = [];
  tags: GedTag[] = [];
  activites: GedActivite[] = [];
  
  loading = false;
  searchTerm = '';
  categorieActive = '';
  selectedTags: string[] = [];
  viewMode: 'list' | 'grid' = 'list';
  sortBy = 'dateCreation';
  sortOrder: 'asc' | 'desc' = 'desc';
  
  isDragging = false;
  showUploadModal = false;
  showTagModal = false;
  showPdfExportModal = false;
  selectedFile: File | null = null;
  selectedDocument: GedDocument | null = null;
  uploadingFiles: { name: string; progress: number }[] = [];
  totalTaille = 0;
  
  // Envoi rapide
  quickUploadFiles: File[] = [];
  quickUploadSelected: { [key: string]: boolean } = {};
  targetDocumentId: number | null = null;
  preselectedFiles: File[] = [];
  
  // Export PDF options
  pdfExportOptions = {
    metadata: true,
    comments: true,
    fitImages: true,
    margin: 10
  };
  
  newDocument: Partial<GedDocument> = {
    titre: '',
    description: '',
    categorie: 'AUTRE',
    tags: []
  };

  categories = [
    { id: 'IDENTITE', nom: 'Pièces d\'identité', couleur: 'bg-blue-500', count: 0 },
    { id: 'CONTRAT', nom: 'Contrats', couleur: 'bg-green-500', count: 0 },
    { id: 'ATTESTATION', nom: 'Attestations', couleur: 'bg-purple-500', count: 0 },
    { id: 'ATCT', nom: 'Dossiers ATCT', couleur: 'bg-orange-500', count: 0 },
    { id: 'AUTRE', nom: 'Autres', couleur: 'bg-gray-500', count: 0 }
  ];

  constructor(
    private gedService: GedService,
    private router: Router,
    private fileTransferService: FileTransferService
  ) {}

  ngOnInit(): void {
    this.loadDocuments();
    this.loadTags();
    this.loadActivites();
  }

  loadDocuments(): void {
    this.loading = true;
    this.gedService.getDocuments(this.searchTerm, this.categorieActive, this.selectedTags).subscribe({
      next: (docs) => {
        // Ne montrer que les documents racine (pas les enfants)
        this.documents = docs.filter(d => !d.parentId);
        this.totalTaille = docs.reduce((sum, d) => sum + (d.fichierTaille || 0), 0);
        this.updateCategoryCounts();
        this.sortDocuments();
        this.loading = false;
      },
      error: () => {
        this.loading = false;
        // Données de démonstration si pas de backend
        this.documents = this.getDemoDocuments();
        this.totalTaille = this.documents.reduce((sum, d) => sum + d.fichierTaille, 0);
        this.updateCategoryCounts();
      }
    });
  }

  loadTags(): void {
    this.gedService.getTags().subscribe({
      next: (tags) => this.tags = tags,
      error: () => {
        // Tags de démonstration
        this.tags = [
          { id: 1, nom: 'Important', couleur: 'red' },
          { id: 2, nom: 'Urgent', couleur: 'orange' },
          { id: 3, nom: 'Archivé', couleur: 'gray' },
          { id: 4, nom: 'Validé', couleur: 'green' }
        ];
      }
    });
  }

  loadActivites(): void {
    this.gedService.getActivites(10).subscribe({
      next: (acts) => this.activites = acts,
      error: () => {
        // Activités de démonstration
        this.activites = [
          { id: 1, type: 'CREATION', documentTitre: 'Contrat.pdf', utilisateur: 'admin', dateActivite: new Date().toISOString() },
          { id: 2, type: 'TELECHARGEMENT', documentTitre: 'Attestation.pdf', utilisateur: 'agent1', dateActivite: new Date(Date.now() - 3600000).toISOString() }
        ];
      }
    });
  }

  getDemoDocuments(): GedDocument[] {
    return [
      { id: 1, titre: 'Contrat de travail', fichierNom: 'contrat_2024.pdf', fichierType: 'application/pdf', fichierTaille: 245000, tags: ['Important'], categorie: 'CONTRAT', dateCreation: '2024-02-08T10:00:00', creePar: 'admin' },
      { id: 2, titre: 'Attestation affiliation', fichierNom: 'attestation_50-0123456.pdf', fichierType: 'application/pdf', fichierTaille: 156000, tags: ['Validé'], categorie: 'ATTESTATION', dateCreation: '2024-02-07T15:30:00', creePar: 'agent1' },
      { id: 3, titre: 'CIN Recto-Verso', fichierNom: 'cin_scan.jpg', fichierType: 'image/jpeg', fichierTaille: 890000, tags: [], categorie: 'IDENTITE', dateCreation: '2024-02-06T09:15:00', creePar: 'admin' }
    ];
  }

  updateCategoryCounts(): void {
    this.categories.forEach(cat => {
      cat.count = this.documents.filter(d => d.categorie === cat.id).length;
    });
  }

  onSearch(): void {
    this.loadDocuments();
  }

  filterCategorie(catId: string): void {
    this.categorieActive = catId;
    this.loadDocuments();
  }

  toggleTag(tagName: string): void {
    const idx = this.selectedTags.indexOf(tagName);
    if (idx > -1) {
      this.selectedTags.splice(idx, 1);
    } else {
      this.selectedTags.push(tagName);
    }
    this.loadDocuments();
  }

  setSortBy(field: string): void {
    if (this.sortBy === field) {
      this.sortOrder = this.sortOrder === 'asc' ? 'desc' : 'asc';
    } else {
      this.sortBy = field;
      this.sortOrder = 'desc';
    }
    this.sortDocuments();
  }

  sortDocuments(): void {
    this.documents.sort((a: any, b: any) => {
      const valA = a[this.sortBy];
      const valB = b[this.sortBy];
      const cmp = valA < valB ? -1 : valA > valB ? 1 : 0;
      return this.sortOrder === 'asc' ? cmp : -cmp;
    });
  }

  selectDocument(doc: GedDocument): void {
    this.router.navigate(['/ged/document', doc.id]);
  }

  // Drag & Drop
  onDragOver(event: DragEvent): void {
    event.preventDefault();
    this.isDragging = true;
  }

  onDragLeave(event: DragEvent): void {
    event.preventDefault();
    this.isDragging = false;
  }

  onDrop(event: DragEvent): void {
    event.preventDefault();
    this.isDragging = false;
    const files = event.dataTransfer?.files;
    if (files) {
      this.uploadFiles(Array.from(files));
    }
  }

  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files) {
      this.uploadFiles(Array.from(input.files));
    }
  }

  onModalFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.selectedFile = input.files[0];
      if (!this.newDocument.titre) {
        this.newDocument.titre = this.selectedFile.name.replace(/\.[^/.]+$/, '');
      }
    }
  }

  uploadFiles(files: File[]): void {
    files.forEach(file => {
      const uploadItem = { name: file.name, progress: 0 };
      this.uploadingFiles.push(uploadItem);
      
      this.gedService.uploadDocumentSimple(file, { titre: file.name, categorie: 'AUTRE' }).subscribe({
        next: () => {
          uploadItem.progress = 100;
          setTimeout(() => {
            this.uploadingFiles = this.uploadingFiles.filter(u => u !== uploadItem);
            this.loadDocuments();
            this.loadActivites();
          }, 1000);
        },
        error: () => {
          uploadItem.progress = 100;
          setTimeout(() => {
            this.uploadingFiles = this.uploadingFiles.filter(u => u !== uploadItem);
          }, 2000);
        }
      });
    });
  }

  uploadNewDocument(): void {
    // Utiliser les fichiers pré-sélectionnés ou le fichier sélectionné manuellement
    const filesToUpload = this.preselectedFiles.length > 0 ? this.preselectedFiles : (this.selectedFile ? [this.selectedFile] : []);
    
    if (filesToUpload.length === 0) return;
    
    // Upload tous les fichiers avec les mêmes métadonnées
    filesToUpload.forEach((file, index) => {
      const metadata = {
        ...this.newDocument,
        titre: filesToUpload.length > 1 ? `${this.newDocument.titre} (${index + 1})` : this.newDocument.titre
      };
      
      this.gedService.uploadDocumentSimple(file, metadata).subscribe({
        next: () => {
          if (index === filesToUpload.length - 1) {
            this.closeUploadModal();
            this.loadDocuments();
            this.loadActivites();
          }
        },
        error: (err) => {
          console.error('Erreur upload:', err);
          alert('Erreur lors du téléversement');
        }
      });
    });
  }
  
  closeUploadModal(): void {
    this.showUploadModal = false;
    this.selectedFile = null;
    this.preselectedFiles = [];
    this.newDocument = { titre: '', description: '', categorie: 'AUTRE', tags: [] };
  }

  toggleNewDocTag(tagName: string): void {
    if (!this.newDocument.tags) this.newDocument.tags = [];
    const idx = this.newDocument.tags.indexOf(tagName);
    if (idx > -1) {
      this.newDocument.tags.splice(idx, 1);
    } else {
      this.newDocument.tags.push(tagName);
    }
  }

  downloadDoc(doc: GedDocument, event: Event): void {
    event.stopPropagation();
    this.gedService.downloadDocument(doc.id).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = doc.fichierNom;
        a.click();
        window.URL.revokeObjectURL(url);
      },
      error: () => {
        alert('Erreur lors du téléchargement');
      }
    });
  }

  deleteDoc(doc: GedDocument, event: Event): void {
    event.stopPropagation();
    if (confirm(`Supprimer "${doc.titre}" ?`)) {
      this.gedService.deleteDocument(doc.id).subscribe({
        next: () => {
          this.loadDocuments();
          this.loadActivites();
        },
        error: () => {
          // En mode démo, supprimer localement
          this.documents = this.documents.filter(d => d.id !== doc.id);
          this.updateCategoryCounts();
        }
      });
    }
  }

  // Helpers
  formatSize(bytes: number): string {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];
  }

  formatDate(dateStr: string): string {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('fr-FR', { day: '2-digit', month: 'short', year: 'numeric' });
  }

  formatRelativeDate(dateStr: string): string {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);
    if (minutes < 1) return 'À l\'instant';
    if (minutes < 60) return `Il y a ${minutes} min`;
    const hours = Math.floor(minutes / 60);
    if (hours < 24) return `Il y a ${hours}h`;
    const days = Math.floor(hours / 24);
    return `Il y a ${days} jour(s)`;
  }

  getFileIcon(type: string): string {
    if (type?.includes('pdf')) return '📄';
    if (type?.includes('image')) return '🖼️';
    if (type?.includes('word') || type?.includes('document')) return '📝';
    if (type?.includes('excel') || type?.includes('spreadsheet')) return '📊';
    return '📁';
  }

  getFileIconClass(type: string): string {
    if (type?.includes('pdf')) return 'bg-red-100 text-red-600';
    if (type?.includes('image')) return 'bg-purple-100 text-purple-600';
    if (type?.includes('word')) return 'bg-blue-100 text-blue-600';
    if (type?.includes('excel')) return 'bg-green-100 text-green-600';
    return 'bg-gray-100 text-gray-600';
  }

  getCategorieClass(cat: string): string {
    const classes: { [key: string]: string } = {
      'IDENTITE': 'bg-blue-100 text-blue-700',
      'CONTRAT': 'bg-green-100 text-green-700',
      'ATTESTATION': 'bg-purple-100 text-purple-700',
      'ATCT': 'bg-orange-100 text-orange-700',
      'AUTRE': 'bg-gray-100 text-gray-700'
    };
    return classes[cat] || classes['AUTRE'];
  }

  getActiviteLabel(act: GedActivite): string {
    switch (act.type) {
      case 'CREATION': return `a créé "${act.documentTitre}"`;
      case 'MODIFICATION': return `a modifié "${act.documentTitre}"`;
      case 'SUPPRESSION': return `a supprimé "${act.documentTitre}"`;
      case 'TELECHARGEMENT': return `a téléchargé "${act.documentTitre}"`;
      default: return act.details || '';
    }
  }

  // Quick Upload Methods
  onQuickDrop(event: DragEvent): void {
    event.preventDefault();
    this.isDragging = false;
    const files = event.dataTransfer?.files;
    if (files) {
      this.quickUploadFiles.push(...Array.from(files));
    }
  }

  onQuickFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files) {
      this.quickUploadFiles.push(...Array.from(input.files));
    }
  }

  toggleQuickFileSelection(fileName: string): void {
    this.quickUploadSelected[fileName] = !this.quickUploadSelected[fileName];
  }

  selectAllQuickFiles(): void {
    const allSelected = this.quickUploadFiles.every(f => this.quickUploadSelected[f.name]);
    this.quickUploadFiles.forEach(f => {
      this.quickUploadSelected[f.name] = !allSelected;
    });
  }

  removeQuickFile(index: number, event: Event): void {
    event.stopPropagation();
    const fileName = this.quickUploadFiles[index].name;
    delete this.quickUploadSelected[fileName];
    this.quickUploadFiles.splice(index, 1);
  }

  hasSelectedQuickFiles(): boolean {
    return this.quickUploadFiles.some(f => this.quickUploadSelected[f.name]);
  }

  getFileIconByName(fileName: string): string {
    const ext = fileName.split('.').pop()?.toLowerCase();
    if (ext === 'pdf') return '📄';
    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(ext || '')) return '🖼️';
    if (['doc', 'docx'].includes(ext || '')) return '📝';
    if (['xls', 'xlsx'].includes(ext || '')) return '📊';
    if (['js', 'ts', 'css', 'html'].includes(ext || '')) return '📜';
    if (ext === 'zip') return '🗜️';
    return '📁';
  }

  showDocumentSelector(): void {
    const selectedFiles = this.quickUploadFiles.filter(f => this.quickUploadSelected[f.name]);
    if (selectedFiles.length === 0) return;
    
    // Stocker les fichiers dans le service et naviguer vers /ged/add
    this.fileTransferService.setFiles(selectedFiles);
    
    // Nettoyer la liste d'envoi rapide
    this.quickUploadFiles = this.quickUploadFiles.filter(f => !this.quickUploadSelected[f.name]);
    this.quickUploadSelected = {};
    
    // Naviguer vers la page d'ajout
    this.router.navigate(['/ged/add']);
  }
  
  removePreselectedFile(index: number): void {
    this.preselectedFiles.splice(index, 1);
    if (this.preselectedFiles.length > 0) {
      this.selectedFile = this.preselectedFiles[0];
    } else {
      this.selectedFile = null;
    }
  }
}
