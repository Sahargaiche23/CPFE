import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Debit {
  id?: number;
  numeroDebit?: string;
  affiliationId: number;
  periode: string; // Format: Q1-2024
  montant: number;
  dateEcheance: Date;
  status?: string;
  dateCreation?: Date;
}

@Injectable({
  providedIn: 'root'
})
export class DebitService {
  private readonly API_URL = `${environment.apiUrl}/debit`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Debit[]> {
    return this.http.get<Debit[]>(`${this.API_URL}/list`);
  }

  getById(id: number): Observable<Debit> {
    return this.http.get<Debit>(`${this.API_URL}/${id}`);
  }

  getByAffiliation(affiliationId: number): Observable<Debit[]> {
    return this.http.get<Debit[]>(`${this.API_URL}/affiliation/${affiliationId}`);
  }

  generateTrimestriel(affiliationId: number): Observable<Debit> {
    return this.http.post<Debit>(`${this.API_URL}/generate-trimestriel`, { affiliationId });
  }

  validateDebit(id: number): Observable<Debit> {
    return this.http.post<Debit>(`${this.API_URL}/${id}/validate`, {});
  }
}
