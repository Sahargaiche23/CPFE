import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-reclamations',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="min-h-screen bg-gradient-to-br from-teal-700 via-teal-600 to-green-500">
      <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex items-center gap-4">
          <img src="https://www.cnss.tn/html/themes/images/logo.png" alt="CNSS" class="h-12" />
          <a routerLink="/cooperant/espace" class="text-teal-600 hover:text-teal-800">← Retour</a>
        </div>
      </header>

      <main class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6">Réclamations</h2>
          
          <!-- Formulaire de réclamation -->
          <div *ngIf="!submitted" class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Objet de la réclamation *</label>
              <select [(ngModel)]="reclamation.objet" class="w-full border rounded-lg px-4 py-2">
                <option value="">-- Sélectionner --</option>
                <option value="dossier">Problème avec mon dossier</option>
                <option value="validation">Délai de validation</option>
                <option value="documents">Documents manquants</option>
                <option value="correction">Demande de correction</option>
                <option value="autre">Autre</option>
              </select>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Description *</label>
              <textarea [(ngModel)]="reclamation.description" rows="5" 
                        class="w-full border rounded-lg px-4 py-2"
                        placeholder="Décrivez votre réclamation en détail..."></textarea>
            </div>

            <button (click)="submit()" 
                    [disabled]="!reclamation.objet || !reclamation.description"
                    class="w-full bg-teal-600 text-white py-3 rounded-lg font-semibold hover:bg-teal-700 disabled:bg-gray-300 disabled:cursor-not-allowed">
              Envoyer la réclamation
            </button>
          </div>

          <!-- Message de succès -->
          <div *ngIf="submitted" class="text-center py-8">
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-2">Réclamation envoyée !</h3>
            <p class="text-gray-600 mb-4">Votre réclamation a été enregistrée. Nous vous répondrons dans les plus brefs délais.</p>
            <button (click)="reset()" class="text-teal-600 hover:underline">Soumettre une autre réclamation</button>
          </div>

          <!-- Historique -->
          <div class="mt-8 border-t pt-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4">Historique des réclamations</h3>
            <div class="text-center py-4 text-gray-500">
              <p>Aucune réclamation précédente</p>
            </div>
          </div>
        </div>
      </main>
    </div>
  `
})
export class ReclamationsComponent {
  reclamation = { objet: '', description: '' };
  submitted = false;

  submit() {
    // TODO: Envoyer la réclamation au backend
    console.log('Réclamation:', this.reclamation);
    this.submitted = true;
  }

  reset() {
    this.reclamation = { objet: '', description: '' };
    this.submitted = false;
  }
}
