import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, FormsModule } from '@angular/forms';
import { Router, RouterLink, ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { DebitService } from '../../../core/services/debit.service';
import { RegimeService, RegimeCotisation } from '../../../core/services/regime.service';
import { I18nService } from '../../../core/services/i18n.service';
import { PdfService } from '../../../core/services/pdf.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'app-debit-generate',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, FormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './debit-generate.component.html',
  styles: []
})
export class DebitGenerateComponent implements OnInit {
  debitForm: FormGroup;
  loading = false;
  cooperants: Cooperant[] = [];
  regimes: RegimeCotisation[] = [];
  cotisations: { regime: RegimeCotisation; base: number; montant: number; selected: boolean }[] = [];
  totalCotisation = 0;
  isEditMode = false;
  debitId: number | null = null;
  existingData: any = null;
  selectedCooperant: Cooperant | null = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    private cooperantService: CooperantService,
    private debitService: DebitService,
    private regimeService: RegimeService,
    public i18n: I18nService,
    private pdfService: PdfService
  ) {
    const currentYear = new Date().getFullYear();
    const currentQuarter = Math.ceil((new Date().getMonth() + 1) / 3);
    
    this.debitForm = this.fb.group({
      periode: ['en_cours'],
      cooperantId: ['', Validators.required],
      numAffiliation: [''],
      dateDebut: [''],
      quarter: [`Q${currentQuarter}`, Validators.required],
      year: [currentYear, [Validators.required, Validators.min(2020)]],
      montant: [0]
    });
  }

  ngOnInit() {
    this.loadRegimes();
    
    // Charger les coopérants puis vérifier le mode édition
    this.cooperantService.getAll().subscribe({
      next: (data) => {
        this.cooperants = data.filter(c => c.numAffiliation);
        
        // Vérifier si on est en mode édition après le chargement des coopérants
        const id = this.route.snapshot.paramMap.get('id');
        if (id) {
          this.isEditMode = true;
          this.debitId = +id;
          this.loadDebit(this.debitId);
        }
      },
      error: (err) => console.error('Erreur chargement coopérants:', err)
    });
    
    // Mettre à jour le N° affiliation quand on change de coopérant
    this.debitForm.get('cooperantId')?.valueChanges.subscribe(id => {
      this.onCooperantChange(id);
    });
  }

  loadRegimes() {
    this.regimeService.getAll().subscribe({
      next: (data) => {
        this.regimes = data;
        this.calculateCotisations();
      },
      error: (err) => {
        console.error('Erreur chargement régimes:', err);
        // Initialiser les régimes par défaut si aucun n'existe
        this.regimeService.initDefaultRegimes().subscribe({
          next: () => this.loadRegimes()
        });
      }
    });
  }

  calculateCotisations() {
    if (!this.selectedCooperant || this.regimes.length === 0) {
      this.cotisations = [];
      this.totalCotisation = 0;
      return;
    }

    const salaire = this.selectedCooperant.salaire || 0;
    this.cotisations = this.regimes.map(regime => {
      const base = salaire * regime.coefficientBase;
      const montant = base * (regime.taux / 100);
      return { regime, base, montant, selected: true };
    });
    this.updateTotalCotisation();
  }

  onRegimeSelectionChange() {
    this.updateTotalCotisation();
  }

  updateTotalCotisation() {
    this.totalCotisation = this.cotisations
      .filter(c => c.selected)
      .reduce((sum, c) => sum + c.montant, 0);
  }
  
  onCooperantChange(cooperantId: any) {
    const id = Number(cooperantId);
    this.selectedCooperant = this.cooperants.find(c => c.id === id) || null;
    if (this.selectedCooperant) {
      const numAff = this.selectedCooperant.cleAffiliation && this.selectedCooperant.numAffiliation
        ? `${this.selectedCooperant.cleAffiliation}-${this.selectedCooperant.numAffiliation}`
        : this.selectedCooperant.numAffiliation || '';
      this.debitForm.patchValue({
        numAffiliation: numAff,
        dateDebut: this.selectedCooperant.dateEffetAffiliation || ''
      });
      // Recalculer les cotisations avec le nouveau salaire
      this.calculateCotisations();
    }
  }

  onPeriodeChange(periode: string) {
    if (periode === 'toutes') {
      // En mode "Toutes", on désactive la validation du trimestre
      this.debitForm.get('quarter')?.clearValidators();
      this.debitForm.get('year')?.clearValidators();
    } else {
      // En mode "En cours", on remet les validateurs
      this.debitForm.get('quarter')?.setValidators(Validators.required);
      this.debitForm.get('year')?.setValidators([Validators.required, Validators.min(2020)]);
    }
    this.debitForm.get('quarter')?.updateValueAndValidity();
    this.debitForm.get('year')?.updateValueAndValidity();
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
        
        // Trouver le coopérant et le définir comme sélectionné
        const cooperant = this.cooperants.find((c: Cooperant) => 
          c.numAffiliation === data.numAffiliation
        );
        
        if (cooperant) {
          this.selectedCooperant = cooperant;
          // Recalculer les cotisations pour l'affichage
          this.calculateCotisations();
        }
        
        this.debitForm.patchValue({
          cooperantId: cooperant?.id || '',
          numAffiliation: data.numAffiliation || '',
          dateDebut: data.dateDebut || data.dateEffet || '',
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


  onSubmit() {
    if (this.debitForm.valid && this.selectedCooperant) {
      this.loading = true;
      const formData = this.debitForm.value;
      const quarterMap: { [key: string]: number } = { 'Q1': 1, 'Q2': 2, 'Q3': 3, 'Q4': 4 };
      const trimestre = quarterMap[formData.quarter] || 1;
      
      // Utiliser le montant calculé dynamiquement à partir des régimes
      const salaire = this.selectedCooperant.salaire || 0;
      const montantCotisation = this.totalCotisation;
      
      if (this.isEditMode && this.debitId && this.existingData) {
        // Mode édition
        const updateData = {
          ...this.existingData,
          cooperantId: this.selectedCooperant.id,
          numAffiliation: formData.numAffiliation,
          trimestre: trimestre,
          annee: formData.year,
          montantCotisation: parseFloat(formData.montant) || montantCotisation
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
        // Mode création - générer l'avis de débit avec PDF arabe
        const nomCooperant = this.selectedCooperant.nomCompletFr || `${this.selectedCooperant.prenomFr} ${this.selectedCooperant.nomFr}`;
        
        // Générer le PDF arabe côté frontend
        const pdfData = {
          number: formData.numAffiliation,
          employerName: nomCooperant,
          trimestre: `T${trimestre}`,
          generatedDate: new Date().toISOString(),
          amount: montantCotisation,
          numAffiliation: formData.numAffiliation,
          matricule: this.selectedCooperant.matriculeComplet || '',
          salaire: salaire,
          adresse: this.selectedCooperant.adresseFr || '',
          annee: formData.year
        };
        
        this.pdfService.generateDebitPdfBase64(pdfData).then((pdfBase64: string) => {
          const debitData = {
            cooperantId: this.selectedCooperant!.id,
            numAffiliation: formData.numAffiliation,
            nomCooperant: nomCooperant,
            adresse: this.selectedCooperant!.adresseFr || '',
            matricule: this.selectedCooperant!.matriculeComplet || '',
            trimestre: trimestre,
            annee: formData.year,
            salaire: salaire,
            montantCotisation: montantCotisation,
            dateDebut: formData.dateDebut,
            email: this.selectedCooperant!.email,
            pdfBase64: pdfBase64
          };
          
          this.debitService.generate(debitData).subscribe({
            next: (response: any) => {
              this.loading = false;
              alert('Avis de débit créé avec succès !');
              this.router.navigate(['/debit']);
            },
            error: (err: any) => {
              console.error('Erreur génération débit:', err);
              this.loading = false;
              alert('Erreur lors de la génération du débit');
            }
          });
        }).catch((err: any) => {
          console.error('Erreur génération PDF:', err);
          // Fallback: envoyer sans PDF
          const debitData = {
            cooperantId: this.selectedCooperant!.id,
            numAffiliation: formData.numAffiliation,
            nomCooperant: nomCooperant,
            adresse: this.selectedCooperant!.adresseFr || '',
            matricule: this.selectedCooperant!.matriculeComplet || '',
            trimestre: trimestre,
            annee: formData.year,
            salaire: salaire,
            montantCotisation: montantCotisation,
            dateDebut: formData.dateDebut,
            email: this.selectedCooperant!.email
          };
          
          this.debitService.generate(debitData).subscribe({
            next: () => {
              this.loading = false;
              alert('Avis de débit créé (sans PDF arabe)');
              this.router.navigate(['/debit']);
            },
            error: () => {
              this.loading = false;
              alert('Erreur lors de la génération du débit');
            }
          });
        });
      }
    }
  }
}
