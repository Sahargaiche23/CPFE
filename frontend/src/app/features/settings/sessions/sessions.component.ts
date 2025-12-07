import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserService, UserSession } from '../../../core/services/user.service';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-sessions',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="bg-white rounded-lg shadow-md p-6">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-xl font-semibold text-gray-800">
          <span class="material-icons align-middle mr-2 text-primary-600">devices</span>
          Sessions actives
        </h2>
        <button 
          *ngIf="sessions.length > 1"
          (click)="revokeAllOther()"
          class="btn btn-outline-danger text-sm">
          <span class="material-icons text-sm mr-1">logout</span>
          Déconnecter autres appareils
        </button>
      </div>

      <!-- Loading -->
      <div *ngIf="loading" class="text-center py-8">
        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-600 mx-auto"></div>
        <p class="text-gray-500 mt-2">Chargement...</p>
      </div>

      <!-- Sessions List -->
      <div *ngIf="!loading" class="space-y-4">
        <div *ngFor="let session of sessions" 
             class="border rounded-lg p-4 hover:shadow-md transition-shadow"
             [class.border-primary-500]="isCurrentSession(session)"
             [class.bg-primary-50]="isCurrentSession(session)">
          
          <div class="flex items-start justify-between">
            <div class="flex items-start space-x-4">
              <!-- Device Icon -->
              <div class="w-12 h-12 rounded-full flex items-center justify-center"
                   [class.bg-blue-100]="session.deviceType === 'Desktop'"
                   [class.bg-green-100]="session.deviceType === 'Mobile'"
                   [class.bg-purple-100]="session.deviceType === 'Tablet'">
                <span class="material-icons text-2xl"
                      [class.text-blue-600]="session.deviceType === 'Desktop'"
                      [class.text-green-600]="session.deviceType === 'Mobile'"
                      [class.text-purple-600]="session.deviceType === 'Tablet'">
                  {{ getDeviceIcon(session.deviceType) }}
                </span>
              </div>

              <!-- Session Info -->
              <div>
                <div class="flex items-center space-x-2">
                  <span class="font-semibold text-gray-800">{{ session.browser }} sur {{ session.os }}</span>
                  <span *ngIf="isCurrentSession(session)" 
                        class="px-2 py-0.5 bg-primary-600 text-white text-xs rounded-full">
                    Session actuelle
                  </span>
                </div>
                <div class="text-sm text-gray-500 mt-1">
                  <span class="material-icons text-sm align-middle">location_on</span>
                  {{ session.location || 'Localisation inconnue' }}
                  <span class="mx-2">•</span>
                  <span class="material-icons text-sm align-middle">wifi</span>
                  {{ session.ipAddress }}
                </div>
                <div class="text-sm text-gray-400 mt-1">
                  <span class="material-icons text-sm align-middle">schedule</span>
                  Dernière activité: {{ formatDate(session.lastActivity) }}
                </div>
              </div>
            </div>

            <!-- Revoke Button -->
            <button 
              *ngIf="!isCurrentSession(session)"
              (click)="revokeSession(session)"
              class="text-red-500 hover:text-red-700 p-2 rounded-full hover:bg-red-50"
              title="Déconnecter cet appareil">
              <span class="material-icons">logout</span>
            </button>
          </div>
        </div>

        <!-- Empty State -->
        <div *ngIf="sessions.length === 0" class="text-center py-8 text-gray-500">
          <span class="material-icons text-4xl mb-2">devices</span>
          <p>Aucune session active</p>
        </div>
      </div>

      <!-- Info Box -->
      <div class="mt-6 p-4 bg-blue-50 rounded-lg">
        <div class="flex items-start space-x-3">
          <span class="material-icons text-blue-600">info</span>
          <div class="text-sm text-blue-800">
            <p class="font-medium">Protégez votre compte</p>
            <p class="mt-1">Si vous voyez une session que vous ne reconnaissez pas, 
            déconnectez-la immédiatement et changez votre mot de passe.</p>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .btn-outline-danger {
      @apply px-3 py-1.5 border border-red-500 text-red-500 rounded-md hover:bg-red-50 transition-colors;
    }
  `]
})
export class SessionsComponent implements OnInit {
  sessions: UserSession[] = [];
  loading = true;
  currentUser: any;

  constructor(
    private userService: UserService,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.currentUser = this.authService.getCurrentUser();
    this.loadSessions();
  }

  loadSessions() {
    if (this.currentUser?.id) {
      this.loading = true;
      this.userService.getUserSessions(this.currentUser.id).subscribe({
        next: (sessions) => {
          this.sessions = sessions;
          this.loading = false;
        },
        error: (err) => {
          console.error('Erreur chargement sessions:', err);
          this.sessions = [];
          this.loading = false;
        }
      });
    }
  }

  getDeviceIcon(deviceType: string): string {
    switch (deviceType) {
      case 'Mobile': return 'smartphone';
      case 'Tablet': return 'tablet';
      default: return 'computer';
    }
  }

  isCurrentSession(session: UserSession): boolean {
    // La session la plus récente est probablement la session actuelle
    if (this.sessions.length === 0) return false;
    const sorted = [...this.sessions].sort((a, b) => 
      new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
    );
    return sorted[0].id === session.id;
  }

  formatDate(dateStr: string): string {
    if (!dateStr) return 'Inconnue';
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);
    const hours = Math.floor(diff / 3600000);
    const days = Math.floor(diff / 86400000);

    if (minutes < 1) return 'À l\'instant';
    if (minutes < 60) return `Il y a ${minutes} minute${minutes > 1 ? 's' : ''}`;
    if (hours < 24) return `Il y a ${hours} heure${hours > 1 ? 's' : ''}`;
    if (days < 7) return `Il y a ${days} jour${days > 1 ? 's' : ''}`;
    
    return date.toLocaleDateString('fr-FR', { 
      day: 'numeric', 
      month: 'short', 
      year: 'numeric' 
    });
  }

  revokeSession(session: UserSession) {
    if (confirm('Voulez-vous déconnecter cet appareil ?')) {
      this.userService.revokeSession(this.currentUser.id, session.id).subscribe({
        next: () => {
          this.sessions = this.sessions.filter(s => s.id !== session.id);
        },
        error: (err) => {
          console.error('Erreur révocation session:', err);
          alert('Impossible de déconnecter cet appareil');
        }
      });
    }
  }

  revokeAllOther() {
    if (confirm('Voulez-vous déconnecter tous les autres appareils ?')) {
      this.userService.revokeAllOtherSessions(this.currentUser.id).subscribe({
        next: () => {
          // Garder uniquement la session actuelle
          const currentSession = this.sessions.find(s => this.isCurrentSession(s));
          this.sessions = currentSession ? [currentSession] : [];
        },
        error: (err) => {
          console.error('Erreur révocation sessions:', err);
          alert('Impossible de déconnecter les autres appareils');
        }
      });
    }
  }
}
