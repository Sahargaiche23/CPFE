import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { UserService, AuditLog } from '../../../core/services/user.service';

@Component({
  selector: 'app-audit-logs',
  standalone: true,
  imports: [CommonModule, FormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-6">
          <h1 class="text-3xl font-bold text-cnss-dark">Journal d'Audit</h1>
          <button (click)="exportLogs()" 
                  class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-opacity-90 flex items-center gap-2">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            Exporter
          </button>
        </div>

        <!-- Filtres -->
        <div class="bg-white rounded-xl shadow-lg p-4 mb-6">
          <div class="flex flex-wrap gap-4">
            <input type="text" [(ngModel)]="filters.username" placeholder="Nom d'utilisateur" 
                   class="px-4 py-2 border rounded-lg w-48">
            <select [(ngModel)]="filters.action" class="px-4 py-2 border rounded-lg">
              <option value="">Toutes les actions</option>
              <option value="LOGIN">Connexion</option>
              <option value="LOGOUT">Déconnexion</option>
              <option value="LOGIN_FAILED">Échec connexion</option>
              <option value="PASSWORD_CHANGE">Changement MDP</option>
              <option value="USER_CREATE">Création utilisateur</option>
              <option value="USER_UPDATE">Modification utilisateur</option>
            </select>
            <input type="date" [(ngModel)]="filters.dateFrom" class="px-4 py-2 border rounded-lg">
            <input type="date" [(ngModel)]="filters.dateTo" class="px-4 py-2 border rounded-lg">
            <input type="text" [(ngModel)]="filters.ipAddress" placeholder="Adresse IP" 
                   class="px-4 py-2 border rounded-lg w-40">
            <button (click)="applyFilters()" 
                    class="bg-cnss-primary text-white px-4 py-2 rounded-lg hover:bg-opacity-90">
              Filtrer
            </button>
            <button (click)="resetFilters()" 
                    class="border px-4 py-2 rounded-lg hover:bg-gray-50">
              Réinitialiser
            </button>
          </div>
        </div>

        <!-- Statistiques rapides -->
        <div class="grid grid-cols-1 md:grid-cols-5 gap-4 mb-6">
          <div class="bg-white rounded-lg shadow p-4 text-center">
            <div class="text-2xl font-bold text-green-600">{{ getActionCount('LOGIN') }}</div>
            <div class="text-sm text-gray-600">Connexions</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 text-center">
            <div class="text-2xl font-bold text-red-600">{{ getActionCount('LOGIN_FAILED') }}</div>
            <div class="text-sm text-gray-600">Échecs</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 text-center">
            <div class="text-2xl font-bold text-yellow-600">{{ getActionCount('PASSWORD_CHANGE') }}</div>
            <div class="text-sm text-gray-600">Chg. MDP</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 text-center">
            <div class="text-2xl font-bold text-blue-600">{{ getActionCount('USER_CREATE') }}</div>
            <div class="text-sm text-gray-600">Créations</div>
          </div>
          <div class="bg-white rounded-lg shadow p-4 text-center">
            <div class="text-2xl font-bold text-gray-600">{{ filteredLogs.length }}</div>
            <div class="text-sm text-gray-600">Total</div>
          </div>
        </div>

        <!-- Tableau des logs -->
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
          <div class="overflow-x-auto">
            <table class="min-w-full">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date/Heure</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Utilisateur</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Action</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Description</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">IP</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Bureau</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Navigateur</th>
                  <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Statut</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200">
                <tr *ngFor="let log of paginatedLogs" class="hover:bg-gray-50" 
                    [class.bg-red-50]="!log.success">
                  <td class="px-4 py-3 text-sm whitespace-nowrap">
                    {{ log.createdAt | date:'dd/MM/yyyy HH:mm:ss' }}
                  </td>
                  <td class="px-4 py-3">
                    <div class="font-medium">{{ log.username }}</div>
                    <div class="text-xs text-gray-500">ID: {{ log.userId }}</div>
                  </td>
                  <td class="px-4 py-3">
                    <span [class]="getActionClass(log.action)" class="px-2 py-1 rounded text-xs font-medium">
                      {{ getActionLabel(log.action) }}
                    </span>
                  </td>
                  <td class="px-4 py-3 text-sm max-w-xs truncate" [title]="log.description">
                    {{ log.description }}
                  </td>
                  <td class="px-4 py-3 text-sm font-mono">{{ log.ipAddress }}</td>
                  <td class="px-4 py-3 text-sm">{{ log.burCode || '-' }}</td>
                  <td class="px-4 py-3 text-xs text-gray-500 max-w-xs truncate" [title]="log.userAgent">
                    {{ getBrowserName(log.userAgent) }}
                  </td>
                  <td class="px-4 py-3">
                    <span [class]="log.success ? 'text-green-600' : 'text-red-600'" class="font-bold">
                      {{ log.success ? '✓ Succès' : '✗ Échec' }}
                    </span>
                  </td>
                </tr>
                <tr *ngIf="filteredLogs.length === 0">
                  <td colspan="8" class="py-8 text-center text-gray-500">
                    Aucun log trouvé
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- Pagination -->
          <div class="px-6 py-4 border-t flex justify-between items-center">
            <div class="text-sm text-gray-600">
              Affichage {{ startIndex + 1 }} - {{ endIndex }} sur {{ filteredLogs.length }}
            </div>
            <div class="flex gap-2">
              <button (click)="prevPage()" [disabled]="currentPage === 0"
                      class="px-3 py-1 border rounded hover:bg-gray-50 disabled:opacity-50">
                ← Précédent
              </button>
              <span class="px-3 py-1">Page {{ currentPage + 1 }} / {{ totalPages }}</span>
              <button (click)="nextPage()" [disabled]="currentPage >= totalPages - 1"
                      class="px-3 py-1 border rounded hover:bg-gray-50 disabled:opacity-50">
                Suivant →
              </button>
            </div>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class AuditLogsComponent implements OnInit {
  allLogs: AuditLog[] = [];
  filteredLogs: AuditLog[] = [];
  
  currentPage = 0;
  pageSize = 20;
  
  filters = {
    username: '',
    action: '',
    dateFrom: '',
    dateTo: '',
    ipAddress: ''
  };

  constructor(private userService: UserService) {}

  ngOnInit() {
    this.loadLogs();
  }

  loadLogs() {
    this.userService.getAuditLogs(0, 1000).subscribe({
      next: (response: any) => {
        this.allLogs = response.content || response;
        this.filteredLogs = [...this.allLogs];
      },
      error: (err) => console.error('Erreur chargement logs:', err)
    });
  }

  applyFilters() {
    this.filteredLogs = this.allLogs.filter(log => {
      const matchUsername = !this.filters.username || 
        log.username.toLowerCase().includes(this.filters.username.toLowerCase());
      const matchAction = !this.filters.action || log.action === this.filters.action;
      const matchIp = !this.filters.ipAddress || 
        log.ipAddress?.includes(this.filters.ipAddress);
      
      let matchDate = true;
      if (this.filters.dateFrom) {
        matchDate = new Date(log.createdAt) >= new Date(this.filters.dateFrom);
      }
      if (this.filters.dateTo && matchDate) {
        matchDate = new Date(log.createdAt) <= new Date(this.filters.dateTo + 'T23:59:59');
      }
      
      return matchUsername && matchAction && matchIp && matchDate;
    });
    this.currentPage = 0;
  }

  resetFilters() {
    this.filters = {
      username: '',
      action: '',
      dateFrom: '',
      dateTo: '',
      ipAddress: ''
    };
    this.filteredLogs = [...this.allLogs];
    this.currentPage = 0;
  }

  get paginatedLogs(): AuditLog[] {
    const start = this.currentPage * this.pageSize;
    return this.filteredLogs.slice(start, start + this.pageSize);
  }

  get startIndex(): number {
    return this.currentPage * this.pageSize;
  }

  get endIndex(): number {
    return Math.min((this.currentPage + 1) * this.pageSize, this.filteredLogs.length);
  }

  get totalPages(): number {
    return Math.ceil(this.filteredLogs.length / this.pageSize);
  }

  prevPage() {
    if (this.currentPage > 0) this.currentPage--;
  }

  nextPage() {
    if (this.currentPage < this.totalPages - 1) this.currentPage++;
  }

  getActionCount(action: string): number {
    return this.filteredLogs.filter(l => l.action === action).length;
  }

  getActionClass(action: string): string {
    switch (action) {
      case 'LOGIN': return 'bg-green-100 text-green-800';
      case 'LOGOUT': return 'bg-blue-100 text-blue-800';
      case 'LOGIN_FAILED': return 'bg-red-100 text-red-800';
      case 'PASSWORD_CHANGE': return 'bg-yellow-100 text-yellow-800';
      case 'USER_CREATE': return 'bg-purple-100 text-purple-800';
      case 'USER_UPDATE': return 'bg-indigo-100 text-indigo-800';
      case 'USER_DELETE': return 'bg-pink-100 text-pink-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  }

  getActionLabel(action: string): string {
    const labels: { [key: string]: string } = {
      'LOGIN': 'Connexion',
      'LOGOUT': 'Déconnexion',
      'LOGIN_FAILED': 'Échec connexion',
      'PASSWORD_CHANGE': 'Chg. MDP',
      'USER_CREATE': 'Création',
      'USER_UPDATE': 'Modification',
      'USER_DELETE': 'Suppression',
      'VIEW_PAGE': 'Consultation'
    };
    return labels[action] || action;
  }

  getBrowserName(userAgent: string): string {
    if (!userAgent) return '-';
    if (userAgent.includes('Firefox')) return 'Firefox';
    if (userAgent.includes('Chrome')) return 'Chrome';
    if (userAgent.includes('Safari')) return 'Safari';
    if (userAgent.includes('Edge')) return 'Edge';
    return 'Autre';
  }

  exportLogs() {
    const csv = this.generateCSV();
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = `audit_logs_${new Date().toISOString().split('T')[0]}.csv`;
    link.click();
  }

  generateCSV(): string {
    const headers = ['Date', 'Utilisateur', 'Action', 'Description', 'IP', 'Bureau', 'Statut'];
    const rows = this.filteredLogs.map(log => [
      log.createdAt,
      log.username,
      log.action,
      log.description,
      log.ipAddress,
      log.burCode || '',
      log.success ? 'Succès' : 'Échec'
    ]);
    return [headers.join(','), ...rows.map(r => r.join(','))].join('\n');
  }
}
