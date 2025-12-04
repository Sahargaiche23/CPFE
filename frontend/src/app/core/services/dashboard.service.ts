import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface DashboardStats {
  totalEmployeurs: number;
  totalAffiliations: number;
  debitsEnAttente: number;
  totalPaiements: number;
}

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  private apiUrl = `${environment.apiUrl}/dashboard`;

  constructor(private http: HttpClient) {}

  getStats(): Observable<DashboardStats> {
    return this.http.get<DashboardStats>(`${this.apiUrl}/stats`);
  }

  getRecentActivities(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/activities`);
  }
}
