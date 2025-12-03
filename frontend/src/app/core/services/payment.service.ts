import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Payment {
  id?: number;
  numeroPaiement?: string;
  debitId: number;
  montant: number;
  modePaiement: string;
  datePaiement?: Date;
  status?: string;
  reference?: string;
}

@Injectable({
  providedIn: 'root'
})
export class PaymentService {
  private readonly API_URL = `${environment.apiUrl}/payment`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Payment[]> {
    return this.http.get<Payment[]>(`${this.API_URL}/list`);
  }

  getById(id: number): Observable<Payment> {
    return this.http.get<Payment>(`${this.API_URL}/${id}`);
  }

  create(payment: Payment): Observable<Payment> {
    return this.http.post<Payment>(`${this.API_URL}/create`, payment);
  }

  validatePayment(id: number): Observable<Payment> {
    return this.http.post<Payment>(`${this.API_URL}/${id}/validate`, {});
  }

  generateReceipt(id: number): Observable<Blob> {
    return this.http.get(`${this.API_URL}/${id}/receipt`, {
      responseType: 'blob'
    });
  }
}
