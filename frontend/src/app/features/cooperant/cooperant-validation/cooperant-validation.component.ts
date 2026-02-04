import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';

interface Document {
  id: number;
  nomOriginal: string;
  typeDocument: string;
  mimeType: string;
  tailleFichier: number;
  dateUpload: string;
  statut: string;
  emailCooperant: string;
}

interface DocumentGroupe {
  email: string;
  documents: Document[];
}

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

@Component({
  selector: 'app-cooperant-validation',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './cooperant-validation.component.html',
  styles: []
})
export class CooperantValidationComponent implements OnInit {
  loading = true;
  pending: Cooperant[] = [];

  agentId = 1;
  rejectMotif = '';
  selectedId: number | null = null;
  
  // Documents
  showDocuments = false;
  selectedCooperant: Cooperant | null = null;
  documents: Document[] = [];
  loadingDocs = false;
  
  // Documents en attente (groupés par email)
  pendingDocuments: Document[] = [];
  documentsGroupes: DocumentGroupe[] = [];
  activeTab: 'cooperants' | 'documents' | 'valides' = 'documents';
  
  // Retour manque documents
  showRetourModal = false;
  retourMotif = '';
  documentsManquants: string[] = [];
  
  // Modal voir tous documents
  showVoirTousModal = false;
  selectedGroupe: DocumentGroupe | null = null;
  
  // Modal réclamation
  showReclamationModal = false;
  reclamationMotif = '';
  reclamationDocsManquants: string[] = [];
  typesDocuments = ['identite', 'contrat', 'diplome', 'attestation', 'atct', 'autres'];
  
  // Modal prévisualisation
  showPreviewModal = false;
  previewDocument: Document | null = null;
  
  // Dossiers ATCT validés
  dossiersATCTValides: DossierATCT[] = [];
  
  // Modal documents coopérant
  showDocsCooperantModal = false;
  docsCooperant: Document[] = [];
  selectedATCT: DossierATCT | null = null;

  constructor(
    private cooperantService: CooperantService,
    private http: HttpClient
  ) {}

  ngOnInit(): void {
    this.load();
    this.loadPendingDocuments();
    this.loadDossiersATCTValides();
  }

  load() {
    this.loading = true;
    this.cooperantService.getPending().subscribe({
      next: (data) => {
        this.pending = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement pending:', err);
        this.loading = false;
      }
    });
  }

  loadDossiersATCTValides() {
    this.http.get<DossierATCT[]>('/api/atct').subscribe({
      next: (dossiers) => {
        this.dossiersATCTValides = dossiers.filter(d => d.statut === 'VALIDE');
      },
      error: (err) => console.error('Erreur chargement dossiers ATCT:', err)
    });
  }

  loadPendingDocuments() {
    this.http.get<Document[]>('/api/documents/pending').subscribe({
      next: (docs) => {
        this.pendingDocuments = docs;
        // Grouper par email
        const grouped = new Map<string, Document[]>();
        docs.forEach(doc => {
          const email = doc.emailCooperant || 'inconnu';
          if (!grouped.has(email)) {
            grouped.set(email, []);
          }
          grouped.get(email)!.push(doc);
        });
        this.documentsGroupes = Array.from(grouped.entries()).map(([email, documents]) => ({
          email,
          documents
        }));
      },
      error: (err) => console.error('Erreur chargement documents:', err)
    });
  }

  validerDocument(id: number) {
    this.http.put(`/api/documents/${id}/valider`, {}).subscribe({
      next: () => this.loadPendingDocuments(),
      error: (err) => alert('Erreur validation document')
    });
  }

  rejeterDocument(id: number) {
    this.http.put(`/api/documents/${id}/rejeter`, {}).subscribe({
      next: () => this.loadPendingDocuments(),
      error: (err) => alert('Erreur rejet document')
    });
  }

  // Voir tous les documents d'un coopérant
  voirTousDocuments(groupe: DocumentGroupe) {
    this.selectedGroupe = groupe;
    this.showVoirTousModal = true;
  }

