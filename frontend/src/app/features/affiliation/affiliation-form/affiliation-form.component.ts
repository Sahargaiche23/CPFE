import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

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

  constructor(
    private fb: FormBuilder,
    private router: Router
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

  ngOnInit() {}

  onSubmit() {
    if (this.affiliationForm.valid) {
      this.loading = true;
      // Simulate API call
      setTimeout(() => {
        console.log('Affiliation created:', this.affiliationForm.value);
        this.loading = false;
        this.router.navigate(['/affiliation']);
      }, 1500);
    }
  }
}
