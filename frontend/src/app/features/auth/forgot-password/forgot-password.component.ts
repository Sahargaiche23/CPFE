import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-forgot-password',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterModule],
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.scss']
})
export class ForgotPasswordComponent {
  step: 'request' | 'reset' = 'request';

  requestForm: FormGroup;
  resetForm: FormGroup;

  loading = false;
  error = '';
  success = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.requestForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]]
    });

    this.resetForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      otp: ['', [Validators.required, Validators.minLength(4)]],
      newPassword: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  onRequestOtp(): void {
    if (this.requestForm.invalid) return;

    this.loading = true;
    this.error = '';
    this.success = '';

    const email = this.requestForm.value.email;

    this.authService.forgotPassword(email).subscribe({
      next: () => {
        this.loading = false;
        this.step = 'reset';
        this.resetForm.patchValue({ email });
        this.success = 'OTP envoyé par email.';
      },
      error: (err) => {
        this.loading = false;
        this.error = err?.error?.error || 'Impossible d\'envoyer l\'OTP. Veuillez réessayer.';
      }
    });
  }

  onResetPassword(): void {
    if (this.resetForm.invalid) return;

    this.loading = true;
    this.error = '';
    this.success = '';

    const { email, otp, newPassword } = this.resetForm.value;

    this.authService.resetPasswordWithOtp(email, otp, newPassword).subscribe({
      next: () => {
        this.loading = false;
        this.success = 'Mot de passe mis à jour. Vous pouvez vous connecter.';
        setTimeout(() => this.router.navigate(['/auth/login']), 800);
      },
      error: (err) => {
        this.loading = false;
        this.error = err?.error?.error || 'Échec de réinitialisation. Vérifiez l\'OTP.';
      }
    });
  }

  backToLogin(): void {
    this.router.navigate(['/auth/login']);
  }
}
