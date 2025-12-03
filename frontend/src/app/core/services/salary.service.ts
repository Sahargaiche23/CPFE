import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface SalaryConversion {
  montantEtranger: number;
  deviseEtrangere: string;
  montantTND?: number;
  tauxChange?: number;
  dateConversion?: Date;
}

export interface CotisationCalcul {
  salaireBase: number;
  regimeCode: string;
  tauxCotisation?: number;
  montantCotisation?: number;
}

@Injectable({
  providedIn: 'root'
})
export class SalaryService {
  private readonly API_URL = `${environment.apiUrl}/salary`;

  constructor(private http: HttpClient) {}

  convertSalary(conversion: SalaryConversion): Observable<SalaryConversion> {
    return this.http.post<SalaryConversion>(`${this.API_URL}/convert`, conversion);
  }

  calculateCotisation(calcul: CotisationCalcul): Observable<CotisationCalcul> {
    return this.http.post<CotisationCalcul>(`${this.API_URL}/calculate-cotisation`, calcul);
  }

  getExchangeRates(): Observable<any> {
    return this.http.get<any>(`${this.API_URL}/exchange-rates`);
  }
}
