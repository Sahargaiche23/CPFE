import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { PaymentService, Payment } from '../../../core/services/payment.service';
import { PdfService } from '../../../core/services/pdf.service';
import { EmployerService } from '../../../core/services/employer.service';
import { DebitService } from '../../../core/services/debit.service';

@Component({
  selector: 'app-payment-list',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './payment-list.component.html',
  styles: []
})
export class PaymentListComponent implements OnInit {
  loading = true;
  payments: any[] = [];
  filteredPayments: any[] = [];
  employers: any[] = [];
  debits: any[] = [];
  error: string | null = null;
  
  // Modal
  selectedPayment: any = null;
  showModal = false;
  
  // Filtres
  searchTerm = '';
  selectedEmployer = '';
  selectedStatus = '';
  dateFrom = '';
  dateTo = '';

  constructor(
    private paymentService: PaymentService,
    private pdfService: PdfService,
    private employerService: EmployerService,
    private debitService: DebitService,
    private router: Router
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
      payments: this.paymentService.getAll()
    }).subscribe({
      next: (result) => {
        console.log('Debits bruts:', result.debits);
        console.log('Payments bruts:', result.payments);
        
        // Mapper les employeurs
        this.employers = result.employers.map(e => ({
          id: `${e.empMat}-${e.empCle}`,
          empMat: e.empMat,
          name: e.nomCommercial || `Employeur ${e.empMat}`
        }));
        
        // Mapper les débits - stocker aussi engNum comme référence
        this.debits = result.debits.map((d: any) => ({
          id: d.engNum || d.id,
          engNum: d.engNum,
          empMat: d.empMat,
          empCle: d.empCle,
          employerId: `${d.empMat}-${d.empCle}`,
          montant: d.enoMontantEcheance || 0
        }));
        
        console.log('Debits mappés:', this.debits);
        
        // Mapper les paiements avec les relations
        this.payments = result.payments.map((p: Payment) => {
          // numAffiliation peut être "566859" (empMat) ou "566859-1" (empMat-empCle) ou engNum
          const numAff = p.numAffiliation || '';
          
          // Trouver l'employeur par empMat ou par id complet
          const employer = this.employers.find(e => 
            e.empMat?.toString() === numAff || e.id === numAff
          );
          
          // Trouver le débit par engNum (numAffiliation du paiement = engNum du débit)
          const numAffNum = parseInt(numAff, 10);
          const debit = this.debits.find(d => {
            const match = d.engNum === numAffNum || 
                          String(d.engNum) === numAff ||
                          d.id === numAffNum ||
                          String(d.id) === numAff;
            return match;
          });
          
          if (!debit) {
            console.log(`Payment ${p.id} numAff=${numAff} - No matching debit found in:`, 
              this.debits.map(d => ({ engNum: d.engNum, id: d.id })));
          }
          
          return {
            id: p.id,
            reference: `PAY-${p.id?.toString().padStart(4, '0')}`,
            numAffiliation: p.numAffiliation || '-',
            employerName: employer?.name || p.numAffiliation || '-',
            debitId: debit?.id || '-',
            debitAmount: debit?.montant || 0,
            trimestre: p.trimestre || '-',
            paymentDate: p.createdAt ? new Date(p.createdAt).toLocaleDateString('fr-FR') : '-',
            rawDate: p.createdAt,
            amount: p.montant || 0,
            paymentMode: p.modePaiement || 'Virement',
            status: p.paiementPartiel ? 'partial' : 'validated',
            statusLabel: p.paiementPartiel ? 'Partiel' : 'Validé'
          };
        });
        
        this.filteredPayments = [...this.payments];
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement données:', err);
        this.error = 'Erreur lors du chargement des données';
        this.loading = false;
      }
    });
  }

  loadPayments() {
    this.loadAllData();
  }

  deletePayment(id: number) {
    if (confirm('Êtes-vous sûr de vouloir supprimer ce paiement ?')) {
      this.paymentService.delete(id).subscribe({
        next: () => this.loadPayments(),
        error: (err) => {
          console.error('Erreur suppression:', err);
          alert('Erreur lors de la suppression');
        }
      });
    }
  }

  getValidatedCount(): number {
    return this.payments.filter(p => p.status === 'validated').length;
  }

  getPendingCount(): number {
    return this.payments.filter(p => p.status === 'pending' || p.status === 'partial').length;
  }

  getTotalAmount(): number {
    return this.payments.reduce((sum, p) => sum + (p.amount || 0), 0);
  }

  generateReceipt(payment: any) {
    this.pdfService.generatePaymentReceipt({
      reference: payment.reference,
      employerName: payment.employerName || 'Employeur',
      employerNumber: payment.numAffiliation || '-',
      amount: payment.amount,
      paymentDate: payment.paymentDate,
      paymentMode: payment.paymentMode,
      trimestre: payment.trimestre
    });
  }

  // Modal détails
  viewPayment(payment: any) {
    this.selectedPayment = payment;
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
    this.selectedPayment = null;
  }

  editPayment(payment: any) {
    this.router.navigate(['/payment/edit', payment.id]);
  }

  // Filtres
  applyFilters() {
    this.filteredPayments = this.payments.filter(p => {
      // Recherche par référence ou employeur
      const matchesSearch = !this.searchTerm || 
        p.reference.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        p.employerName.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        p.numAffiliation.toLowerCase().includes(this.searchTerm.toLowerCase());
      
      // Filtre par employeur
      const matchesEmployer = !this.selectedEmployer || p.numAffiliation === this.selectedEmployer;
      
      // Filtre par statut
      const matchesStatus = !this.selectedStatus || p.status === this.selectedStatus;
      
      return matchesSearch && matchesEmployer && matchesStatus;
    });
  }

  resetFilters() {
    this.searchTerm = '';
    this.selectedEmployer = '';
    this.selectedStatus = '';
    this.dateFrom = '';
    this.dateTo = '';
    this.filteredPayments = [...this.payments];
  }
}
