import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { I18nService } from '../../../core/services/i18n.service';

interface DossierATCT {
  id: number;
  email: string;
  nomFr: string;
  prenomFr: string;
  nomAr: string;
  prenomAr: string;
  telephone: string;
  paysEtranger: string;
  dateDebutDetachement: string;
  dateFinDetachement: string;
  codeRegime: string;
  statut: string;
  dateCreation: string;
  dateValidation: string;
  matriculeEmployeurComplet: string;
}

interface Document {
  id: number;
  nomOriginal: string;
  typeDocument: string;
  mimeType: string;
  tailleFichier: number;
  statut: string;
}

@Component({
  selector: 'app-cooperant-list',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './cooperant-list.component.html',
  styles: []
})
export class CooperantListComponent implements OnInit {
  loading = true;
  cooperants: Cooperant[] = [];
  filtered: Cooperant[] = [];

  searchTerm = '';
  selectedRegime = '';
  selectedValidation = '';
  
  // Suppression
  deleteId: number | null = null;
  deleteName = '';
  
  // Dossiers ATCT validés
  dossiersATCTValides: DossierATCT[] = [];
  
  // Modal documents
  showDocsModal = false;
  selectedATCT: DossierATCT | null = null;
  docsCooperant: Document[] = [];

  constructor(
    private cooperantService: CooperantService,
    public i18n: I18nService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.load();
    this.loadDossiersATCTValides();
  }

  loadDossiersATCTValides() {
    this.http.get<any[]>('/api/atct').subscribe({
      next: (dossiers) => {
        // Afficher tous les dossiers ATCT validés ou affiliés
        this.dossiersATCTValides = dossiers.filter(d => d.statut === 'VALIDE' || d.statut === 'AFFILIE');
      },
      error: (err) => console.error('Erreur chargement dossiers ATCT:', err)
    });
  }

  load() {
    this.loading = true;
    this.cooperantService.getAll().subscribe({
      next: (data) => {
        this.cooperants = data;
        this.filtered = [...data];
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement coopérants:', err);
        this.loading = false;
      }
    });
  }

  applyFilters() {
    const s = this.searchTerm.trim().toLowerCase();
    this.filtered = this.cooperants.filter(c => {
      const full = (c.nomCompletFr || `${c.prenomFr} ${c.nomFr}`).toLowerCase();
      const m = (c.matriculeComplet || '').toLowerCase();
      const matchesSearch = !s || full.includes(s) || m.includes(s) || (c.numPieceIdentite || '').toLowerCase().includes(s);
      const matchesRegime = !this.selectedRegime || c.codeRegime === this.selectedRegime;
      const matchesVal = !this.selectedValidation || (c.statutValidation || '') === this.selectedValidation;
      return matchesSearch && matchesRegime && matchesVal;
    });
  }

  resetFilters() {
    this.searchTerm = '';
    this.selectedRegime = '';
    this.selectedValidation = '';
    this.filtered = [...this.cooperants];
  }

  confirmDelete(c: Cooperant) {
    this.deleteId = c.id!;
    this.deleteName = c.nomCompletFr || `${c.prenomFr} ${c.nomFr}`;
  }

  cancelDelete() {
    this.deleteId = null;
    this.deleteName = '';
  }

  deleteCooperant() {
    if (!this.deleteId) return;
    this.cooperantService.delete(this.deleteId).subscribe({
      next: () => {
        this.deleteId = null;
        this.deleteName = '';
        this.load();
      },
      error: (err) => {
        console.error('Erreur suppression:', err);
        alert('Erreur lors de la suppression');
      }
    });
  }

  voirDocsCooperant(dossier: DossierATCT) {
    this.selectedATCT = dossier;
    this.showDocsModal = true;
    this.http.get<Document[]>(`/api/documents/cooperant/${dossier.email}`).subscribe({
      next: (docs) => this.docsCooperant = docs,
      error: () => this.docsCooperant = []
    });
  }

  fermerDocsModal() {
    this.showDocsModal = false;
    this.selectedATCT = null;
    this.docsCooperant = [];
  }

  getTypeLabel(type: string): string {
    const labels: Record<string, string> = {
      'identite': 'Pièce d\'identité',
      'contrat': 'Contrat de travail',
      'diplome': 'Diplômes',
      'attestation': 'Attestation détachement',
      'atct': 'Formulaire ATCT',
      'autres': 'Autres'
    };
    return labels[type] || type;
  }

  getFileExtension(filename: string | undefined): string {
    if (!filename) return 'FILE';
    const parts = filename.split('.');
    return parts.length > 1 ? parts[parts.length - 1].toUpperCase() : 'FILE';
  }
}
