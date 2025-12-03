import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService, Employer } from '../../../core/services/employer.service';

@Component({
  selector: 'app-employer-list',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-8">
          <h1 class="text-3xl font-bold text-cnss-dark">Gestion des Employeurs</h1>
          <a routerLink="/employer/new" class="btn-primary">
            <span class="material-icons mr-2">add</span>
            Nouvel Employeur
          </a>
        </div>

        <div class="card">
          <div class="table-container">
            <table class="data-table">
              <thead>
                <tr>
                  <th>N° Employeur</th>
                  <th>Raison Sociale</th>
                  <th>Email</th>
                  <th>Téléphone</th>
                  <th>Régime</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let employer of employers">
                  <td class="font-semibold text-cnss-primary">{{ employer.numeroEmployeur }}</td>
                  <td>{{ employer.raisonSociale }}</td>
                  <td>{{ employer.email }}</td>
                  <td>{{ employer.tel }}</td>
                  <td><span class="badge badge-info">{{ employer.regimeCode }}</span></td>
                  <td><span class="badge badge-success">{{ employer.status }}</span></td>
                  <td>
                    <a [routerLink]="['/employer', employer.id]" class="text-cnss-primary hover:underline">
                      Détails
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class EmployerListComponent implements OnInit {
  employers: Employer[] = [];

  constructor(private employerService: EmployerService) {}

  ngOnInit() {
    this.loadEmployers();
  }

  loadEmployers() {
    this.employerService.getAll().subscribe(employers => {
      this.employers = employers;
    });
  }
}