  fermerVoirTous() {
    this.showVoirTousModal = false;
    this.selectedGroupe = null;
  }

  // Prévisualiser un document
  previsualiserDocument(doc: Document) {
    this.previewDocument = doc;
    this.showPreviewModal = true;
  }

  fermerPreview() {
    this.showPreviewModal = false;
    this.previewDocument = null;
  }

  getPreviewUrl(): string {
    if (!this.previewDocument) return '';
    return '/api/documents/' + this.previewDocument.id + '/download';
  }

  // Valider tous les documents d'un groupe et valider le dossier ATCT
  validerTousDocuments(groupe: DocumentGroupe) {
    if (!confirm(`Valider tous les ${groupe.documents.length} documents de ${groupe.email} ?`)) return;
    
    // Valider tous les documents d'abord
    const requests = groupe.documents.map(doc => 
      this.http.put(`/api/documents/${doc.id}/valider`, {}).toPromise()
    );
    
    Promise.all(requests).then(() => {
      console.log('Tous les documents validés');
      
      // Chercher le dossier ATCT pour le valider si nécessaire
      this.http.get<any[]>('/api/atct').subscribe({
        next: (dossiers) => {
          const dossier = dossiers.find(d => d.email === groupe.email);
          
          if (dossier && dossier.statut === 'EN_ATTENTE') {
            // Valider le dossier ATCT seulement s'il est en attente
            this.http.post(`/api/atct/${dossier.id}/valider`, {}, {
              headers: { 'X-Agent-Id': String(this.agentId) }
            }).subscribe({
              next: () => {
                alert(`Documents et dossier ATCT validés ! Le coopérant peut maintenant être affilié.`);
                this.loadPendingDocuments();
                this.loadDossiersATCTValides();
              },
              error: (err) => {
                console.error('Erreur validation ATCT:', err);
                alert('Documents validés. Erreur validation ATCT: ' + (err.error?.message || err.message));
                this.loadPendingDocuments();
              }
            });
          } else if (dossier && (dossier.statut === 'VALIDE' || dossier.statut === 'AFFILIE')) {
            alert(`Documents validés ! Le dossier ATCT est déjà ${dossier.statut.toLowerCase()}.`);
            this.loadPendingDocuments();
          } else {
            alert('Documents validés ! Aucun dossier ATCT trouvé pour cet email.');
            this.loadPendingDocuments();
          }
        },
        error: () => {
          alert('Documents validés !');
          this.loadPendingDocuments();
        }
      });
    }).catch(err => {
      console.error('Erreur validation documents:', err);
      alert('Erreur lors de la validation des documents');
      this.loadPendingDocuments();
    });
  }

  // Ouvrir modal réclamation
  ouvrirReclamation(groupe: DocumentGroupe) {
    this.selectedGroupe = groupe;
    this.reclamationMotif = '';
    this.reclamationDocsManquants = [];
    this.showReclamationModal = true;
  }

  fermerReclamation() {
    this.showReclamationModal = false;
    this.selectedGroupe = null;
    this.reclamationMotif = '';
    this.reclamationDocsManquants = [];
  }

  toggleDocManquantReclamation(type: string) {
    const idx = this.reclamationDocsManquants.indexOf(type);
    if (idx >= 0) {
      this.reclamationDocsManquants.splice(idx, 1);
    } else {
      this.reclamationDocsManquants.push(type);
    }
  }

  envoyerReclamation() {
    if (!this.selectedGroupe) return;
    if (this.reclamationDocsManquants.length === 0 && !this.reclamationMotif.trim()) {
      alert('Sélectionnez les documents manquants ou saisissez un motif');
      return;
    }

    const body = {
      email: this.selectedGroupe.email,
      documentsManquants: this.reclamationDocsManquants,
      motif: this.reclamationMotif.trim(),
      agentId: this.agentId
    };

    this.http.post('/api/reclamations', body).subscribe({
      next: () => {
        alert('Réclamation envoyée au coopérant');
        this.fermerReclamation();
      },
      error: (err) => {
        console.error('Erreur envoi réclamation:', err);
        alert('Erreur lors de l\'envoi de la réclamation');
      }
    });
  }

