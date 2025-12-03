import { Routes } from '@angular/router';

export const AFFILIATION_ROUTES: Routes = [
  {
    path: '',
    loadComponent: () => import('./affiliation-list/affiliation-list.component').then(m => m.AffiliationListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./affiliation-form/affiliation-form.component').then(m => m.AffiliationFormComponent)
  }
];
