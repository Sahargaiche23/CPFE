import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { PdfService } from '../../../core/services/pdf.service';
import { I18nService } from '../../../core/services/i18n.service';

interface DossierATCT {
  id: number;
  email: string;
  nomFr: string;
  prenomFr: string;
  matriculeEmployeurComplet: string;
  statut: string;
  dateCreation: string;
  affiliationId: number | null;
  numAffiliation: string | null;
}

@Component({
  selector: 'app-affiliation-list',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './affiliation-list.component.html',
  styles: []
})
export class AffiliationListComponent implements OnInit {
  loading = true;
  affiliations: any[] = [];
  filteredAffiliations: any[] = [];
  employers: any[] = [];
  error: string | null = null;
  
  // Coopérants ATCT validés en attente d'affiliation
  pendingATCT: DossierATCT[] = [];
  
  // Filtres
  searchTerm = '';
  selectedEmployer = '';
  selectedStatus = '';
  
  // Modal
  showDetailModal = false;
  selectedAffiliation: any = null;
  
  // Modal création affiliation
  showCreateModal = false;
  selectedDossier: DossierATCT | null = null;
  newAffiliation = {
    regime: '500',
    salaire: 0,
    dateEffet: ''
  };
  
  regimes = [
    { code: '500', label: 'Coopérant Général' },
    { code: '510', label: 'Coopérant Agricole Amélioré' },
    { code: '520', label: 'Régime Agricole' }
  ];

  constructor(
    private cooperantService: CooperantService,
    private pdfService: PdfService,
    public i18n: I18nService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.loadAllData();
    this.loadPendingATCT();
  }

  loadPendingATCT() {
    this.http.get<DossierATCT[]>('/api/atct').subscribe({
      next: (dossiers) => {
        // Filtrer les dossiers ATCT validés qui n'ont pas encore d'affiliation
        this.pendingATCT = dossiers.filter(d => d.statut === 'VALIDE' && !d.affiliationId);
      },
      error: (err) => console.error('Erreur chargement ATCT:', err)
    });
  }

  ouvrirCreationAffiliation(dossier: DossierATCT) {
    this.selectedDossier = dossier;
    this.newAffiliation = {
      regime: '500',
      salaire: 0,
      dateEffet: new Date().toISOString().split('T')[0]
    };
    this.showCreateModal = true;
  }

  fermerCreationModal() {
    this.showCreateModal = false;
    this.selectedDossier = null;
  }

  creerAffiliation() {
    if (!this.selectedDossier) return;
    
    const payload = {
      email: this.selectedDossier.email,
      codeRegime: this.newAffiliation.regime,
      salaire: this.newAffiliation.salaire,
      dateEffetAffiliation: this.newAffiliation.dateEffet
    };
    
    this.http.post('/api/affiliations/create-from-atct', payload).subscribe({
      next: (result: any) => {
        alert(`Affiliation créée avec succès ! N° ${result.numAffiliation || 'généré'}`);
        this.fermerCreationModal();
        this.loadAllData();
        this.loadPendingATCT();
      },
      error: (err) => {
        console.error('Erreur création affiliation:', err);
        alert('Erreur lors de la création de l\'affiliation');
      }
    });
  }

