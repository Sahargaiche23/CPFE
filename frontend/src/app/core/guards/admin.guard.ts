import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const adminGuard = () => {
  const authService = inject(AuthService);
  const router = inject(Router);

  if (!authService.isAuthenticated()) {
    router.navigate(['/auth/login']);
    return false;
  }

  const user = authService.getCurrentUser();
  const profil = user?.profil?.toUpperCase();
  if (profil === 'ADMIN' || profil === 'ROLE_ADMIN') {
    return true;
  }

  // Rediriger vers le dashboard si pas admin
  router.navigate(['/dashboard']);
  return false;
};
