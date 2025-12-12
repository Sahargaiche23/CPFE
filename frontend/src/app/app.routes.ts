import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';
import { adminGuard } from './core/guards/admin.guard';

export const routes: Routes = [
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full'
  },
  {
    path: 'public/cooperant/depot',
    loadComponent: () => import('./features/cooperant/cooperant-form/cooperant-form.component').then(m => m.CooperantFormComponent)
  },
  {
    path: 'public/cooperant/new',
    loadComponent: () => import('./features/cooperant/cooperant-form/cooperant-form.component').then(m => m.CooperantFormComponent)
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
    children: [
      {
        path: '',
        redirectTo: '/cooperant',
        pathMatch: 'full'
      },
      {
        path: 'new',
        redirectTo: '/cooperant/new',
        pathMatch: 'full'
      },
      {
        path: 'validation',
        redirectTo: '/cooperant/validation',
        pathMatch: 'full'
      },
      {
        path: '**',
        redirectTo: '/cooperant'
      }
    ]
  },
  {
    path: 'cooperant',
    canActivate: [authGuard],
    loadChildren: () => import('./features/cooperant/cooperant.routes').then(m => m.COOPERANT_ROUTES)
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
    path: 'profile',
    canActivate: [authGuard],
    loadComponent: () => import('./features/profile/profile.component').then(m => m.ProfileComponent)
  },
  {
    path: 'settings',
    canActivate: [authGuard],
    loadComponent: () => import('./features/settings/settings.component').then(m => m.SettingsComponent)
  },
  {
    path: 'admin/users',
    canActivate: [authGuard],
    loadComponent: () => import('./features/admin/user-management/user-management.component').then(m => m.UserManagementComponent)
  },
  {
    path: 'admin/logs',
    canActivate: [authGuard],
    loadComponent: () => import('./features/admin/audit-logs/audit-logs.component').then(m => m.AuditLogsComponent)
  },
  {
    path: 'reports',
    canActivate: [adminGuard],
    loadComponent: () => import('./features/reports/reports.component').then(m => m.ReportsComponent)
  },
  {
    path: '**',
    redirectTo: '/dashboard'
  }
];
