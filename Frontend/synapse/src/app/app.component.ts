import { Component, OnInit } from '@angular/core';
import { Producto } from './interfaces/productointerface';
import { StoreService } from './service/store.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'synapse';

  producto: Producto[] = [];

  products: Producto[] = [];





  constructor(private StoreService: StoreService) {

  }

  ngOnInit() {
    this.products = [
      { id: 1, nombre: 'PYTHON', descripcion: 'El lenguaje de programación mas usado en el mundo.', precio: 25000, imagen: '' },
      { id: 2, nombre: 'ANGULAR', descripcion: 'Potente framework para crear SPA.', precio: 20000, imagen: '' },
      { id: 3, nombre: 'DJANGO', descripcion: 'Framework de python, para crear paginas web.', precio: 20000, imagen: '' },
      { id: 4, nombre: 'BASES DE DATOS', descripcion: 'Aprenda el lenguaje SQL y comience a crear sus propias bases de datos.', precio: 15000, imagen: '' },
      { id: 5, nombre: 'HTML Y CSS', descripcion: 'Realice estructuras y enbellezca las paginas de forma dinámica.', precio: 25000, imagen: '' },
      { id: 6, nombre: 'JAVASCRIPT', descripcion: 'Lenguaje de programación mas potente del mercado IT.', precio: 28000, imagen: '' },
    ]
  }
}



