import { Routes } from '@angular/router';
import { authGuard } from './guards/auth.guard';

export const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  {
    path: 'login',
    loadComponent: () => import('./features/auth/login.component').then(m => m.LoginComponent)
  },
  {
    path: 'app',
    loadComponent: () => import('./layout/main-layout.component').then(m => m.MainLayoutComponent),
    canActivate: [authGuard],
    children: [
      { path: '', redirectTo: 'dossiers', pathMatch: 'full' },
      {
        path: 'dossiers',
        loadComponent: () => import('./features/dossiers/dossier-registration.component').then(m => m.DossierRegistrationComponent)
      },
      {
        path: 'salaires',
        loadComponent: () => import('./features/salaires/salaire-update.component').then(m => m.SalaireUpdateComponent)
      },
      {
        path: 'cotisations',
        loadComponent: () => import('./features/cotisations/cotisation-generation.component').then(m => m.CotisationGenerationComponent)
      },
      {
        path: 'paiements',
        loadComponent: () => import('./features/paiements/paiement-update.component').then(m => m.PaiementUpdateComponent)
      },
      {
        path: 'carte-paiement',
        loadComponent: () => import('./features/paiements/carte-paiement.component').then(m => m.CartePaiementComponent)
      },
      {
        path: 'print/avis-agents',
        loadComponent: () => import('./features/print/avis-agents.component').then(m => m.AvisAgentsComponent)
      },
      {
        path: 'print/suivi-paiements',
        loadComponent: () => import('./features/print/suivi-paiements.component').then(m => m.SuiviPaiementsComponent)
      },
      {
        path: 'print/relance-institutions',
        loadComponent: () => import('./features/print/relance-institutions.component').then(m => m.RelanceInstitutionsComponent)
      }
    ]
  },
  { path: '**', redirectTo: 'login' }
];
