import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink, ActivatedRoute } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { PaymentService } from '../../../core/services/payment.service';
import { DebitService } from '../../../core/services/debit.service';

@Component({
  selector: 'app-payment-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MainLayoutComponent],
  templateUrl: './payment-form.component.html',
  styles: []
})
export class PaymentFormComponent implements OnInit {
  paymentForm: FormGroup;
  loading = false;
  debits: any[] = [];
  isEditMode = false;
  paymentId: number | null = null;
  existingData: any = null;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute,
    private paymentService: PaymentService,
    private debitService: DebitService
  ) {
    this.paymentForm = this.fb.group({
      debitId: ['', Validators.required],
      paymentDate: ['', Validators.required],
      amount: ['', [Validators.required, Validators.min(0)]],
      paymentMode: ['Virement', Validators.required],
      transactionRef: [''],
      notes: ['']
    });
  }

  ngOnInit() {
    this.loadDebits();
    
    // Vérifier si on est en mode édition
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.paymentId = +id;
      this.loadPayment(this.paymentId);
    }
  }

  loadPayment(id: number) {
    this.loading = true;
    this.paymentService.getById(id).subscribe({
      next: (data: any) => {
        console.log('Payment loaded:', data);
        this.existingData = data;
        this.paymentForm.patchValue({
          debitId: data.numAffiliation || '',
          paymentDate: data.createdAt ? data.createdAt.split('T')[0] : '',
          amount: data.montant,
          paymentMode: data.modePaiement || 'Virement'
        });
        this.loading = false;
      },
      error: (err: any) => {
        console.error('Erreur chargement paiement:', err);
        this.loading = false;
      }
    });
  }

  loadDebits() {
    this.debitService.getAll().subscribe({
      next: (data) => {
        this.debits = data.map((d: any) => ({
          id: d.engNum || d.id,
          label: `DEB-${d.engNum || d.id} - ${d.empMat}-${d.empCle} (${d.enoMontantEcheance || 0} TND)`
        }));
      },
      error: (err) => console.error('Erreur chargement débits:', err)
    });
  }

  onSubmit() {
    if (this.paymentForm.valid) {
      this.loading = true;
      const formData = this.paymentForm.value;
      
      // Calculer le trimestre actuel (T1-2025 format)
      const now = new Date();
      const quarter = Math.floor(now.getMonth() / 3) + 1;
      const trimestre = `T${quarter}-${now.getFullYear()}`;
      
      const paymentData = {
        numAffiliation: formData.debitId?.toString().substring(0, 20) || '',
        trimestre: trimestre.substring(0, 10),
        montant: parseFloat(formData.amount),
        modePaiement: formData.paymentMode?.substring(0, 20) || 'Virement',
        paiementPartiel: false
      };
      
      if (this.isEditMode && this.paymentId) {
        // Mode édition
        this.paymentService.update(this.paymentId, paymentData).subscribe({
          next: () => {
            this.loading = false;
            alert('Paiement modifié avec succès !');
            this.router.navigate(['/payment']);
          },
          error: (err: any) => {
            console.error('Erreur modification paiement:', err);
            this.loading = false;
            alert('Erreur lors de la modification du paiement');
          }
        });
      } else {
        // Mode création
        this.paymentService.create(paymentData).subscribe({
          next: () => {
            this.loading = false;
            this.router.navigate(['/payment']);
          },
          error: (err: any) => {
            console.error('Erreur création paiement:', err);
            this.loading = false;
            alert('Erreur lors de l\'enregistrement du paiement');
          }
        });
      }
    }
  }
}
