import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, CreateCooperantRequest } from '../../../core/services/cooperant.service';
import { ArabicKeyboardComponent } from '../../../shared/components/arabic-keyboard/arabic-keyboard.component';

@Component({
  selector: 'app-cooperant-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent, ArabicKeyboardComponent],
  templateUrl: './cooperant-form.component.html',
  styles: []
})
export class CooperantFormComponent implements OnInit {
  form: FormGroup;
  loading = false;
  isEditMode = false;
  id: number | null = null;
  isPublicMode = false;
  successMessage = '';
  createdMatricule = '';
  createdEmail = '';

  dossierFile: File | null = null;
  identiteFile: File | null = null;
  
  // Clavier arabe
  @ViewChild('arabicKeyboard') arabicKeyboard!: ArabicKeyboardComponent;
  activeArabicField: string | null = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private cooperantService: CooperantService
  ) {
    this.form = this.fb.group({
      // FR
      nomFr: ['', Validators.required],
      prenomFr: ['', Validators.required],
      adresseFr: ['', Validators.required],
      codePostal: [''],
      localiteFr: [''],
      lieuNaissanceFr: [''],

      // AR
      nomAr: [''],
      prenomAr: [''],
      adresseAr: [''],
      localiteAr: [''],
      lieuNaissanceAr: [''],

      // Naissance
      dateNaissance: [''],

      // Contact
      telephone: [''],
      fax: [''],
      email: ['', Validators.email],

      // Identité
      typePieceIdentite: ['CIN', Validators.required],
      numPieceIdentite: ['', Validators.required],

      // Nationalité
      nationalite: ['Tunisienne'],

      // Régime
      codeRegime: ['500', Validators.required]
    });
  }

  ngOnInit(): void {
    // Détecter si on est en mode public (route /public/...)
    this.isPublicMode = this.router.url.startsWith('/public');
    
    const idParam = this.route.snapshot.paramMap.get('id');
    if (idParam) {
      this.isEditMode = true;
      this.id = parseInt(idParam, 10);
      this.load();
    }
  }

  load() {
    if (!this.id) return;
    this.loading = true;
    this.cooperantService.getById(this.id).subscribe({
      next: (c) => {
        this.form.patchValue({
          nomFr: c.nomFr,
          prenomFr: c.prenomFr,
          adresseFr: c.adresseFr,
          codePostal: c.codePostal,
          localiteFr: c.localiteFr,
          lieuNaissanceFr: c.lieuNaissanceFr,

          nomAr: c.nomAr,
          prenomAr: c.prenomAr,
          adresseAr: c.adresseAr,
          localiteAr: c.localiteAr,
          lieuNaissanceAr: c.lieuNaissanceAr,

          dateNaissance: c.dateNaissance,

          telephone: c.telephone,
          fax: c.fax,
          email: c.email,

          typePieceIdentite: c.typePieceIdentite,
          numPieceIdentite: c.numPieceIdentite,

          nationalite: c.nationalite,
          codeRegime: c.codeRegime
        });
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement:', err);
        this.loading = false;
      }
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

    const payload: CreateCooperantRequest = this.form.value;

    const finish = (id: number, matriculeComplet?: string, email?: string) => {
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
          if (this.isPublicMode) {
            this.createdMatricule = matriculeComplet || '';
            this.createdEmail = email || this.form.get('email')?.value || '';
            this.successMessage = 'Dossier déposé avec succès. Vos identifiants de connexion seront envoyés par email.';
          } else {
            this.router.navigate(['/cooperant']);
          }
        });
    };

    if (this.isEditMode && this.id) {
      this.cooperantService.update(this.id, payload).subscribe({
        next: (c) => finish(c.id as number),
        error: (err) => {
          console.error('Erreur mise à jour:', err);
          this.loading = false;
          alert('Erreur lors de la mise à jour');
        }
      });
    } else {
      this.cooperantService.create(payload).subscribe({
        next: (c) => finish(c.id as number, c.matriculeComplet, c.email),
        error: (err) => {
          console.error('Erreur création:', err);
          this.loading = false;
          alert('Erreur lors de la création');
        }
      });
    }
  }

  goToLogin(): void {
    this.router.navigate(['/auth/login']);
  }

  // Méthodes clavier arabe
  toggleArabicKeyboard(fieldName: string): void {
    if (this.activeArabicField === fieldName && this.arabicKeyboard?.isOpen) {
      this.arabicKeyboard.close();
      this.activeArabicField = null;
    } else {
      this.activeArabicField = fieldName;
      this.arabicKeyboard?.open();
    }
  }

  onArabicKeyPress(key: string): void {
    if (this.activeArabicField) {
      const currentValue = this.form.get(this.activeArabicField)?.value || '';
      this.form.get(this.activeArabicField)?.setValue(currentValue + key);
    }
  }

  onArabicBackspace(): void {
    if (this.activeArabicField) {
      const currentValue = this.form.get(this.activeArabicField)?.value || '';
      this.form.get(this.activeArabicField)?.setValue(currentValue.slice(0, -1));
    }
  }

  onArabicKeyboardClosed(): void {
    this.activeArabicField = null;
  }
}
