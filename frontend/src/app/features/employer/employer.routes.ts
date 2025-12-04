import { Routes } from '@angular/router';

export const EMPLOYER_ROUTES: Routes = [
  {
    path: '',
    loadComponent: () => import('./employer-list/employer-list.component').then(m => m.EmployerListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./employer-form/employer-form.component').then(m => m.EmployerFormComponent)
  },
  {
    path: 'edit/:id',
    loadComponent: () => import('./employer-form/employer-form.component').then(m => m.EmployerFormComponent)
  },
  {
    path: ':id',
    loadComponent: () => import('./employer-detail/employer-detail.component').then(m => m.EmployerDetailComponent)
  }
];
