import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NzCardModule } from 'ng-zorro-antd/card';
import { LoginModule } from './login/login.module';
import { ProfileModule } from './profile/profile.module';
import { ProductsModule } from './products/products.module';
import { MembershipModule } from './membership/membership.module';
import { BlogModule } from './blog/blog.module';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    LoginModule,
    ProfileModule,
    ProductsModule,
    MembershipModule,
    BlogModule,
    NzCardModule,
  ],
})
export class PagesModule { }
