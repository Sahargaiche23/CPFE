import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-employer-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './employer-list.component.html',
  styles: []
})
export class EmployerListComponent implements OnInit {
  loading = true;
  employers: any[] = [];

  ngOnInit() {
    // Simulate API call with test data
    setTimeout(() => {
      this.employers = [
        {
          id: 1,
          employerNumber: '500-2024-001',
          legalName: 'Entreprise Test SARL',
          tradeName: 'Test Company France',
          regime: '500',
          country: 'France',
          active: true,
          affiliationsCount: 5
        },
        {
          id: 2,
          employerNumber: '510-2024-002',
          legalName: 'International Corporation GmbH',
          tradeName: 'IntCorp Deutschland',
          regime: '510',
          country: 'Allemagne',
          active: true,
          affiliationsCount: 12
        },
        {
          id: 3,
          employerNumber: '500-2024-003',
          legalName: 'Tech Solutions SARL',
          tradeName: 'TechSol France',
          regime: '500',
          country: 'France',
          active: false,
          affiliationsCount: 3
        }
      ];
      this.loading = false;
    }, 800);
  }

  getRegimeCount(regime: string): number {
    return this.employers.filter(e => e.regime === regime).length;
  }
}
