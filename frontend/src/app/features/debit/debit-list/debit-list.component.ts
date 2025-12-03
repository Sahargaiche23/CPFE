import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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

  ngOnInit() {
    setTimeout(() => {
      this.debits = [
        {
          id: 1,
          number: 'DEB-2024-Q1-001',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          quarter: 'T1',
          year: 2024,
          generatedDate: '05/04/2024',
          amount: 12500.50,
          status: 'validated',
          statusLabel: 'Validé'
        },
        {
          id: 2,
          number: 'DEB-2024-Q2-002',
          employerName: 'IntCorp Deutschland',
          employerNumber: '510-2024-002',
          quarter: 'T2',
          year: 2024,
          generatedDate: '10/07/2024',
          amount: 28340.75,
          status: 'paid',
          statusLabel: 'Payé'
        },
        {
          id: 3,
          number: 'DEB-2024-Q3-003',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          quarter: 'T3',
          year: 2024,
          generatedDate: '05/10/2024',
          amount: 13200.00,
          status: 'pending',
          statusLabel: 'En attente'
        }
      ];
      this.loading = false;
    }, 800);
  }

  getValidatedCount(): number {
    return this.debits.filter(d => d.status === 'validated' || d.status === 'paid').length;
  }

  getPendingCount(): number {
    return this.debits.filter(d => d.status === 'pending').length;
  }

  getTotalAmount(): number {
    return this.debits.reduce((sum, d) => sum + d.amount, 0);
  }
}
