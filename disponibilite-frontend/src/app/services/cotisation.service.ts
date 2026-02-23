import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Cotisation {
  id?: number;
  agentPublic?: any;
  institution?: any;
  ilhaq?: any;
  trimestre: number;
  annee: number;
  salaireMensuelApplique: number;
  montantCode137: number;
  montantCode138: number;
  montantCode197: number;
  montantCode198: number;
  montantTotal: number;
  statut: string;
  createdAt?: string;
}

export interface CotisationGenerationRequest {
  mode: 'TOUTES' | 'INSTITUTION' | 'AGENT';
  trimestre: number;
  annee: number;
  institutionId?: number;
  agentPublicId?: number;
}

@Injectable({ providedIn: 'root' })
export class CotisationService {
  private api = `${environment.apiUrl}/api/disponibilite/cotisations`;

  constructor(private http: HttpClient) {}

  findAll(annee?: number, trimestre?: number): Observable<Cotisation[]> {
    let params: any = {};
    if (annee) params['annee'] = annee;
    if (trimestre) params['trimestre'] = trimestre;
    return this.http.get<Cotisation[]>(this.api, { params });
  }

  findById(id: number): Observable<Cotisation> {
    return this.http.get<Cotisation>(`${this.api}/${id}`);
  }

  findByAgent(agentId: number): Observable<Cotisation[]> {
    return this.http.get<Cotisation[]>(`${this.api}/agent/${agentId}`);
  }

  findByInstitution(instId: number, annee?: number): Observable<Cotisation[]> {
    let params: any = {};
    if (annee) params['annee'] = annee;
    return this.http.get<Cotisation[]>(`${this.api}/institution/${instId}`, { params });
  }

  generer(request: CotisationGenerationRequest): Observable<any> {
    return this.http.post<any>(`${this.api}/generer`, request);
  }
}
