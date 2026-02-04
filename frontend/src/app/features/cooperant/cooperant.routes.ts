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
  {
    path: 'search',
    loadComponent: () => import('./cooperant-search/cooperant-search.component').then(m => m.CooperantSearchComponent)
  },
  // Routes Espace Coopérant
  {
    path: 'espace',
    loadComponent: () => import('./cooperant-dashboard/cooperant-dashboard.component').then(m => m.CooperantDashboardComponent)
  },
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
    loadComponent: () => import('./mes-reclamations/mes-reclamations.component').then(m => m.MesReclamationsComponent)
  },
  {
    path: 'depot-documents',
    loadComponent: () => import('./depot-documents/depot-documents.component').then(m => m.DepotDocumentsComponent)
  },
  {
    path: 'mes-depots',
    loadComponent: () => import('./mes-depots/mes-depots.component').then(m => m.MesDepotsComponent)
  },
  {
    path: 'suivi-dossier',
    loadComponent: () => import('./suivi-dossier/suivi-dossier.component').then(m => m.SuiviDossierComponent)
  },
  {
    path: ':id',
    loadComponent: () => import('./cooperant-detail/cooperant-detail.component').then(m => m.CooperantDetailComponent)
  }
];
