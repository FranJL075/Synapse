import { Component } from '@angular/core';
import { Product } from './interfaces/products.interface';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'synapse';
  products: Product[] = [];

  constructor() {

  }

  ngOnInit() {
    this.products = [
      { id: 1, nombre: 'PYTHON', descripcion: 'Lenguaje de programación orientado a objetos. Duración 4 meses', precio: 25000, imagen: '' },
      { id: 2, nombre: 'ANGULAR', descripcion: 'Framework de uso intensivo en la creación de SPA. Duración 3 meses', precio: 20000, imagen: '' },
      { id: 3, nombre: 'DJANGO', descripcion: 'Framework de python para creación de paginas dinámicas. Duración 3 meses', precio: 20000, imagen: '' },
      { id: 4, nombre: 'BASE DE DATOS', descripcion: 'Curso de lenguaje SQL, orientado a la creacion de base de datos. Duración 4 meses', precio: 18000, imagen: '' },
      { id: 5, nombre: 'HTML Y CSS', descripcion: 'Aprenda a darle estructura y estilos, a sus diseños web. Duración 5 meses', precio: 30000, imagen: '' },
      { id: 6, nombre: 'JAVASCRIPT', descripcion: 'Lenguaje de programación dinámico y versatil de gran posicionamiento en el mercado. Duración 2 meses', precio: 28000, imagen: '' },
    ]
  }
}
