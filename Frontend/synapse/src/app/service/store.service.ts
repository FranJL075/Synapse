import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { observableToBeFn } from 'rxjs/internal/testing/TestScheduler';
import { Producto } from '../interfaces/productointerface';
import { Observable } from 'rxjs/internal/Observable';
import { BehaviorSubject, lastValueFrom } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StoreService {

  baseUrl = "https://api.escuelajs.co/api/v1/"



  private mycart = new BehaviorSubject<Producto[]>([]);
  mycart$ = this.mycart.asObservable();


  constructor(private httpClient: HttpClient) { }

  getAllproductos(): Observable<Producto[]> {
    const response = this.httpClient.get<Producto[]>('${this.baseUrl}productos')
    console.log(response);
    return response
  }
  getPromise(): Promise<any[]> {
    return lastValueFrom(this.httpClient.get<any[]>('${this.baseUrl}productos'))

  }

  addProducto(producto: Producto) {
    console.log(producto)
  }
}
