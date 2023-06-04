import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiService } from 'src/app/common/services/api.base.service';

@Injectable({
  providedIn: 'root',
})
export class ApiTestService {
  constructor(public api: ApiService) {}

  //Obtener todos los usuarios

  public listUsers(): Observable<any> {
    return this.api.get(`usuarios`);
  }

  //Obtener usuario por id
  public getUserById(id: number): Observable<any> {
    return this.api.get(`usuarios/${id}`);
  }
  // Login usuario
  public login(model: any): Observable<any> {
    return this.api.get(`login`);
  }

  // Cerrar sesion
  public logout(model: any): Observable<any> {
    return this.api.get(`logout`);
  }

  public logoutall(model: any): Observable<any> {
    return this.api.get(`logoutall`);
  }

  // Register usuario
  public register(model: any): Observable<any> {
    return this.api.post(`register`);
  }
}
