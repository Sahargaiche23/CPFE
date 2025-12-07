import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { DebitService, Debit } from '../../../core/services/debit.service';
import { EmployerService } from '../../../core/services/employer.service';
import { PdfService } from '../../../core/services/pdf.service';
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
  error: string | null = null;
  selectedDebit: any = null;

  constructor(
    private debitService: DebitService,
    private employerService: EmployerService,
    private pdfService: PdfService,
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
      debits: this.debitService.getAll()
    }).subscribe({
      next: (result) => {
        // Mapper les employeurs d'abord
        this.employers = result.employers.map(e => ({
          id: `${e.empMat}-${e.empCle}`,
          empMat: e.empMat,
          empCle: e.empCle,
          name: e.nomCommercial || `Employeur ${e.empMat}`
        }));
        
        // Mapper les débits avec les noms des employeurs
        this.debits = (result.debits as any[]).map(d => {
          const employerId = `${d.empMat}-${d.empCle}`;
          const employer = this.employers.find(e => e.id === employerId);
          
          return {
            id: d.engNum || d.id,
            number: d.referenceComplete || `ENG-${(d.engNum || d.id)?.toString().padStart(4, '0')}/ECH-${d.enoNumEng || '0'}${d.empCle || ''}`,
            employerName: employer?.name || '-',
            employerId: employerId,
            trimestre: d.enoNumEng ? `T${d.enoNumEng}` : (d.trimestre || '-'),
            generatedDate: d.enoDateEcheance || d.createdAt ? new Date(d.enoDateEcheance || d.createdAt).toLocaleDateString('fr-FR') : '-',
            amount: d.engMontant || d.enoMontantEcheance || d.montantCotisation || 0,
            status: (d.enoSituation === 2 || d.paye) ? 'paid' : 'pending',
            statusLabel: (d.enoSituation === 2 || d.paye) ? 'Payé' : 'En attente'
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
    if (confirm('Êtes-vous sûr de vouloir supprimer ce débit ?')) {
      this.debitService.delete(id).subscribe({
        next: () => this.loadDebits(),
        error: (err) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression');
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
    // Utiliser PdfService pour générer le PDF avec l'en-tête CNSS officiel
    this.pdfService.generateDebitPdf(debit);
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
}
