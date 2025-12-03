import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Employer {
  id?: number;
  numeroEmployeur?: string;
  raisonSociale: string;
  adresse: string;
  tel: string;
  email: string;
  regimeCode: string;
  status?: string;
  dateCreation?: Date;
}

@Injectable({
  providedIn: 'root'
})
export class EmployerService {
  private readonly API_URL = `${environment.apiUrl}/employer`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Employer[]> {
    return this.http.get<Employer[]>(`${this.API_URL}/list`);
  }

  getById(id: number): Observable<Employer> {
    return this.http.get<Employer>(`${this.API_URL}/${id}`);
  }

  create(employer: Employer): Observable<Employer> {
    return this.http.post<Employer>(`${this.API_URL}/create`, employer);
  }

  update(id: number, employer: Employer): Observable<Employer> {
    return this.http.put<Employer>(`${this.API_URL}/${id}`, employer);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.API_URL}/${id}`);
  }

  generateNumero(regimeCode: string): Observable<string> {
    return this.http.post<string>(`${this.API_URL}/generate-numero`, { regimeCode });
  }
}
