import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ReportService {
  // Accès direct au service affiliation pour les rapports
  private apiUrl = 'http://localhost:8084/api/reports';

  constructor(private http: HttpClient) {}

  /**
   * Générer le rapport des affiliations
   */
  generateAffiliationsReport(bureau?: string, periode?: string): Observable<Blob> {
    let params = new HttpParams();
    if (bureau) params = params.set('bureau', bureau);
    if (periode) params = params.set('periode', periode);

    return this.http.get(`${this.apiUrl}/affiliations`, {
      params,
      responseType: 'blob'
    });
  }

  /**
   * Générer le rapport des paiements
   */
  generatePaiementsReport(bureau?: string, periode?: string): Observable<Blob> {
    let params = new HttpParams();
    if (bureau) params = params.set('bureau', bureau);
    if (periode) params = params.set('periode', periode);

    return this.http.get(`${this.apiUrl}/paiements`, {
      params,
      responseType: 'blob'
    });
  }

  /**
   * Prévisualiser le rapport (dans un nouvel onglet)
   */
  previewReport(type: 'affiliations' | 'paiements', bureau?: string): void {
    let url = `${this.apiUrl}/${type}/preview`;
    if (bureau) url += `?bureau=${bureau}`;
    window.open(url, '_blank');
  }

  /**
   * Télécharger le rapport
   */
  downloadReport(blob: Blob, filename: string): void {
    const url = window.URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    link.click();
    window.URL.revokeObjectURL(url);
  }
}
