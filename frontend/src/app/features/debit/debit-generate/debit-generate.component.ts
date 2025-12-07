import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink, ActivatedRoute } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { EmployerService, Employer } from '../../../core/services/employer.service';
import { DebitService } from '../../../core/services/debit.service';
import { I18nService } from '../../../core/services/i18n.service';

@Component({
  selector: 'app-debit-generate',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './debit-generate.component.html',
  styles: []
})
export class DebitGenerateComponent implements OnInit {
  debitForm: FormGroup;
  loading = false;
  employers: Employer[] = [];
  isEditMode = false;
  debitId: number | null = null;
  existingData: any = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private employerService: EmployerService,
    private debitService: DebitService,
    public i18n: I18nService
  ) {
    this.debitForm = this.fb.group({
      employerId: ['', Validators.required],
      quarter: ['Q1', Validators.required],
      year: [2024, [Validators.required, Validators.min(2020)]],
      montant: [0]
    });
  }

  ngOnInit() {
    this.loadEmployers();
    
    // Vérifier si on est en mode édition
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.debitId = +id;
      this.loadDebit(this.debitId);
    }
  }

  loadDebit(id: number) {
    this.loading = true;
    this.debitService.getById(id).subscribe({
      next: (data: any) => {
        console.log('Debit loaded:', data);
        this.existingData = data;
        
        // Extraire le trimestre du format "T1-2024" ou du champ enoNumEng
        let quarter = 'Q1';
        if (data.trimestre) {
          const match = data.trimestre.match(/T(\d)/);
          if (match) quarter = `Q${match[1]}`;
        } else if (data.enoNumEng) {
          quarter = `Q${data.enoNumEng}`;
        }
        
        // Trouver l'ID de l'employeur
        const employerId = this.employers.find(e => 
          e.empMat === data.empMat && e.empCle === data.empCle
        )?.id || `${data.empMat}-${data.empCle}`;
        
        this.debitForm.patchValue({
          employerId: employerId,
          quarter: quarter,
          year: data.annee || new Date().getFullYear(),
          montant: data.enoMontantEcheance || data.montantCotisation || 0
        });
        this.loading = false;
      },
      error: (err: any) => {
        console.error('Erreur chargement débit:', err);
        this.loading = false;
      }
    });
  }

  loadEmployers() {
    this.employerService.getAll().subscribe({
      next: (data) => {
        this.employers = data;
      },
      error: (err) => console.error('Erreur chargement employeurs:', err)
    });
  }

  onSubmit() {
    if (this.debitForm.valid) {
      this.loading = true;
      const formData = this.debitForm.value;
      
      // Trouver l'employeur sélectionné
      const employer = this.employers.find(e => e.id === formData.employerId);
      
      const quarterMap: { [key: string]: number } = { 'Q1': 1, 'Q2': 2, 'Q3': 3, 'Q4': 4 };
      
      if (this.isEditMode && this.debitId && this.existingData) {
        // Mode édition
        const updateData = {
          ...this.existingData,
          empMat: employer?.empMat || this.existingData.empMat,
          empCle: employer?.empCle || this.existingData.empCle,
          enoNumEng: quarterMap[formData.quarter] || 1,
          enoMontantEcheance: parseFloat(formData.montant) || this.existingData.enoMontantEcheance
        };
        
        this.debitService.update(this.debitId, updateData).subscribe({
          next: () => {
            this.loading = false;
            alert('Débit modifié avec succès !');
            this.router.navigate(['/debit']);
          },
          error: (err: any) => {
            console.error('Erreur modification débit:', err);
            this.loading = false;
            alert('Erreur lors de la modification du débit');
          }
        });
      } else {
        // Mode création
        const debitData = {
          empMat: employer?.empMat || 0,
          empCle: employer?.empCle || 0,
          trimestre: quarterMap[formData.quarter] || 1,
          annee: formData.year
        };
        
        this.debitService.generate(debitData).subscribe({
          next: () => {
            this.loading = false;
            this.router.navigate(['/debit']);
          },
          error: (err: any) => {
            console.error('Erreur génération débit:', err);
            this.loading = false;
            alert('Erreur lors de la génération du débit');
          }
        });
      }
    }
  }
}
