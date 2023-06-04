import {
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Router,
} from '@angular/router';
import { Injectable } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { PermissionService } from '../services/permission-manager.service';

@Injectable()
export class AuthGuard {
  constructor(
    private router: Router,
    private authService: AuthService,
    private permission: PermissionService
  ) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    const user = this.authService.currentUser;

    if (!user) {
      this.router.navigate(['/']);
      return false;
    } else if (state.url == '/home') {
      return true;
    } else {
      return this.permission.hasPermission(state.url);
    }
  }
}
