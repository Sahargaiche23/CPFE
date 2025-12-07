import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { UserService, User, Governorate } from '../../../core/services/user.service';

@Component({
  selector: 'app-user-management',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-6">
          <h1 class="text-3xl font-bold text-cnss-dark">Gestion des Utilisateurs</h1>
          <button (click)="openCreateModal()" 
                  class="bg-cnss-primary text-white px-4 py-2 rounded-lg hover:bg-opacity-90 flex items-center gap-2">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
            </svg>
            Nouvel Utilisateur
          </button>
        </div>

        <!-- Statistiques -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
          <div class="bg-white rounded-xl shadow p-4">
            <div class="text-3xl font-bold text-cnss-primary">{{ stats?.totalUsers || 0 }}</div>
            <div class="text-gray-600">Total Utilisateurs</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4">
            <div class="text-3xl font-bold text-green-600">{{ stats?.activeUsers || 0 }}</div>
            <div class="text-gray-600">Actifs</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4">
            <div class="text-3xl font-bold text-blue-600">{{ stats?.adminUsers || 0 }}</div>
            <div class="text-gray-600">Administrateurs</div>
          </div>
          <div class="bg-white rounded-xl shadow p-4">
            <div class="text-3xl font-bold text-orange-600">{{ stats?.regularUsers || 0 }}</div>
            <div class="text-gray-600">Agents</div>
          </div>
        </div>

        <!-- Filtres -->
        <div class="bg-white rounded-xl shadow-lg p-4 mb-6">
          <div class="flex flex-wrap gap-4">
            <input type="text" [(ngModel)]="searchTerm" placeholder="Rechercher..." 
                   class="px-4 py-2 border rounded-lg w-64"
                   (input)="filterUsers()">
            <select [(ngModel)]="filterRole" (change)="filterUsers()" class="px-4 py-2 border rounded-lg">
              <option value="">Tous les rôles</option>
              <option value="admin">Admin</option>
              <option value="user">Agent</option>
            </select>
            <select [(ngModel)]="filterStatus" (change)="filterUsers()" class="px-4 py-2 border rounded-lg">
              <option value="">Tous les statuts</option>
              <option value="1">Actif</option>
              <option value="0">Inactif</option>
            </select>
          </div>
        </div>

        <!-- Liste des utilisateurs -->
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
          <table class="min-w-full">
            <thead class="bg-gray-50">
              <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Utilisateur</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Identité</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Rôle</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Bureau</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Statut</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
              <tr *ngFor="let user of filteredUsers" class="hover:bg-gray-50">
                <td class="px-6 py-4">
                  <div class="flex items-center gap-3">
                    <div class="w-10 h-10 bg-cnss-primary rounded-full flex items-center justify-center text-white font-bold">
                      {{ getInitials(user) }}
                    </div>
                    <div>
                      <div class="font-medium">{{ user.username }}</div>
                      <div class="text-sm text-gray-500">{{ user.email || '-' }}</div>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-4">{{ user.firstName }} {{ user.lastName }}</td>
                <td class="px-6 py-4">
                  <span [class]="user.profil === 'admin' ? 'bg-purple-100 text-purple-800' : 'bg-blue-100 text-blue-800'" 
                        class="px-2 py-1 rounded-full text-xs font-medium">
                    {{ user.profil === 'admin' ? 'Admin' : 'Agent' }}
                  </span>
                </td>
                <td class="px-6 py-4">{{ user.burCod || '-' }}</td>
                <td class="px-6 py-4">
                  <span [class]="user.active === 1 ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'" 
                        class="px-2 py-1 rounded-full text-xs font-medium">
                    {{ user.active === 1 ? 'Actif' : 'Inactif' }}
                  </span>
                </td>
                <td class="px-6 py-4">
                  <div class="flex gap-2">
                    <button (click)="openEditModal(user)" class="text-blue-600 hover:text-blue-800" title="Modifier">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                      </svg>
                    </button>
                    <button (click)="toggleStatus(user)" 
                            [class]="user.active === 1 ? 'text-orange-600 hover:text-orange-800' : 'text-green-600 hover:text-green-800'"
                            [title]="user.active === 1 ? 'Désactiver' : 'Activer'">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path *ngIf="user.active === 1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"/>
                        <path *ngIf="user.active !== 1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                      </svg>
                    </button>
                    <button (click)="openResetPasswordModal(user)" class="text-yellow-600 hover:text-yellow-800" title="Réinitialiser MDP">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 7a2 2 0 012 2m4 0a6 6 0 01-7.743 5.743L11 17H9v2H7v2H4a1 1 0 01-1-1v-2.586a1 1 0 01.293-.707l5.964-5.964A6 6 0 1121 9z"/>
                      </svg>
                    </button>
                    <button (click)="viewLogs(user)" class="text-gray-600 hover:text-gray-800" title="Voir logs">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                      </svg>
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Modal Création/Edition -->
        <div *ngIf="showModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div class="bg-white rounded-xl shadow-2xl w-full max-w-lg mx-4 max-h-[90vh] overflow-y-auto">
            <div class="p-6 border-b">
              <h2 class="text-xl font-bold">{{ isEditing ? 'Modifier l\\'utilisateur' : 'Nouvel utilisateur' }}</h2>
            </div>
            <form [formGroup]="userForm" (ngSubmit)="saveUser()" class="p-6 space-y-4">
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Nom d'utilisateur *</label>
                  <input type="text" formControlName="username" class="w-full px-4 py-2 border rounded-lg"
                         [readonly]="isEditing">
                </div>
                <div *ngIf="!isEditing">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Mot de passe *</label>
                  <input type="password" formControlName="password" class="w-full px-4 py-2 border rounded-lg">
                </div>
              </div>
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Prénom</label>
                  <input type="text" formControlName="firstName" class="w-full px-4 py-2 border rounded-lg">
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Nom</label>
                  <input type="text" formControlName="lastName" class="w-full px-4 py-2 border rounded-lg">
                </div>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input type="email" formControlName="email" class="w-full px-4 py-2 border rounded-lg">
              </div>
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Rôle *</label>
                  <select formControlName="profil" class="w-full px-4 py-2 border rounded-lg">
                    <option value="user">Agent</option>
                    <option value="admin">Administrateur</option>
                  </select>
                </div>
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Code Bureau</label>
                  <input type="text" formControlName="burCode" class="w-full px-4 py-2 border rounded-lg" 
                         placeholder="Ex: 81">
                </div>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Gouvernorat</label>
                <select formControlName="govCode" class="w-full px-4 py-2 border rounded-lg">
                  <option value="">Sélectionner...</option>
                  <option *ngFor="let gov of governorates" [value]="gov.code">{{ gov.name }}</option>
                </select>
              </div>
              <div class="flex justify-end gap-3 pt-4">
                <button type="button" (click)="closeModal()" 
                        class="px-4 py-2 border rounded-lg hover:bg-gray-50">Annuler</button>
                <button type="submit" [disabled]="userForm.invalid || loading"
                        class="px-4 py-2 bg-cnss-primary text-white rounded-lg hover:bg-opacity-90 disabled:opacity-50">
                  {{ loading ? 'En cours...' : (isEditing ? 'Modifier' : 'Créer') }}
                </button>
              </div>
            </form>
          </div>
        </div>

        <!-- Modal Reset Password -->
        <div *ngIf="showResetModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div class="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4">
            <div class="p-6 border-b">
              <h2 class="text-xl font-bold">Réinitialiser le mot de passe</h2>
              <p class="text-gray-600 text-sm mt-1">Pour: {{ selectedUser?.username }}</p>
            </div>
            <div class="p-6 space-y-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Nouveau mot de passe</label>
                <input type="password" [(ngModel)]="newPassword" class="w-full px-4 py-2 border rounded-lg">
              </div>
              <div class="flex justify-end gap-3">
                <button (click)="showResetModal = false" 
                        class="px-4 py-2 border rounded-lg hover:bg-gray-50">Annuler</button>
                <button (click)="resetPassword()" [disabled]="!newPassword || loading"
                        class="px-4 py-2 bg-cnss-primary text-white rounded-lg hover:bg-opacity-90 disabled:opacity-50">
                  Réinitialiser
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal Logs -->
        <div *ngIf="showLogsModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div class="bg-white rounded-xl shadow-2xl w-full max-w-4xl mx-4 max-h-[90vh] overflow-hidden">
            <div class="p-6 border-b flex justify-between items-center">
              <div>
                <h2 class="text-xl font-bold">Historique d'activité</h2>
                <p class="text-gray-600 text-sm">{{ selectedUser?.username }}</p>
              </div>
              <button (click)="showLogsModal = false" class="text-gray-500 hover:text-gray-700">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
              </button>
            </div>
            <div class="p-6 overflow-y-auto max-h-96">
              <table class="min-w-full">
                <thead>
                  <tr class="border-b">
                    <th class="text-left py-2 px-2">Date</th>
                    <th class="text-left py-2 px-2">Action</th>
                    <th class="text-left py-2 px-2">Description</th>
                    <th class="text-left py-2 px-2">IP</th>
                    <th class="text-left py-2 px-2">Statut</th>
                  </tr>
                </thead>
                <tbody>
                  <tr *ngFor="let log of userLogs" class="border-b hover:bg-gray-50">
                    <td class="py-2 px-2 text-sm">{{ log.createdAt | date:'dd/MM/yyyy HH:mm' }}</td>
                    <td class="py-2 px-2">
                      <span [class]="getActionClass(log.action)" class="px-2 py-1 rounded text-xs">
                        {{ log.action }}
                      </span>
                    </td>
                    <td class="py-2 px-2 text-sm">{{ log.description }}</td>
                    <td class="py-2 px-2 text-sm font-mono">{{ log.ipAddress }}</td>
                    <td class="py-2 px-2">
                      <span [class]="log.success ? 'text-green-600' : 'text-red-600'">
                        {{ log.success ? '✓' : '✗' }}
                      </span>
                    </td>
                  </tr>
                  <tr *ngIf="userLogs.length === 0">
                    <td colspan="5" class="py-8 text-center text-gray-500">Aucun log trouvé</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class UserManagementComponent implements OnInit {
  users: User[] = [];
  filteredUsers: User[] = [];
  governorates: Governorate[] = [];
  stats: any = null;
  userLogs: any[] = [];
  
  showModal = false;
  showResetModal = false;
  showLogsModal = false;
  isEditing = false;
  loading = false;
  
  selectedUser: User | null = null;
  newPassword = '';
  searchTerm = '';
  filterRole = '';
  filterStatus = '';
  
  userForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private userService: UserService
  ) {
    this.userForm = this.fb.group({
      username: ['', Validators.required],
      password: [''],
      email: ['', Validators.email],
      firstName: [''],
      lastName: [''],
      profil: ['user', Validators.required],
      burCode: [''],
      govCode: ['']
    });
  }

  ngOnInit() {
    this.loadUsers();
    this.loadStats();
    this.loadGovernorates();
  }

  loadUsers() {
    this.userService.getAll().subscribe({
      next: (users) => {
        this.users = users;
        this.filterUsers();
      },
      error: (err) => console.error('Erreur chargement utilisateurs:', err)
    });
  }

  loadStats() {
    this.userService.getStats().subscribe({
      next: (stats) => this.stats = stats,
      error: (err) => console.error('Erreur chargement stats:', err)
    });
  }

  loadGovernorates() {
    this.userService.getGovernorates().subscribe({
      next: (govs) => this.governorates = govs,
      error: (err) => console.error('Erreur chargement gouvernorats:', err)
    });
  }

  filterUsers() {
    this.filteredUsers = this.users.filter(user => {
      const matchSearch = !this.searchTerm || 
        user.username.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        (user.firstName + ' ' + user.lastName).toLowerCase().includes(this.searchTerm.toLowerCase());
      const matchRole = !this.filterRole || user.profil === this.filterRole;
      const matchStatus = !this.filterStatus || user.active.toString() === this.filterStatus;
      return matchSearch && matchRole && matchStatus;
    });
  }

  getInitials(user: User): string {
    if (user.firstName && user.lastName) {
      return (user.firstName[0] + user.lastName[0]).toUpperCase();
    }
    return user.username[0].toUpperCase();
  }

  openCreateModal() {
    this.isEditing = false;
    this.userForm.reset({ profil: 'user' });
    this.userForm.get('password')?.setValidators(Validators.required);
    this.userForm.get('password')?.updateValueAndValidity();
    this.showModal = true;
  }

  openEditModal(user: User) {
    this.isEditing = true;
    this.selectedUser = user;
    this.userForm.patchValue({
      username: user.username,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      profil: user.profil,
      burCode: user.burCod
    });
    this.userForm.get('password')?.clearValidators();
    this.userForm.get('password')?.updateValueAndValidity();
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
    this.selectedUser = null;
  }

  saveUser() {
    if (this.userForm.valid) {
      this.loading = true;
      const formData = this.userForm.value;
      
      if (this.isEditing && this.selectedUser) {
        this.userService.update(this.selectedUser.id, formData).subscribe({
          next: () => {
            this.loading = false;
            this.closeModal();
            this.loadUsers();
          },
          error: (err) => {
            this.loading = false;
            alert('Erreur: ' + (err.error?.error || 'Erreur lors de la modification'));
          }
        });
      } else {
        this.userService.create(formData).subscribe({
          next: () => {
            this.loading = false;
            this.closeModal();
            this.loadUsers();
            this.loadStats();
          },
          error: (err) => {
            this.loading = false;
            alert('Erreur: ' + (err.error?.error || 'Erreur lors de la création'));
          }
        });
      }
    }
  }

  toggleStatus(user: User) {
    if (confirm(`Voulez-vous ${user.active === 1 ? 'désactiver' : 'activer'} cet utilisateur ?`)) {
      this.userService.toggleStatus(user.id).subscribe({
        next: () => this.loadUsers(),
        error: (err) => alert('Erreur: ' + err.message)
      });
    }
  }

  openResetPasswordModal(user: User) {
    this.selectedUser = user;
    this.newPassword = '';
    this.showResetModal = true;
  }

  resetPassword() {
    if (this.selectedUser && this.newPassword) {
      this.loading = true;
      this.userService.resetPassword(this.selectedUser.id, this.newPassword).subscribe({
        next: () => {
          this.loading = false;
          this.showResetModal = false;
          alert('Mot de passe réinitialisé avec succès');
        },
        error: (err) => {
          this.loading = false;
          alert('Erreur: ' + err.message);
        }
      });
    }
  }

  viewLogs(user: User) {
    this.selectedUser = user;
    this.userService.getUserLogs(user.id).subscribe({
      next: (logs) => {
        this.userLogs = logs;
        this.showLogsModal = true;
      },
      error: (err) => console.error('Erreur chargement logs:', err)
    });
  }

  getActionClass(action: string): string {
    switch (action) {
      case 'LOGIN': return 'bg-green-100 text-green-800';
      case 'LOGOUT': return 'bg-blue-100 text-blue-800';
      case 'LOGIN_FAILED': return 'bg-red-100 text-red-800';
      case 'PASSWORD_CHANGE': return 'bg-yellow-100 text-yellow-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  }
}
