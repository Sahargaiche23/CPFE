import { Routes } from '@angular/router';

export const DEMANDE_ROUTES: Routes = [
  {
    path: '',
    loadComponent: () => import('./demande-list/demande-list.component').then(m => m.DemandeListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./demande-form/demande-form.component').then(m => m.DemandeFormComponent)
  }
];
