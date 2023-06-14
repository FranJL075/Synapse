import { Component, Input, OnInit } from '@angular/core';
import { Producto } from 'src/app/interfaces/productointerface';
import { StoreService } from 'src/app/service/store.service';


@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {

  @Input() product!: Producto;

  productos: Producto[] = [];



  constructor(private storeService: StoreService) { }

  ngOnInit(): void {
    this.getProducto();
  }

  getProducto() {
    this.storeService.getAllproductos().subscribe((data) => {
      return this.productos = data
    })
  }



}
