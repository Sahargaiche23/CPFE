import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { PdfService } from '../../../core/services/pdf.service';
import { I18nService } from '../../../core/services/i18n.service';

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
  
  // Filtres
  searchTerm = '';
  selectedEmployer = '';
  selectedStatus = '';
  
  // Modal
  showDetailModal = false;
  selectedAffiliation: any = null;

  constructor(
    private cooperantService: CooperantService,
    private pdfService: PdfService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    this.loadAllData();
  }

  loadAllData() {
    this.loading = true;
    this.error = null;
    
    // Charger les coopérants qui ont un numAffiliation
    this.cooperantService.getAll().subscribe({
      next: (cooperants: Cooperant[]) => {
        // Filtrer uniquement ceux qui ont un numAffiliation
        const affiliatedCooperants = cooperants.filter(c => c.numAffiliation);
        
        this.affiliations = affiliatedCooperants.map((c: Cooperant) => ({
          id: c.id,
          numAffiliation: c.cleAffiliation && c.numAffiliation 
            ? `${c.cleAffiliation}-${c.numAffiliation}` 
            : c.numAffiliation || '-',
          employerName: c.nomCompletFr || '-',
          employerId: c.matriculeComplet || '-',
          assureName: c.nomCompletFr || c.nomCompletAr || '-',
          dateDebut: c.dateEffetAffiliation 
            ? new Date(c.dateEffetAffiliation).toLocaleDateString('fr-FR') 
            : (c.createdAt ? new Date(c.createdAt).toLocaleDateString('fr-FR') : '-'),
          dateFin: '-',
          salaire: c.salaire || 0,
          status: c.statutValidation === 'VALIDE' ? 'active' : 'inactive',
          statusLabel: c.statutValidation === 'VALIDE' ? 'Active' : 'En attente',
          regime: c.codeRegime || '500',
          email: c.email
        }));
        
        this.filteredAffiliations = [...this.affiliations];
        this.loading = false;
      },
      error: (err: any) => {
        console.error('Erreur chargement données:', err);
        this.error = 'Erreur lors du chargement des données';
        this.loading = false;
      }
    });
  }

  loadAffiliations() {
    this.loadAllData();
  }

  deleteAffiliation(id: number) {
    if (confirm('Êtes-vous sûr de vouloir retirer cette affiliation ?')) {
      // Retirer l'affiliation (numAffiliation) sans supprimer le coopérant
      this.cooperantService.updateAffiliation(id, '', '').subscribe({
        next: () => this.loadAffiliations(),
        error: (err: any) => {
          console.error('Erreur retrait affiliation:', err);
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
