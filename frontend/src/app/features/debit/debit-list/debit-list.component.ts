import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, Router } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { DebitService, Debit } from '../../../core/services/debit.service';
import { PdfService } from '../../../core/services/pdf.service';

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
  error: string | null = null;
  selectedDebit: any = null;

  constructor(
    private debitService: DebitService,
    private pdfService: PdfService,
    private router: Router
  ) {}

  ngOnInit() {
    this.loadDebits();
  }

  loadDebits() {
    this.loading = true;
    this.error = null;
    
    this.debitService.getAll().subscribe({
      next: (data: any[]) => {
        this.debits = data.map(d => ({
          id: d.engNum || d.id,
          number: d.referenceComplete || `DEB-${(d.engNum || d.id)?.toString().padStart(4, '0')}`,
          employer: `${d.empMat}-${d.empCle}`,
          trimestre: d.enoNumEng ? `T${d.enoNumEng}` : (d.trimestre || '-'),
          generatedDate: d.enoDateEcheance || d.createdAt ? new Date(d.enoDateEcheance || d.createdAt).toLocaleDateString('fr-FR') : '-',
          amount: d.enoMontantEcheance || d.montantCotisation || 0,
          status: (d.enoSituation === 2 || d.paye) ? 'paid' : 'pending',
          statusLabel: (d.enoSituation === 2 || d.paye) ? 'Payé' : 'En attente'
        }));
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement débits:', err);
        this.error = 'Erreur lors du chargement des débits';
        this.loading = false;
      }
    });
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
    // Générer un PDF pour le débit
    const { jsPDF } = (window as any).jspdf;
    const doc = new jsPDF();
    
    // Header
    doc.setFillColor(139, 0, 0);
    doc.rect(0, 0, 210, 30, 'F');
    doc.setTextColor(255, 255, 255);
    doc.setFontSize(16);
    doc.text('CNSS - DÉBIT TRIMESTRIEL', 105, 18, { align: 'center' });
    
    // Content
    doc.setTextColor(0, 0, 0);
    doc.setFontSize(12);
    
    let y = 50;
    doc.text(`Numéro: ${debit.number}`, 20, y);
    y += 15;
    doc.text(`Employeur: ${debit.employer}`, 20, y);
    y += 15;
    doc.text(`Période: ${debit.trimestre}`, 20, y);
    y += 15;
    doc.text(`Date: ${debit.generatedDate}`, 20, y);
    y += 15;
    
    // Amount box
    doc.setFillColor(255, 248, 220);
    doc.rect(20, y, 170, 25, 'F');
    doc.setDrawColor(139, 0, 0);
    doc.rect(20, y, 170, 25);
    doc.setFontSize(14);
    doc.setTextColor(139, 0, 0);
    doc.text(`Montant: ${debit.amount?.toLocaleString('fr-FR')} TND`, 105, y + 15, { align: 'center' });
    
    y += 40;
    doc.setFontSize(11);
    doc.setTextColor(0, 0, 0);
    doc.text(`Statut: ${debit.statusLabel}`, 20, y);
    
    // Footer
    doc.setFontSize(8);
    doc.setTextColor(128, 128, 128);
    doc.text('Document généré par le système CNSS - Coopération Technique', 105, 280, { align: 'center' });
    
    doc.save(`debit_${debit.number}.pdf`);
  }
}