  valider(id: number) {
    this.cooperantService.valider(id, this.agentId).subscribe({
      next: () => this.load(),
      error: (err) => {
        console.error('Erreur validation:', err);
        alert('Erreur validation');
      }
    });
  }

  startReject(id: number) {
    this.selectedId = id;
    this.rejectMotif = '';
  }

  rejeter() {
    if (!this.selectedId) return;
    if (!this.rejectMotif.trim()) {
      alert('Motif requis');
      return;
    }
    this.cooperantService.rejeter(this.selectedId, this.agentId, this.rejectMotif.trim()).subscribe({
      next: () => {
        this.selectedId = null;
        this.rejectMotif = '';
        this.load();
      },
      error: (err) => {
        console.error('Erreur rejet:', err);
        alert('Erreur rejet');
      }
    });
  }

  cancelReject() {
    this.selectedId = null;
    this.rejectMotif = '';
  }

  voirDocuments(c: Cooperant) {
    this.selectedCooperant = c;
    this.showDocuments = true;
    this.loadingDocs = true;
    
    this.http.get<Document[]>(`/api/documents/cooperant/${c.email}`).subscribe({
      next: (docs) => {
        this.documents = docs;
        this.loadingDocs = false;
      },
      error: (err) => {
        console.error('Erreur chargement documents:', err);
        this.documents = [];
        this.loadingDocs = false;
      }
    });
  }

  closeDocuments() {
    this.showDocuments = false;
    this.selectedCooperant = null;
    this.documents = [];
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

  formatSize(bytes: number): string {
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
    return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
  }

  startRetour(c: Cooperant) {
    this.selectedCooperant = c;
    this.showRetourModal = true;
    this.retourMotif = '';
    this.documentsManquants = [];
  }

  toggleDocManquant(doc: string) {
    const idx = this.documentsManquants.indexOf(doc);
    if (idx >= 0) {
      this.documentsManquants.splice(idx, 1);
    } else {
      this.documentsManquants.push(doc);
    }
  }

  cancelRetour() {
    this.showRetourModal = false;
    this.selectedCooperant = null;
    this.retourMotif = '';
    this.documentsManquants = [];
  }

  envoyerRetour() {
    if (!this.selectedCooperant) return;
    if (this.documentsManquants.length === 0 && !this.retourMotif.trim()) {
      alert('Veuillez sélectionner les documents manquants ou saisir un motif');
      return;
    }
    
    const motif = 'Documents manquants: ' + this.documentsManquants.join(', ') + 
                  (this.retourMotif ? '\n' + this.retourMotif : '');
    
    this.cooperantService.rejeter(this.selectedCooperant.id!, this.agentId, motif).subscribe({
      next: () => {
        alert('Demande de compléments envoyée au coopérant');
        this.cancelRetour();
        this.load();
      },
      error: (err) => {
        console.error('Erreur envoi retour:', err);
        alert('Erreur lors de l\'envoi');
      }
    });
  }

  getFileExtension(filename: string | undefined): string {
    if (!filename) return 'FILE';
    const parts = filename.split('.');
    return parts.length > 1 ? parts[parts.length - 1].toUpperCase() : 'FILE';
  }

  getRegimeLabel(code: string): string {
    const regimes: Record<string, string> = {
      '500': 'Général',
      '510': 'Agricole Amélioré',
      '520': 'Agricole'
    };
    return regimes[code] || code;
  }

  voirDocsCooperant(dossier: DossierATCT) {
    this.selectedATCT = dossier;
    this.showDocsCooperantModal = true;
    this.http.get<Document[]>(`/api/documents/cooperant/${dossier.email}`).subscribe({
      next: (docs) => this.docsCooperant = docs,
      error: () => this.docsCooperant = []
    });
  }

  fermerDocsCooperant() {
    this.showDocsCooperantModal = false;
    this.selectedATCT = null;
    this.docsCooperant = [];
  }
}
