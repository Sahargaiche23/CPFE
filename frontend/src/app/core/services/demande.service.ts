import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DemandeCooperant {
  id?: number;
  cooperantId: number;
  numAffiliation?: string;
  nomCooperant?: string;
  matricule?: string;
  email?: string;
  typeDemande: string;
  statut?: string;
  ancienSalaire?: number;
  nouveauSalaire?: number;
  dateEffetSalaire?: string;
  motif?: string;
  regimeConcerne?: string;
  impactCotisation?: number;
  debitId?: number;
  trimestreDebit?: string;
  montantOriginal?: number;
  tauxRachat?: number;
  montantRachat?: number;
  reduction?: number;
  validePar?: number;
  dateValidation?: string;
  motifRejet?: string;
  commentaire?: string;
  fichierJustificatif?: string;
  createdAt?: string;
  updatedAt?: string;
}

@Injectable({ providedIn: 'root' })
export class DemandeService {

  private apiUrl = '/api/demandes';

  constructor(private http: HttpClient) {}

  findAll(): Observable<DemandeCooperant[]> {
    return this.http.get<DemandeCooperant[]>(this.apiUrl);
  }

  findById(id: number): Observable<DemandeCooperant> {
    return this.http.get<DemandeCooperant>(`${this.apiUrl}/${id}`);
  }

  findByCooperant(cooperantId: number): Observable<DemandeCooperant[]> {
    return this.http.get<DemandeCooperant[]>(`${this.apiUrl}/cooperant/${cooperantId}`);
  }

  findPending(type?: string): Observable<DemandeCooperant[]> {
    const params = type ? `?type=${type}` : '';
    return this.http.get<DemandeCooperant[]>(`${this.apiUrl}/pending${params}`);
  }

  findByType(type: string): Observable<DemandeCooperant[]> {
    return this.http.get<DemandeCooperant[]>(`${this.apiUrl}/type/${type}`);
  }

  getStats(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/stats`);
  }

  // Création par type
  creerActualisationSalaire(data: any): Observable<DemandeCooperant> {
    return this.http.post<DemandeCooperant>(`${this.apiUrl}/actualisation-salaire`, data);
  }

  creerSortieRegimeMaladie(data: any): Observable<DemandeCooperant> {
    return this.http.post<DemandeCooperant>(`${this.apiUrl}/sortie-regime-maladie`, data);
  }

  creerAnnulationAssurance(data: any): Observable<DemandeCooperant> {
    return this.http.post<DemandeCooperant>(`${this.apiUrl}/annulation-assurance`, data);
  }

  creerDemandeRachat(data: any): Observable<DemandeCooperant> {
    return this.http.post<DemandeCooperant>(`${this.apiUrl}/rachat`, data);
  }

  // Validation / Rejet
  valider(id: number, agentId: number = 1, commentaire?: string): Observable<DemandeCooperant> {
    let params = `?agentId=${agentId}`;
    if (commentaire) params += `&commentaire=${encodeURIComponent(commentaire)}`;
    return this.http.post<DemandeCooperant>(`${this.apiUrl}/${id}/valider${params}`, {});
  }

  rejeter(id: number, agentId: number = 1, motif: string): Observable<DemandeCooperant> {
    return this.http.post<DemandeCooperant>(
      `${this.apiUrl}/${id}/rejeter?agentId=${agentId}&motif=${encodeURIComponent(motif)}`, {});
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
