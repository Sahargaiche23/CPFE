import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { forkJoin } from 'rxjs';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AffiliationService } from '../../../core/services/affiliation.service';
import { EmployerService } from '../../../core/services/employer.service';
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
    private affiliationService: AffiliationService,
    private employerService: EmployerService,
    private pdfService: PdfService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    this.loadAllData();
  }

  loadAllData() {
    this.loading = true;
    this.error = null;
    
    // Charger toutes les données en parallèle
    forkJoin({
      employers: this.employerService.getAll(),
      affiliations: this.affiliationService.getAll()
    }).subscribe({
      next: (result) => {
        // Mapper les employeurs d'abord
        this.employers = result.employers.map(e => ({
          id: `${e.empMat}-${e.empCle}`,
          empMat: e.empMat,
          empCle: e.empCle,
          name: e.nomCommercial || `Employeur ${e.empMat}`
        }));
        
        // Ensuite mapper les affiliations avec les employeurs disponibles
        this.affiliations = result.affiliations.map((a: any) => {
          // Trouver le nom de l'employeur
          const employer = this.employers.find(e => e.id === `${a.empMat}-${a.empCle}`);
          
          // Construire le nom complet de l'assuré
          const assureName = (a.assNom && a.assPrenom) 
            ? `${a.assNom} ${a.assPrenom}` 
            : (a.lastName && a.firstName) 
              ? `${a.lastName} ${a.firstName}`
              : a.assureMatriculeComplet || '-';
          
          return {
            id: a.dcoId,
            numAffiliation: a.dcoNumAffiliation && a.dcoClefAffiliation 
              ? `${a.dcoClefAffiliation}-${a.dcoNumAffiliation}` 
              : a.assureMatriculeComplet || '-',
            employerName: employer?.name || '-',
            employerId: `${a.empMat}-${a.empCle}`,
            assureName: assureName,
            dateDebut: a.dcoDateDebut ? new Date(a.dcoDateDebut).toLocaleDateString('fr-FR') : '-',
            dateFin: a.dcoDateFin ? new Date(a.dcoDateFin).toLocaleDateString('fr-FR') : '-',
            salaire: a.dcoSalaire || 0,
            status: a.actif !== false ? 'active' : 'inactive',
            statusLabel: a.actif !== false ? 'Active' : 'Inactive'
          };
        });
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
    if (confirm('Êtes-vous sûr de vouloir supprimer cette affiliation ?')) {
      this.affiliationService.delete(id).subscribe({
        next: () => this.loadAffiliations(),
        error: (err: any) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression');
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
