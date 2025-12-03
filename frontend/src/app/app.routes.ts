import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';

export const routes: Routes = [
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full'
  },
  {
    path: 'auth',
    loadChildren: () => import('./features/auth/auth.routes').then(m => m.AUTH_ROUTES)
  },
  {
    path: 'dashboard',
    canActivate: [authGuard],
    loadComponent: () => import('./features/dashboard/dashboard.component').then(m => m.DashboardComponent)
  },
  {
    path: 'employer',
    canActivate: [authGuard],
    loadChildren: () => import('./features/employer/employer.routes').then(m => m.EMPLOYER_ROUTES)
  },
  {
    path: 'affiliation',
    canActivate: [authGuard],
    loadChildren: () => import('./features/affiliation/affiliation.routes').then(m => m.AFFILIATION_ROUTES)
  },
  {
    path: 'salary',
    canActivate: [authGuard],
    loadChildren: () => import('./features/salary/salary.routes').then(m => m.SALARY_ROUTES)
  },
  {
    path: 'debit',
    canActivate: [authGuard],
    loadChildren: () => import('./features/debit/debit.routes').then(m => m.DEBIT_ROUTES)
  },
  {
    path: 'payment',
    canActivate: [authGuard],
    loadChildren: () => import('./features/payment/payment.routes').then(m => m.PAYMENT_ROUTES)
  },
  {
    path: '**',
    redirectTo: '/dashboard'
  }
];
