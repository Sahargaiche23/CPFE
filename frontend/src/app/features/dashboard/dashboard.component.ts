import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { CooperantService } from '../../core/services/cooperant.service';
import { DebitService } from '../../core/services/debit.service';
import { PaymentService } from '../../core/services/payment.service';
import { I18nService } from '../../core/services/i18n.service';
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
    private cooperantService: CooperantService,
    private debitService: DebitService,
    private paymentService: PaymentService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    this.loadDashboardData();
  }

  loadDashboardData() {
    this.loading = true;
    this.error = null;

    forkJoin({
      employers: this.cooperantService.getAll(),
      debits: this.debitService.getAll(),
      payments: this.paymentService.getAll()
    }).subscribe({
      next: (data) => {
        // Compter les affiliations = coopérants avec numAffiliation
        const affiliatedCooperants = data.employers?.filter((c: any) => c.numAffiliation) || [];
        
        this.stats = {
          totalEmployers: data.employers?.length || 0,
          totalAffiliations: affiliatedCooperants.length,
          pendingDebits: data.debits?.filter((d: any) => !d.paye)?.length || 0,
          totalPayments: data.payments?.length || 0
        };

        // Generate recent activities from real data
        this.recentActivities = this.generateRecentActivities({...data, affiliations: affiliatedCooperants});
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
    
    // Ajouter les paiements récents avec dates réelles
    if (data.payments?.length > 0) {
      const recentPayments = [...data.payments]
        .sort((a: any, b: any) => new Date(b.datePaiement || b.createdAt || 0).getTime() - new Date(a.datePaiement || a.createdAt || 0).getTime())
        .slice(0, 3);
      
      recentPayments.forEach((p: any) => {
        activities.push({
          type: 'payment',
          description: `Paiement de ${(p.montant || 0).toLocaleString('fr-FR')} TND - ${p.cooperantNom || 'Coopérant'}`,
          time: this.formatDate(p.datePaiement || p.createdAt),
          icon: 'payment',
          color: 'text-blue-600'
        });
      });
    }
    
    // Ajouter les débits récents avec dates réelles
    if (data.debits?.length > 0) {
      const recentDebits = [...data.debits]
        .sort((a: any, b: any) => new Date(b.createdAt || 0).getTime() - new Date(a.createdAt || 0).getTime())
        .slice(0, 3);
      
      recentDebits.forEach((d: any) => {
        const status = d.paye ? '✓ Payé' : '⏳ En attente';
        activities.push({
          type: 'debit',
          description: `Débit ${d.nomCooperant || ''} - T${d.trimestre} ${d.annee} - ${status}`,
          time: this.formatDate(d.createdAt),
          icon: d.paye ? 'check_circle' : 'pending',
          color: d.paye ? 'text-green-600' : 'text-orange-600'
        });
      });
    }
    
    // Ajouter les coopérants récents
    if (data.employers?.length > 0) {
      const recentCooperants = [...data.employers]
        .sort((a: any, b: any) => new Date(b.createdAt || 0).getTime() - new Date(a.createdAt || 0).getTime())
        .slice(0, 2);
      
      recentCooperants.forEach((c: any) => {
        activities.push({
          type: 'cooperant',
          description: `Coopérant: ${c.nomFr || c.nomAr || 'Nouveau'}`,
          time: this.formatDate(c.createdAt),
          icon: 'person',
          color: 'text-purple-600'
        });
      });
    }
    
    // Trier toutes les activités par date
    return activities
      .sort((a, b) => {
        const dateA = this.parseActivityDate(a.time);
        const dateB = this.parseActivityDate(b.time);
        return dateB - dateA;
      })
      .slice(0, 8); // Limiter à 8 activités
  }

  private formatDate(dateStr: string | Date | null): string {
    if (!dateStr) return 'Récemment';
    
    const date = new Date(dateStr);
    if (isNaN(date.getTime())) return 'Récemment';
    
    const now = new Date();
    const diffMs = now.getTime() - date.getTime();
    const diffMins = Math.floor(diffMs / 60000);
    const diffHours = Math.floor(diffMs / 3600000);
    const diffDays = Math.floor(diffMs / 86400000);
    
    if (diffMins < 1) return "À l'instant";
    if (diffMins < 60) return `Il y a ${diffMins} min`;
    if (diffHours < 24) return `Il y a ${diffHours}h`;
    if (diffDays < 7) return `Il y a ${diffDays} jour(s)`;
    
    return date.toLocaleDateString('fr-FR', { day: '2-digit', month: 'short', year: 'numeric' });
  }

  private parseActivityDate(timeStr: string): number {
    if (timeStr.includes("À l'instant")) return Date.now();
    if (timeStr.includes("Il y a")) {
      const num = parseInt(timeStr.match(/\d+/)?.[0] || '0');
      if (timeStr.includes('min')) return Date.now() - num * 60000;
      if (timeStr.includes('h')) return Date.now() - num * 3600000;
      if (timeStr.includes('jour')) return Date.now() - num * 86400000;
    }
    return new Date(timeStr).getTime() || 0;
  }
}
