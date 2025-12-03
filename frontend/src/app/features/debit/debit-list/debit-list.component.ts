import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-debit-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-8">
          <h1 class="text-3xl font-bold text-cnss-dark">Gestion des Débits</h1>
          <a routerLink="/debit/generate" class="btn-primary">
            <span class="material-icons mr-2">add</span>
            Générer Débit
          </a>
        </div>
        <div class="card">
          <p class="text-gray-600">Liste des débits en cours de développement...</p>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class DebitListComponent {}
