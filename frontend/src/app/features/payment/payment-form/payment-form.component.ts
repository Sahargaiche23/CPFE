import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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

  constructor(
    private fb: FormBuilder,
    private router: Router
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

  ngOnInit() {}

  onSubmit() {
    if (this.paymentForm.valid) {
      this.loading = true;
      setTimeout(() => {
        console.log('Payment recorded:', this.paymentForm.value);
        this.loading = false;
        this.router.navigate(['/payment']);
      }, 1500);
    }
  }
}
