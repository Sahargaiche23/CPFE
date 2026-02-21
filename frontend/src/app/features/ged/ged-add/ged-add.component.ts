import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { GedService } from '../../../core/services/ged.service';
import { FileTransferService } from '../../../core/services/file-transfer.service';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-ged-add',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="flex h-[calc(100vh-120px)]">
        <!-- Sidebar gauche - Liste documents -->
        <aside class="w-72 bg-white border-r border-gray-200 flex flex-col">
          <div class="p-4">
            <button routerLink="/ged" class="w-full bg-pink-600 hover:bg-pink-700 text-white px-4 py-2.5 rounded-lg flex items-center justify-center gap-2 font-medium">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
              </svg>
              Ajouter un document
            </button>
          </div>
          <div class="px-4 pb-4">
            <div class="relative">
              <input type="text" placeholder="Rechercher..." class="w-full border border-gray-300 rounded-lg pl-10 pr-4 py-2 text-sm">
              <svg class="absolute left-3 top-2.5 w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
              </svg>
            </div>
          </div>
          <div class="flex-1 overflow-y-auto px-4">
            <div class="text-sm text-gray-500 mb-2">Documents récents</div>
            <div *ngFor="let doc of recentDocs" class="p-2 hover:bg-gray-100 rounded cursor-pointer text-sm">
              {{ doc.titre }}
            </div>
          </div>
        </aside>

        <!-- Formulaire principal -->
        <main class="flex-1 overflow-y-auto bg-gray-50">
          <div class="max-w-4xl mx-auto p-8">
            <!-- Header -->
            <div class="flex justify-between items-center mb-8">
              <h1 class="text-2xl font-bold text-gray-800">Nouveau Document</h1>
              <button (click)="save()" [disabled]="saving" 
                      class="px-6 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700 disabled:opacity-50 flex items-center gap-2">
                <svg *ngIf="saving" class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
                </svg>
                Enregistrer
              </button>
            </div>

            <!-- Métadonnées principales -->
            <div class="bg-white rounded-lg shadow-sm p-6 mb-6">
              <h2 class="text-lg font-semibold text-gray-800 mb-6 pb-2 border-b">Métadonnées principales</h2>
              
              <div class="space-y-6">
                <!-- Titre -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2">Titre *</label>
                  <input type="text" [(ngModel)]="document.titre" 
                         placeholder="Titre principal du document"
                         class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-pink-500 focus:border-pink-500">
                </div>

                <!-- Description -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                  <div class="border border-gray-300 rounded-lg overflow-hidden">
                    <!-- Toolbar -->
                    <div class="bg-gray-50 border-b border-gray-200 px-3 py-2 flex gap-1">
                      <button class="p-1.5 hover:bg-gray-200 rounded" title="Gras">
                        <span class="font-bold text-sm">B</span>
                      </button>
                      <button class="p-1.5 hover:bg-gray-200 rounded" title="Italique">
                        <span class="italic text-sm">I</span>
                      </button>
                      <button class="p-1.5 hover:bg-gray-200 rounded" title="Souligné">
                        <span class="underline text-sm">U</span>
                      </button>
                      <button class="p-1.5 hover:bg-gray-200 rounded" title="Barré">
                        <span class="line-through text-sm">S</span>
                      </button>
                      <div class="w-px bg-gray-300 mx-1"></div>
                      <button class="p-1.5 hover:bg-gray-200 rounded text-sm font-bold">H₁</button>
                      <button class="p-1.5 hover:bg-gray-200 rounded text-sm font-bold">H₂</button>
                      <div class="w-px bg-gray-300 mx-1"></div>
                      <button class="p-1.5 hover:bg-gray-200 rounded">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h7"/>
                        </svg>
                      </button>
                      <button class="p-1.5 hover:bg-gray-200 rounded">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"/>
                        </svg>
                      </button>
                      <button class="p-1.5 hover:bg-gray-200 rounded">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                      </button>
                    </div>
                    <textarea [(ngModel)]="document.description" rows="5" 
                              class="w-full px-4 py-3 focus:outline-none resize-none"
                              placeholder="Description du document..."></textarea>
                  </div>
                </div>

                <!-- Date de création -->
                <div class="grid grid-cols-2 gap-6">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Date de création</label>
                    <input type="date" [(ngModel)]="document.dateCreation" 
                           class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-pink-500">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Langue</label>
                    <select [(ngModel)]="document.langue" class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-pink-500">
                      <option value="fr">Français</option>
                      <option value="ar">العربية</option>
                      <option value="en">English</option>
                    </select>
                  </div>
                </div>

                <!-- Fichiers -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2">Nouveaux fichiers</label>
                  <div class="flex items-center gap-4">
                    <input type="file" #fileInput (change)="onFilesSelected($event)" multiple class="hidden">
                    <button (click)="fileInput.click()" 
                            class="px-4 py-2 bg-pink-100 text-pink-700 rounded-lg hover:bg-pink-200 font-medium">
                      Parcourir...
                    </button>
                    <span class="text-gray-500 text-sm">
                      {{ selectedFiles.length > 0 ? selectedFiles.length + ' fichier(s) sélectionné(s)' : 'Aucun fichier sélectionné.' }}
                    </span>
                  </div>
                  <!-- Liste des fichiers sélectionnés -->
                  <div *ngIf="selectedFiles.length > 0" class="mt-4 space-y-2">
                    <div *ngFor="let file of selectedFiles; let i = index" 
                         class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                      <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-gray-200 rounded flex items-center justify-center">
                          {{ getFileIcon(file.type) }}
                        </div>
                        <div>
                          <div class="font-medium text-sm">{{ file.name }}</div>
                          <div class="text-xs text-gray-500">{{ formatSize(file.size) }}</div>
                        </div>
                      </div>
                      <button (click)="removeFile(i)" class="text-red-500 hover:text-red-700">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Tags -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2">Tags</label>
                  <div class="flex flex-wrap gap-2 mb-2">
                    <span *ngFor="let tag of document.tags; let i = index" 
                          class="px-3 py-1 bg-pink-100 text-pink-700 rounded-full text-sm flex items-center gap-1">
                      {{ tag }}
                      <button (click)="removeTag(i)" class="hover:text-pink-900">×</button>
                    </span>
                  </div>
                  <input type="text" [(ngModel)]="newTag" (keyup.enter)="addTag()" 
                         placeholder="Entrez un tag et appuyez sur Entrée"
                         class="w-full border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-pink-500">
                </div>
              </div>
            </div>

            <!-- Métadonnées secondaires -->
            <div class="bg-white rounded-lg shadow-sm p-6 mb-6">
              <div class="flex justify-between items-center mb-4">
                <h2 class="text-lg font-semibold text-gray-800">Métadonnées secondaires</h2>
                <button (click)="addMetadata()" class="text-pink-600 hover:text-pink-800">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                  </svg>
                </button>
              </div>
              <div *ngFor="let meta of metadata; let i = index" class="flex gap-4 mb-3">
                <input type="text" [(ngModel)]="meta.key" placeholder="Clé" 
                       class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm">
                <input type="text" [(ngModel)]="meta.value" placeholder="Valeur" 
                       class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm">
                <button (click)="removeMetadata(i)" class="text-red-500 hover:text-red-700">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                  </svg>
                </button>
              </div>
              <div *ngIf="metadata.length === 0" class="text-gray-400 text-sm text-center py-4">
                Cliquez sur + pour ajouter des métadonnées
              </div>
            </div>

            <!-- Catégorie -->
            <div class="bg-white rounded-lg shadow-sm p-6 mb-6">
              <h2 class="text-lg font-semibold text-gray-800 mb-4">Catégorie</h2>
              <div class="grid grid-cols-5 gap-3">
                <button *ngFor="let cat of categories" (click)="document.categorie = cat.id"
                        class="p-4 rounded-lg border-2 text-center transition"
                        [class.border-pink-500]="document.categorie === cat.id"
                        [class.bg-pink-50]="document.categorie === cat.id"
                        [class.border-gray-200]="document.categorie !== cat.id">
                  <div class="text-2xl mb-1">{{ cat.icon }}</div>
                  <div class="text-sm font-medium">{{ cat.nom }}</div>
                </button>
              </div>
            </div>

            <!-- Actions -->
            <div class="flex justify-end gap-4">
              <button routerLink="/ged" class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                Annuler
              </button>
              <button (click)="save()" [disabled]="saving || !document.titre" 
                      class="px-6 py-2 bg-pink-600 text-white rounded-lg hover:bg-pink-700 disabled:opacity-50">
                {{ saving ? 'Enregistrement...' : 'Enregistrer' }}
              </button>
            </div>
          </div>
        </main>
      </div>
    </app-main-layout>
  `
})
export class GedAddComponent implements OnInit {
  document = {
    titre: '',
    description: '',
    dateCreation: new Date().toISOString().split('T')[0],
    langue: 'fr',
    categorie: 'AUTRE',
    tags: [] as string[]
  };
  
  selectedFiles: File[] = [];
  newTag = '';
  metadata: { key: string; value: string }[] = [];
  recentDocs: any[] = [];
  saving = false;

  categories = [
    { id: 'IDENTITE', nom: 'Identité', icon: '🪪' },
    { id: 'CONTRAT', nom: 'Contrats', icon: '📑' },
    { id: 'ATTESTATION', nom: 'Attestations', icon: '📜' },
    { id: 'ATCT', nom: 'ATCT', icon: '🌍' },
    { id: 'AUTRE', nom: 'Autres', icon: '📁' }
  ];

  constructor(
    private gedService: GedService,
    private router: Router,
    private fileTransferService: FileTransferService
  ) {}

  ngOnInit(): void {
    this.loadRecentDocs();
    // Récupérer les fichiers pré-sélectionnés depuis l'envoi rapide
    if (this.fileTransferService.hasFiles()) {
      this.selectedFiles = this.fileTransferService.getFiles();
      if (this.selectedFiles.length > 0) {
        // Pré-remplir le titre avec le nom du premier fichier
        this.document.titre = this.selectedFiles[0].name.replace(/\.[^/.]+$/, '');
      }
      this.fileTransferService.clearFiles();
    }
  }

  loadRecentDocs(): void {
    this.gedService.getDocuments().subscribe({
      next: (docs) => this.recentDocs = docs.slice(0, 5),
      error: () => {}
    });
  }

  onFilesSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files) {
      this.selectedFiles = [...this.selectedFiles, ...Array.from(input.files)];
    }
  }

  removeFile(index: number): void {
    this.selectedFiles.splice(index, 1);
  }

  addTag(): void {
    if (this.newTag.trim() && !this.document.tags.includes(this.newTag.trim())) {
      this.document.tags.push(this.newTag.trim());
      this.newTag = '';
    }
  }

  removeTag(index: number): void {
    this.document.tags.splice(index, 1);
  }

  addMetadata(): void {
    this.metadata.push({ key: '', value: '' });
  }

  removeMetadata(index: number): void {
    this.metadata.splice(index, 1);
  }

  save(): void {
    if (!this.document.titre || this.selectedFiles.length === 0) {
      alert('Veuillez saisir un titre et sélectionner au moins un fichier');
      return;
    }

    this.saving = true;
    
    // Upload each file
    const file = this.selectedFiles[0];
    this.gedService.uploadDocumentSimple(file, {
      titre: this.document.titre,
      description: this.document.description,
      categorie: this.document.categorie,
      tags: this.document.tags
    }).subscribe({
      next: () => {
        this.saving = false;
        this.router.navigate(['/ged']);
      },
      error: (err) => {
        console.error('Erreur:', err);
        this.saving = false;
        alert('Erreur lors de l\'enregistrement');
      }
    });
  }

  getFileIcon(type: string): string {
    if (type?.includes('pdf')) return '📄';
    if (type?.includes('image')) return '🖼️';
    if (type?.includes('word')) return '📝';
    if (type?.includes('excel')) return '📊';
    return '📁';
  }

  formatSize(bytes: number): string {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];
  }
}
