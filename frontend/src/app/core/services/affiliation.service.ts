import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Affiliation {
  id?: number;
  numeroAffiliation?: string;
  assureNom: string;
  assurePrenom: string;
  assureDateNaissance: Date;
  assurecin: string;
  employeurId: number;
  regimeCode: string;
  dateAffiliation?: Date;
  status?: string;
  salaireBase: number;
  cotisationMensuelle?: number;
}

@Injectable({
  providedIn: 'root'
})
export class AffiliationService {
  private readonly API_URL = `${environment.apiUrl}/affiliation`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Affiliation[]> {
    return this.http.get<Affiliation[]>(`${this.API_URL}/list`);
  }

  getById(id: number): Observable<Affiliation> {
    return this.http.get<Affiliation>(`${this.API_URL}/${id}`);
  }

  create(affiliation: Affiliation): Observable<Affiliation> {
    return this.http.post<Affiliation>(`${this.API_URL}/create`, affiliation);
  }

  update(id: number, affiliation: Affiliation): Observable<Affiliation> {
    return this.http.put<Affiliation>(`${this.API_URL}/${id}`, affiliation);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.API_URL}/${id}`);
  }

  generateAttestation(id: number): Observable<Blob> {
    return this.http.get(`${this.API_URL}/${id}/attestation`, {
      responseType: 'blob'
    });
  }
}
