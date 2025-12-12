import { Routes } from '@angular/router';

export const COOPERANT_ROUTES: Routes = [
  // Routes Agent (liste, création, validation)
  {
    path: '',
    loadComponent: () => import('./cooperant-list/cooperant-list.component').then(m => m.CooperantListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./cooperant-form/cooperant-form.component').then(m => m.CooperantFormComponent)
  },
  {
    path: 'edit/:id',
    loadComponent: () => import('./cooperant-form/cooperant-form.component').then(m => m.CooperantFormComponent)
  },
  {
    path: 'validation',
    loadComponent: () => import('./cooperant-validation/cooperant-validation.component').then(m => m.CooperantValidationComponent)
  },
  // Routes Espace Coopérant
  {
    path: 'mon-dossier',
    loadComponent: () => import('./mon-dossier/mon-dossier.component').then(m => m.MonDossierComponent)
  },
  {
    path: 'suivi',
    loadComponent: () => import('./suivi-dossier/suivi-dossier.component').then(m => m.SuiviDossierComponent)
  },
  {
    path: 'historique',
    loadComponent: () => import('./mon-dossier/mon-dossier.component').then(m => m.MonDossierComponent)
  },
  {
    path: 'reclamations',
    loadComponent: () => import('./reclamations/reclamations.component').then(m => m.ReclamationsComponent)
  },
  {
    path: ':id',
    loadComponent: () => import('./cooperant-detail/cooperant-detail.component').then(m => m.CooperantDetailComponent)
  }
];
