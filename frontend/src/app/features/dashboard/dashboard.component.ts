import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  stats = {
    totalEmployers: 0,
    totalAffiliations: 0,
    pendingDebits: 0,
    totalPayments: 0
  };

  recentActivities: any[] = [];
  loading = true;

  ngOnInit() {
    this.loadDashboardData();
  }

  loadDashboardData() {
    // Simulated data - replace with actual API calls
    setTimeout(() => {
      this.stats = {
        totalEmployers: 156,
        totalAffiliations: 423,
        pendingDebits: 48,
        totalPayments: 1254
      };

      this.recentActivities = [
        {
          type: 'affiliation',
          description: 'Nouvelle affiliation créée pour Ben Ali Ahmed',
          time: 'Il y a 2 heures',
          icon: 'person_add',
          color: 'text-green-600'
        },
        {
          type: 'payment',
          description: 'Paiement validé - 2500 TND',
          time: 'Il y a 3 heures',
          icon: 'payment',
          color: 'text-blue-600'
        },
        {
          type: 'employer',
          description: 'Nouvel employeur enregistré - ATCT France',
          time: 'Il y a 5 heures',
          icon: 'business',
          color: 'text-purple-600'
        },
        {
          type: 'debit',
          description: 'Débit trimestriel généré - Q1-2024',
          time: 'Il y a 1 jour',
          icon: 'receipt',
          color: 'text-orange-600'
        }
      ];

      this.loading = false;
    }, 1000);
  }
}
