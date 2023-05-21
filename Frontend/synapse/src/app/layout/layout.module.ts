import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SectionComponent } from './section/section.component';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzCardModule } from 'ng-zorro-antd/card';

@NgModule({
  declarations: [
    FooterComponent,
    HeaderComponent,
    NavbarComponent,
    SectionComponent,
  ],
  imports: [CommonModule, NzMenuModule, NzLayoutModule, NzCardModule],
  exports: [
    FooterComponent,
    HeaderComponent,
    NavbarComponent,
    SectionComponent,
  ],
})
export class LayoutModule {}
