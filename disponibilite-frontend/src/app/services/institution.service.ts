import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Institution {
  id?: number;
  numAffiliation: string;
  brancheSociale: string;
  raisonSociale: string;
  adresse: string;
  telephone: string;
  email: string;
  gouvernorat: string;
  actif: boolean;
  createdAt?: string;
}

@Injectable({ providedIn: 'root' })
export class InstitutionService {
  private api = `${environment.apiUrl}/api/disponibilite/institutions`;

  constructor(private http: HttpClient) {}

  findAll(): Observable<Institution[]> {
    return this.http.get<Institution[]>(this.api);
  }

  findById(id: number): Observable<Institution> {
    return this.http.get<Institution>(`${this.api}/${id}`);
  }

  search(q: string): Observable<Institution[]> {
    return this.http.get<Institution[]>(`${this.api}/search`, { params: { q } });
  }

  findByAffiliation(numAffiliation: string, branche: string): Observable<Institution[]> {
    return this.http.get<Institution[]>(`${this.api}/search`, { params: { numAffiliation, branche } });
  }

  create(inst: Institution): Observable<Institution> {
    return this.http.post<Institution>(this.api, inst);
  }

  update(id: number, inst: Institution): Observable<Institution> {
    return this.http.put<Institution>(`${this.api}/${id}`, inst);
  }
}
