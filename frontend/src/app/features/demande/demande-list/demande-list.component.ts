import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { DemandeService, DemandeCooperant } from '../../../core/services/demande.service';

@Component({
  selector: 'app-demande-list',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule, MainLayoutComponent],
  templateUrl: './demande-list.component.html'
})
export class DemandeListComponent implements OnInit {
  demandes: DemandeCooperant[] = [];
  filteredDemandes: DemandeCooperant[] = [];
  loading = false;
  filterType = '';
  filterStatut = '';
  stats: any = {};

  constructor(private demandeService: DemandeService) {}

  ngOnInit() {
    this.loadDemandes();
    this.loadStats();
  }

  loadDemandes() {
    this.loading = true;
    this.demandeService.findAll().subscribe({
      next: (data) => {
        this.demandes = data;
        this.applyFilters();
        this.loading = false;
      },
      error: () => this.loading = false
    });
  }

  loadStats() {
    this.demandeService.getStats().subscribe({
      next: (data) => this.stats = data,
      error: () => {}
    });
  }

  applyFilters() {
    this.filteredDemandes = this.demandes.filter(d => {
      if (this.filterType && d.typeDemande !== this.filterType) return false;
      if (this.filterStatut && d.statut !== this.filterStatut) return false;
      return true;
    });
  }

  getTypeLabel(type: string): string {
    const labels: any = {
      'ACTUALISATION_SALAIRE': 'Actualisation Salaire',
      'SORTIE_REGIME_MALADIE': 'Sortie Régime Maladie',
      'ANNULATION_ASSURANCE': 'Annulation Assurance',
      'RACHAT_LOI105': 'Rachat Loi 105'
    };
    return labels[type] || type;
  }

  getStatutClass(statut: string): string {
    switch (statut) {
      case 'EN_ATTENTE': return 'bg-yellow-100 text-yellow-800';
      case 'VALIDEE': return 'bg-green-100 text-green-800';
      case 'REJETEE': return 'bg-red-100 text-red-800';
      case 'EN_COURS': return 'bg-blue-100 text-blue-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  }

  getTypeIcon(type: string): string {
    switch (type) {
      case 'ACTUALISATION_SALAIRE': return 'paid';
      case 'SORTIE_REGIME_MALADIE': return 'medical_services';
      case 'ANNULATION_ASSURANCE': return 'cancel';
      case 'RACHAT_LOI105': return 'receipt_long';
      default: return 'description';
    }
  }

  valider(id: number) {
    if (confirm('Confirmer la validation de cette demande ?')) {
      this.demandeService.valider(id).subscribe({
        next: () => this.loadDemandes(),
        error: (err) => alert('Erreur: ' + err.message)
      });
    }
  }

  rejeter(id: number) {
    const motif = prompt('Motif du rejet:');
    if (motif) {
      this.demandeService.rejeter(id, 1, motif).subscribe({
        next: () => this.loadDemandes(),
        error: (err) => alert('Erreur: ' + err.message)
      });
    }
  }
}
