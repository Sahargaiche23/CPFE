import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Salaire {
  id?: number;
  agentPublic?: { id: number };
  salaireMensuel: number;
  dateEffet: string;
  createdAt?: string;
}

@Injectable({ providedIn: 'root' })
export class SalaireService {
  private api = `${environment.apiUrl}/api/disponibilite/salaires`;

  constructor(private http: HttpClient) {}

  findByAgent(agentId: number): Observable<Salaire[]> {
    return this.http.get<Salaire[]>(`${this.api}/agent/${agentId}`);
  }

  findApplicable(agentId: number, date: string): Observable<Salaire> {
    return this.http.get<Salaire>(`${this.api}/applicable`, { params: { agentId: agentId.toString(), date } });
  }

  create(salaire: Salaire): Observable<Salaire> {
    return this.http.post<Salaire>(this.api, salaire);
  }

  update(id: number, salaire: Salaire): Observable<Salaire> {
    return this.http.put<Salaire>(`${this.api}/${id}`, salaire);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.api}/${id}`);
  }
}