  loadAllData() {
    this.loading = true;
    this.error = null;
    
    // Charger les dossiers ATCT (source principale pour les affiliations)
    this.http.get<any[]>('/api/atct').subscribe({
      next: (dossiers) => {
        // Aussi charger les coopérants pour compléter les données
        this.cooperantService.getAll().subscribe({
          next: (cooperants: Cooperant[]) => {
            this.buildAffiliationsList(dossiers, cooperants);
            this.loading = false;
          },
          error: () => {
            this.buildAffiliationsList(dossiers, []);
            this.loading = false;
          }
        });
      },
      error: (err: any) => {
        console.error('Erreur chargement ATCT:', err);
        // Fallback: charger uniquement depuis les coopérants
        this.cooperantService.getAll().subscribe({
          next: (cooperants: Cooperant[]) => {
            const affiliated = cooperants.filter(c => c.numAffiliation);
            this.affiliations = affiliated.map(c => ({
              id: c.id,
              numAffiliation: c.cleAffiliation && c.numAffiliation 
                ? `${c.cleAffiliation}-${c.numAffiliation}` : c.numAffiliation || '-',
              employerName: '-',
              employerId: '-',
              assureName: c.nomCompletFr || c.nomCompletAr || '-',
              assureNameAr: c.nomCompletAr || '',
              numSecuSociale: c.numPieceIdentite || '-',
              dateDebut: c.dateEffetAffiliation 
                ? new Date(c.dateEffetAffiliation).toLocaleDateString('fr-FR') : '-',
              dateFin: '-',
              salaire: c.salaire || 0,
              status: 'active',
              statusLabel: 'Active',
              regime: c.codeRegime || '500',
              email: c.email
            }));
            this.filteredAffiliations = [...this.affiliations];
            this.loading = false;
          },
          error: () => {
            this.error = 'Erreur lors du chargement des données';
            this.loading = false;
          }
        });
      }
    });
  }

  private buildAffiliationsList(dossiers: any[], cooperants: Cooperant[]) {
    const seen = new Set<string>();
    this.affiliations = [];

    // 1. Dossiers ATCT affiliés (source fiable - contient numAffiliation même si coopérant inactif)
    const affiliatedDossiers = dossiers.filter(d => d.statut === 'AFFILIE' && d.numAffiliation);
    for (const d of affiliatedDossiers) {
      const key = d.email || d.id;
      if (seen.has(key)) continue;
      seen.add(key);

      const coop = cooperants.find(c => c.email === d.email);
      this.affiliations.push({
        id: d.affiliationId || d.id,
        numAffiliation: d.numAffiliation || '-',
        employerName: d.paysEtranger || 'Employeur étranger',
        employerId: d.matriculeEmployeurComplet || '-',
        assureName: d.nomCompletFr || `${d.prenomFr || ''} ${d.nomFr || ''}`.trim() || '-',
        assureNameAr: d.nomCompletAr || `${d.prenomAr || ''} ${d.nomAr || ''}`.trim() || '',
        numSecuSociale: d.numSecuSociale || coop?.numPieceIdentite || '-',
        dateDebut: d.dateDebutDetachement 
          ? new Date(d.dateDebutDetachement).toLocaleDateString('fr-FR') : '-',
        dateFin: d.dateFinDetachement 
          ? new Date(d.dateFinDetachement).toLocaleDateString('fr-FR') : '-',
        salaire: d.salaireTunisie || coop?.salaire || 0,
        status: 'active',
        statusLabel: 'Active',
        regime: d.codeRegime || coop?.codeRegime || '500',
        email: d.email
      });
    }

    // 2. Coopérants avec numAffiliation qui ne sont pas déjà dans la liste
    const affiliatedCooperants = cooperants.filter(c => c.numAffiliation);
    for (const c of affiliatedCooperants) {
      const key = c.email || String(c.id);
      if (seen.has(key)) continue;
      seen.add(key);

      const dossier = dossiers.find(d => d.email === c.email);
      this.affiliations.push({
        id: c.id,
        numAffiliation: c.cleAffiliation && c.numAffiliation 
          ? `${c.cleAffiliation}-${c.numAffiliation}` : c.numAffiliation || '-',
        employerName: dossier?.paysEtranger || 'Employeur étranger',
        employerId: dossier?.matriculeEmployeurComplet || '-',
        assureName: c.nomCompletFr || c.nomCompletAr || '-',
        assureNameAr: c.nomCompletAr || '',
        numSecuSociale: c.numPieceIdentite || '-',
        dateDebut: c.dateEffetAffiliation 
          ? new Date(c.dateEffetAffiliation).toLocaleDateString('fr-FR') : '-',
        dateFin: dossier?.dateFinDetachement 
          ? new Date(dossier.dateFinDetachement).toLocaleDateString('fr-FR') : '-',
        salaire: c.salaire || 0,
        status: c.statutValidation === 'VALIDE' ? 'active' : 'inactive',
        statusLabel: c.statutValidation === 'VALIDE' ? 'Active' : 'En attente',
        regime: c.codeRegime || '500',
        email: c.email
      });
    }

    this.filteredAffiliations = [...this.affiliations];
  }

