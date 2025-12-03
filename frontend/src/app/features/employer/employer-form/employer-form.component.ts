import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService } from '../../../core/services/employer.service';

@Component({
  selector: 'app-employer-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MainLayoutComponent],
  template: `
    <app-main-layout>
      <div class="max-w-3xl mx-auto fade-in">
        <h1 class="text-3xl font-bold text-cnss-dark mb-8">Nouvel Employeur</h1>
        
        <div class="card">
          <form [formGroup]="employerForm" (ngSubmit)="onSubmit()">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div class="form-field md:col-span-2">
                <label class="form-label">Raison Sociale</label>
                <input type="text" formControlName="raisonSociale" class="form-input" />
              </div>

              <div class="form-field">
                <label class="form-label">Email</label>
                <input type="email" formControlName="email" class="form-input" />
              </div>

              <div class="form-field">
                <label class="form-label">Téléphone</label>
                <input type="tel" formControlName="tel" class="form-input" />
              </div>

              <div class="form-field md:col-span-2">
                <label class="form-label">Adresse</label>
                <textarea formControlName="adresse" class="form-input" rows="3"></textarea>
              </div>

              <div class="form-field">
                <label class="form-label">Régime</label>
                <select formControlName="regimeCode" class="form-input">
                  <option value="">Sélectionner un régime</option>
                  <option value="500">Régime 500</option>
                  <option value="510">Régime 510</option>
                </select>
              </div>
            </div>

            <div class="flex justify-end space-x-4 mt-8">
              <button type="button" (click)="cancel()" class="btn-outline">
                Annuler
              </button>
              <button type="submit" [disabled]="employerForm.invalid || loading" class="btn-primary">
                {{ loading ? 'Enregistrement...' : 'Enregistrer' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </app-main-layout>
  `,
  styles: []
})
export class EmployerFormComponent {
  employerForm: FormGroup;
  loading = false;

  constructor(
    private fb: FormBuilder,
    private employerService: EmployerService,
    private router: Router
  ) {
    this.employerForm = this.fb.group({
      raisonSociale: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      tel: ['', Validators.required],
      adresse: ['', Validators.required],
      regimeCode: ['', Validators.required]
    });
  }

  onSubmit() {
    if (this.employerForm.invalid) return;

    this.loading = true;
    this.employerService.create(this.employerForm.value).subscribe({
      next: () => {
        this.router.navigate(['/employer']);
      },
      error: () => {
        this.loading = false;
      }
    });
  }

  cancel() {
    this.router.navigate(['/employer']);
  }
}
