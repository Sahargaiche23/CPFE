import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { AuthService } from '../../core/services/auth.service';
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
          <form class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.currentPassword') }}</label>
              <input type="password" class="w-full px-4 py-2 border rounded-lg">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.newPassword') }}</label>
              <input type="password" class="w-full px-4 py-2 border rounded-lg">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">{{ i18n.t('profile.confirmPassword') }}</label>
              <input type="password" class="w-full px-4 py-2 border rounded-lg">
            </div>
            <button type="submit" class="bg-cnss-primary text-white px-6 py-2 rounded-lg hover:bg-opacity-90">
              {{ i18n.t('profile.update') }}
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

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    public i18n: I18nService
  ) {
    this.profileForm = this.fb.group({
      username: [''],
      profil: [''],
      burCod: [''],
      identite: ['']
    });
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
}
