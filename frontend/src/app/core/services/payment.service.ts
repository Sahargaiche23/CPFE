import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Payment {
  id?: number;
  numAffiliation: string;
  trimestre: string;
  montant: number;
  modePaiement: string;
  paiementPartiel?: boolean;
  createdAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class PaymentService {
  private apiUrl = `${environment.apiUrl}/payments`;

  constructor(private http: HttpClient) {}

  getAll(filters?: any): Observable<Payment[]> {
    let params = new HttpParams();
    if (filters) {
      Object.keys(filters).forEach(key => {
        if (filters[key]) params = params.set(key, filters[key]);
      });
    }
    return this.http.get<Payment[]>(this.apiUrl, { params });
  }

  create(payment: any): Observable<Payment> {
    return this.http.post<Payment>(this.apiUrl, payment);
  }

  getById(id: number | string): Observable<Payment> {
    return this.http.get<Payment>(`${this.apiUrl}/${id}`);
  }

  validate(id: number): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}/validate`, {});
  }

  update(id: number, payment: any): Observable<Payment> {
    return this.http.put<Payment>(`${this.apiUrl}/${id}`, payment);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
