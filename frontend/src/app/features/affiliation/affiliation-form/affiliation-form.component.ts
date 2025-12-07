import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink, ActivatedRoute } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { AffiliationService } from '../../../core/services/affiliation.service';
import { PdfService } from '../../../core/services/pdf.service';
import { EmployerService, Employer } from '../../../core/services/employer.service';
import { I18nService } from '../../../core/services/i18n.service';

@Component({
  selector: 'app-affiliation-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './affiliation-form.component.html',
  styles: []
})
export class AffiliationFormComponent implements OnInit {
  affiliationForm: FormGroup;
  loading = false;
  showAttestationPrompt = false;
  createdAffiliation: any = null;
  employers: Employer[] = [];
  isEditMode = false;
  affiliationId: number | null = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private affiliationService: AffiliationService,
    private pdfService: PdfService,
    private employerService: EmployerService,
    public i18n: I18nService
  ) {
    this.affiliationForm = this.fb.group({
      employerId: ['', Validators.required],
      lastName: ['', Validators.required],
      firstName: ['', Validators.required],
      birthDate: ['', Validators.required],
      birthPlace: [''],
      nationality: ['', Validators.required],
      gender: ['', Validators.required],
      passportNumber: [''],
      socialSecurityNumber: [''],
      startDate: ['', Validators.required],
      endDate: [''],
      position: ['', Validators.required],
      contractType: ['CDI'],
      salary: ['', [Validators.required, Validators.min(0)]],
      address: [''],
      city: [''],
      country: [''],
      phone: [''],
      email: ['', Validators.email]
    });
  }

  ngOnInit() {
    this.loadEmployers();
    
    // Vérifier si on est en mode édition
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.affiliationId = +id;
      this.loadAffiliation(this.affiliationId);
    }
  }

  existingData: any = null;

  loadAffiliation(id: number) {
    this.loading = true;
    this.affiliationService.getByDcoId(id).subscribe({
      next: (data: any) => {
        console.log('Affiliation loaded:', data);
        this.existingData = data;
        
        // Mapper le code pays vers la nationalité
        const nationality = this.getNationalityFromCode(data.paysCode);
        
        this.affiliationForm.patchValue({
          employerId: `${data.empMat}-${data.empCle}`,
          lastName: data.assNom || '',
          firstName: data.assPrenom || '',
          birthDate: data.dateNaissance || '',
          birthPlace: data.lieuNaissance || '',
          nationality: nationality,
          gender: data.sexe || '',
          passportNumber: data.numPasseport || '',
          socialSecurityNumber: data.numSecuSociale || '',
          startDate: data.dcoDateDebut,
          endDate: data.dcoDateFin,
          position: data.poste || '',
          contractType: data.typeContrat || 'CDI',
          salary: data.dcoSalaire,
          address: data.adresse || '',
          city: data.ville || '',
          country: data.paysResidence || '',
          phone: data.telephone || '',
          email: data.email || ''
        });
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement affiliation:', err);
        this.loading = false;
      }
    });
  }

  getNationalityFromCode(code: number): string {
    const nationalities: { [key: number]: string } = {
      788: 'Tunisienne',
      250: 'Française',
      276: 'Allemande',
      380: 'Italienne',
      999: 'Autre'
    };
    return nationalities[code] || 'Autre';
  }

  loadEmployers() {
    this.employerService.getAll().subscribe({
      next: (data) => {
        this.employers = data.map(e => ({
          ...e,
          id: `${e.empMat}-${e.empCle}`
        }));
        console.log('Employers loaded:', this.employers);
      },
      error: (err) => console.error('Erreur chargement employeurs:', err)
    });
  }

  onSubmit() {
    if (this.affiliationForm.valid) {
      this.loading = true;
      const formData = this.affiliationForm.value;
      console.log('Form data:', formData);
      
      // Trouver l'employeur sélectionné par l'ID composé
      const employer = this.employers.find(e => e.id === formData.employerId);
      console.log('Selected employer:', employer);
      
      if (this.isEditMode && this.existingData) {
        // Mode édition - mettre à jour l'affiliation existante
        const updateData = {
          ...this.existingData,
          empMat: employer?.empMat || this.existingData.empMat,
          empCle: employer?.empCle || this.existingData.empCle,
          dcoDateDebut: formData.startDate,
          assNom: formData.lastName,
          assPrenom: formData.firstName,
          dateNaissance: formData.birthDate || null,
          lieuNaissance: formData.birthPlace || null,
          sexe: formData.gender || null,
          numPasseport: formData.passportNumber || null,
          numSecuSociale: formData.socialSecurityNumber || null,
          poste: formData.position || null,
          typeContrat: formData.contractType || 'CDI',
          paysCode: this.getCountryCode(formData.nationality),
          dcoDateFin: formData.endDate || null,
          dcoSalaire: parseFloat(formData.salary) || 0,
          adresse: formData.address || null,
          ville: formData.city || null,
          paysResidence: formData.country || null,
          telephone: formData.phone || null,
          email: formData.email || null
        };
        
        this.affiliationService.updateById(this.affiliationId!, updateData).subscribe({
          next: (result) => {
            console.log('Affiliation updated:', result);
            this.loading = false;
            alert('Affiliation modifiée avec succès !');
            this.router.navigate(['/affiliation']);
          },
          error: (err) => {
            console.error('Erreur modification affiliation:', err);
            this.loading = false;
            alert('Erreur lors de la modification de l\'affiliation');
          }
        });
      } else {
        // Mode création
        const numAff = Math.floor(Math.random() * 900000 + 100000);
        const cleAff = Math.floor(Math.random() * 90 + 10);
        
        const affiliationData = {
          empMat: employer?.empMat || 500380,
          empCle: employer?.empCle || 54,
          dcoDateDebut: formData.startDate,
          assureMat: Math.floor(Math.random() * 9000000 + 1000000),
          assureCle: Math.floor(Math.random() * 90 + 10),
          assNom: formData.lastName,
          assPrenom: formData.firstName,
          dateNaissance: formData.birthDate || null,
          lieuNaissance: formData.birthPlace || null,
          sexe: formData.gender || null,
          numPasseport: formData.passportNumber || null,
          numSecuSociale: formData.socialSecurityNumber || null,
          poste: formData.position || null,
          typeContrat: formData.contractType || 'CDI',
          paysCode: this.getCountryCode(formData.nationality),
          dcoDateFin: formData.endDate || null,
          dcoSalaire: parseFloat(formData.salary) || 0,
          dcoNumAffiliation: numAff,
          dcoClefAffiliation: cleAff,
          dcoSalaireId: 'V',
          adresse: formData.address || null,
          ville: formData.city || null,
          paysResidence: formData.country || null,
          telephone: formData.phone || null,
          email: formData.email || null
        };
        
        this.affiliationService.create(affiliationData).subscribe({
          next: (result) => {
            console.log('Affiliation created:', result);
            this.loading = false;
            this.createdAffiliation = {
              numAffiliation: `${cleAff}-${numAff}`,
              fullName: `${formData.lastName} ${formData.firstName}`,
              dateEffet: formData.startDate,
              regime: '500',
              address: `${formData.address || ''}, ${formData.city || ''}, ${formData.country || ''}`
            };
            this.showAttestationPrompt = true;
          },
          error: (err) => {
            console.error('Erreur création affiliation:', err);
            this.loading = false;
            alert('Erreur lors de la création de l\'affiliation');
          }
        });
      }
    }
  }

  getCountryCode(nationality: string): number {
    const codes: { [key: string]: number } = {
      'Tunisienne': 788,
      'Française': 250,
      'Allemande': 276,
      'Italienne': 380,
      'Autre': 999
    };
    return codes[nationality] || 999;
  }

  generateAffiliationNumber(): string {
    const prefix = Math.floor(Math.random() * 90 + 10);
    const number = Math.floor(Math.random() * 900000 + 100000);
    return `${prefix}-${number}`;
  }

  generateAttestation() {
    if (this.createdAffiliation) {
      this.pdfService.generateAffiliationAttestation({
        affiliationNumber: this.createdAffiliation.numAffiliation,
        employerName: this.createdAffiliation.matricule,
        employerNumber: this.createdAffiliation.matricule,
        employeeName: this.createdAffiliation.fullName,
        startDate: this.createdAffiliation.dateEffet,
        regime: this.createdAffiliation.regime,
        address: this.createdAffiliation.address
      });
    }
    this.router.navigate(['/affiliation']);
  }

  skipAttestation() {
    this.router.navigate(['/affiliation']);
  }
}
