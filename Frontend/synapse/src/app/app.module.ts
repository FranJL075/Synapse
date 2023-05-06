import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaerComponent } from './heaer/heaer.component';
import { HeadeComponent } from './heade/heade.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SectionComponent } from './section/section.component';

@NgModule({
  declarations: [AppComponent, HeaerComponent, HeadeComponent, HeaderComponent, FooterComponent, NavbarComponent, SectionComponent],
  imports: [BrowserModule, AppRoutingModule, RouterModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
