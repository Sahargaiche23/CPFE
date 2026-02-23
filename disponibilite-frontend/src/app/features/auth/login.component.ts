import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-900 via-rose-800 to-pink-700 flex items-center justify-center p-4">
      <div class="w-full max-w-md">
        <!-- Logo & Header -->
        <div class="text-center mb-8">
          <div class="w-20 h-20 bg-white rounded-2xl mx-auto mb-4 flex items-center justify-center shadow-xl">
            <span class="material-icons text-4xl text-rose-600">gavel</span>
          </div>
          <h1 class="text-2xl font-bold text-white">عدم المباشرة الخاصة</h1>
          <p class="text-rose-200 mt-1">Mise en Disponibilité Spéciale</p>
          <p class="text-rose-300 text-sm mt-2">CNSS - Bureau Tunis</p>
          <!-- App Switch Buttons -->
          <div class="flex items-center justify-center gap-3 mt-4">
            <a href="http://localhost:4200" class="px-4 py-2 bg-white/20 hover:bg-white/30 text-white rounded-full text-sm flex items-center gap-2 transition-colors backdrop-blur-sm">
              <span class="material-icons text-sm">handshake</span>
              Coopération Technique
            </a>
            <span class="px-4 py-2 bg-white/40 text-white rounded-full text-sm flex items-center gap-2 font-medium">
              <span class="material-icons text-sm">gavel</span>
              Mise en Disponibilité
            </span>
          </div>
        </div>

        <!-- Login Card -->
        <div class="bg-white rounded-2xl shadow-2xl p-8">
          <div class="text-center mb-6">
            <h2 class="text-xl font-semibold text-gray-800">تسجيل الدخول</h2>
            <p class="text-gray-500 text-sm">Connexion Agent CNSS</p>
          </div>

          <form (ngSubmit)="login()" class="space-y-5">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">
                اسم المستخدم / Nom d'utilisateur
              </label>
              <div class="relative">
                <span class="material-icons absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">person</span>
                <input [(ngModel)]="username" name="username" type="text" required
                       class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-rose-500 focus:border-rose-500"
                       placeholder="Entrez votre nom d'utilisateur">
              </div>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">
                كلمة المرور / Mot de passe
              </label>
              <div class="relative">
                <span class="material-icons absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">lock</span>
                <input [(ngModel)]="password" name="password" [type]="showPassword ? 'text' : 'password'" required
                       class="w-full pl-10 pr-12 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-rose-500 focus:border-rose-500"
                       placeholder="Entrez votre mot de passe">
                <button type="button" (click)="showPassword = !showPassword"
                        class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                  <span class="material-icons">{{ showPassword ? 'visibility_off' : 'visibility' }}</span>
                </button>
              </div>
            </div>

            <div *ngIf="error" class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg text-sm">
              {{ error }}
            </div>

            <button type="submit" [disabled]="loading"
                    class="w-full py-3 bg-rose-600 text-white rounded-lg font-medium hover:bg-rose-700 transition-colors disabled:opacity-50 flex items-center justify-center gap-2">
              <span class="material-icons text-xl" [class.animate-spin]="loading">{{ loading ? 'sync' : 'login' }}</span>
              {{ loading ? 'جاري الدخول...' : 'دخول / Connexion' }}
            </button>
          </form>

          <div class="mt-6 pt-6 border-t border-gray-200 text-center">
            <p class="text-xs text-gray-500">
              Loi n°16 de 2003 - القانون عدد 16 لسنة 2003
            </p>
          </div>
        </div>

        <!-- Footer -->
        <div class="text-center mt-6 text-rose-200 text-xs">
          © 2026 CNSS - الصندوق الوطني للضمان الاجتماعي
        </div>
      </div>
    </div>
  `
})
export class LoginComponent {
  username = '';
  password = '';
  showPassword = false;
  loading = false;
  error = '';

  constructor(private authService: AuthService, private router: Router) {}

  login(): void {
    if (!this.username || !this.password) {
      this.error = 'Veuillez remplir tous les champs';
      return;
    }
    this.loading = true;
    this.error = '';

    this.authService.login({ username: this.username, password: this.password }).subscribe({
      next: () => {
        this.router.navigate(['/app']);
      },
      error: (err) => {
        this.error = err.error?.error || 'Erreur de connexion';
        this.loading = false;
      }
    });
  }
}
