import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface TauxCotisation {
  id?: number;
  dateDebut: string;
  dateFin: string | null;
  tauxCode137: number;
  tauxCode138: number;
  tauxCode197: number | null;
  tauxCode198: number | null;
}

@Injectable({ providedIn: 'root' })
export class TauxService {
  private api = `${environment.apiUrl}/api/disponibilite/taux`;

  constructor(private http: HttpClient) {}

  findAll(): Observable<TauxCotisation[]> {
    return this.http.get<TauxCotisation[]>(this.api);
  }
}
