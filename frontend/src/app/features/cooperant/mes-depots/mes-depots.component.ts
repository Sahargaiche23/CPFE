import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';

interface Document {
  id: number;
  nomFichier: string;
  nomOriginal: string;
  typeDocument: string;
  mimeType: string;
  tailleFichier: number;
  dateUpload: string;
  statut: string;
}

@Component({
  selector: 'app-mes-depots',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <a routerLink="/cooperant/espace" class="text-teal-600 hover:text-teal-800">← Retour à l'espace</a>
        </div>
      </header>

      <main class="max-w-6xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6">
          <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-gray-800">📁 Mes Dépôts de Documents</h2>
            <a routerLink="/cooperant/depot-documents" 
               class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700">
              + Nouveau dépôt
            </a>
          </div>

          <div *ngIf="loading" class="flex justify-center py-12">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-teal-600"></div>
          </div>

          <div *ngIf="!loading && documents.length === 0" class="text-center py-12">
            <div class="text-6xl mb-4">📭</div>
            <h3 class="text-xl font-semibold text-gray-700 mb-2">Aucun document déposé</h3>
            <p class="text-gray-500 mb-4">Vous n'avez pas encore soumis de documents.</p>
            <a routerLink="/cooperant/depot-documents" 
               class="inline-block px-6 py-3 bg-teal-600 text-white rounded-lg hover:bg-teal-700">
              Déposer mes documents
            </a>
          </div>

          <!-- Résumé par statut -->
          <div *ngIf="!loading && documents.length > 0" class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
            <div class="bg-gray-50 p-4 rounded-lg text-center">
              <div class="text-3xl font-bold text-gray-800">{{ documents.length }}</div>
              <div class="text-sm text-gray-500">Total documents</div>
            </div>
            <div class="bg-yellow-50 p-4 rounded-lg text-center">
              <div class="text-3xl font-bold text-yellow-600">{{ getCountByStatus('EN_ATTENTE') }}</div>
              <div class="text-sm text-yellow-700">En attente</div>
            </div>
            <div class="bg-green-50 p-4 rounded-lg text-center">
              <div class="text-3xl font-bold text-green-600">{{ getCountByStatus('VALIDE') }}</div>
              <div class="text-sm text-green-700">Validés</div>
            </div>
            <div class="bg-red-50 p-4 rounded-lg text-center">
              <div class="text-3xl font-bold text-red-600">{{ getCountByStatus('REJETE') }}</div>
              <div class="text-sm text-red-700">Rejetés</div>
            </div>
          </div>

          <!-- Liste des documents par catégorie -->
          <div *ngIf="!loading && documents.length > 0" class="space-y-6">
            <div *ngFor="let category of getCategories()" class="border rounded-lg overflow-hidden">
              <div class="bg-gray-100 px-4 py-3 font-semibold text-gray-700 flex items-center justify-between">
                <span>{{ getCategoryLabel(category) }}</span>
                <span class="text-sm text-gray-500">{{ getDocumentsByCategory(category).length }} document(s)</span>
              </div>
              <div class="divide-y">
                <div *ngFor="let doc of getDocumentsByCategory(category)" 
                     class="p-4 flex items-center justify-between hover:bg-gray-50">
                  <div class="flex items-center gap-4">
                    <div class="w-10 h-10 rounded-lg flex items-center justify-center text-white text-xs font-bold"
                         [ngClass]="getFileIconClass(doc.mimeType)">
                      {{ getFileExtension(doc.nomOriginal) }}
                    </div>
                    <div>
                      <p class="font-medium text-gray-800">{{ doc.nomOriginal }}</p>
                      <p class="text-sm text-gray-500">
                        {{ formatFileSize(doc.tailleFichier) }} • {{ formatDate(doc.dateUpload) }}
                      </p>
                    </div>
                  </div>
                  <div class="flex items-center gap-3">
                    <span class="px-3 py-1 rounded-full text-sm font-medium"
                          [ngClass]="{
                            'bg-yellow-100 text-yellow-800': doc.statut === 'EN_ATTENTE',
                            'bg-green-100 text-green-800': doc.statut === 'VALIDE',
                            'bg-red-100 text-red-800': doc.statut === 'REJETE'
                          }">
                      {{ getStatusLabel(doc.statut) }}
                    </span>
                    <a [href]="'/api/documents/' + doc.id + '/download'" target="_blank"
                       class="p-2 text-teal-600 hover:bg-teal-50 rounded-lg">
                      📥
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  `
})
export class MesDepotsComponent implements OnInit {
  documents: Document[] = [];
  loading = true;
  userEmail = '';

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    const userStr = localStorage.getItem('user');
    if (userStr) {
      const user = JSON.parse(userStr);
      this.userEmail = user.username || user.email || '';
    }
    this.loadDocuments();
  }

  loadDocuments() {
    if (!this.userEmail) {
      this.loading = false;
      return;
    }

    this.http.get<Document[]>(`/api/documents/cooperant/${this.userEmail}`).subscribe({
      next: (data) => {
        this.documents = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement documents:', err);
        this.loading = false;
      }
    });
  }

  getCountByStatus(statut: string): number {
    return this.documents.filter(d => d.statut === statut).length;
  }

  getCategories(): string[] {
    const categories = [...new Set(this.documents.map(d => d.typeDocument))];
    return categories.sort();
  }

  getDocumentsByCategory(category: string): Document[] {
    return this.documents.filter(d => d.typeDocument === category);
  }

  getCategoryLabel(type: string): string {
    const labels: { [key: string]: string } = {
      'identite': '🪪 Pièce d\'identité',
      'contrat': '📝 Contrat de travail',
      'diplome': '🎓 Diplômes',
      'attestation': '📜 Attestation de détachement',
      'atct': '📋 Formulaire ATCT',
      'autres': '📎 Autres documents'
    };
    return labels[type?.toLowerCase()] || type;
  }

  getStatusLabel(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return '⏳ En attente';
      case 'VALIDE': return '✓ Validé';
      case 'REJETE': return '✗ Rejeté';
      default: return statut;
    }
  }

  getFileExtension(filename: string): string {
    return filename?.split('.').pop()?.toUpperCase() || '?';
  }

  getFileIconClass(mimeType: string): Record<string, boolean> {
    if (mimeType?.includes('pdf')) return { 'bg-red-500': true };
    if (mimeType?.includes('image')) return { 'bg-green-500': true };
    if (mimeType?.includes('word') || mimeType?.includes('doc')) return { 'bg-blue-500': true };
    return { 'bg-gray-500': true };
  }

  formatFileSize(bytes: number): string {
    if (!bytes) return '0 KB';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];
  }

  formatDate(dateStr: string): string {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('fr-FR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric'
    });
  }
}
