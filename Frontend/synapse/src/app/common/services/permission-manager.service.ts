import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';
import { PermissionModel } from '../directives/permission.model';
import { Permission } from '../models/permissions.enum';

@Injectable()
export class PermissionService {
  constructor(private authService: AuthService, private router: Router) {}

  permission: PermissionModel[] = [
    //#region Users
    //#endregion
  ];

  /*Metodo de validacion de que este logueado y que tenga permisos para acceder a la url*/

  public hasPermission(url: string) {
    if (!this.authService.currentUser) {
      return this.router.navigate(['/']);
    }

    let permissions = this.authService.currentPermissions;

    let hasPermission = this.checkPermissions(url, permissions);

    if (!hasPermission) {
      this.router.navigate(['/home']);
    }

    return hasPermission;
  }

  /*Metodo para validar si el permiso requerido para ingresar a la url esta otorgado al usuario */
  private checkPermissions(url: string, permissions: Permission[]): boolean {
    let permissionUrl = this.permission.find((p) =>
      p.url.test(url)
    )?.permissions;
    if (!permissionUrl) return false;

    return permissions.findIndex((i) => permissionUrl?.includes(i)) !== -1;
  }

  /*Metodo para validar si el permiso requerido esta otorgado al usuario */
  public validatePermissionKey(permissionKey: Permission[]): boolean {
    let userPerms = this.authService.currentPermissions;

    let valid =
      userPerms && permissionKey.findIndex((i) => userPerms.includes(i)) !== -1;

    return valid;
  }
}
