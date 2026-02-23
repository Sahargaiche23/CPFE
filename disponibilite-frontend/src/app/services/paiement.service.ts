import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Paiement {
  id?: number;
  cotisation?: any;
  montantPaye: number;
  codePaiement: string;
  typePaiement: string;
  referencePaiement: string;
  datePaiement: string;
  createdAt?: string;
}

export interface PaiementRequest {
  cotisationId: number;
  montantPaye: number;
  codePaiement: string;
  typePaiement: string;
  referencePaiement: string;
  datePaiement: string;
}

@Injectable({ providedIn: 'root' })
export class PaiementService {
  private api = `${environment.apiUrl}/api/disponibilite/paiements`;

  constructor(private http: HttpClient) {}

  findAll(): Observable<Paiement[]> {
    return this.http.get<Paiement[]>(this.api);
  }

  findByCotisation(cotisationId: number): Observable<Paiement[]> {
    return this.http.get<Paiement[]>(`${this.api}/cotisation/${cotisationId}`);
  }

  findByAgent(agentId: number): Observable<Paiement[]> {
    return this.http.get<Paiement[]>(`${this.api}/agent/${agentId}`);
  }

  create(request: PaiementRequest): Observable<Paiement> {
    return this.http.post<Paiement>(this.api, request);
  }
}
