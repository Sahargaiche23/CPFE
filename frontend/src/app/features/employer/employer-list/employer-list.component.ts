import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService, Employer } from '../../../core/services/employer.service';
import { PdfService } from '../../../core/services/pdf.service';
import { I18nService } from '../../../core/services/i18n.service';

@Component({
  selector: 'app-employer-list',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './employer-list.component.html',
  styles: []
})
export class EmployerListComponent implements OnInit {
  loading = true;
  employers: any[] = [];
  filteredEmployers: any[] = [];
  error: string | null = null;
  
  // Filtres
  searchTerm = '';
  selectedRegime = '';
  selectedStatus = '';

  constructor(
    private employerService: EmployerService,
    private pdfService: PdfService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    this.loadEmployers();
  }

  loadEmployers() {
    this.loading = true;
    this.error = null;
    
    this.employerService.getAll().subscribe({
      next: (data: Employer[]) => {
        this.employers = data.map(e => ({
          id: e.empMat,
          empMat: e.empMat,
          empCle: e.empCle,
          employerNumber: `${e.empMat}-${e.empCle}`,
          tradeName: e.nomCommercial || '-',
          regime: e.regime || '-',
          country: e.pays || '-',
          active: e.statut === 'Actif',
          affiliationsCount: e.affiliations || 0
        }));
        this.filteredEmployers = [...this.employers];
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement employeurs:', err);
        this.error = 'Erreur lors du chargement des employeurs';
        this.loading = false;
      }
    });
  }

  deleteEmployer(empMat: number, empCle: number) {
    if (confirm('Êtes-vous sûr de vouloir supprimer cet employeur ?')) {
      this.employerService.delete(empMat, empCle).subscribe({
        next: () => this.loadEmployers(),
        error: (err) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression');
        }
      });
    }
  }

  getRegimeCount(regime: string): number {
    return this.employers.filter(e => e.regime === regime).length;
  }

  getActiveCount(): number {
    return this.employers.filter(e => e.active).length;
  }

  applyFilters() {
    this.filteredEmployers = this.employers.filter(e => {
      // Filtre par recherche
      const matchesSearch = !this.searchTerm || 
        e.tradeName.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        e.employerNumber.includes(this.searchTerm);
      
      // Filtre par régime
      const matchesRegime = !this.selectedRegime || e.regime === this.selectedRegime;
      
      // Filtre par statut
      const matchesStatus = !this.selectedStatus || 
        (this.selectedStatus === 'Actif' && e.active) ||
        (this.selectedStatus === 'Inactif' && !e.active);
      
      return matchesSearch && matchesRegime && matchesStatus;
    });
  }

  resetFilters() {
    this.searchTerm = '';
    this.selectedRegime = '';
    this.selectedStatus = '';
    this.filteredEmployers = [...this.employers];
  }

  exportPDF() {
    const data = this.filteredEmployers.map(e => ({
      matricule: e.employerNumber,
      nomCommercial: e.tradeName,
      regime: e.regime,
      pays: e.country,
      affiliationsCount: e.affiliationsCount,
      actif: e.active
    }));
    this.pdfService.generateEmployeursReport(data, 'TUNIS');
  }
}
