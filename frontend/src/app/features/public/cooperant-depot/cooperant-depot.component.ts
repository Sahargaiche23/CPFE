import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { CooperantService, CreateCooperantRequest } from '../../../core/services/cooperant.service';

@Component({
  selector: 'app-cooperant-depot',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterModule],
  templateUrl: './cooperant-depot.component.html'
})
export class CooperantDepotComponent {
  form: FormGroup;
  loading = false;
  successMessage = '';
  createdMatricule = '';

  dossierFile: File | null = null;
  identiteFile: File | null = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private cooperantService: CooperantService
  ) {
    this.form = this.fb.group({
      nomFr: ['', Validators.required],
      prenomFr: ['', Validators.required],
      adresseFr: ['', Validators.required],
      codePostal: [''],
      localiteFr: [''],
      lieuNaissanceFr: [''],

      nomAr: [''],
      prenomAr: [''],
      adresseAr: [''],
      localiteAr: [''],
      lieuNaissanceAr: [''],

      dateNaissance: [''],

      telephone: [''],
      fax: [''],
      email: ['', [Validators.required, Validators.email]],

      typePieceIdentite: ['CIN', Validators.required],
      numPieceIdentite: ['', Validators.required],

      nationalite: ['Tunisienne'],
      codeRegime: ['500', Validators.required]
    });
  }

  onFileChange(evt: Event, kind: 'dossier' | 'identite') {
    const input = evt.target as HTMLInputElement;
    if (!input.files || input.files.length === 0) return;
    const f = input.files[0];
    if (kind === 'dossier') this.dossierFile = f;
    if (kind === 'identite') this.identiteFile = f;
  }

  onSubmit() {
    if (this.form.invalid) return;

    this.loading = true;
    this.successMessage = '';

    const payload: CreateCooperantRequest = this.form.value;

    const finish = (id: number, matriculeComplet?: string) => {
      const uploads: Array<Promise<any>> = [];
      if (this.dossierFile) {
        uploads.push(this.cooperantService.uploadFile(id, this.dossierFile, 'dossier').toPromise());
      }
      if (this.identiteFile) {
        uploads.push(this.cooperantService.uploadFile(id, this.identiteFile, 'identite').toPromise());
      }

      Promise.allSettled(uploads)
        .finally(() => {
          this.loading = false;
          this.createdMatricule = matriculeComplet || '';
          this.successMessage = 'Dossier déposé avec succès. Vos identifiants de connexion seront envoyés par email.';
        });
    };

    this.cooperantService.create(payload).subscribe({
      next: (c) => finish(c.id as number, c.matriculeComplet),
      error: (err) => {
        console.error('Erreur dépôt:', err);
        this.loading = false;
        alert('Erreur lors du dépôt du dossier');
      }
    });
  }

  goToLogin(): void {
    this.router.navigate(['/auth/login']);
  }
}
