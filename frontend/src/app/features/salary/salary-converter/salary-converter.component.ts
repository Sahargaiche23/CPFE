import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';

@Component({
  selector: 'app-salary-converter',
  standalone: true,
  imports: [CommonModule, MainLayoutComponent],
  templateUrl: './salary-converter.component.html',
  styles: []
})
export class SalaryConverterComponent {}
