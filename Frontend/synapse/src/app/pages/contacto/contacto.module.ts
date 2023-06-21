import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule  } from '@angular/forms';

import { ContactoComponent } from './contacto.component';

@NgModule({
    imports:      [ BrowserModule, FormsModule, ReactiveFormsModule ],
    declarations: [ ContactoComponent ],
    bootstrap:    [ ContactoComponent ]
})
export class AppModule { }
