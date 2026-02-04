import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface DossierATCT {
  id?: number;
  
  // Informations Personnelles
  numSecuSociale?: string;
  nomFr: string;
  prenomFr: string;
  nomAr?: string;
  prenomAr?: string;
  nomCompletFr?: string;
  nomCompletAr?: string;
  dateNaissance?: string;
  lieuNaissanceFr?: string;
  lieuNaissanceAr?: string;
  sexe?: string;
  nationalite?: string;
  numCin?: string;
  numPasseport?: string;

  // Adresse Tunisie
  adresseTunisie?: string;
  codePostalTunisie?: string;
  villeTunisie?: string;

  // Adresse Étranger
  adresseEtranger?: string;
  codePostalEtranger?: string;
  villeEtranger?: string;
  paysEtranger?: string;
  paysCode?: number;

  // Contact
  telephone?: string;
  email?: string;

  // Établissement d'Origine
  etablissementOrigine?: string;
  matriculeEmployeur?: number;
  cleEmployeur?: number;
  matriculeEmployeurComplet?: string;

  // Mission à l'Étranger
  organismeEtranger?: string;
  missionPoste?: string;

  // Période de Détachement
  dateDebutDetachement: string;
  dateFinDetachement?: string;
  dateRenouvellement?: string;

  // Salaires
  salaireTunisie?: number;
  salaireEtranger?: number;
  deviseEtranger?: string;
  salaireConvertiTnd?: number;

  // Mode de Paiement
  modePaiement?: string;
  paiementAnticipe?: boolean;

  // Régime
  codeRegime?: string;

  // Options Assurance
  assuranceMaladie?: boolean;
  capitalDeces?: boolean;
  dateEffetAssurance?: string;

  // Statut
  statut?: string;
  dateValidation?: string;
  validePar?: number;
  motifRejet?: string;

  // Compte
  compteCree?: boolean;
  emailEnvoye?: boolean;
  dateEnvoiEmail?: string;

  // Affiliation
  affiliationId?: number;
  numAffiliation?: string;

  // Documents
  documentsDeposes?: boolean;
  dateDepotDocuments?: string;

  // Audit
  creePar?: number;
  dateCreation?: string;
  dateModification?: string;
  actif?: boolean;
}

export interface DossierATCTRequest {
  numSecuSociale?: string;
  nomFr: string;
  prenomFr: string;
  nomAr?: string;
  prenomAr?: string;
  dateNaissance?: string;
  lieuNaissanceFr?: string;
  sexe?: string;
  nationalite?: string;
  numCin?: string;
  numPasseport?: string;

  adresseTunisie?: string;
  codePostalTunisie?: string;
  villeTunisie?: string;

  adresseEtranger?: string;
  codePostalEtranger?: string;
  villeEtranger?: string;
  paysEtranger?: string;
  paysCode?: number;

  telephone?: string;
  email?: string;

  etablissementOrigine?: string;
  matriculeEmployeur?: number;
  cleEmployeur?: number;

  organismeEtranger?: string;
  missionPoste?: string;

  dateDebutDetachement: string;
  dateFinDetachement?: string;
  dateRenouvellement?: string;

  salaireTunisie?: number;
  salaireEtranger?: number;
  deviseEtranger?: string;
  salaireConvertiTnd?: number;

  modePaiement?: string;
  paiementAnticipe?: boolean;

  codeRegime?: string;

  assuranceMaladie?: boolean;
  capitalDeces?: boolean;
  dateEffetAssurance?: string;
}

export interface ATCTStats {
  total?: number;
  en_attente?: number;
  valides?: number;
  rejetes?: number;
  [key: string]: number | undefined;
}

@Injectable({
  providedIn: 'root'
})
export class AtctService {
  private apiUrl = `${environment.apiUrl}/atct`;

  constructor(private http: HttpClient) {}

  // Liste tous les dossiers ATCT
  getAll(): Observable<DossierATCT[]> {
    return this.http.get<DossierATCT[]>(this.apiUrl);
  }

  // Récupérer par ID
  getById(id: number): Observable<DossierATCT> {
    return this.http.get<DossierATCT>(`${this.apiUrl}/${id}`);
  }

  // Récupérer par statut
  getByStatut(statut: string): Observable<DossierATCT[]> {
    return this.http.get<DossierATCT[]>(`${this.apiUrl}/statut/${statut}`);
  }

  // Récupérer les dossiers en attente
  getEnAttente(): Observable<DossierATCT[]> {
    return this.http.get<DossierATCT[]>(`${this.apiUrl}/en-attente`);
  }

  // Récupérer les dossiers prêts pour affiliation
  getPourAffiliation(): Observable<DossierATCT[]> {
    return this.http.get<DossierATCT[]>(`${this.apiUrl}/pour-affiliation`);
  }

  // Recherche
  search(query: string): Observable<DossierATCT[]> {
    return this.http.get<DossierATCT[]>(`${this.apiUrl}/search`, {
      params: new HttpParams().set('q', query)
    });
  }

  // Statistiques
  getStats(): Observable<ATCTStats> {
    return this.http.get<ATCTStats>(`${this.apiUrl}/stats`);
  }

  // Créer un dossier ATCT
  create(dossier: DossierATCTRequest): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(this.apiUrl, dossier);
  }

  // Mettre à jour un dossier
  update(id: number, dossier: DossierATCTRequest): Observable<DossierATCT> {
    return this.http.put<DossierATCT>(`${this.apiUrl}/${id}`, dossier);
  }

  // Valider un dossier
  valider(id: number): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/valider`, null);
  }

  // Rejeter un dossier
  rejeter(id: number, motif: string): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/rejeter`, null, {
      params: new HttpParams().set('motif', motif)
    });
  }

  // Marquer documents déposés
  marquerDocumentsDeposes(id: number): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/documents-deposes`, null);
  }

  // Lier à une affiliation
  lierAffiliation(id: number, affiliationId: number, numAffiliation: string): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/lier-affiliation`, null, {
      params: new HttpParams()
        .set('affiliationId', affiliationId.toString())
        .set('numAffiliation', numAffiliation)
    });
  }

  // Supprimer (désactiver)
  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  // Envoyer email avec identifiants
  envoyerEmail(id: number): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/envoyer-email`, null);
  }

  // Envoyer rappel
  envoyerRappel(id: number): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/rappel`, null);
  }

  // Envoyer rappel avec PDF généré côté frontend
  envoyerRappelAvecPdf(id: number, pdfBase64: string): Observable<DossierATCT> {
    return this.http.post<DossierATCT>(`${this.apiUrl}/${id}/rappel-pdf`, { pdfBase64 });
  }

  // Générer PDF du dossier
  telechargerPdf(id: number): Observable<Blob> {
    return this.http.get(`${this.apiUrl}/${id}/pdf`, {
      responseType: 'blob'
    });
  }
}
