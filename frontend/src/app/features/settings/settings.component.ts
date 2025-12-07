import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../shared/layouts/main-layout/main-layout.component';
import { SessionsComponent } from './sessions/sessions.component';
import { I18nService, Language } from '../../core/services/i18n.service';
import { AuthService } from '../../core/services/auth.service';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-settings',
  standalone: true,
  imports: [CommonModule, FormsModule, MainLayoutComponent, SessionsComponent],
  template: `
    <app-main-layout>
      <div class="fade-in max-w-4xl mx-auto">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">{{ i18n.t('settings.title') }}</h1>

        <div *ngIf="successMessage" class="mb-4 p-4 bg-green-100 text-green-700 rounded-lg flex items-center gap-2">
          <span class="material-icons">check_circle</span>
          {{ successMessage }}
        </div>

        <div class="space-y-6">
          <!-- Paramètres d'affichage -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h3 class="text-xl font-semibold mb-4 flex items-center gap-2">
              <span class="material-icons text-cnss-primary">display_settings</span>
              {{ i18n.t('settings.display') }}
            </h3>
            <div class="space-y-4">
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.darkMode') }}</p>
                  <p class="text-sm text-gray-500">{{ i18n.t('settings.darkModeDesc') }}</p>
                </div>
                <label class="relative inline-flex items-center cursor-pointer">
                  <input type="checkbox" [(ngModel)]="settings.darkMode" (change)="onSettingChange()" class="sr-only peer">
                  <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cnss-primary"></div>
                </label>
              </div>
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.language') }}</p>
                  <p class="text-sm text-gray-500">{{ i18n.t('settings.languageDesc') }}</p>
                </div>
                <select [(ngModel)]="settings.language" (change)="onLanguageChange()" class="px-4 py-2 border rounded-lg">
                  <option value="fr">🇫🇷 Français</option>
                  <option value="ar">🇹🇳 العربية</option>
                  <option value="en">🇬🇧 English</option>
                </select>
              </div>
            </div>
          </div>

          <!-- Notifications -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h3 class="text-xl font-semibold mb-4 flex items-center gap-2">
              <span class="material-icons text-cnss-primary">notifications</span>
              {{ i18n.t('settings.notifications') }}
            </h3>
            <div class="space-y-4">
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.emailNotif') }}</p>
                  <p class="text-sm text-gray-500">{{ i18n.t('settings.emailNotifDesc') }}</p>
                </div>
                <label class="relative inline-flex items-center cursor-pointer">
                  <input type="checkbox" [(ngModel)]="settings.emailNotifications" (change)="onSettingChange()" class="sr-only peer">
                  <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cnss-primary"></div>
                </label>
              </div>
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.pushNotif') }}</p>
                  <p class="text-sm text-gray-500">{{ i18n.t('settings.pushNotifDesc') }}</p>
                </div>
                <label class="relative inline-flex items-center cursor-pointer">
                  <input type="checkbox" [(ngModel)]="settings.pushNotifications" (change)="onSettingChange()" class="sr-only peer">
                  <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cnss-primary"></div>
                </label>
              </div>
            </div>
          </div>

          <!-- Sécurité -->
          <div class="bg-white rounded-xl shadow-lg p-6">
            <h3 class="text-xl font-semibold mb-4 flex items-center gap-2">
              <span class="material-icons text-cnss-primary">security</span>
              {{ i18n.t('settings.security') }}
            </h3>
            <div class="space-y-4">
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.twoFactor') }}</p>
                  <p class="text-sm text-gray-500">{{ i18n.t('settings.twoFactorDesc') }}</p>
                </div>
                <label class="relative inline-flex items-center cursor-pointer">
                  <input type="checkbox" [(ngModel)]="settings.twoFactorAuth" (change)="onSettingChange()" class="sr-only peer">
                  <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cnss-primary"></div>
                </label>
              </div>
              <div class="flex items-center justify-between">
                <div>
                  <p class="font-medium">{{ i18n.t('settings.sessions') }}</p>
                  <p class="text-sm text-gray-500">Gérer les sessions connectées</p>
                </div>
                <button (click)="showSessions = !showSessions" class="text-cnss-primary hover:underline">
                  {{ showSessions ? 'Masquer' : i18n.t('settings.viewSessions') }}
                </button>
              </div>
            </div>
          </div>

          <!-- Sessions actives -->
          <app-sessions *ngIf="showSessions"></app-sessions>

          <!-- Actions -->
          <div class="flex justify-end gap-4">
            <button (click)="resetSettings()" class="px-6 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">
              {{ i18n.t('settings.cancel') }}
            </button>
            <button (click)="saveSettings()" [disabled]="saving" 
                    class="px-6 py-2 bg-cnss-primary text-white rounded-lg hover:bg-opacity-90 disabled:opacity-50 flex items-center gap-2">
              <span *ngIf="saving" class="animate-spin material-icons text-sm">sync</span>
              {{ i18n.t('settings.save') }}
            </button>
          </div>
        </div>
      </div>
    </app-main-layout>
  `
})
export class SettingsComponent implements OnInit {
  settings = {
    darkMode: false,
    language: 'fr' as Language,
    emailNotifications: true,
    pushNotifications: false,
    twoFactorAuth: false
  };
  
  saving = false;
  successMessage = '';
  showSessions = false;
  private userId: number | null = null;

  constructor(
    public i18n: I18nService,
    private authService: AuthService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    // Load settings from localStorage
    const savedSettings = localStorage.getItem('userSettings');
    if (savedSettings) {
      this.settings = { ...this.settings, ...JSON.parse(savedSettings) };
    }
    this.settings.language = this.i18n.getLanguage();
    
    const user = this.authService.getCurrentUser();
    if (user) {
      this.userId = user.id;
    }
  }

  onLanguageChange() {
    this.i18n.setLanguage(this.settings.language);
    this.onSettingChange();
  }

  onSettingChange() {
    // Apply dark mode
    if (this.settings.darkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }

  resetSettings() {
    this.settings = {
      darkMode: false,
      language: 'fr',
      emailNotifications: true,
      pushNotifications: false,
      twoFactorAuth: false
    };
    this.i18n.setLanguage('fr');
  }

  saveSettings() {
    this.saving = true;
    this.successMessage = '';
    
    // Save to localStorage
    localStorage.setItem('userSettings', JSON.stringify(this.settings));
    
    // Save to backend (if endpoint exists)
    const settingsData = {
      userId: this.userId,
      ...this.settings
    };
    
    // Simulate API call - in production, this would be a real API call
    setTimeout(() => {
      console.log('Settings saved:', settingsData);
      this.saving = false;
      this.successMessage = this.i18n.t('settings.saved');
      
      // Clear success message after 3 seconds
      setTimeout(() => {
        this.successMessage = '';
      }, 3000);
    }, 500);
  }
}
