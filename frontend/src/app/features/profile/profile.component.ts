import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { AuthService } from '../../core/services/auth.service';
import { UserService } from '../../core/services/user.service';
import { I18nService } from '../../core/services/i18n.service';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in max-w-4xl mx-auto">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">{{ i18n.t('profile.title') }}</h1>

        <div class="bg-white rounded-xl shadow-lg p-6 mb-6">
          <div class="flex items-center gap-6 mb-6">
            <div class="w-24 h-24 bg-cnss-primary rounded-full flex items-center justify-center text-white text-3xl font-bold">
              {{ getInitials() }}
            </div>
            <div>
              <h2 class="text-2xl font-semibold">{{ user?.identite || user?.username }}</h2>
              <p class="text-gray-600">{{ user?.profil }}</p>
              <p class="text-sm text-gray-500">{{ i18n.t('profile.connectedSince') }} {{ getLoginTime() }}</p>
            </div>
          </div>

          <form [formGroup]="profileForm" (ngSubmit)="onSubmit()" class="space-y-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.username') }}</label>
                <input type="text" formControlName="username" 
                       class="w-full px-4 py-2 border rounded-lg bg-gray-100" readonly>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.role') }}</label>
                <input type="text" formControlName="profil" 
                       class="w-full px-4 py-2 border rounded-lg bg-gray-100" readonly>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.officeCode') }}</label>
                <input type="text" formControlName="burCod" 
                       class="w-full px-4 py-2 border rounded-lg bg-gray-100" readonly>
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.identity') }}</label>
                <input type="text" formControlName="identite" 
                       class="w-full px-4 py-2 border rounded-lg bg-gray-100" readonly>
              </div>
            </div>
          </form>
        </div>

        <div class="bg-white rounded-xl shadow-lg p-6">
          <h3 class="text-xl font-semibold mb-4">{{ i18n.t('profile.changePassword') }}</h3>
          
          <!-- Message de succès -->
          <div *ngIf="successMessage" class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded-lg">
            {{ successMessage }}
          </div>
          
          <!-- Message d'erreur -->
          <div *ngIf="errorMessage" class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            {{ errorMessage }}
          </div>
          
          <form [formGroup]="passwordForm" (ngSubmit)="onChangePassword()" class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.currentPassword') }}</label>
              <input type="password" formControlName="currentPassword" 
                     class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-cnss-primary focus:border-transparent"
                     [class.border-red-500]="passwordForm.get('currentPassword')?.invalid && passwordForm.get('currentPassword')?.touched">
              <p *ngIf="passwordForm.get('currentPassword')?.invalid && passwordForm.get('currentPassword')?.touched" 
                 class="text-red-500 text-sm mt-1">Le mot de passe actuel est requis</p>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.newPassword') }}</label>
              <input type="password" formControlName="newPassword" 
                     class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-cnss-primary focus:border-transparent"
                     [class.border-red-500]="passwordForm.get('newPassword')?.invalid && passwordForm.get('newPassword')?.touched">
              <p *ngIf="passwordForm.get('newPassword')?.hasError('required') && passwordForm.get('newPassword')?.touched" 
                 class="text-red-500 text-sm mt-1">Le nouveau mot de passe est requis</p>
              <p *ngIf="passwordForm.get('newPassword')?.hasError('minlength') && passwordForm.get('newPassword')?.touched" 
                 class="text-red-500 text-sm mt-1">Le mot de passe doit contenir au moins 6 caractères</p>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.confirmPassword') }}</label>
              <input type="password" formControlName="confirmPassword" 
                     class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-cnss-primary focus:border-transparent"
                     [class.border-red-500]="passwordForm.get('confirmPassword')?.invalid && passwordForm.get('confirmPassword')?.touched">
              <p *ngIf="passwordForm.get('confirmPassword')?.invalid && passwordForm.get('confirmPassword')?.touched" 
                 class="text-red-500 text-sm mt-1">La confirmation est requise</p>
              <p *ngIf="passwordForm.errors?.['mismatch'] && passwordForm.get('confirmPassword')?.touched" 
                 class="text-red-500 text-sm mt-1">Les mots de passe ne correspondent pas</p>
            </div>
            <button type="submit" 
                    [disabled]="passwordForm.invalid || loading"
                    class="bg-cnss-primary text-white px-6 py-2 rounded-lg hover:bg-opacity-90 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2">
              <svg *ngIf="loading" class="animate-spin h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
              </svg>
              {{ loading ? 'En cours...' : i18n.t('profile.update') }}
            </button>
          </form>
        </div>
      </div>
    </app-main-layout>
  `
})
export class ProfileComponent implements OnInit {
  user: any = null;
  profileForm: FormGroup;
  passwordForm: FormGroup;
  loading = false;
  successMessage = '';
  errorMessage = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private userService: UserService,
    public i18n: I18nService
  ) {
    this.profileForm = this.fb.group({
      username: [''],
      profil: [''],
      burCod: [''],
      identite: ['']
    });

    this.passwordForm = this.fb.group({
      currentPassword: ['', Validators.required],
      newPassword: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required]
    }, { validators: this.passwordMatchValidator });
  }

  passwordMatchValidator(form: FormGroup) {
    const newPassword = form.get('newPassword')?.value;
    const confirmPassword = form.get('confirmPassword')?.value;
    return newPassword === confirmPassword ? null : { mismatch: true };
  }

  ngOnInit() {
    this.user = this.authService.getCurrentUser();
    if (this.user) {
      this.profileForm.patchValue({
        username: this.user.username,
        profil: this.user.profil,
        burCod: this.user.burCod || '-',
        identite: this.user.identite || this.user.username
      });
    }
  }

  getInitials(): string {
    if (this.user?.identite) {
      return this.user.identite.split(' ').map((n: string) => n[0]).join('').toUpperCase();
    }
    return this.user?.username?.[0]?.toUpperCase() || 'U';
  }

  getLoginTime(): string {
    return new Date().toLocaleDateString('fr-FR');
  }

  onSubmit() {
    console.log('Profile update not implemented');
  }

  onChangePassword() {
    const userId = this.user?.id || this.user?.userId;
    if (this.passwordForm.valid && userId) {
      this.loading = true;
      this.successMessage = '';
      this.errorMessage = '';

      const request = {
        currentPassword: this.passwordForm.get('currentPassword')?.value,
        newPassword: this.passwordForm.get('newPassword')?.value,
        confirmPassword: this.passwordForm.get('confirmPassword')?.value
      };

      console.log('Changing password for user:', userId, request);
      
      this.userService.changePassword(userId, request).subscribe({
        next: (response: any) => {
          this.loading = false;
          this.successMessage = 'Mot de passe changé avec succès !';
          this.passwordForm.reset();
        },
        error: (err: any) => {
          this.loading = false;
          this.errorMessage = err.error?.error || 'Erreur lors du changement de mot de passe';
        }
      });
    }
  }
}
