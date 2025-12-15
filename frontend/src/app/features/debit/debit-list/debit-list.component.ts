import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { DebitService, Debit } from '../../../core/services/debit.service';
import { EmployerService } from '../../../core/services/employer.service';
import { PdfService } from '../../../core/services/pdf.service';
import { RegimeService, RegimeCotisation } from '../../../core/services/regime.service';
import { I18nService } from '../../../core/services/i18n.service';

@Component({
  selector: 'app-debit-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './debit-list.component.html',
  styles: []
})
export class DebitListComponent implements OnInit {
  loading = true;
  debits: any[] = [];
  employers: any[] = [];
  regimes: RegimeCotisation[] = [];
  error: string | null = null;
  selectedDebit: any = null;

  constructor(
    private debitService: DebitService,
    private employerService: EmployerService,
    private pdfService: PdfService,
    private regimeService: RegimeService,
    private router: Router,
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
      debits: this.debitService.getAll(),
      regimes: this.regimeService.getAll()
    }).subscribe({
      next: (result) => {
        // Stocker les régimes
        this.regimes = result.regimes || [];
        
        // Mapper les employeurs d'abord
        this.employers = result.employers.map(e => ({
          id: `${e.empMat}-${e.empCle}`,
          empMat: e.empMat,
          empCle: e.empCle,
          name: e.nomCommercial || `Employeur ${e.empMat}`
        }));
        
        // Mapper les débits (nouvelle structure Debit pour coopérants)
        this.debits = (result.debits as any[]).map(d => {
          return {
            id: d.id,
            number: d.numAffiliation || `DEB-${d.id?.toString().padStart(4, '0')}`,
            employerName: d.nomCooperant || '-',
            trimestre: d.trimestre || '-',
            generatedDate: d.createdAt ? new Date(d.createdAt).toLocaleDateString('fr-FR') : '-',
            amount: d.montantCotisation || 0,
            status: d.paye ? 'paid' : 'pending',
            statusLabel: d.paye ? 'Payé' : 'En attente',
            // Champs pour le PDF officiel
            numAffiliation: d.numAffiliation || '',
            matricule: d.matricule || '',
            salaire: d.salaire || 0,
            adresse: d.adresse || '',
            annee: d.annee || new Date().getFullYear()
          };
        });
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement données:', err);
        this.error = 'Erreur lors du chargement des données';
        this.loading = false;
      }
    });
  }

  loadDebits() {
    this.loadAllData();
  }

  deleteDebit(id: number) {
    if (!id) {
      alert('ID du débit non trouvé');
      return;
    }
    if (confirm('Êtes-vous sûr de vouloir supprimer ce débit ?')) {
      this.debitService.delete(id).subscribe({
        next: () => {
          alert('Débit supprimé avec succès');
          this.loadDebits();
        },
        error: (err) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression: ' + (err.message || 'Erreur inconnue'));
        }
      });
    }
  }

  getValidatedCount(): number {
    return this.debits.filter(d => d.status === 'paid').length;
  }

  getPendingCount(): number {
    return this.debits.filter(d => d.status === 'pending').length;
  }

  getTotalAmount(): number {
    return this.debits.reduce((sum, d) => sum + (d.amount || 0), 0);
  }

  viewDebit(debit: any) {
    this.selectedDebit = debit;
  }

  closeModal() {
    this.selectedDebit = null;
  }

  editDebit(debit: any) {
    this.router.navigate(['/debit/edit', debit.id]);
  }

  downloadDebit(debit: any) {
    // Calculer les cotisations dynamiques à partir des régimes
    const cotisations = this.calculateCotisations(debit.salaire || 0);
    const debitWithCotisations = { ...debit, cotisations };
    this.pdfService.generateDebitPdf(debitWithCotisations);
  }

  printDebit(debit: any) {
    // Calculer les cotisations dynamiques à partir des régimes
    const cotisations = this.calculateCotisations(debit.salaire || 0);
    const debitWithCotisations = { ...debit, cotisations };
    this.pdfService.generateDebitPdf(debitWithCotisations, true);
  }

  private calculateCotisations(salaire: number): { code: string; nomAr: string; taux: number; base: number; montant: number }[] {
    return this.regimes.map(regime => {
      const base = salaire * regime.coefficientBase;
      const montant = base * (regime.taux / 100);
      return {
        code: regime.code,
        nomAr: regime.nomAr,
        taux: regime.taux,
        base,
        montant
      };
    });
  }

  exportPDF() {
    // Générer un rapport PDF de tous les débits
    const data = this.debits.map(d => ({
      reference: d.number,
      employerName: d.employerName,
      debitRef: d.number,
      date: d.generatedDate,
      amount: d.amount,
      mode: '-',
      statusLabel: d.statusLabel
    }));
    this.pdfService.generatePaiementsReport(data, 'TUNIS');
  }

  printAllDebits() {
    // Générer le rapport PDF de tous les débits (mode "Toutes")
    this.pdfService.generateAllDebitsReport(this.debits, 'TUNIS');
  }
}
