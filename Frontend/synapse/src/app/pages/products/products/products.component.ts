import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {

  constructor() {

  }
  ngOnInit() {

  }

  url: string = "./python";
  url2: string = "./angular";
  url3: string = "./html";
  url4: string = "./django";

  changeImage(event: any) {
    this.url = event.target.src;
  }

}
