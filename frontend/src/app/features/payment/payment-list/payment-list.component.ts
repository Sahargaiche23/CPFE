import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-payment-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-8">
          <h1 class="text-3xl font-bold text-cnss-dark">Gestion des Paiements</h1>
          <a routerLink="/payment/new" class="btn-primary">
            <span class="material-icons mr-2">add</span>
            Nouveau Paiement
          </a>
        </div>
        <div class="card">
          <p class="text-gray-600">Liste des paiements en cours de développement...</p>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class PaymentListComponent {}
