import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpEventType } from '@angular/common/http';
import { AuthService } from '../../../core/services/auth.service';

interface DocumentFile {
  file: File;
  name: string;
  type: string;
  size: string;
  progress: number;
  uploaded: boolean;
  error?: string;
}

interface DocumentCategory {
  id: string;
  label: string;
  labelAr: string;
  required: boolean;
  accept: string;
  multiple: boolean;
  files: DocumentFile[];
}

@Component({
  selector: 'app-depot-documents',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <!-- Header -->
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-14" />
            <div>
              <h1 class="text-xl font-bold text-gray-800">Dépôt de Documents</h1>
              <p class="text-sm text-gray-500">إيداع الوثائق - GED</p>
            </div>
          </div>
          <div class="flex items-center gap-4">
            <a [routerLink]="['/cooperant/espace']" class="text-teal-600 hover:text-teal-800">
              ← Retour à l'espace
            </a>
          </div>
        </div>
      </header>

      <!-- Main Content -->
      <main class="max-w-5xl mx-auto px-4 py-8">
        <!-- Instructions -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-6">
          <h2 class="text-xl font-bold text-gray-800 mb-2">📁 Dépôt des documents pour inscription CNSS</h2>
          <p class="text-gray-600 mb-4">إيداع الوثائق للتسجيل في الصندوق الوطني للضمان الاجتماعي</p>
          <div class="bg-blue-50 border-l-4 border-blue-500 p-4 rounded">
            <p class="text-sm text-blue-700">
              <strong>Formats acceptés:</strong> PDF, Word (.doc, .docx), Images (JPG, PNG, GIF)<br>
              <strong>Taille max:</strong> 10 Mo par fichier
            </p>
          </div>
        </div>

        <!-- Document Categories -->
        <div class="space-y-6">
          <div *ngFor="let category of categories" class="bg-white rounded-xl shadow-lg p-6">
            <div class="flex justify-between items-start mb-4">
              <div>
                <h3 class="font-semibold text-gray-800 flex items-center gap-2">
                  {{ category.label }}
                  <span *ngIf="category.required" class="text-red-500">*</span>
                </h3>
                <p class="text-sm text-gray-500">{{ category.labelAr }}</p>
              </div>
              <span *ngIf="category.multiple" class="text-xs bg-gray-100 px-2 py-1 rounded">
                Multiple fichiers
              </span>
            </div>

            <!-- Drop Zone -->
            <div 
              class="border-2 border-dashed rounded-lg p-6 text-center transition-colors"
              [class.border-teal-500]="dragOver === category.id"
              [class.bg-teal-50]="dragOver === category.id"
              [class.border-gray-300]="dragOver !== category.id"
              (dragover)="onDragOver($event, category.id)"
              (dragleave)="onDragLeave($event)"
              (drop)="onDrop($event, category)">
              
              <input 
                type="file" 
                [id]="'file-' + category.id"
                [accept]="category.accept"
                [multiple]="category.multiple"
                (change)="onFileSelect($event, category)"
                class="hidden">
              
              <label [for]="'file-' + category.id" class="cursor-pointer">
                <svg class="w-12 h-12 mx-auto text-gray-400 mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                </svg>
                <p class="text-gray-600 mb-1">Glissez-déposez vos fichiers ici</p>
                <p class="text-sm text-gray-400">ou cliquez pour sélectionner</p>
              </label>
            </div>

            <!-- File List -->
            <div *ngIf="category.files.length > 0" class="mt-4 space-y-2">
              <div *ngFor="let file of category.files; let i = index" 
                   class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div class="flex items-center gap-3">
                  <div class="w-10 h-10 rounded flex items-center justify-center"
                       [ngClass]="getFileIconClass(file.type)">
                    <span class="text-xs font-bold text-white">{{ getFileExtension(file.name) }}</span>
                  </div>
                  <div>
                    <p class="font-medium text-gray-800 text-sm">{{ file.name }}</p>
                    <p class="text-xs text-gray-500">{{ file.size }}</p>
                  </div>
                </div>
                <div class="flex items-center gap-2">
                  <span *ngIf="file.uploaded" class="text-green-500">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                  </span>
                  <div *ngIf="file.progress > 0 && file.progress < 100" class="w-20">
                    <div class="bg-gray-200 rounded-full h-2">
                      <div class="bg-teal-500 h-2 rounded-full" [style.width.%]="file.progress"></div>
                    </div>
                  </div>
                  <button (click)="removeFile(category, i)" class="text-red-500 hover:text-red-700">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Actions -->
        <div class="mt-8 flex justify-between items-center">
          <a [routerLink]="['/cooperant/espace']" class="px-6 py-3 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300">
            ← Retour
          </a>
          <button 
            (click)="submitDocuments()"
            [disabled]="!canSubmit() || submitting"
            class="px-8 py-3 bg-teal-600 text-white rounded-lg hover:bg-teal-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2">
            <span *ngIf="submitting" class="animate-spin">⏳</span>
            {{ submitting ? 'Envoi en cours...' : 'Soumettre les documents' }}
          </button>
        </div>

        <!-- Success/Error Messages -->
        <div *ngIf="successMessage" class="mt-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded-lg">
          {{ successMessage }}
        </div>
        <div *ngIf="errorMessage" class="mt-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg">
          {{ errorMessage }}
        </div>
      </main>
    </div>
  `
})
export class DepotDocumentsComponent implements OnInit {
  categories: DocumentCategory[] = [
    {
      id: 'identite',
      label: 'Pièce d\'identité (CIN / Passeport)',
      labelAr: 'بطاقة التعريف الوطنية / جواز السفر',
      required: true,
      accept: '.pdf,.jpg,.jpeg,.png,.gif',
      multiple: false,
      files: []
    },
    {
      id: 'contrat',
      label: 'Contrat de travail / Attestation employeur',
      labelAr: 'عقد العمل / شهادة العمل',
      required: true,
      accept: '.pdf,.doc,.docx,.jpg,.jpeg,.png',
      multiple: true,
      files: []
    },
    {
      id: 'diplome',
      label: 'Diplômes et certificats',
      labelAr: 'الشهادات العلمية',
      required: false,
      accept: '.pdf,.jpg,.jpeg,.png',
      multiple: true,
      files: []
    },
    {
      id: 'attestation',
      label: 'Attestation de détachement',
      labelAr: 'شهادة الإلحاق',
      required: true,
      accept: '.pdf,.doc,.docx,.jpg,.jpeg,.png',
      multiple: false,
      files: []
    },
    {
      id: 'atct',
      label: 'Formulaire ATCT signé',
      labelAr: 'استمارة التعاون الفني الممضاة',
      required: true,
      accept: '.pdf,.jpg,.jpeg,.png',
      multiple: false,
      files: []
    },
    {
      id: 'autres',
      label: 'Autres documents',
      labelAr: 'وثائق أخرى',
      required: false,
      accept: '.pdf,.doc,.docx,.jpg,.jpeg,.png,.gif',
      multiple: true,
      files: []
    }
  ];

  dragOver: string | null = null;
  submitting = false;
  successMessage = '';
  errorMessage = '';

  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {}

  ngOnInit() {}

  onDragOver(event: DragEvent, categoryId: string) {
    event.preventDefault();
    event.stopPropagation();
    this.dragOver = categoryId;
  }

  onDragLeave(event: DragEvent) {
    event.preventDefault();
    event.stopPropagation();
    this.dragOver = null;
  }

  onDrop(event: DragEvent, category: DocumentCategory) {
    event.preventDefault();
    event.stopPropagation();
    this.dragOver = null;
    
    const files = event.dataTransfer?.files;
    if (files) {
      this.handleFiles(files, category);
    }
  }

  onFileSelect(event: Event, category: DocumentCategory) {
    const input = event.target as HTMLInputElement;
    if (input.files) {
      this.handleFiles(input.files, category);
    }
  }

  handleFiles(files: FileList, category: DocumentCategory) {
    const maxSize = 10 * 1024 * 1024; // 10 Mo
    
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      
      if (file.size > maxSize) {
        this.errorMessage = `Le fichier "${file.name}" dépasse la taille maximale de 10 Mo`;
        setTimeout(() => this.errorMessage = '', 5000);
        continue;
      }

      if (!category.multiple && category.files.length > 0) {
        category.files = [];
      }

      const docFile: DocumentFile = {
        file: file,
        name: file.name,
        type: file.type,
        size: this.formatFileSize(file.size),
        progress: 0,
        uploaded: false
      };

      category.files.push(docFile);
    }
  }

  removeFile(category: DocumentCategory, index: number) {
    category.files.splice(index, 1);
  }

  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }

  getFileExtension(filename: string): string {
    return filename.split('.').pop()?.toUpperCase() || '?';
  }

  getFileIconClass(type: string): Record<string, boolean> {
    if (type.includes('pdf')) {
      return { 'bg-red-500': true };
    } else if (type.includes('word') || type.includes('doc')) {
      return { 'bg-blue-500': true };
    } else if (type.includes('image')) {
      return { 'bg-green-500': true };
    }
    return { 'bg-gray-500': true };
  }

  canSubmit(): boolean {
    return this.categories
      .filter(c => c.required)
      .every(c => c.files.length > 0);
  }

  async submitDocuments() {
    this.submitting = true;
    this.errorMessage = '';
    this.successMessage = '';

    const user = this.authService.getCurrentUser();
    const formData = new FormData();
    formData.append('email', user?.username || '');

    for (const category of this.categories) {
      for (const file of category.files) {
        formData.append(category.id, file.file, file.file.name);
      }
    }

    try {
      this.http.post('/api/documents/upload', formData, {
        reportProgress: true,
        observe: 'events'
      }).subscribe({
        next: (event) => {
          if (event.type === HttpEventType.UploadProgress && event.total) {
            const progress = Math.round(100 * event.loaded / event.total);
            this.categories.forEach(c => {
              c.files.forEach(f => f.progress = progress);
            });
          } else if (event.type === HttpEventType.Response) {
            this.categories.forEach(c => {
              c.files.forEach(f => {
                f.progress = 100;
                f.uploaded = true;
              });
            });
            this.successMessage = 'Documents soumis avec succès! Votre demande sera traitée prochainement.';
            this.submitting = false;
          }
        },
        error: (err) => {
          console.error('Erreur upload:', err);
          this.errorMessage = 'Erreur lors de l\'envoi des documents. Veuillez réessayer.';
          this.submitting = false;
        }
      });
    } catch (err) {
      this.errorMessage = 'Erreur lors de l\'envoi des documents';
      this.submitting = false;
    }
  }
}
