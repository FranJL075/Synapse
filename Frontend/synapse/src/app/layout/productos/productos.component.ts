import { Component, Input, OnInit } from '@angular/core';
import { Product } from 'src/app/interfaces/products.interface';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {

  @Input() product!: Product;

  constructor() {

  }

  ngOnInit(): void {

  }

}
