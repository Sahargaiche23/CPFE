import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-salary-converter',
  standalone: true,
  imports: [CommonModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">Conversion de Salaire</h1>
        <div class="card">
          <p class="text-gray-600">Convertisseur de salaire en cours de développement...</p>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class SalaryConverterComponent {}
