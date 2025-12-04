import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Employer {
  id?: string;
  empMat: number;
  empCle: number;
  nomCommercial: string;
  raisonSociale?: string;
  regime: string;
  pays: string;
  adresse?: string;
  telephone?: string;
  email?: string;
  affiliations: number;
  statut: string;
  dateCreation?: string;
}

@Injectable({
  providedIn: 'root'
})
export class EmployerService {
  private apiUrl = `${environment.apiUrl}/employers`;

  constructor(private http: HttpClient) {}

  getAll(filters?: any): Observable<Employer[]> {
    let params = new HttpParams();
    if (filters) {
      Object.keys(filters).forEach(key => {
        if (filters[key]) params = params.set(key, filters[key]);
      });
    }
    return this.http.get<Employer[]>(this.apiUrl, { params });
  }

  getById(empMat: number, empCle: number): Observable<Employer> {
    return this.http.get<Employer>(`${this.apiUrl}/${empMat}/${empCle}`);
  }

  create(employer: any): Observable<Employer> {
    return this.http.post<Employer>(this.apiUrl, employer);
  }

  update(empMat: number, empCle: number, employer: any): Observable<Employer> {
    return this.http.put<Employer>(`${this.apiUrl}/${empMat}/${empCle}`, employer);
  }

  delete(empMat: number, empCle: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${empMat}/${empCle}`);
  }
}
