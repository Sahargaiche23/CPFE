import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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

  constructor(
    private fb: FormBuilder,
    private router: Router
  ) {
    this.employerForm = this.fb.group({
      regime: ['', Validators.required],
      legalName: ['', Validators.required],
      tradeName: ['', Validators.required],
      country: ['', Validators.required],
      legalForm: [''],
      address: ['', Validators.required],
      postalCode: [''],
      city: [''],
      phone: [''],
      email: ['', Validators.email],
      taxId: [''],
      creationDate: ['']
    });
  }

  ngOnInit() {}

  onSubmit() {
    if (this.employerForm.valid) {
      this.loading = true;
      // Simulate API call
      setTimeout(() => {
        console.log('Employer created:', this.employerForm.value);
        this.loading = false;
        this.router.navigate(['/employer']);
      }, 1500);
    }
  }
}
