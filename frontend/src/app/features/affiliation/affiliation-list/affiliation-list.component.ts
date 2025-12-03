import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-affiliation-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './affiliation-list.component.html',
  styles: []
})
export class AffiliationListComponent implements OnInit {
  loading = true;
  affiliations: any[] = [];

  ngOnInit() {
    setTimeout(() => {
      this.affiliations = [
        {
          id: 1,
          matricule: 'AF-2024-001',
          firstName: 'Jean',
          lastName: 'Dupont',
          nationalite: 'Française',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          startDate: '01/01/2024',
          salary: 2500.00,
          status: 'active',
          statusLabel: 'Active'
        },
        {
          id: 2,
          matricule: 'AF-2024-002',
          firstName: 'Sophie',
          lastName: 'Martin',
          nationalite: 'Française',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          startDate: '15/02/2024',
          salary: 2800.00,
          status: 'active',
          statusLabel: 'Active'
        },
        {
          id: 3,
          matricule: 'AF-2024-003',
          firstName: 'Hans',
          lastName: 'Müller',
          nationalite: 'Allemande',
          employerName: 'IntCorp Deutschland',
          employerNumber: '510-2024-002',
          startDate: '10/03/2024',
          salary: 3200.00,
          status: 'active',
          statusLabel: 'Active'
        },
        {
          id: 4,
          matricule: 'AF-2024-004',
          firstName: 'Marie',
          lastName: 'Dubois',
          nationalite: 'Française',
          employerName: 'Test Company France',
          employerNumber: '500-2024-001',
          startDate: '01/12/2024',
          salary: 2600.00,
          status: 'pending',
          statusLabel: 'En attente'
        },
        {
          id: 5,
          matricule: 'AF-2024-005',
          firstName: 'Lucas',
          lastName: 'Bernard',
          nationalite: 'Française',
          employerName: 'TechSol France',
          employerNumber: '500-2024-003',
          startDate: '15/11/2024',
          salary: 2900.00,
          status: 'suspended',
          statusLabel: 'Suspendue'
        }
      ];
      this.loading = false;
    }, 800);
  }

  getActiveCount(): number {
    return this.affiliations.filter(a => a.status === 'active').length;
  }

  getPendingCount(): number {
    return this.affiliations.filter(a => a.status === 'pending').length;
  }

  getThisMonthCount(): number {
    // Simulate this month affiliations (Dec 2024)
    return this.affiliations.filter(a => a.startDate.includes('/12/2024')).length;
  }
}
