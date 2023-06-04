import { Injectable } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  public user: BehaviorSubject<string | null>;
  public userId: BehaviorSubject<number | null>;
  public token: BehaviorSubject<string | null>;
  public permissions: BehaviorSubject<string | null>;

  constructor(private route: ActivatedRoute, private router: Router) {
    this.user = new BehaviorSubject<any>(
      JSON.parse(sessionStorage.getItem('user')!)
    );
    this.userId = new BehaviorSubject<any>(
      JSON.parse(sessionStorage.getItem('userId')!)
    );
    this.token = new BehaviorSubject<any>(
      JSON.parse(sessionStorage.getItem('token')!)
    );

    this.permissions = new BehaviorSubject<any>(
      JSON.parse(sessionStorage.getItem('permissions')!)
    );
  }

  /* Medtodo para setear Token y Obtener */
  public set tokenLS(token: string) {
    sessionStorage.setItem('token', JSON.stringify(token));
    this.token.next(token);
  }
  public get tokenLS(): string {
    return JSON.parse(sessionStorage.getItem('token')!);
  }

  /* Metodo para setea usuario y obtener */
  public get currentUser(): string {
    return JSON.parse(sessionStorage.getItem('user')!);
  }
  public set currentUser(user: string) {
    sessionStorage.setItem('user', JSON.stringify(user));
    this.user.next(user);
    // this.user = new BehaviorSubject<string>(user);
  }

  /* Metodo para setea usuario y obtener */
  public get currentUserIds(): string {
    return JSON.parse(sessionStorage.getItem('userId')!);
  }
  public set currentUserId(userId: number) {
    sessionStorage.setItem('userId', JSON.stringify(userId));
    this.userId.next(userId);
  }

  /* Metodo para setea permisos y obtener */
  public get currentPermissions(): any {
    return JSON.parse(sessionStorage.getItem('permissions')!);
  }
  public set setCurrentPermissions(permissions: any) {
    sessionStorage.setItem('permissions', JSON.stringify(permissions));
    this.permissions.next(permissions);
  }

  /**
   * Metodo para desloguear el usuario
   */
  logout() {
    this.router.navigate(['/'], {
      relativeTo: this.route,
      queryParams: {
        token: this.token,
        mail: this.user,
        page: 'salir0',
      },
    });
    this.router.navigate(['/'], {
      relativeTo: this.route,
    });
    sessionStorage.removeItem('token');
    sessionStorage.removeItem('user');
    sessionStorage.removeItem('userId');
    sessionStorage.removeItem('menus');
    sessionStorage.removeItem('dealers');
    sessionStorage.removeItem('permissions');
    this.token.next(null);
    this.user.next(null);
    this.userId.next(null);
    this.permissions.next(null);
  }
}
