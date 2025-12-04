import { Routes } from '@angular/router';

export const DEBIT_ROUTES: Routes = [
  {
    path: '',
    loadComponent: () => import('./debit-list/debit-list.component').then(m => m.DebitListComponent)
  },
  {
    path: 'generate',
    loadComponent: () => import('./debit-generate/debit-generate.component').then(m => m.DebitGenerateComponent)
  },
  {
    path: 'edit/:id',
    loadComponent: () => import('./debit-generate/debit-generate.component').then(m => m.DebitGenerateComponent)
  }
];
