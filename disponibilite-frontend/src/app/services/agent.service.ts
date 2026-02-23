import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface AgentPublic {
  id?: number;
  numInscription: string;
  codeExploitation?: string;
  nom: string;
  prenom: string;
  nomFr?: string;
  prenomFr?: string;
  dateNaissance?: string;
  cin?: string;
  adresse?: string;
  email?: string;
  telephone?: string;
  institution?: any;
  dateDebutIlhaq?: string;
  dateFinIlhaq?: string;
  actif: boolean;
  createdAt?: string;
}

@Injectable({ providedIn: 'root' })
export class AgentService {
  private api = `${environment.apiUrl}/api/disponibilite/agents`;

  constructor(private http: HttpClient) {}

  findAll(): Observable<AgentPublic[]> {
    return this.http.get<AgentPublic[]>(this.api);
  }

  findById(id: number): Observable<AgentPublic> {
    return this.http.get<AgentPublic>(`${this.api}/${id}`);
  }

  findByInstitution(instId: number): Observable<AgentPublic[]> {
    return this.http.get<AgentPublic[]>(`${this.api}/institution/${instId}`);
  }

  search(q: string): Observable<AgentPublic[]> {
    return this.http.get<AgentPublic[]>(`${this.api}/search`, { params: { q } });
  }

  searchByNumInscription(numInscription: string): Observable<AgentPublic[]> {
    return this.http.get<AgentPublic[]>(`${this.api}/search`, { params: { numInscription } });
  }

  create(agent: AgentPublic): Observable<AgentPublic> {
    return this.http.post<AgentPublic>(this.api, agent);
  }

  update(id: number, agent: AgentPublic): Observable<AgentPublic> {
    return this.http.put<AgentPublic>(`${this.api}/${id}`, agent);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.api}/${id}`);
  }
}
