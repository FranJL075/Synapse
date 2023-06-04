import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { AuthService } from '../services/auth.service';

@Injectable()
export class AuthReverseGuard {
  constructor(private router: Router, private authService: AuthService) {}

  canActivate(): boolean {
    if (this.authService.currentUser) {
      this.router.navigate(['/home']);
      return false;
    } else {
      return true;
    }
  }
}
