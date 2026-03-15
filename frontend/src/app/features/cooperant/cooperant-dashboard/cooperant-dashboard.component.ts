import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { AuthService } from '../../../core/services/auth.service';

interface DossierATCT {
  id: number;
  nomFr: string;
  prenomFr: string;
  email: string;
  matriculeEmployeurComplet: string;
  statut: string;
  dateCreation: string;
  codeRegime: string;
}

@Component({
  selector: 'app-cooperant-dashboard',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-pink-800 via-pink-600 to-pink-400">
      <!-- Header -->
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-14" />
            <div>
              <h1 class="text-xl font-bold text-gray-800">Espace Coopérant</h1>
              <p class="text-sm text-gray-500">CNSS - Coopération Technique</p>
            </div>
          </div>
          <div class="flex items-center gap-4">
            <span class="text-gray-600">{{ username }}</span>
            <button (click)="logout()" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
              Déconnexion
            </button>
          </div>
        </div>
      </header>

      <!-- Main Content -->
      <main class="max-w-7xl mx-auto px-4 py-8">
        <!-- Welcome Banner -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-8">
          <h2 class="text-2xl font-bold text-gray-800 mb-2">Bienvenue, {{ getNom() }}</h2>
          <p class="text-gray-600">Matricule: <strong class="text-pink-600">{{ getMatricule() }}</strong></p>
        </div>

        <!-- Dashboard Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <!-- Mon Dossier -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer" 
               [routerLink]="['/cooperant/mon-dossier']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
              </div>
              <span class="text-3xl font-bold text-blue-600">1</span>
            </div>
            <h3 class="font-semibold text-gray-800">Mon Dossier</h3>
            <p class="text-sm text-gray-500">Voir ma demande</p>
          </div>

          <!-- Suivi Dossier -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/suivi']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path>
                </svg>
              </div>
              <span class="px-3 py-1 rounded-full text-sm font-medium" 
                    [ngClass]="getStatutClass()">
                {{ getStatutLabel() }}
              </span>
            </div>
            <h3 class="font-semibold text-gray-800">Suivi Dossier</h3>
            <p class="text-sm text-gray-500">État de ma demande</p>
          </div>

          <!-- Historique -->
          <div class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition cursor-pointer"
               [routerLink]="['/cooperant/historique']">
            <div class="flex items-center justify-between mb-4">
              <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
            </div>
            <h3 class="font-semibold text-gray-800">Historique</h3>
            <p class="text-sm text-gray-500">Mes demandes passées</p>
          </div>

        </div>

        <!-- Phase 3: Demandes Coopérant -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-8">
          <div class="flex items-center justify-between mb-6">
            <div>
              <h3 class="text-lg font-bold text-gray-800 flex items-center gap-2">
                <svg class="w-6 h-6 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
              </h3>
              <p class="text-sm text-gray-500 mt-1">Déposer une demande ou suivre vos demandes en cours</p>
            </div>
            <div [routerLink]="['/cooperant/mes-demandes']" class="cursor-pointer flex items-center gap-2 px-4 py-2 bg-pink-50 text-pink-700 rounded-lg hover:bg-pink-100 transition">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
              </svg>
              <span class="font-medium text-sm">Suivi ({{ nbDemandes }})</span>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Actualisation Salaire -->
            <div class="border-2 border-gray-200 rounded-xl p-5 hover:border-pink-500 hover:shadow-lg transition cursor-pointer group"
                 [routerLink]="['/cooperant/demande-salaire']">
              <div class="w-12 h-12 bg-emerald-100 rounded-full flex items-center justify-center mb-3 group-hover:bg-emerald-200 transition">
                <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
              <h4 class="font-semibold text-gray-800 text-sm">Actualisation Salaire</h4>
              <p class="text-xs text-gray-500 mt-1">Mise à jour de votre salaire</p>
            </div>

            <!-- Sortie Régime Maladie -->
            <div class="border-2 border-gray-200 rounded-xl p-5 hover:border-pink-500 hover:shadow-lg transition cursor-pointer group"
                 [routerLink]="['/cooperant/demande-sortie-regime']">
              <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-3 group-hover:bg-blue-200 transition">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg>
              </div>
              <h4 class="font-semibold text-gray-800 text-sm">Sortie Régime Maladie</h4>
              <p class="text-xs text-gray-500 mt-1">Demande de sortie du régime</p>
            </div>

            <!-- Annulation Assurance -->
            <div class="border-2 border-gray-200 rounded-xl p-5 hover:border-pink-500 hover:shadow-lg transition cursor-pointer group"
                 [routerLink]="['/cooperant/demande-annulation']">
              <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mb-3 group-hover:bg-red-200 transition">
                <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                </svg>
              </div>
              <h4 class="font-semibold text-gray-800 text-sm">Annulation Assurance</h4>
              <p class="text-xs text-gray-500 mt-1">Maladie + Capital Décès</p>
            </div>

            <!-- Rachat Loi 105 -->
            <div class="border-2 border-gray-200 rounded-xl p-5 hover:border-amber-500 hover:shadow-lg transition cursor-pointer group bg-amber-50"
                 [routerLink]="['/cooperant/demande-rachat']">
              <div class="w-12 h-12 bg-amber-100 rounded-full flex items-center justify-center mb-3 group-hover:bg-amber-200 transition">
                <svg class="w-6 h-6 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
                </svg>
              </div>
              <h4 class="font-semibold text-gray-800 text-sm">Rachat Loi 105</h4>
              <p class="text-xs text-gray-500 mt-1">Débits > 1 an · Taux 95%</p>
            </div>
          </div>
        </div>

        <!-- Détails du dossier -->
        <div class="bg-white rounded-xl shadow-lg p-6 mb-8" *ngIf="cooperant">
          <h3 class="text-lg font-bold text-gray-800 mb-4">Informations du dossier</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <p class="text-sm text-gray-500">Régime</p>
              <p class="font-medium">{{ cooperant.codeRegime === '500' ? 'Coopérant Général' : cooperant.codeRegime === '510' ? 'Coopérant Agricole Amélioré' : 'Régime Agricole' }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Email</p>
              <p class="font-medium">{{ cooperant.email }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Date de dépôt</p>
              <p class="font-medium">{{ cooperant.createdAt | date:'dd/MM/yyyy' }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Statut</p>
              <span class="px-3 py-1 rounded-full text-sm font-medium" [ngClass]="getStatutClass()">
                {{ getStatutLabel() }}
              </span>
            </div>
          </div>
        </div>

        <!-- AI Assistant Guide -->
        <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-8">
          <!-- Chat Header -->
          <div class="p-5 flex items-center justify-between" style="background: linear-gradient(135deg, #7C3AED, #EC4899);">
            <div class="flex items-center gap-3">
              <div class="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714a2.25 2.25 0 00.659 1.591L19 14.5M14.25 3.104c.251.023.501.05.75.082M19 14.5l-1.364 1.636a2.25 2.25 0 01-1.726.814H8.09a2.25 2.25 0 01-1.726-.814L5 14.5m14 0V19a2 2 0 01-2 2H7a2 2 0 01-2-2v-4.5"></path>
                </svg>
              </div>
              <div>
                <h3 class="text-white font-bold text-base">{{ chatTitle }}</h3>
                <p class="text-white/70 text-xs">{{ chatSubtitle }}</p>
              </div>
            </div>
            <div class="flex gap-1 bg-white/10 rounded-full p-1">
              <button (click)="switchLang('fr')" class="px-3 py-1 rounded-full text-xs font-bold transition"
                [ngClass]="chatLang === 'fr' ? 'bg-white text-purple-700' : 'text-white/80 hover:bg-white/20'">FR</button>
              <button (click)="switchLang('ar')" class="px-3 py-1 rounded-full text-xs font-bold transition"
                [ngClass]="chatLang === 'ar' ? 'bg-white text-purple-700' : 'text-white/80 hover:bg-white/20'">\u0639\u0631\u0628\u064a</button>
              <button (click)="switchLang('en')" class="px-3 py-1 rounded-full text-xs font-bold transition"
                [ngClass]="chatLang === 'en' ? 'bg-white text-purple-700' : 'text-white/80 hover:bg-white/20'">EN</button>
            </div>
          </div>

          <!-- Chat Messages -->
          <div class="bg-gray-50 p-4 max-h-80 overflow-y-auto" [attr.dir]="chatLang === 'ar' ? 'rtl' : 'ltr'" #chatContainer>
            <div *ngFor="let msg of chatMessages" class="mb-3" [ngClass]="msg.sender === 'user' ? 'text-right' : 'text-left'">
              <div class="inline-block max-w-[85%] px-4 py-2.5 rounded-2xl text-sm leading-relaxed whitespace-pre-line"
                   [ngClass]="msg.sender === 'user' ? 'bg-purple-600 text-white rounded-br-sm' : 'bg-white border border-gray-200 text-gray-800 rounded-bl-sm shadow-sm'">
                {{ msg.text }}
              </div>
            </div>
            <div *ngIf="chatLoading" class="text-left mb-3">
              <div class="inline-block px-4 py-3 bg-white border border-gray-200 rounded-2xl rounded-bl-sm shadow-sm">
                <div class="flex gap-1.5">
                  <div class="w-2 h-2 bg-purple-400 rounded-full animate-bounce"></div>
                  <div class="w-2 h-2 bg-purple-400 rounded-full animate-bounce" style="animation-delay: 150ms"></div>
                  <div class="w-2 h-2 bg-purple-400 rounded-full animate-bounce" style="animation-delay: 300ms"></div>
                </div>
              </div>
            </div>
          </div>

          <!-- Quick Questions -->
          <div class="px-4 pt-3 pb-2 flex flex-wrap gap-2" [attr.dir]="chatLang === 'ar' ? 'rtl' : 'ltr'">
            <button *ngFor="let q of quickQuestions" (click)="askQuestion(q.key)"
              class="px-3 py-1.5 bg-purple-50 text-purple-700 rounded-full text-xs font-medium hover:bg-purple-100 transition border border-purple-200">
              {{ q.label }}
            </button>
          </div>

          <!-- Input -->
          <div class="p-4 border-t border-gray-100 flex gap-2" [attr.dir]="chatLang === 'ar' ? 'rtl' : 'ltr'">
            <input [(ngModel)]="chatInput" (keydown.enter)="sendMessage()"
              [placeholder]="chatPlaceholder"
              class="flex-1 px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-400 focus:border-transparent text-sm outline-none" />
            <button (click)="sendMessage()" [disabled]="!chatInput.trim() || chatLoading"
              class="px-4 py-2.5 rounded-xl font-medium text-sm text-white transition disabled:opacity-50"
              style="background: linear-gradient(135deg, #7C3AED, #EC4899);">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
              </svg>
            </button>
          </div>
        </div>
      </main>
    </div>
  `
})
export class CooperantDashboardComponent implements OnInit {
  @ViewChild('chatContainer') chatContainer!: ElementRef;

  cooperant: Cooperant | null = null;
  dossierAtct: DossierATCT | null = null;
  username = '';
  loading = true;
  nbDemandes = 0;

  // AI Chatbot
  chatLang: 'fr' | 'ar' | 'en' = 'fr';
  chatMessages: { sender: 'user' | 'bot'; text: string }[] = [];
  chatInput = '';
  chatLoading = false;
  chatTitle = '';
  chatSubtitle = '';
  chatPlaceholder = '';
  quickQuestions: { key: string; label: string }[] = [];

  private readonly i18n: Record<string, Record<string, string>> = {
    fr: {
      title: 'Assistant IA - Guide Coopérant',
      subtitle: 'Je vous aide à utiliser la plateforme CNSS',
      placeholder: 'Posez votre question...',
      welcome: 'Bonjour ! Je suis votre assistant IA pour la plateforme CNSS Coopération Technique.\n\nJe peux vous aider à :\n• Comprendre votre dossier et son suivi\n• Connaître les démarches à effectuer\n• Vous guider sur les demandes (salaire, régime maladie, rachat...)\n\nComment puis-je vous aider ?',
    },
    ar: {
      title: 'المساعد الذكي - دليل المتعاون',
      subtitle: 'أساعدك في استخدام منصة الصندوق الوطني للضمان الاجتماعي',
      placeholder: 'اطرح سؤالك...',
      welcome: 'مرحبا! أنا مساعدك الذكي لمنصة التعاون الفني للصندوق الوطني للضمان الاجتماعي.\n\nيمكنني مساعدتك في:\n• فهم ملفك ومتابعته\n• معرفة الإجراءات المطلوبة\n• إرشادك حول الطلبات (الأجر، نظام المرض، الاسترداد...)\n\nكيف يمكنني مساعدتك؟',
    },
    en: {
      title: 'AI Assistant - Cooperant Guide',
      subtitle: 'I help you navigate the CNSS platform',
      placeholder: 'Ask your question...',
      welcome: 'Hello! I am your AI assistant for the CNSS Technical Cooperation platform.\n\nI can help you with:\n• Understanding your file and its status\n• Knowing the required procedures\n• Guiding you on requests (salary, health plan, buyback...)\n\nHow can I help you?',
    }
  };

  private readonly quickQuestionsData: Record<string, { key: string; label: string }[]> = {
    fr: [
      { key: 'dossier', label: '📁 Mon dossier' },
      { key: 'suivi', label: '📋 Suivi demande' },
      { key: 'salaire', label: '💰 Actualiser salaire' },
      { key: 'regime', label: '🏥 Régime maladie' },
      { key: 'rachat', label: '📊 Rachat Loi 105' },
      { key: 'documents', label: '📄 Documents requis' },
    ],
    ar: [
      { key: 'dossier', label: '📁 ملفي' },
      { key: 'suivi', label: '📋 متابعة الطلب' },
      { key: 'salaire', label: '💰 تحديث الأجر' },
      { key: 'regime', label: '🏥 نظام المرض' },
      { key: 'rachat', label: '📊 استرداد القانون 105' },
      { key: 'documents', label: '📄 الوثائق المطلوبة' },
    ],
    en: [
      { key: 'dossier', label: '📁 My file' },
      { key: 'suivi', label: '📋 Track request' },
      { key: 'salaire', label: '💰 Update salary' },
      { key: 'regime', label: '🏥 Health plan' },
      { key: 'rachat', label: '📊 Buyback Law 105' },
      { key: 'documents', label: '📄 Required documents' },
    ]
  };

  private readonly answers: Record<string, Record<string, string>> = {
    fr: {
      dossier: '📁 **Mon Dossier**\n\nPour consulter votre dossier ATCT :\n1. Cliquez sur la carte "Mon Dossier" en haut\n2. Vous verrez toutes vos informations personnelles\n3. Votre matricule, régime et statut y sont affichés\n\nSi votre dossier est "En attente", un agent CNSS doit encore le valider.',
      suivi: '📋 **Suivi de Demande**\n\nPour suivre l\'état de votre demande :\n1. Cliquez sur "Suivi Dossier"\n2. Vous verrez le statut actuel : En attente, Validé ou Rejeté\n3. Les dates importantes sont affichées\n\nStatuts possibles :\n• En attente - Votre dossier est en cours de traitement\n• Validé - Votre dossier a été approuvé\n• Rejeté - Des documents supplémentaires sont nécessaires',
      salaire: '💰 **Actualisation Salaire**\n\nPour mettre à jour votre salaire :\n1. Dans la section "Demandes", cliquez sur "Actualisation Salaire"\n2. Remplissez le formulaire avec votre nouveau salaire brut\n3. Joignez votre dernière attestation de salaire\n4. Soumettez la demande\n\nLa mise à jour affectera le calcul de vos cotisations trimestrielles.',
      regime: '🏥 **Régime Maladie**\n\nLe régime maladie couvre :\n• Les frais médicaux et hospitaliers\n• Le capital décès\n\nPour quitter le régime :\n1. Cliquez sur "Sortie Régime Maladie"\n2. Remplissez le formulaire de demande\n3. La sortie prend effet le trimestre suivant\n\nPour annuler l\'assurance : utilisez "Annulation Assurance".',
      rachat: '📊 **Rachat Loi 105**\n\nSi vous avez des débits (cotisations impayées) de plus d\'un an :\n• Vous pouvez bénéficier d\'une réduction de 95% sur les pénalités\n• Cliquez sur "Rachat Loi 105" dans la section Demandes\n• Le calcul se fait automatiquement\n\nConditions :\n• Débits > 1 an\n• Taux de réduction : 95%',
      documents: '📄 **Documents Requis**\n\nPour un dossier complet, vous devez fournir :\n1. Carte d\'Identité Nationale (CIN)\n2. Contrat de Coopérant\n3. Attestation de Salaire récente\n4. Décision d\'Affectation\n5. Attestation d\'Affiliation CNSS\n\nFormats acceptés : PDF, JPG, PNG\nTaille max : 10 Mo par document',
      default: 'Je comprends votre question. Voici comment naviguer sur la plateforme :\n\n• "Mon Dossier" : consultez vos informations personnelles\n• "Suivi Dossier" : suivez l\'état de votre demande\n• "Historique" : retrouvez vos demandes passées\n• Section "Demandes" : soumettez de nouvelles demandes\n\nN\'hésitez pas à poser une question plus précise !',
    },
    ar: {
      dossier: '📁 **ملفي**\n\nللاطلاع على ملف التعاون الفني :\n1. اضغط على بطاقة "ملفي" في الأعلى\n2. ستجد جميع معلوماتك الشخصية\n3. رقم التسجيل والنظام والحالة معروضة\n\nإذا كان ملفك "قيد الانتظار"، فإن موظف الصندوق لم يصادق عليه بعد.',
      suivi: '📋 **متابعة الطلب**\n\nلمتابعة حالة طلبك :\n1. اضغط على "متابعة الملف"\n2. ستجد الحالة الحالية : قيد الانتظار، مصادق عليه، أو مرفوض\n3. التواريخ المهمة معروضة\n\nالحالات الممكنة :\n• قيد الانتظار - ملفك قيد المعالجة\n• مصادق عليه - تمت الموافقة على ملفك\n• مرفوض - مطلوب وثائق إضافية',
      salaire: '💰 **تحديث الأجر**\n\nلتحديث أجرك :\n1. في قسم "الطلبات"، اضغط على "تحديث الأجر"\n2. املأ الاستمارة بأجرك الخام الجديد\n3. أرفق آخر شهادة أجر\n4. قدم الطلب\n\nالتحديث سيؤثر على حساب اشتراكاتك الفصلية.',
      regime: '🏥 **نظام المرض**\n\nيغطي نظام المرض :\n• المصاريف الطبية والاستشفائية\n• رأس مال الوفاة\n\nللخروج من النظام :\n1. اضغط على "الخروج من نظام المرض"\n2. املأ استمارة الطلب\n3. يدخل الخروج حيز التنفيذ في الفصل التالي\n\nلإلغاء التأمين : استخدم "إلغاء التأمين".',
      rachat: '📊 **استرداد القانون 105**\n\nإذا كانت لديك ديون (اشتراكات غير مسددة) لأكثر من سنة :\n• يمكنك الاستفادة من تخفيض 95% على الغرامات\n• اضغط على "استرداد القانون 105" في قسم الطلبات\n• يتم الحساب تلقائيا\n\nالشروط :\n• ديون > سنة\n• نسبة التخفيض : 95%',
      documents: '📄 **الوثائق المطلوبة**\n\nلملف كامل، يجب تقديم :\n1. بطاقة التعريف الوطنية\n2. عقد التعاون\n3. شهادة أجر حديثة\n4. مقرر الإلحاق\n5. شهادة الانخراط في الصندوق\n\nالصيغ المقبولة : PDF، JPG، PNG\nالحجم الأقصى : 10 ميغابايت لكل وثيقة',
      default: 'أفهم سؤالك. إليك كيفية التنقل في المنصة :\n\n• "ملفي" : اطلع على معلوماتك الشخصية\n• "متابعة الملف" : تابع حالة طلبك\n• "السجل" : اعثر على طلباتك السابقة\n• قسم "الطلبات" : قدم طلبات جديدة\n\nلا تتردد في طرح سؤال أكثر تحديدا !',
    },
    en: {
      dossier: '📁 **My File**\n\nTo view your ATCT file:\n1. Click the "My File" card at the top\n2. You will see all your personal information\n3. Your registration number, plan and status are displayed\n\nIf your file is "Pending", a CNSS agent still needs to validate it.',
      suivi: '📋 **Request Tracking**\n\nTo track your request status:\n1. Click on "Track File"\n2. You will see the current status: Pending, Approved or Rejected\n3. Important dates are displayed\n\nPossible statuses:\n• Pending - Your file is being processed\n• Approved - Your file has been approved\n• Rejected - Additional documents are needed',
      salaire: '💰 **Salary Update**\n\nTo update your salary:\n1. In the "Requests" section, click "Salary Update"\n2. Fill in the form with your new gross salary\n3. Attach your latest salary certificate\n4. Submit the request\n\nThe update will affect the calculation of your quarterly contributions.',
      regime: '🏥 **Health Plan**\n\nThe health plan covers:\n• Medical and hospital expenses\n• Death benefit\n\nTo leave the plan:\n1. Click "Leave Health Plan"\n2. Fill in the request form\n3. The exit takes effect the following quarter\n\nTo cancel insurance: use "Cancel Insurance".',
      rachat: '📊 **Buyback Law 105**\n\nIf you have debts (unpaid contributions) older than one year:\n• You can benefit from a 95% reduction on penalties\n• Click "Buyback Law 105" in the Requests section\n• The calculation is done automatically\n\nConditions:\n• Debts > 1 year\n• Reduction rate: 95%',
      documents: '📄 **Required Documents**\n\nFor a complete file, you must provide:\n1. National Identity Card (CIN)\n2. Cooperant Contract\n3. Recent Salary Certificate\n4. Assignment Decision\n5. CNSS Affiliation Certificate\n\nAccepted formats: PDF, JPG, PNG\nMax size: 10 MB per document',
      default: 'I understand your question. Here is how to navigate the platform:\n\n• "My File": view your personal information\n• "Track File": follow your request status\n• "History": find your past requests\n• "Requests" section: submit new requests\n\nFeel free to ask a more specific question!',
    }
  };

  constructor(
    private cooperantService: CooperantService,
    private authService: AuthService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    const user = this.authService.getCurrentUser();
    this.username = user?.username || '';
    this.loadMyDossier();
    this.loadDemandes();
    this.switchLang('fr');
  }

  loadMyDossier() {
    this.http.get<DossierATCT[]>('/api/atct').subscribe({
      next: (dossiers) => {
        this.dossierAtct = dossiers.find(d => d.email === this.username) || null;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement dossier ATCT:', err);
        this.cooperantService.getAll().subscribe({
          next: (cooperants) => {
            this.cooperant = cooperants.find(c => c.email === this.username) || null;
            this.loading = false;
          },
          error: () => this.loading = false
        });
      }
    });
  }

  loadDemandes() {
    this.cooperantService.getAll().subscribe({
      next: (cooperants) => {
        const coop = cooperants.find(c => c.email === this.username);
        if (coop?.id) {
          this.http.get<any[]>(`/api/demandes/cooperant/${coop.id}`).subscribe({
            next: (demandes) => this.nbDemandes = demandes.length,
            error: () => {}
          });
        }
      },
      error: () => {}
    });
  }

  // ============ AI Chatbot Methods ============

  switchLang(lang: 'fr' | 'ar' | 'en') {
    this.chatLang = lang;
    this.chatTitle = this.i18n[lang]['title'];
    this.chatSubtitle = this.i18n[lang]['subtitle'];
    this.chatPlaceholder = this.i18n[lang]['placeholder'];
    this.quickQuestions = this.quickQuestionsData[lang];
    this.chatMessages = [{ sender: 'bot', text: this.i18n[lang]['welcome'] }];
    this.chatInput = '';
  }

  askQuestion(key: string) {
    const label = this.quickQuestions.find(q => q.key === key)?.label || key;
    this.chatMessages.push({ sender: 'user', text: label });
    this.chatLoading = true;
    this.scrollChat();

    setTimeout(() => {
      const answer = this.answers[this.chatLang][key] || this.answers[this.chatLang]['default'];
      this.chatMessages.push({ sender: 'bot', text: answer });
      this.chatLoading = false;
      this.scrollChat();
    }, 600);
  }

  sendMessage() {
    const msg = this.chatInput.trim();
    if (!msg || this.chatLoading) return;

    this.chatMessages.push({ sender: 'user', text: msg });
    this.chatInput = '';
    this.chatLoading = true;
    this.scrollChat();

    setTimeout(() => {
      const answer = this.findBestAnswer(msg);
      this.chatMessages.push({ sender: 'bot', text: answer });
      this.chatLoading = false;
      this.scrollChat();
    }, 800);
  }

  private findBestAnswer(query: string): string {
    const q = query.toLowerCase();
    const lang = this.chatLang;

    const keywords: Record<string, string[]> = {
      dossier: ['dossier', 'file', 'ملف', 'mon dossier', 'my file', 'informations'],
      suivi: ['suivi', 'track', 'متابعة', 'statut', 'status', 'état', 'حالة', 'attente', 'valide'],
      salaire: ['salaire', 'salary', 'أجر', 'rémunération', 'paie', 'actualisation', 'update'],
      regime: ['regime', 'maladie', 'health', 'مرض', 'assurance', 'insurance', 'تأمين', 'médical'],
      rachat: ['rachat', 'buyback', 'استرداد', 'loi 105', 'law 105', 'débit', 'debt', 'pénalité', 'penalty'],
      documents: ['document', 'وثيقة', 'pièce', 'cin', 'contrat', 'attestation', 'fichier', 'upload'],
    };

    for (const [key, kws] of Object.entries(keywords)) {
      if (kws.some(kw => q.includes(kw))) {
        return this.answers[lang][key];
      }
    }

    return this.answers[lang]['default'];
  }

  private scrollChat() {
    setTimeout(() => {
      if (this.chatContainer?.nativeElement) {
        this.chatContainer.nativeElement.scrollTop = this.chatContainer.nativeElement.scrollHeight;
      }
    }, 50);
  }

  // ============ Dashboard Methods ============

  getStatutClass(): string {
    const statut = this.dossierAtct?.statut || this.cooperant?.statutValidation;
    switch (statut) {
      case 'VALIDE': return 'bg-green-100 text-green-800';
      case 'REJETE': return 'bg-red-100 text-red-800';
      default: return 'bg-yellow-100 text-yellow-800';
    }
  }

  getStatutLabel(): string {
    const statut = this.dossierAtct?.statut || this.cooperant?.statutValidation;
    switch (statut) {
      case 'VALIDE': return 'Validé';
      case 'REJETE': return 'Rejeté';
      case 'EN_ATTENTE': return 'En attente';
      default: return statut || 'En attente';
    }
  }

  getNom(): string {
    if (this.dossierAtct) {
      return `${this.dossierAtct.prenomFr} ${this.dossierAtct.nomFr}`;
    }
    if (this.cooperant) {
      return `${this.cooperant.prenomFr} ${this.cooperant.nomFr}`;
    }
    return '';
  }

  getMatricule(): string {
    return this.dossierAtct?.matriculeEmployeurComplet || this.cooperant?.matriculeComplet || '';
  }

  logout() {
    this.authService.logout();
  }
}
