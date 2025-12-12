import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, ActivatedRoute, Router } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService, Employer } from '../../../core/services/employer.service';

@Component({
  selector: 'app-employer-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="fade-in">
        <div class="flex justify-between items-center mb-8">
          <h1 class="text-3xl font-bold text-cnss-dark">Détails Employeur</h1>
          <div class="flex gap-2">
            <a [routerLink]="['/employer/edit', employer.empMat + '-' + employer.empCle]" 
               class="btn-secondary flex items-center gap-2" *ngIf="employer">
              <span class="material-icons text-sm">edit</span> Modifier
            </a>
            <a routerLink="/cooperant" class="btn-outline">← Retour</a>
          </div>
        </div>

        <div *ngIf="loading" class="text-center py-8">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-cnss-primary mx-auto"></div>
          <p class="mt-4 text-gray-600">Chargement...</p>
        </div>

        <div *ngIf="error" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
          {{ error }}
        </div>

        <div *ngIf="employer && !loading" class="bg-white rounded-xl shadow-lg p-6">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="space-y-4">
              <div>
                <label class="text-sm text-gray-500">Numéro Matricule</label>
                <p class="text-lg font-semibold">{{ employer.empMat }}-{{ employer.empCle }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Nom Commercial</label>
                <p class="text-lg">{{ employer.nomCommercial }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Raison Sociale</label>
                <p class="text-lg">{{ employer.raisonSociale || '-' }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Régime</label>
                <span class="px-3 py-1 rounded-full text-sm" 
                      [class]="employer.regime === '500' ? 'bg-blue-100 text-blue-800' : 'bg-purple-100 text-purple-800'">
                  Régime {{ employer.regime }}
                </span>
              </div>
            </div>
            <div class="space-y-4">
              <div>
                <label class="text-sm text-gray-500">Pays</label>
                <p class="text-lg">{{ employer.pays }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Adresse</label>
                <p class="text-lg">{{ employer.adresse || '-' }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Téléphone</label>
                <p class="text-lg">{{ employer.telephone || '-' }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Email</label>
                <p class="text-lg">{{ employer.email || '-' }}</p>
              </div>
              <div>
                <label class="text-sm text-gray-500">Statut</label>
                <span class="px-3 py-1 rounded-full text-sm"
                      [class]="employer.statut === 'Actif' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'">
                  {{ employer.statut }}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: [`
    .btn-secondary { @apply bg-cnss-secondary text-white px-4 py-2 rounded-lg hover:bg-opacity-90; }
    .btn-outline { @apply border border-gray-300 px-4 py-2 rounded-lg hover:bg-gray-50; }
  `]
})
export class EmployerDetailComponent implements OnInit {
  employer: Employer | null = null;
  loading = true;
  error: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private employerService: EmployerService
  ) {}

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      const parts = id.split('-');
      if (parts.length >= 2) {
        const empMat = parseInt(parts[0]);
        const empCle = parseInt(parts[1]);
        this.loadEmployer(empMat, empCle);
      }
    }
  }

  loadEmployer(empMat: number, empCle: number) {
    this.employerService.getById(empMat, empCle).subscribe({
      next: (data) => {
        this.employer = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur:', err);
        this.error = 'Employeur non trouvé';
        this.loading = false;
      }
    });
  }
}
