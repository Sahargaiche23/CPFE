import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Debit {
  id?: number;
  numAffiliation: string;
  trimestre: string;
  dateEffet?: string;
  montantCotisation: number;
  paye?: boolean;
  createdAt?: string;
}

export interface GenerateDebitRequest {
  cooperantId?: number;
  numAffiliation: string;
  nomCooperant?: string;
  adresse?: string;
  matricule?: string;
  trimestre: number;
  annee: number;
  salaire?: number;
  montantCotisation?: number;
  dateDebut?: string;
  email?: string;
}

@Injectable({
  providedIn: 'root'
})
export class DebitService {
  private apiUrl = `${environment.apiUrl}/debits`;

  constructor(private http: HttpClient) {}

  getAll(filters?: any): Observable<Debit[]> {
    let params = new HttpParams();
    if (filters) {
      Object.keys(filters).forEach(key => {
        if (filters[key]) params = params.set(key, filters[key]);
      });
    }
    return this.http.get<Debit[]>(this.apiUrl, { params });
  }

  generate(request: GenerateDebitRequest): Observable<Debit> {
    return this.http.post<Debit>(`${this.apiUrl}/generate`, request);
  }

  getByTrimestre(trimestre: number, annee: number): Observable<Debit[]> {
    return this.http.get<Debit[]>(`${this.apiUrl}/trimestre/${trimestre}/${annee}`);
  }

  getByEmployer(empMat: number, empCle: number): Observable<Debit[]> {
    return this.http.get<Debit[]>(`${this.apiUrl}/employer/${empMat}/${empCle}`);
  }

  validate(debitId: number): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${debitId}/validate`, {});
  }

  getById(id: number): Observable<Debit> {
    return this.http.get<Debit>(`${this.apiUrl}/${id}`);
  }

  update(id: number, data: any): Observable<Debit> {
    return this.http.put<Debit>(`${this.apiUrl}/${id}`, data);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
