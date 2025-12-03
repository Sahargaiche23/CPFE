import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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

  constructor(
    private fb: FormBuilder,
    private router: Router
  ) {
    this.debitForm = this.fb.group({
      employerId: ['', Validators.required],
      quarter: ['', Validators.required],
      year: [2024, [Validators.required, Validators.min(2020)]]
    });
  }

  ngOnInit() {}

  onSubmit() {
    if (this.debitForm.valid) {
      this.loading = true;
      setTimeout(() => {
        console.log('Debit generated:', this.debitForm.value);
        this.loading = false;
        this.router.navigate(['/debit']);
      }, 1500);
    }
  }
}
