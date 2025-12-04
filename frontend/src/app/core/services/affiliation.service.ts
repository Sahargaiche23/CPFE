import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Affiliation {
  id?: number;
  numAffiliation: string;
  matricule?: number;
  dateEffet?: string;
  dateAssujettissement?: string;
  regime?: string;
  attestationPath?: string;
  createdAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class AffiliationService {
  private apiUrl = `${environment.apiUrl}/affiliations`;

  constructor(private http: HttpClient) {}

  getAll(filters?: any): Observable<Affiliation[]> {
    let params = new HttpParams();
    if (filters) {
      Object.keys(filters).forEach(key => {
        if (filters[key]) params = params.set(key, filters[key]);
      });
    }
    return this.http.get<Affiliation[]>(this.apiUrl, { params });
  }

  getById(empMat: number, empCle: number, dateDebut: string): Observable<Affiliation> {
    return this.http.get<Affiliation>(`${this.apiUrl}/${empMat}/${empCle}/${dateDebut}`);
  }

  getByDcoId(dcoId: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${dcoId}`);
  }

  create(affiliation: any): Observable<Affiliation> {
    return this.http.post<Affiliation>(this.apiUrl, affiliation);
  }

  update(empMat: number, empCle: number, dateDebut: string, data: any): Observable<Affiliation> {
    return this.http.put<Affiliation>(`${this.apiUrl}/${empMat}/${empCle}/${dateDebut}`, data);
  }

  updateById(id: number, data: any): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${id}`, data);
  }

  getByEmployer(empMat: number, empCle: number): Observable<Affiliation[]> {
    return this.http.get<Affiliation[]>(`${this.apiUrl}/employer/${empMat}/${empCle}`);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
