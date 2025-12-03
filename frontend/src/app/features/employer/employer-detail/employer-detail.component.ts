import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-employer-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">Détails Employeur</h1>
        <p>Composant en développement...</p>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class EmployerDetailComponent {}
