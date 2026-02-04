import { Routes } from '@angular/router';

export const ATCT_ROUTES: Routes = [
  {
    path: '',
    redirectTo: 'list',
    pathMatch: 'full'
  },
  {
    path: 'list',
    loadComponent: () => import('./atct-list/atct-list.component').then(m => m.AtctListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./atct-form/atct-form.component').then(m => m.AtctFormComponent)
  },
  {
    path: 'edit/:id',
    loadComponent: () => import('./atct-form/atct-form.component').then(m => m.AtctFormComponent)
  },
  {
    path: 'detail/:id',
    loadComponent: () => import('./atct-detail/atct-detail.component').then(m => m.AtctDetailComponent)
  },
  {
    path: 'validation',
    loadComponent: () => import('./atct-validation/atct-validation.component').then(m => m.AtctValidationComponent)
  }
];
