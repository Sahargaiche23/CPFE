import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-affiliation-form',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">Nouvelle Affiliation</h1>
        <div class="card">
          <p class="text-gray-600">Formulaire d'affiliation en cours de développement...</p>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class AffiliationFormComponent {}
