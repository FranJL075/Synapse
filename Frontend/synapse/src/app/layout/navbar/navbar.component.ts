import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  viewCart: boolean = false;

  constructor() { }

  ngOnInit(): void {

  }

  onTooglecart() {
    this.viewCart = !this.viewCart
  }



}
