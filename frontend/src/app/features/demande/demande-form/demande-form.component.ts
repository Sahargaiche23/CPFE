import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DemandeService } from '../../../core/services/demande.service';

@Component({
  selector: 'app-demande-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './demande-form.component.html'
})
export class DemandeFormComponent implements OnInit {
  demandeForm: FormGroup;
  cooperants: Cooperant[] = [];
  selectedCooperant: Cooperant | null = null;
  loading = false;
  typeDemande = '';
  debitsEligibles: any[] = [];

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private http: HttpClient,
    private cooperantService: CooperantService,
    private demandeService: DemandeService
  ) {
    this.demandeForm = this.fb.group({
      cooperantId: ['', Validators.required],
      typeDemande: ['', Validators.required],
      // Actualisation salaire
      nouveauSalaire: [''],
      dateEffet: [''],
      // Sortie régime / Annulation assurance
      regimeConcerne: [''],
      impactCotisation: [''],
      // Rachat
      debitId: [''],
      trimestreDebit: [''],
      montantOriginal: [''],
      // Commun
      motif: ['']
    });
  }

  ngOnInit() {
    this.cooperantService.getAll().subscribe({
      next: (data) => this.cooperants = data.filter((c: any) => c.actif && c.numAffiliation),
      error: () => {}
    });
  }

  onCooperantChange(event: any) {
    const id = +event.target.value;
    this.selectedCooperant = this.cooperants.find(c => c.id === id) || null;
    if (this.selectedCooperant && this.typeDemande === 'RACHAT_LOI105') {
      this.loadDebitsEligibles();
    }
  }

  onTypeChange() {
    this.typeDemande = this.demandeForm.value.typeDemande;
    if (this.typeDemande === 'RACHAT_LOI105' && this.selectedCooperant) {
      this.loadDebitsEligibles();
    }
  }

  loadDebitsEligibles() {
    if (!this.selectedCooperant) return;
    this.http.get<any[]>('/api/debits').subscribe({
      next: (debits) => {
        const now = new Date();
        const oneYearAgo = new Date(now.getFullYear() - 1, now.getMonth(), now.getDate());
        this.debitsEligibles = debits.filter((d: any) => {
          return d.cooperantId === this.selectedCooperant!.id
            && d.paye === true
            && d.dateDepot
            && new Date(d.dateDepot) <= oneYearAgo;
        });
      },
      error: () => this.debitsEligibles = []
    });
  }

  onDebitSelect(event: any) {
    const debitId = +event.target.value;
    const debit = this.debitsEligibles.find(d => d.id === debitId);
    if (debit) {
      this.demandeForm.patchValue({
        debitId: debit.id,
        trimestreDebit: debit.trimestre,
        montantOriginal: debit.montantCotisation
      });
    }
  }

  getMontantRachat(): number {
    const montant = this.demandeForm.value.montantOriginal;
    return montant ? montant * 0.95 : 0;
  }

  getReduction(): number {
    const montant = this.demandeForm.value.montantOriginal;
    return montant ? montant * 0.05 : 0;
  }

  onSubmit() {
    if (!this.demandeForm.valid || !this.selectedCooperant) return;
    this.loading = true;
    const form = this.demandeForm.value;

    switch (form.typeDemande) {
      case 'ACTUALISATION_SALAIRE':
        this.demandeService.creerActualisationSalaire({
          cooperantId: this.selectedCooperant.id,
          nouveauSalaire: form.nouveauSalaire,
          dateEffet: form.dateEffet,
          motif: form.motif
        }).subscribe({
          next: () => this.onSuccess('Demande d\'actualisation salaire créée'),
          error: (err) => this.onError(err)
        });
        break;

      case 'SORTIE_REGIME_MALADIE':
        this.demandeService.creerSortieRegimeMaladie({
          cooperantId: this.selectedCooperant.id,
          regimeConcerne: form.regimeConcerne,
          motif: form.motif,
          impactCotisation: form.impactCotisation || 0
        }).subscribe({
          next: () => this.onSuccess('Demande de sortie régime maladie créée'),
          error: (err) => this.onError(err)
        });
        break;

      case 'ANNULATION_ASSURANCE':
        this.demandeService.creerAnnulationAssurance({
          cooperantId: this.selectedCooperant.id,
          motif: form.motif,
          impactCotisation: form.impactCotisation || 0
        }).subscribe({
          next: () => this.onSuccess('Demande d\'annulation assurance créée'),
          error: (err) => this.onError(err)
        });
        break;

      case 'RACHAT_LOI105':
        this.demandeService.creerDemandeRachat({
          cooperantId: this.selectedCooperant.id,
          debitId: form.debitId,
          trimestreDebit: form.trimestreDebit,
          montantOriginal: form.montantOriginal
        }).subscribe({
          next: () => this.onSuccess('Demande de rachat Loi 105 créée'),
          error: (err) => this.onError(err)
        });
        break;
    }
  }

  private onSuccess(msg: string) {
    this.loading = false;
    alert(msg + ' avec succès !');
    this.router.navigate(['/demande']);
  }

  private onError(err: any) {
    this.loading = false;
    console.error(err);
    alert('Erreur lors de la création de la demande');
  }
}
