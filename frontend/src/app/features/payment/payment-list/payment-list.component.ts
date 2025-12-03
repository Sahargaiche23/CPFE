import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-payment-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './payment-list.component.html',
  styles: []
})
export class PaymentListComponent implements OnInit {
  loading = true;
  payments: any[] = [];

  ngOnInit() {
    setTimeout(() => {
      this.payments = [
        {
          id: 1,
          reference: 'PAY-2024-001',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          debitNumber: 'DEB-2024-Q1-001',
          paymentDate: '10/04/2024',
          amount: 12500.50,
          paymentMode: 'Virement',
          status: 'validated',
          statusLabel: 'Validé'
        },
        {
          id: 2,
          reference: 'PAY-2024-002',
          employerName: 'IntCorp Deutschland',
          employerNumber: '510-2024-002',
          debitNumber: 'DEB-2024-Q2-002',
          paymentDate: '15/07/2024',
          amount: 28340.75,
          paymentMode: 'Chèque',
          status: 'validated',
          statusLabel: 'Validé'
        },
        {
          id: 3,
          reference: 'PAY-2024-003',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          debitNumber: 'DEB-2024-Q3-003',
          paymentDate: '01/12/2024',
          amount: 6600.00,
          paymentMode: 'Virement',
          status: 'pending',
          statusLabel: 'En attente'
        }
      ];
      this.loading = false;
    }, 800);
  }

  getValidatedCount(): number {
    return this.payments.filter(p => p.status === 'validated').length;
  }

  getPendingCount(): number {
    return this.payments.filter(p => p.status === 'pending').length;
  }

  getTotalAmount(): number {
    return this.payments.reduce((sum, p) => sum + p.amount, 0);
  }
}
