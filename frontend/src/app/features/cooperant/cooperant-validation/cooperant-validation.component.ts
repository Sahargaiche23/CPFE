import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';

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

  constructor(private cooperantService: CooperantService) {}

  ngOnInit(): void {
    this.load();
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
}
