import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink, ActivatedRoute } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService } from '../../../core/services/employer.service';
import { I18nService } from '../../../core/services/i18n.service';

@Component({
  selector: 'app-employer-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './employer-form.component.html',
  styles: []
})
export class EmployerFormComponent implements OnInit {
  employerForm: FormGroup;
  loading = false;
  isEditMode = false;
  empMat: number | null = null;
  empCle: number | null = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private employerService: EmployerService,
    public i18n: I18nService
  ) {
    this.employerForm = this.fb.group({
      regime: ['500', Validators.required],
      raisonSociale: ['', Validators.required],
      nomCommercial: ['', Validators.required],
      pays: ['France', Validators.required],
      legalForm: [''],
      adresse: ['', Validators.required],
      postalCode: [''],
      city: [''],
      telephone: [''],
      email: ['', Validators.email],
      taxId: [''],
      creationDate: ['']
    });
  }

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    if (id && id !== 'new') {
      this.isEditMode = true;
      const parts = id.split('-');
      if (parts.length === 2) {
        this.empMat = parseInt(parts[0]);
        this.empCle = parseInt(parts[1]);
        this.loadEmployer();
      }
    }
  }

  loadEmployer() {
    if (this.empMat && this.empCle) {
      this.employerService.getById(this.empMat, this.empCle).subscribe({
        next: (employer) => {
          this.employerForm.patchValue({
            regime: employer.regime,
            raisonSociale: employer.raisonSociale,
            nomCommercial: employer.nomCommercial,
            pays: employer.pays,
            adresse: employer.adresse,
            telephone: employer.telephone,
            email: employer.email
          });
        },
        error: (err) => console.error('Erreur chargement:', err)
      });
    }
  }

  onSubmit() {
    if (this.employerForm.valid) {
      this.loading = true;
      const data = this.employerForm.value;
      
      if (this.isEditMode && this.empMat && this.empCle) {
        this.employerService.update(this.empMat, this.empCle, data).subscribe({
          next: () => {
            this.loading = false;
            this.router.navigate(['/employer']);
          },
          error: (err) => {
            console.error('Erreur mise à jour:', err);
            this.loading = false;
            alert('Erreur lors de la mise à jour');
          }
        });
      } else {
        this.employerService.create(data).subscribe({
          next: (result) => {
            console.log('Employer created:', result);
            this.loading = false;
            this.router.navigate(['/employer']);
          },
          error: (err) => {
            console.error('Erreur création:', err);
            this.loading = false;
            alert('Erreur lors de la création');
          }
        });
      }
    }
  }
}
