import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { I18nService } from '../../../core/services/i18n.service';
import { ExchangeRateService, ExchangeRate } from '../../../core/services/exchange-rate.service';
import { Subject, interval } from 'rxjs';
import { takeUntil } from 'rxjs/operators';

@Component({
  selector: 'app-salary-converter',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MainLayoutComponent],
  templateUrl: './salary-converter.component.html',
  styles: []
})
export class SalaryConverterComponent implements OnInit, OnDestroy {
  private destroy$ = new Subject<void>();
  
  converterForm: FormGroup;
  convertedAmount: number = 0;
  employeeRate: number = 9.18;
  employerRate: number = 16.57;
  
  employeeContribution: number = 0;
  employerContribution: number = 0;
  totalContribution: number = 0;
  netSalary: number = 0;
  totalCost: number = 0;

  // Taux de change dynamiques
  exchangeRates: ExchangeRate[] = [];
  selectedRate: ExchangeRate | null = null;
  isLoadingRates: boolean = true;
  lastUpdateTime: Date = new Date();
  
  // Pour le mini-graphique
  historicalData: { date: string; rate: number }[] = [];

  constructor(
    private fb: FormBuilder, 
    public i18n: I18nService,
    private exchangeRateService: ExchangeRateService
  ) {
    this.converterForm = this.fb.group({
      sourceCurrency: ['', Validators.required],
      exchangeRate: [{ value: 0, disabled: false }, [Validators.required, Validators.min(0)]],
      sourceAmount: ['', [Validators.required, Validators.min(0)]]
    });
  }

  ngOnInit() {
    this.loadExchangeRates();
    
    // Rafraîchir les taux toutes les 5 minutes
    interval(300000)
      .pipe(takeUntil(this.destroy$))
      .subscribe(() => this.loadExchangeRates());
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }

  loadExchangeRates() {
    this.isLoadingRates = true;
    this.exchangeRateService.getLatestRates()
      .pipe(takeUntil(this.destroy$))
      .subscribe({
        next: (rates) => {
          this.exchangeRates = rates;
          this.lastUpdateTime = new Date();
          this.isLoadingRates = false;
          
          // Mettre à jour le taux si une devise est déjà sélectionnée
          const currency = this.converterForm.get('sourceCurrency')?.value;
          if (currency) {
            this.updateRate();
          }
        },
        error: () => {
          this.isLoadingRates = false;
        }
      });
  }

  loadHistoricalData(currency: string) {
    this.exchangeRateService.getHistoricalRates(currency, 7)
      .pipe(takeUntil(this.destroy$))
      .subscribe(data => {
        this.historicalData = data;
      });
  }

  updateRate() {
    const currency = this.converterForm.get('sourceCurrency')?.value;
    if (currency) {
      const rate = this.exchangeRates.find(r => r.code === currency);
      if (rate) {
        this.selectedRate = rate;
        this.converterForm.patchValue({
          exchangeRate: rate.rate
        });
        this.loadHistoricalData(currency);
        this.calculate();
      }
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
