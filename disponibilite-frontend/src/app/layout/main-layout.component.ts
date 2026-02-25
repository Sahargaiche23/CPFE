import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, RouterLink, RouterLinkActive } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [CommonModule, RouterOutlet, RouterLink, RouterLinkActive],
  template: `
    <div class="min-h-screen bg-gray-100" dir="rtl">
      <!-- Top Header Bar -->
      <div class="bg-rose-800 text-white">
        <div class="max-w-7xl mx-auto px-4 py-2 flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-white rounded-lg flex items-center justify-center">
              <span class="material-icons text-rose-600">gavel</span>
            </div>
            <div>
              <h1 class="font-bold">عدم المباشرة الخاصة</h1>
              <p class="text-xs text-rose-200">Mise en Disponibilité Spéciale</p>
            </div>
          </div>
          <div class="flex items-center gap-4">
            <a href="http://localhost:4200" class="px-3 py-1.5 bg-rose-600 hover:bg-rose-500 rounded-lg text-sm flex items-center gap-2 transition-colors" title="Coopération Technique">
              <span class="material-icons text-sm">swap_horiz</span>
              Coopération Technique
            </a>
            <div class="text-left" dir="ltr">
              <p class="text-sm font-medium">{{ user?.identite }}</p>
              <p class="text-xs text-rose-200">{{ user?.profil }}</p>
            </div>
            <button (click)="logout()" class="p-2 hover:bg-rose-700 rounded-lg transition-colors" title="تسجيل الخروج">
              <span class="material-icons">logout</span>
            </button>
          </div>
        </div>
      </div>

      <!-- Menu Bar -->
      <div class="bg-rose-700 text-white shadow-md">
        <div class="max-w-7xl mx-auto px-4">
          <div class="flex items-center gap-1">
            <!-- التصرف في الملفات Menu -->
            <div class="relative group">
              <button class="px-4 py-3 hover:bg-rose-600 flex items-center gap-2 text-sm font-medium transition-colors">
                <span class="material-icons text-lg">folder_open</span>
                التصرف في الملفات
                <span class="material-icons text-sm">arrow_drop_down</span>
              </button>
              <div class="absolute top-full right-0 bg-white text-gray-800 rounded-lg shadow-xl min-w-64 hidden group-hover:block z-50 border border-gray-200">
                <a routerLink="/app/dossiers" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-rose-600">description</span>
                  <div>
                    <p class="font-medium">تسجيل الملفات</p>
                    <p class="text-xs text-gray-500">Enregistrement des dossiers</p>
                  </div>
                </a>
                <a routerLink="/app/salaires" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-green-600">payments</span>
                  <div>
                    <p class="font-medium">تحيين الأجور</p>
                    <p class="text-xs text-gray-500">Mise à jour des salaires</p>
                  </div>
                </a>
                <a routerLink="/app/cotisations" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-blue-600">calculate</span>
                  <div>
                    <p class="font-medium">تنزيل المساهمات</p>
                    <p class="text-xs text-gray-500">Génération des cotisations</p>
                  </div>
                </a>
                <a routerLink="/app/paiements" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-orange-600">receipt_long</span>
                  <div>
                    <p class="font-medium">تحيين الخلاصات</p>
                    <p class="text-xs text-gray-500">Mise à jour des paiements</p>
                  </div>
                </a>
                <a routerLink="/app/carte-paiement" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-red-600">credit_card</span>
                  <div>
                    <p class="font-medium">بطاقة خلاص</p>
                    <p class="text-xs text-gray-500">Carte de paiement</p>
                  </div>
                </a>
                <a routerLink="/app/ged" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50">
                  <span class="material-icons text-purple-600">folder_special</span>
                  <div>
                    <p class="font-medium">إدارة الوثائق - GED</p>
                    <p class="text-xs text-gray-500">Gestion Électronique des Documents</p>
                  </div>
                </a>
              </div>
            </div>

            <!-- طباعة Menu -->
            <div class="relative group">
              <button class="px-4 py-3 hover:bg-rose-600 flex items-center gap-2 text-sm font-medium transition-colors">
                <span class="material-icons text-lg">print</span>
                طباعة
                <span class="material-icons text-sm">arrow_drop_down</span>
              </button>
              <div class="absolute top-full right-0 bg-white text-gray-800 rounded-lg shadow-xl min-w-72 hidden group-hover:block z-50 border border-gray-200">
                <a routerLink="/app/print/avis-agents" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-rose-600">mail</span>
                  <div>
                    <p class="font-medium">إشعار للخلاص بالنسبة للأعوان</p>
                    <p class="text-xs text-gray-500">Avis de paiement pour les agents</p>
                  </div>
                </a>
                <a routerLink="/app/print/suivi-paiements" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50 border-b border-gray-100">
                  <span class="material-icons text-blue-600">fact_check</span>
                  <div>
                    <p class="font-medium">متابعة خلاص المساهمات</p>
                    <p class="text-xs text-gray-500">Suivi des paiements</p>
                  </div>
                </a>
                <a routerLink="/app/print/relance-institutions" class="flex items-center gap-3 px-4 py-3 hover:bg-rose-50">
                  <span class="material-icons text-red-600">warning</span>
                  <div>
                    <p class="font-medium">إعلام حول تأخير المؤسسات للتسديد</p>
                    <p class="text-xs text-gray-500">Relance institutions en retard</p>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer Status Bar -->
      <div class="bg-rose-900 text-white py-1.5 text-sm">
        <div class="max-w-7xl mx-auto px-4 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <span class="material-icons text-sm text-rose-300">location_on</span>
            <span>المكتب: تونس المدينة</span>
          </div>
          <div class="flex items-center gap-2" dir="ltr">
            <span class="material-icons text-sm text-rose-300">calendar_today</span>
            <span>{{ currentDate }}</span>
          </div>
        </div>
      </div>

      <!-- Main Content -->
      <main class="max-w-7xl mx-auto p-4">
        <router-outlet></router-outlet>
      </main>
    </div>
  `,
  styles: [`
    .group:hover .group-hover\\:block { display: block; }
  `]
})
export class MainLayoutComponent {
  user = this.authService.getUser();
  currentDate = new Date().toLocaleDateString('fr-FR');

  constructor(private authService: AuthService) {}

  logout(): void {
    this.authService.logout();
  }
}
