import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MembershipComponent } from './membership/membership.component';

const routes: Routes = [{ path: '', component: MembershipComponent }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class MembershipRoutingModule {}
