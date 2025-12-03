import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-salary-converter',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MainLayoutComponent],
  templateUrl: './salary-converter.component.html',
  styles: []
})
export class SalaryConverterComponent implements OnInit {
  converterForm: FormGroup;
  convertedAmount: number = 0;
  employeeRate: number = 9.18; // Taux de cotisation salariale en %
  employerRate: number = 16.57; // Taux de cotisation patronale en %
  
  employeeContribution: number = 0;
  employerContribution: number = 0;
  totalContribution: number = 0;
  netSalary: number = 0;
  totalCost: number = 0;

  // Taux de change par défaut (mis à jour quotidiennement en production)
  exchangeRates: any = {
    'EUR': 3.450,
    'USD': 3.180,
    'GBP': 4.020,
    'CHF': 3.680,
    'CAD': 2.350
  };

  constructor(private fb: FormBuilder) {
    this.converterForm = this.fb.group({
      sourceCurrency: ['', Validators.required],
      exchangeRate: [{ value: 0, disabled: false }, [Validators.required, Validators.min(0)]],
      sourceAmount: ['', [Validators.required, Validators.min(0)]]
    });
  }

  ngOnInit() {}

  updateRate() {
    const currency = this.converterForm.get('sourceCurrency')?.value;
    if (currency && this.exchangeRates[currency]) {
      this.converterForm.patchValue({
        exchangeRate: this.exchangeRates[currency]
      });
      this.calculate();
    }
  }

  calculate() {
    const sourceAmount = this.converterForm.get('sourceAmount')?.value;
    const exchangeRate = this.converterForm.get('exchangeRate')?.value;

    if (sourceAmount && exchangeRate) {
      // Convert to TND
      this.convertedAmount = sourceAmount * exchangeRate;
      
      // Calculate contributions
      this.employeeContribution = this.convertedAmount * (this.employeeRate / 100);
      this.employerContribution = this.convertedAmount * (this.employerRate / 100);
      this.totalContribution = this.employeeContribution + this.employerContribution;
      
      // Calculate net salary
      this.netSalary = this.convertedAmount - this.employeeContribution;
      
      // Calculate total cost for employer
      this.totalCost = this.convertedAmount + this.employerContribution;
    } else {
      this.resetCalculations();
    }
  }

  reset() {
    this.converterForm.reset();
    this.resetCalculations();
  }

  resetCalculations() {
    this.convertedAmount = 0;
    this.employeeContribution = 0;
    this.employerContribution = 0;
    this.totalContribution = 0;
    this.netSalary = 0;
    this.totalCost = 0;
  }

  print() {
    window.print();
  }
}
