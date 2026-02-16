import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { CooperantService } from '../../core/services/cooperant.service';
import { DebitService } from '../../core/services/debit.service';
import { PaymentService } from '../../core/services/payment.service';
import { AtctService } from '../../core/services/atct.service';
import { GedService } from '../../core/services/ged.service';
import { AuthService } from '../../core/services/auth.service';
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

  // Stats pour agent ATCT
  atctStats = {
    totalDossiers: 0,
    enAttente: 0,
    valides: 0,
    rejetes: 0,
    retoursCnss: 0,
    totalDocuments: 0,
    totalTailleGed: 0
  };

  // Réclamations/Retours CNSS
  retoursCnss: any[] = [];

  recentActivities: any[] = [];
  dossiersAtctRecus: any[] = [];
  loading = true;
  error: string | null = null;
  isAgentAtct = false;
  userProfil = '';

  constructor(
    private cooperantService: CooperantService,
    private debitService: DebitService,
    private paymentService: PaymentService,
    private atctService: AtctService,
    private gedService: GedService,
    private authService: AuthService,
    public i18n: I18nService
  ) {}

  ngOnInit() {
    // Vérifier le profil utilisateur
    this.authService.currentUser$.subscribe(user => {
      if (user) {
        this.userProfil = user.profil?.toLowerCase() || '';
        this.isAgentAtct = this.userProfil === 'agent_atct' || this.userProfil === 'agent_coop_tech';
        
        if (this.isAgentAtct) {
          this.loadAtctDashboard();
        } else {
          this.loadDashboardData();
        }
      }
    });
  }

  loadAtctDashboard() {
    this.loading = true;
    forkJoin({
      atctStats: this.atctService.getStats(),
      gedStats: this.gedService.getStats(),
      dossiers: this.atctService.getAll()
    }).subscribe({
      next: (data) => {
        // Compter les retours CNSS (dossiers avec statut RETOUR ou INCOMPLET)
        const dossiersRetour = (data.dossiers || []).filter((d: any) => 
          d.statut === 'RECLAMATION' || d.statut === 'RETOUR' || d.statut === 'INCOMPLET' || d.statut === 'DOCUMENTS_MANQUANTS'
        );
        this.retoursCnss = dossiersRetour;
        
        this.atctStats = {
          totalDossiers: data.atctStats?.total || 0,
          enAttente: data.atctStats?.en_attente || 0,
          valides: data.atctStats?.valides || 0,
          rejetes: data.atctStats?.rejetes || 0,
          retoursCnss: dossiersRetour.length,
          totalDocuments: data.gedStats?.totalDocuments || 0,
          totalTailleGed: data.gedStats?.totalTaille || 0
        };
        
        // Activités récentes ATCT
        this.recentActivities = this.generateAtctActivities(data.dossiers || []);
        this.loading = false;
      },
      error: () => {
        this.loading = false;
      }
    });
  }

  private generateAtctActivities(dossiers: any[]): any[] {
    return dossiers
      .sort((a, b) => new Date(b.dateCreation || 0).getTime() - new Date(a.dateCreation || 0).getTime())
      .slice(0, 8)
      .map(d => ({
        type: 'atct',
        description: `Dossier ${d.nomFr || d.nomAr || 'N/A'} - ${d.statut || 'En cours'}`,
        time: this.formatDate(d.dateCreation),
        icon: d.statut === 'VALIDE' ? 'check_circle' : d.statut === 'REJETE' ? 'cancel' : d.statut === 'RECLAMATION' ? 'assignment_return' : 'hourglass_empty',
        color: d.statut === 'VALIDE' ? 'text-green-600' : d.statut === 'REJETE' ? 'text-red-600' : d.statut === 'RECLAMATION' ? 'text-orange-600' : 'text-yellow-600'
      }));
  }

  loadDashboardData() {
    this.loading = true;
    this.error = null;

    // Charger aussi les dossiers ATCT en attente pour l'agent CNSS
    this.atctService.getEnAttente().subscribe({
      next: (data) => this.dossiersAtctRecus = data || [],
      error: () => this.dossiersAtctRecus = []
    });

    forkJoin({
      employers: this.cooperantService.getAll(),
      debits: this.debitService.getAll(),
      payments: this.paymentService.getAll(),
      atctDossiers: this.atctService.getAll()
    }).subscribe({
      next: (data) => {
        // Compter les affiliations = coopérants avec numAffiliation
        const affiliatedCooperants = data.employers?.filter((c: any) => c.numAffiliation) || [];
        // Total Coopérants = nombre de dossiers ATCT uniques (vrais coopérants du système)
        const atctEmails = new Set((data.atctDossiers || []).map((d: any) => d.email));
        
        this.stats = {
          totalEmployers: atctEmails.size || data.employers?.length || 0,
          totalAffiliations: affiliatedCooperants.length,
          pendingDebits: data.debits?.filter((d: any) => !d.paye)?.length || 0,
          totalPayments: data.payments?.length || 0
        };

        // Generate recent activities from real data
        this.recentActivities = this.generateRecentActivities({...data, affiliations: affiliatedCooperants, atctDossiers: data.atctDossiers});
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
    
    // Ajouter les activités ATCT récentes
    if (data.atctDossiers?.length > 0) {
      const recentDossiers = [...data.atctDossiers]
        .sort((a: any, b: any) => new Date(b.dateModification || b.dateCreation || 0).getTime() - new Date(a.dateModification || a.dateCreation || 0).getTime())
        .slice(0, 4);
      
      recentDossiers.forEach((d: any) => {
        const nom = d.nomCompletFr || `${d.prenomFr || ''} ${d.nomFr || ''}`.trim() || 'N/A';
        const statut = d.statut || 'EN_ATTENTE';
        const statutLabels: any = {
          'EN_ATTENTE': 'En attente de validation',
          'VALIDE': 'Dossier validé',
          'AFFILIE': `Affilié - N° ${d.numAffiliation || ''}`,
          'REJETE': 'Dossier rejeté',
          'RECLAMATION': 'Réclamation en cours'
        };
        activities.push({
          type: 'atct',
          description: `${nom} - ${statutLabels[statut] || statut}`,
          time: this.formatDate(d.dateModification || d.dateValidation || d.dateCreation),
          icon: statut === 'AFFILIE' ? 'how_to_reg' : statut === 'VALIDE' ? 'check_circle' : statut === 'REJETE' ? 'cancel' : 'folder_shared',
          color: statut === 'AFFILIE' ? 'text-green-600' : statut === 'VALIDE' ? 'text-teal-600' : statut === 'REJETE' ? 'text-red-600' : 'text-yellow-600'
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