  loadAffiliations() {
    this.loadAllData();
  }

  deleteAffiliation(affiliation: any) {
    if (confirm('Êtes-vous sûr de vouloir retirer cette affiliation ?')) {
      const doReload = () => {
        this.loadAllData();
        this.loadPendingATCT();
      };

      // Charger dossiers ATCT et coopérants en parallèle
      this.http.get<any[]>('/api/atct').subscribe({
        next: (dossiers) => {
          // 1. Reset dossier ATCT → VALIDE
          const dossier = dossiers.find(d => d.email === affiliation.email && d.statut === 'AFFILIE');
          const resetAtctDone = new Promise<void>((resolve) => {
            if (dossier) {
              const { nomCompletFr, nomCompletAr, matriculeEmployeurComplet, ...cleanDossier } = dossier;
              cleanDossier.affiliationId = null;
              cleanDossier.numAffiliation = null;
              cleanDossier.statut = 'VALIDE';
              this.http.put(`/api/atct/${dossier.id}`, cleanDossier).subscribe({
                next: () => { console.log('Dossier ATCT remis en VALIDE'); resolve(); },
                error: (err) => { console.error('Erreur reset ATCT:', err); resolve(); }
              });
            } else {
              resolve();
            }
          });

          // 2. Effacer numAffiliation du coopérant via son ID (affiliationId du dossier ATCT)
          const coopId = dossier?.affiliationId || affiliation.id;
          const resetCoopDone = new Promise<void>((resolve) => {
            if (coopId) {
              console.log('Effacement affiliation coopérant ID:', coopId);
              this.cooperantService.updateAffiliation(coopId, '', '').subscribe({
                next: () => { console.log('Coopérant affiliation effacée'); resolve(); },
                error: (err) => { console.error('Erreur reset coopérant:', err); resolve(); }
              });
            } else {
              console.log('Aucun ID coopérant trouvé');
              resolve();
            }
          });

          // 3. Attendre les deux puis recharger
          Promise.all([resetAtctDone, resetCoopDone]).then(() => doReload());
        },
        error: () => {
          alert('Erreur lors du retrait de l\'affiliation');
        }
      });
    }
  }

  getActiveCount(): number {
    return this.affiliations.filter(a => a.status === 'active').length;
  }

  getInactiveCount(): number {
    return this.affiliations.filter(a => a.status === 'inactive').length;
  }

  getTotalSalary(): number {
    return this.affiliations.reduce((sum, a) => sum + (a.salaire || 0), 0);
  }

  generateAttestation(affiliation: any) {
    this.pdfService.generateAffiliationAttestation({
      affiliationNumber: affiliation.numAffiliation,
      employerName: affiliation.employerName,
      employerNumber: affiliation.employerId,
      employeeName: affiliation.assureName,
      startDate: affiliation.dateDebut,
      regime: '500'
    });
  }

  // Filtres
  applyFilters() {
    this.filteredAffiliations = this.affiliations.filter(a => {
      const matchesSearch = !this.searchTerm || 
        a.numAffiliation.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        a.assureName.toLowerCase().includes(this.searchTerm.toLowerCase());
      
      const matchesEmployer = !this.selectedEmployer || a.employerId === this.selectedEmployer;
      
      const matchesStatus = !this.selectedStatus || a.status === this.selectedStatus;
      
      return matchesSearch && matchesEmployer && matchesStatus;
    });
  }

  resetFilters() {
    this.searchTerm = '';
    this.selectedEmployer = '';
    this.selectedStatus = '';
    this.filteredAffiliations = [...this.affiliations];
  }

  // Modal
  viewDetails(affiliation: any) {
    this.selectedAffiliation = affiliation;
    this.showDetailModal = true;
  }

  closeModal() {
    this.showDetailModal = false;
    this.selectedAffiliation = null;
  }

  // Export PDF avec rendu arabe correct (côté frontend)
  exportPDF() {
    // Utiliser le PdfService pour générer le rapport avec le même en-tête que l'attestation
    this.pdfService.generateAffiliationsReport(this.affiliations, 'TUNIS');
  }
}
