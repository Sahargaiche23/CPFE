import { inject } from '@angular/core';
import { Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard = (route: ActivatedRouteSnapshot, state: RouterStateSnapshot) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  if (!authService.isAuthenticated()) {
    router.navigate(['/auth/login']);
    return false;
  }

  // Cooperant users can only access /cooperant/* routes
  const user = authService.getCurrentUser();
  if (user?.profil?.toLowerCase() === 'cooperant') {
    const url = state.url;
    if (!url.startsWith('/cooperant')) {
      router.navigate(['/cooperant/espace']);
      return false;
    }
  }

  return true;
};
