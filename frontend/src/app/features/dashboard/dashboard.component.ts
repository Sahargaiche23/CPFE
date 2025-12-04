import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { EmployerService } from '../../core/services/employer.service';
import { AffiliationService } from '../../core/services/affiliation.service';
import { DebitService } from '../../core/services/debit.service';
import { PaymentService } from '../../core/services/payment.service';
import { forkJoin } from 'rxjs';

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
  error: string | null = null;

  constructor(
    private employerService: EmployerService,
    private affiliationService: AffiliationService,
    private debitService: DebitService,
    private paymentService: PaymentService
  ) {}

  ngOnInit() {
    this.loadDashboardData();
  }

  loadDashboardData() {
    this.loading = true;
    this.error = null;

    forkJoin({
      employers: this.employerService.getAll(),
      affiliations: this.affiliationService.getAll(),
      debits: this.debitService.getAll(),
      payments: this.paymentService.getAll()
    }).subscribe({
      next: (data) => {
        this.stats = {
          totalEmployers: data.employers?.length || 0,
          totalAffiliations: data.affiliations?.length || 0,
          pendingDebits: data.debits?.filter((d: any) => !d.paye)?.length || 0,
          totalPayments: data.payments?.length || 0
        };

        // Generate recent activities from real data
        this.recentActivities = this.generateRecentActivities(data);
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement dashboard:', err);
        this.error = 'Erreur lors du chargement des statistiques';
        this.loading = false;
        // Fallback to zeros
        this.stats = {
          totalEmployers: 0,
          totalAffiliations: 0,
          pendingDebits: 0,
          totalPayments: 0
        };
      }
    });
  }

  private generateRecentActivities(data: any): any[] {
    const activities: any[] = [];
    
    // Add recent affiliations
    if (data.affiliations?.length > 0) {
      activities.push({
        type: 'affiliation',
        description: `${data.affiliations.length} affiliation(s) enregistrée(s)`,
        time: 'Récent',
        icon: 'person_add',
        color: 'text-green-600'
      });
    }
    
    // Add recent payments
    if (data.payments?.length > 0) {
      const totalMontant = data.payments.reduce((sum: number, p: any) => sum + (p.montant || 0), 0);
      activities.push({
        type: 'payment',
        description: `Total paiements: ${totalMontant.toLocaleString('fr-FR')} TND`,
        time: 'Récent',
        icon: 'payment',
        color: 'text-blue-600'
      });
    }
    
    // Add employers info
    if (data.employers?.length > 0) {
      activities.push({
        type: 'employer',
        description: `${data.employers.length} employeur(s) actif(s)`,
        time: 'Actuel',
        icon: 'business',
        color: 'text-purple-600'
      });
    }
    
    // Add pending debits
    const pendingDebits = data.debits?.filter((d: any) => !d.paye) || [];
    if (pendingDebits.length > 0) {
      activities.push({
        type: 'debit',
        description: `${pendingDebits.length} débit(s) en attente`,
        time: 'À traiter',
        icon: 'receipt',
        color: 'text-orange-600'
      });
    }
    
    return activities;
  }
}
