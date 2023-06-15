import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  viewCart: boolean = false;


  constructor() {

  }

  ngOnInit(): void {

  }

  onToggleCart() {
    this.viewCart = !this.viewCart
  }

}
