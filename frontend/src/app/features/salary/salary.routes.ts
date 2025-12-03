import { Routes } from '@angular/router';

export const SALARY_ROUTES: Routes = [
  {
    path: 'convert',
    loadComponent: () => import('./salary-converter/salary-converter.component').then(m => m.SalaryConverterComponent)
  }
];
