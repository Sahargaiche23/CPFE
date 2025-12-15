import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface Cooperant {
  id?: number;
  matricule?: number;
  cle?: number;
  matriculeComplet?: string;
  
  // Informations FR
  nomFr: string;
  prenomFr: string;
  adresseFr: string;
  codePostal?: string;
  localiteFr?: string;
  lieuNaissanceFr?: string;
  nomCompletFr?: string;
  
  // Informations AR
  nomAr?: string;
  prenomAr?: string;
  adresseAr?: string;
  localiteAr?: string;
  lieuNaissanceAr?: string;
  nomCompletAr?: string;
  
  // Date naissance
  dateNaissance?: string;
  
  // Contact
  telephone?: string;
  fax?: string;
  email?: string;
  
  // Pièce identité
  typePieceIdentite: string;
  numPieceIdentite: string;
  
  // Nationalité
  nationalite?: string;
  
  // Régime
  codeRegime: string;
  libelleRegime?: string;
  
  // Fichiers
  fichierDossier?: string;
  fichierIdentite?: string;
  fichierAutre?: string;
  
  // Validation
  statutValidation?: string;
  dateValidation?: string;
  validePar?: number;
  motifRejet?: string;
  
  // Affiliation
  numAffiliation?: string;
  cleAffiliation?: string;
  salaire?: number;
  dateEffetAffiliation?: string;
  
  // Cotisation
  cotisationPayee?: boolean;
  montantCotisation?: number;
  datePaiement?: string;
  
  // Audit
  actif?: boolean;
  createdAt?: string;
  updatedAt?: string;
}

export interface CreateCooperantRequest {
  nomFr: string;
  prenomFr: string;
  adresseFr: string;
  codePostal?: string;
  localiteFr?: string;
  lieuNaissanceFr?: string;
  
  nomAr?: string;
  prenomAr?: string;
  adresseAr?: string;
  localiteAr?: string;
  lieuNaissanceAr?: string;
  
  dateNaissance?: string;
  
  telephone?: string;
  fax?: string;
  email?: string;
  
  typePieceIdentite: string;
  numPieceIdentite: string;
  
  nationalite?: string;
  codeRegime: string;
}

@Injectable({
  providedIn: 'root'
})
export class CooperantService {
  private apiUrl = `${environment.apiUrl}/cooperants`;

  constructor(private http: HttpClient) {}

  // Liste tous les coopérants
  getAll(): Observable<Cooperant[]> {
    return this.http.get<Cooperant[]>(this.apiUrl);
  }

  // Récupérer par ID
  getById(id: number): Observable<Cooperant> {
    return this.http.get<Cooperant>(`${this.apiUrl}/${id}`);
  }

  // Récupérer par matricule
  getByMatricule(matricule: number, cle: number): Observable<Cooperant> {
    return this.http.get<Cooperant>(`${this.apiUrl}/matricule/${matricule}/${cle}`);
  }

  // Créer un coopérant
  create(cooperant: CreateCooperantRequest): Observable<Cooperant> {
    return this.http.post<Cooperant>(this.apiUrl, cooperant);
  }

  // Mettre à jour
  update(id: number, cooperant: CreateCooperantRequest): Observable<Cooperant> {
    return this.http.put<Cooperant>(`${this.apiUrl}/${id}`, cooperant);
  }

  // Supprimer (désactiver)
  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  // Recherche
  search(query: string): Observable<Cooperant[]> {
    return this.http.get<Cooperant[]>(`${this.apiUrl}/search`, {
      params: new HttpParams().set('q', query)
    });
  }

  // Liste par régime
  getByRegime(codeRegime: string): Observable<Cooperant[]> {
    return this.http.get<Cooperant[]>(`${this.apiUrl}/regime/${codeRegime}`);
  }

  // Liste en attente de validation
  getPending(): Observable<Cooperant[]> {
    return this.http.get<Cooperant[]>(`${this.apiUrl}/pending`);
  }

  // Valider un coopérant (agent)
  valider(id: number, agentId: number): Observable<Cooperant> {
    return this.http.post<Cooperant>(`${this.apiUrl}/${id}/valider`, null, {
      params: new HttpParams().set('agentId', agentId.toString())
    });
  }

  // Rejeter un coopérant (agent)
  rejeter(id: number, agentId: number, motif: string): Observable<Cooperant> {
    return this.http.post<Cooperant>(`${this.apiUrl}/${id}/rejeter`, null, {
      params: new HttpParams()
        .set('agentId', agentId.toString())
        .set('motif', motif)
    });
  }

  // Upload fichier
  uploadFile(id: number, file: File, typeFile: string): Observable<{path: string, message: string}> {
    const formData = new FormData();
    formData.append('file', file);
    formData.append('type', typeFile);
    return this.http.post<{path: string, message: string}>(`${this.apiUrl}/${id}/upload`, formData);
  }

  // Statistiques
  getStatsByRegime(): Observable<{[key: string]: number}> {
    return this.http.get<{[key: string]: number}>(`${this.apiUrl}/stats/regime`);
  }

  getStatsByValidation(): Observable<{[key: string]: number}> {
    return this.http.get<{[key: string]: number}>(`${this.apiUrl}/stats/validation`);
  }

  // Mettre à jour l'affiliation du coopérant
  updateAffiliation(id: number, numAffiliation: string, cleAffiliation: string, salaire?: number, dateEffetAffiliation?: string): Observable<Cooperant> {
    const updates: any = { numAffiliation, cleAffiliation };
    if (salaire !== undefined) updates.salaire = salaire.toString();
    if (dateEffetAffiliation) updates.dateEffetAffiliation = dateEffetAffiliation;
    return this.http.patch<Cooperant>(`${this.apiUrl}/${id}`, updates);
  }
}
