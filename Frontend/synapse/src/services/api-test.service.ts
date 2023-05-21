import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiService } from 'src/app/common/services/api.base.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiTestService {
  constructor(public api: ApiService) {}

  public listPosts(): Observable<any> {
    return this.api.get(`posts`);
  }

  public listServices(): Observable<any> {
    return this.api.get(`posts`);
  }
}
