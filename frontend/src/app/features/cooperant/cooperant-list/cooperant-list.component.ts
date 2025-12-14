import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { I18nService } from '../../../core/services/i18n.service';

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

  constructor(
    private cooperantService: CooperantService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    this.load();
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
}
