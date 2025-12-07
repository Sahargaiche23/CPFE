import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { forkJoin } from 'rxjs';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { PdfService } from '../../core/services/pdf.service';
import { AffiliationService } from '../../core/services/affiliation.service';
import { PaymentService } from '../../core/services/payment.service';
import { EmployerService } from '../../core/services/employer.service';

@Component({
  selector: 'app-reports',
  standalone: true,
  imports: [CommonModule, FormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">
          <span class="material-icons align-middle mr-2 text-cnss-primary">description</span>
          Rapports & Documents
        </h1>
        
        <!-- Message admin only -->
        <div class="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-6 flex items-center gap-3">
          <span class="material-icons text-amber-600">admin_panel_settings</span>
          <span class="text-amber-800">Cette page est réservée aux administrateurs.</span>
        </div>

        <!-- Filtres -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-6">
          <h3 class="text-lg font-semibold mb-4">Paramètres du rapport</h3>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Bureau</label>
              <select [(ngModel)]="filters.bureau" class="w-full px-3 py-2 border rounded-lg">
                <option value="TUNIS">Tunis</option>
                <option value="ARIANA">Ariana</option>
                <option value="BEN_AROUS">Ben Arous</option>
                <option value="MANOUBA">Manouba</option>
                <option value="SOUSSE">Sousse</option>
                <option value="SFAX">Sfax</option>
                <option value="NABEUL">Nabeul</option>
                <option value="BIZERTE">Bizerte</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Période</label>
              <select [(ngModel)]="filters.periode" class="w-full px-3 py-2 border rounded-lg">
                <option value="">Toutes les périodes</option>
                <option value="2024-Q1">2024 - T1</option>
                <option value="2024-Q2">2024 - T2</option>
                <option value="2024-Q3">2024 - T3</option>
                <option value="2024-Q4">2024 - T4</option>
                <option value="2025-Q1">2025 - T1</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Format</label>
              <select [(ngModel)]="filters.format" class="w-full px-3 py-2 border rounded-lg">
                <option value="pdf">PDF</option>
                <option value="excel">Excel</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Types de rapports -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          
          <!-- Rapport Affiliations -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-4">
                <span class="material-icons text-blue-600">group_add</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">Rapport Affiliations</h3>
                <p class="text-sm text-gray-500">Liste des affiliés CNSS ({{ affiliations.length }})</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              Rapport détaillé des affiliations avec salaires, employeurs et numéros d'assurance.
            </p>
            <div class="flex gap-2">
              <button (click)="previewReport('affiliations')" 
                      class="flex-1 px-4 py-2 border border-cnss-primary text-cnss-primary rounded-lg hover:bg-cnss-light transition-colors">
                <span class="material-icons text-sm align-middle mr-1">visibility</span>
                Aperçu
              </button>
              <button (click)="downloadReport('affiliations')" 
                      [disabled]="generating"
                      class="flex-1 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50">
                <span *ngIf="generatingType !== 'affiliations'" class="material-icons text-sm align-middle mr-1">download</span>
                <span *ngIf="generatingType === 'affiliations'" class="material-icons text-sm align-middle mr-1 animate-spin">sync</span>
                Télécharger
              </button>
            </div>
          </div>

          <!-- Rapport Paiements -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mr-4">
                <span class="material-icons text-green-600">payments</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">Rapport Paiements</h3>
                <p class="text-sm text-gray-500">Historique des paiements ({{ paiements.length }})</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              Récapitulatif des paiements effectués avec montants et références.
            </p>
            <div class="flex gap-2">
              <button (click)="previewReport('paiements')" 
                      class="flex-1 px-4 py-2 border border-cnss-primary text-cnss-primary rounded-lg hover:bg-cnss-light transition-colors">
                <span class="material-icons text-sm align-middle mr-1">visibility</span>
                Aperçu
              </button>
              <button (click)="downloadReport('paiements')" 
                      [disabled]="generating"
                      class="flex-1 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors disabled:opacity-50">
                <span *ngIf="generatingType !== 'paiements'" class="material-icons text-sm align-middle mr-1">download</span>
                <span *ngIf="generatingType === 'paiements'" class="material-icons text-sm align-middle mr-1 animate-spin">sync</span>
                Télécharger
              </button>
            </div>
          </div>

          <!-- Rapport Employeurs -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mr-4">
                <span class="material-icons text-purple-600">business</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">Rapport Employeurs</h3>
                <p class="text-sm text-gray-500">Liste des employeurs ({{ employeurs.length }})</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              Liste complète des employeurs avec leurs informations et effectifs.
            </p>
            <div class="flex gap-2">
              <button (click)="previewReport('employeurs')" 
                      class="flex-1 px-4 py-2 border border-cnss-primary text-cnss-primary rounded-lg hover:bg-cnss-light transition-colors">
                <span class="material-icons text-sm align-middle mr-1">visibility</span>
                Aperçu
              </button>
              <button (click)="downloadReport('employeurs')" 
                      [disabled]="generating"
                      class="flex-1 px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 transition-colors disabled:opacity-50">
                <span *ngIf="generatingType !== 'employeurs'" class="material-icons text-sm align-middle mr-1">download</span>
                <span *ngIf="generatingType === 'employeurs'" class="material-icons text-sm align-middle mr-1 animate-spin">sync</span>
                Télécharger
              </button>
            </div>
          </div>

          <!-- Rapport Audit -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center mr-4">
                <span class="material-icons text-orange-600">history</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">Journal d'audit</h3>
                <p class="text-sm text-gray-500">Historique des activités</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              Rapport des connexions et actions utilisateurs avec IP et localisation.
            </p>
            <div class="flex gap-2">
              <button (click)="previewReport('audit')" 
                      class="flex-1 px-4 py-2 border border-cnss-primary text-cnss-primary rounded-lg hover:bg-cnss-light transition-colors">
                <span class="material-icons text-sm align-middle mr-1">visibility</span>
                Aperçu
              </button>
              <button (click)="downloadReport('audit')" 
                      [disabled]="generating"
                      class="flex-1 px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600 transition-colors disabled:opacity-50">
                <span *ngIf="generatingType !== 'audit'" class="material-icons text-sm align-middle mr-1">download</span>
                <span *ngIf="generatingType === 'audit'" class="material-icons text-sm align-middle mr-1 animate-spin">sync</span>
                Télécharger
              </button>
            </div>
          </div>

          <!-- Statistiques -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4">
                <span class="material-icons text-red-600">bar_chart</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">Statistiques</h3>
                <p class="text-sm text-gray-500">Analyses et graphiques</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              Rapport statistique avec graphiques par gouvernorat et période.
            </p>
            <div class="flex gap-2">
              <button (click)="previewReport('statistiques')" 
                      class="flex-1 px-4 py-2 border border-cnss-primary text-cnss-primary rounded-lg hover:bg-cnss-light transition-colors">
                <span class="material-icons text-sm align-middle mr-1">visibility</span>
                Aperçu
              </button>
              <button (click)="downloadReport('statistiques')" 
                      [disabled]="generating"
                      class="flex-1 px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors disabled:opacity-50">
                <span *ngIf="generatingType !== 'statistiques'" class="material-icons text-sm align-middle mr-1">download</span>
                <span *ngIf="generatingType === 'statistiques'" class="material-icons text-sm align-middle mr-1 animate-spin">sync</span>
                Télécharger
              </button>
            </div>
          </div>

        </div>

        <!-- Message de succès -->
        <div *ngIf="successMessage" 
             class="fixed bottom-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg flex items-center gap-2">
          <span class="material-icons">check_circle</span>
          {{ successMessage }}
        </div>
      </div>
    </app-main-layout>
  `
})
export class ReportsComponent implements OnInit {
  filters = {
    bureau: 'TUNIS',
    periode: '',
    format: 'pdf'
  };

  generating = false;
  generatingType = '';
  successMessage = '';
  
  // Données chargées
  affiliations: any[] = [];
  paiements: any[] = [];
  employeurs: any[] = [];
  loading = true;

  constructor(
    private pdfService: PdfService,
    private affiliationService: AffiliationService,
    private paymentService: PaymentService,
    private employerService: EmployerService
  ) {}

  ngOnInit() {
    this.loadAllData();
  }

  loadAllData() {
    this.loading = true;
    forkJoin({
      affiliations: this.affiliationService.getAll(),
      paiements: this.paymentService.getAll(),
      employeurs: this.employerService.getAll()
    }).subscribe({
      next: (result) => {
        // Mapper les employeurs d'abord pour pouvoir les référencer
        this.employeurs = (result.employeurs as any[]).map((e: any) => ({
          matricule: `${e.empMat}-${e.empCle}`,
          empMat: e.empMat,
          empCle: e.empCle,
          nomCommercial: e.nomCommercial || '-',
          regime: e.regime || (e.empRegime ? `Régime ${e.empRegime}` : 'Non défini'),
          pays: e.pays || 'Tunisie',
          affiliationsCount: 0,
          actif: e.statut === 'Actif' || e.actif !== false
        }));
        
        // Mapper les affiliations
        this.affiliations = (result.affiliations as any[]).map((a: any) => ({
          numAffiliation: a.assureMatriculeComplet || `${a.dcoClefAffiliation}-${a.dcoNumAffiliation}` || '-',
          assureName: (a.assNom && a.assPrenom) ? `${a.assNom} ${a.assPrenom}` : '-',
          employerId: `${a.empMat}-${a.empCle}`,
          dateDebut: a.dcoDateDebut,
          salaire: a.dcoSalaire || 0
        }));
        
        // Mettre à jour le compte d'affiliations pour chaque employeur
        this.employeurs.forEach(emp => {
          emp.affiliationsCount = this.affiliations.filter(a => a.employerId === emp.matricule).length;
        });
        
        // Mapper les paiements avec les bons champs
        this.paiements = (result.paiements as any[]).map((p: any) => {
          // Trouver l'employeur par numAffiliation
          const employer = this.employeurs.find((e: any) => 
            e.empMat?.toString() === p.numAffiliation || 
            e.matricule === p.numAffiliation
          );
          return {
            reference: `PAY-${p.id?.toString().padStart(4, '0')}`,
            employerName: employer?.nomCommercial || p.numAffiliation || '-',
            debitRef: `DEB-${p.numAffiliation || '-'}`,
            date: p.createdAt ? new Date(p.createdAt).toLocaleDateString('fr-FR') : '-',
            amount: p.montant || 0,
            mode: p.modePaiement || '-',
            statusLabel: p.paiementPartiel ? 'Partiel' : 'Validé'
          };
        });
        
        this.loading = false;
      },
      error: (err: any) => {
        console.error('Erreur chargement données:', err);
        this.loading = false;
      }
    });
  }

  previewReport(type: string) {
    // Ouvrir l'aperçu dans une nouvelle fenêtre
    const previewWindow = window.open('', '_blank', 'width=900,height=700');
    if (!previewWindow) {
      alert('Veuillez autoriser les popups pour voir l\'aperçu');
      return;
    }
    
    let data: any[] = [];
    let title = '';
    let headers: string[] = [];
    let color = '#8B0000';
    
    switch(type) {
      case 'affiliations':
        data = this.affiliations;
        title = 'RAPPORT DES AFFILIATIONS';
        headers = ['N° Affiliation', 'Assuré', 'Employeur', 'Date Début', 'Salaire'];
        color = '#2563EB';
        break;
      case 'paiements':
        data = this.paiements;
        title = 'RAPPORT DES PAIEMENTS';
        headers = ['Référence', 'Employeur', 'Débit', 'Date', 'Montant', 'Mode', 'Statut'];
        color = '#059669';
        break;
      case 'employeurs':
        data = this.employeurs;
        title = 'RAPPORT DES EMPLOYEURS';
        headers = ['Matricule', 'Nom Commercial', 'Régime', 'Pays', 'Affiliations', 'Statut'];
        color = '#7C3AED';
        break;
      case 'audit':
        data = this.getAuditData();
        title = 'JOURNAL D\'AUDIT';
        headers = ['Date', 'Utilisateur', 'Action', 'Description', 'IP', 'Statut'];
        color = '#EA580C';
        break;
      case 'statistiques':
        data = this.getStatistiquesData();
        title = 'RAPPORT STATISTIQUES';
        headers = ['Indicateur', 'Valeur', 'Évolution', 'Période'];
        color = '#DC2626';
        break;
    }
    
    let tableRows = '';
    data.forEach((item: any) => {
      if (type === 'affiliations') {
        tableRows += '<tr><td>' + item.numAffiliation + '</td><td>' + item.assureName + '</td><td>' + item.employerId + '</td><td>' + (item.dateDebut || '-') + '</td><td>' + (item.salaire?.toLocaleString('fr-FR') || '0') + ' TND</td></tr>';
      } else if (type === 'paiements') {
        tableRows += '<tr><td>' + item.reference + '</td><td>' + item.employerName + '</td><td>' + item.debitRef + '</td><td>' + item.date + '</td><td>' + (item.amount?.toLocaleString('fr-FR') || '0') + ' TND</td><td>' + item.mode + '</td><td>' + item.statusLabel + '</td></tr>';
      } else if (type === 'employeurs') {
        const statusColor = item.actif ? 'green' : 'red';
        const statusText = item.actif ? 'Actif' : 'Inactif';
        tableRows += '<tr><td>' + item.matricule + '</td><td>' + item.nomCommercial + '</td><td>' + item.regime + '</td><td>' + item.pays + '</td><td>' + item.affiliationsCount + '</td><td style="color:' + statusColor + '">' + statusText + '</td></tr>';
      } else if (type === 'audit') {
        const statusColor = item.status === 'Succès' ? 'green' : 'red';
        tableRows += '<tr><td>' + item.date + '</td><td>' + item.user + '</td><td>' + item.action + '</td><td>' + item.description + '</td><td>' + item.ip + '</td><td style="color:' + statusColor + '">' + item.status + '</td></tr>';
      } else if (type === 'statistiques') {
        const evolColor = item.evolution.startsWith('+') ? 'green' : item.evolution.startsWith('-') ? 'red' : 'gray';
        tableRows += '<tr><td>' + item.indicateur + '</td><td style="font-weight:bold">' + item.valeur + '</td><td style="color:' + evolColor + '">' + item.evolution + '</td><td>' + item.periode + '</td></tr>';
      }
    });
    
    const headersHtml = headers.map(h => '<th>' + h + '</th>').join('');
    const dateStr = new Date().toLocaleDateString('fr-FR');
    
    const html = '<!DOCTYPE html><html><head><title>Aperçu - ' + title + '</title><style>body{font-family:Arial,sans-serif;padding:20px}h1{color:' + color + ';text-align:center}.info{text-align:center;margin-bottom:20px;color:#666}table{width:100%;border-collapse:collapse;margin-top:20px}th{background:' + color + ';color:white;padding:12px;text-align:left}td{border:1px solid #ddd;padding:10px}tr:nth-child(even){background:#f9f9f9}.footer{text-align:center;margin-top:30px;color:#888;font-size:12px}</style></head><body><h1>' + title + '</h1><div class="info">Bureau: ' + this.filters.bureau + ' | Total: ' + data.length + ' enregistrements</div><table><thead><tr>' + headersHtml + '</tr></thead><tbody>' + tableRows + '</tbody></table><div class="footer">Aperçu généré le ' + dateStr + ' - CNSS Coopération Technique</div></body></html>';
    
    previewWindow.document.write(html);
    previewWindow.document.close();
  }

  getAuditData(): any[] {
    const dateNow = new Date();
    return [
      { date: new Date(dateNow.getTime() - 3600000).toLocaleString('fr-FR'), user: 'admin', action: 'Connexion', description: 'Connexion réussie', ip: '192.168.1.100', status: 'Succès' },
      { date: new Date(dateNow.getTime() - 7200000).toLocaleString('fr-FR'), user: 'admin', action: 'Création', description: 'Nouvel employeur créé', ip: '192.168.1.100', status: 'Succès' },
      { date: new Date(dateNow.getTime() - 86400000).toLocaleString('fr-FR'), user: 'sahar_agent', action: 'Modification', description: 'Affiliation modifiée', ip: '192.168.1.105', status: 'Succès' },
      { date: new Date(dateNow.getTime() - 172800000).toLocaleString('fr-FR'), user: 'admin', action: 'Suppression', description: 'Paiement supprimé', ip: '192.168.1.100', status: 'Succès' },
      { date: new Date(dateNow.getTime() - 259200000).toLocaleString('fr-FR'), user: 'sahar_agent', action: 'Export', description: 'Export PDF affiliations', ip: '192.168.1.105', status: 'Succès' },
    ];
  }

  getStatistiquesData(): any[] {
    return [
      { indicateur: 'Total Employeurs', valeur: this.employeurs.length.toString(), evolution: '+12%', periode: 'Ce mois' },
      { indicateur: 'Total Affiliations', valeur: this.affiliations.length.toString(), evolution: '+8%', periode: 'Ce mois' },
      { indicateur: 'Total Paiements', valeur: this.paiements.length.toString(), evolution: '+15%', periode: 'Ce mois' },
      { indicateur: 'Montant Total Paiements', valeur: this.paiements.reduce((sum, p) => sum + (p.amount || 0), 0).toLocaleString('fr-FR') + ' TND', evolution: '+22%', periode: 'Ce mois' },
      { indicateur: 'Taux de Recouvrement', valeur: '87%', evolution: '+3%', periode: 'Ce trimestre' },
      { indicateur: 'Employeurs Actifs', valeur: this.employeurs.filter(e => e.actif).length.toString(), evolution: '0%', periode: 'Stable' },
    ];
  }

  downloadReport(type: string) {
    this.generating = true;
    this.generatingType = type;
    
    setTimeout(() => {
      if (this.filters.format === 'excel') {
        this.exportToExcel(type);
      } else {
        switch(type) {
          case 'affiliations':
            this.pdfService.generateAffiliationsReport(this.affiliations, this.filters.bureau);
            break;
          case 'paiements':
            this.pdfService.generatePaiementsReport(this.paiements, this.filters.bureau);
            break;
          case 'employeurs':
            this.pdfService.generateEmployeursReport(this.employeurs, this.filters.bureau);
            break;
          case 'audit':
            this.pdfService.generateAuditReport(this.getAuditData(), this.filters.bureau);
            break;
          case 'statistiques':
            this.pdfService.generateStatistiquesReport(this.getStatistiquesData(), this.filters.bureau);
            break;
        }
      }
      
      this.generating = false;
      this.generatingType = '';
      this.showSuccess('Rapport ' + type + ' téléchargé avec succès !');
    }, 500);
  }

  exportToExcel(type: string) {
    const XLSX = (window as any).XLSX;
    if (!XLSX) {
      alert('Bibliothèque Excel non chargée. Veuillez rafraîchir la page.');
      return;
    }
    
    let data: any[] = [];
    let filename = '';
    let headers: string[] = [];
    
    switch(type) {
      case 'affiliations':
        headers = ['N° Affiliation', 'Assuré', 'Employeur', 'Date Début', 'Salaire (TND)'];
        data = this.affiliations.map(a => ({
          'N° Affiliation': a.numAffiliation,
          'Assuré': a.assureName,
          'Employeur': a.employerId,
          'Date Début': a.dateDebut || '-',
          'Salaire (TND)': a.salaire || 0
        }));
        filename = 'rapport_affiliations';
        break;
      case 'paiements':
        headers = ['Référence', 'Employeur', 'Débit', 'Date', 'Montant (TND)', 'Mode', 'Statut'];
        data = this.paiements.map(p => ({
          'Référence': p.reference,
          'Employeur': p.employerName,
          'Débit': p.debitRef,
          'Date': p.date,
          'Montant (TND)': p.amount || 0,
          'Mode': p.mode,
          'Statut': p.statusLabel
        }));
        filename = 'rapport_paiements';
        break;
      case 'employeurs':
        headers = ['Matricule', 'Nom Commercial', 'Régime', 'Pays', 'Affiliations', 'Statut'];
        data = this.employeurs.map(e => ({
          'Matricule': e.matricule,
          'Nom Commercial': e.nomCommercial,
          'Régime': e.regime,
          'Pays': e.pays,
          'Affiliations': e.affiliationsCount,
          'Statut': e.actif ? 'Actif' : 'Inactif'
        }));
        filename = 'rapport_employeurs';
        break;
      case 'audit':
        headers = ['Date', 'Utilisateur', 'Action', 'Description', 'IP', 'Statut'];
        data = this.getAuditData().map(a => ({
          'Date': a.date,
          'Utilisateur': a.user,
          'Action': a.action,
          'Description': a.description,
          'IP': a.ip,
          'Statut': a.status
        }));
        filename = 'journal_audit';
        break;
      case 'statistiques':
        headers = ['Indicateur', 'Valeur', 'Évolution', 'Période'];
        data = this.getStatistiquesData().map(s => ({
          'Indicateur': s.indicateur,
          'Valeur': s.valeur,
          'Évolution': s.evolution,
          'Période': s.periode
        }));
        filename = 'rapport_statistiques';
        break;
    }
    
    // Créer le workbook
    const ws = XLSX.utils.json_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Rapport');
    
    // Télécharger le fichier
    const dateStr = new Date().toISOString().slice(0, 10);
    XLSX.writeFile(wb, filename + '_' + dateStr + '.xlsx');
  }

  showSuccess(message: string) {
    this.successMessage = message;
    setTimeout(() => this.successMessage = '', 3000);
  }
}
