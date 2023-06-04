import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})

/**
 *Api para la conexión con el server
 */
export class ApiService {
  /**
   *Url de la API
   */

  public API_ENDPOINT: string = `${environment.api.url}`;

  /**
   * Constructor
   */
  constructor(public httpClient: HttpClient) {}

  /**
   * Realiza un post a la api
   */
  post(
    path?: string,
    data?: any,
    showSpinner: boolean = true
  ): Observable<any> {
    return this.httpClient.post(`${this.API_ENDPOINT}/${path}`, data);
  }

  /**
   * Realiza un put a la api
   */
  put(path?: string, data?: any, showSpinner: boolean = true): Observable<any> {
    return this.httpClient.put(`${this.API_ENDPOINT}/${path}`, data);
  }

  /**
   * Realiza un delete a la api
   */
  delete(
    path?: string,
    data?: any,
    showSpinner: boolean = true
  ): Observable<any> {
    return this.httpClient.delete(`${this.API_ENDPOINT}/${path}`, data);
  }

  /**
   * Realiza un get a la api
   */
  get(
    path: string,
    showSpinner: boolean = true,
    headers?: any
  ): Observable<any> {
    return this.httpClient.get(`${this.API_ENDPOINT}/${path}`, headers);
  }

  /**
   * Realiza un get a la api
   */
  async getAsync(path: string, showSpinner: boolean = true): Promise<any> {
    return this.httpClient.get(`${this.API_ENDPOINT}/${path}`).toPromise();
  }

  /**
   * Realiza un post a la api
   */
  async postAsync(
    path: string,
    data: any,
    showSpinner: boolean = true
  ): Promise<any> {
    return this.httpClient
      .post(`${this.API_ENDPOINT}/${path}`, data)
      .toPromise();
  }

  getClob(
    path: string,
    filename: string,
    showSpinner: boolean = true,
    download: boolean = true
  ): Observable<any> {
    return this.httpClient
      .get(`${this.API_ENDPOINT}/${path}`, { responseType: 'blob' as 'json' })
      .pipe(
        map((response: any) => {
          const dataType = response.type;
          const binaryData = [];
          binaryData.push(response);
          const downloadLink = document.createElement('a');
          var objectUrl = window.URL.createObjectURL(
            new Blob(binaryData, { type: dataType })
          );
          downloadLink.href = objectUrl;
          if (download) {
            downloadLink.download = filename;
          } else {
            downloadLink.target = '_blank';
          }
          downloadLink.click();
          URL.revokeObjectURL(objectUrl);
        })
      );
  }

  postClob(
    path: string,
    filename: string,
    body: any,
    showSpinner: boolean = true
  ): Observable<any> {
    return this.httpClient
      .post(`${this.API_ENDPOINT}/${path}`, body, {
        responseType: 'blob' as 'json',
      })
      .pipe(
        map((response: any) => {
          const dataType = response.type;
          const binaryData = [];
          binaryData.push(response);
          const downloadLink = document.createElement('a');
          var objectUrl = window.URL.createObjectURL(
            new Blob(binaryData, { type: dataType })
          );
          downloadLink.href = objectUrl;
          downloadLink.click();
          URL.revokeObjectURL(objectUrl);
        })
      );
  }
}
