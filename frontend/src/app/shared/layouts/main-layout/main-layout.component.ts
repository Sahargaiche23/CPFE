import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from '../../components/header/header.component';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [CommonModule, HeaderComponent],
  template: `
    <div class="min-h-screen flex flex-col bg-gray-50">
      <app-header></app-header>
      <main class="flex-1 container mx-auto px-4 py-8">
        <ng-content></ng-content>
      </main>
      <footer class="bg-cnss-dark text-white py-6 mt-auto">
        <div class="container mx-auto px-4 text-center">
          <p>&copy;  CNSS - Caisse Nationale de Sécurité Sociale</p>
          <p class="text-sm mt-2 text-gray-400">Système de Gestion de la Coopération Technique</p>
        </div>
      </footer>
    </div>
  `,
  styles: []
})
export class MainLayoutComponent {}
