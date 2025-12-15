import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface RegimeCotisation {
  id?: number;
  code: string;
  nomAr: string;
  nomFr?: string;
  taux: number;
  baseCalcul: string; // 'SALAIRE' ou 'SALAIRE_PLAFONNE'
  coefficientBase: number;
  actif: boolean;
  ordre: number;
  createdAt?: string;
  updatedAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class RegimeService {
  private apiUrl = `${environment.apiUrl}/regimes`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<RegimeCotisation[]> {
    return this.http.get<RegimeCotisation[]>(this.apiUrl);
  }

  getAllIncludingInactive(): Observable<RegimeCotisation[]> {
    return this.http.get<RegimeCotisation[]>(`${this.apiUrl}/all`);
  }

  getById(id: number): Observable<RegimeCotisation> {
    return this.http.get<RegimeCotisation>(`${this.apiUrl}/${id}`);
  }

  create(regime: RegimeCotisation): Observable<RegimeCotisation> {
    return this.http.post<RegimeCotisation>(this.apiUrl, regime);
  }

  update(id: number, regime: RegimeCotisation): Observable<RegimeCotisation> {
    return this.http.put<RegimeCotisation>(`${this.apiUrl}/${id}`, regime);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  initDefaultRegimes(): Observable<string> {
    return this.http.post(`${this.apiUrl}/init`, {}, { responseType: 'text' });
  }

  // Calculer la cotisation pour un régime donné
  calculateCotisation(regime: RegimeCotisation, salaire: number): { base: number; montant: number } {
    const base = salaire * regime.coefficientBase;
    const montant = base * (regime.taux / 100);
    return { base, montant };
  }
}
