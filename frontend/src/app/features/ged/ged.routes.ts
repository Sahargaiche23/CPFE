import { Routes } from '@angular/router';

export const GED_ROUTES: Routes = [
  {
    path: '',
    loadComponent: () => import('./ged.component').then(m => m.GedComponent)
  },
  {
    path: 'add',
    loadComponent: () => import('./ged-add/ged-add.component').then(m => m.GedAddComponent)
  },
  {
    path: 'document/:id',
    loadComponent: () => import('./ged-detail/ged-detail.component').then(m => m.GedDetailComponent)
  }
];
