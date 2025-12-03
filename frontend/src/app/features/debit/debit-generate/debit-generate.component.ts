import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-debit-generate',
  standalone: true,
  imports: [CommonModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">Générer un Débit Trimestriel</h1>
        <div class="card">
          <p class="text-gray-600">Générateur de débit en cours de développement...</p>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class DebitGenerateComponent {}
