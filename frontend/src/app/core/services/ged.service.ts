import { Injectable } from '@angular/core';
import { HttpClient, HttpEvent, HttpEventType, HttpRequest } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { map } from 'rxjs/operators';

export interface GedDocument {
  id: number;
  titre: string;
  description?: string;
  fichierNom: string;
  fichierType: string;
  fichierTaille: number;
  tags: string[];
  categorie: string;
  dateCreation: string;
  dateModification?: string;
  creePar: string;
  cheminFichier?: string;
  parentId?: number;
}

export interface GedTag {
  id: number;
  nom: string;
  couleur: string;
  count?: number;
}

export interface GedActivite {
  id: number;
  type: 'CREATION' | 'MODIFICATION' | 'SUPPRESSION' | 'TELECHARGEMENT';
  documentId?: number;
  documentTitre?: string;
  utilisateur: string;
  dateActivite: string;
  details?: string;
}

@Injectable({
  providedIn: 'root'
})
export class GedService {
  private apiUrl = '/api/ged';
  
  private documentsSubject = new BehaviorSubject<GedDocument[]>([]);
  documents$ = this.documentsSubject.asObservable();

  constructor(private http: HttpClient) {}

  // Documents
  getDocuments(searchTerm?: string, categorie?: string, tags?: string[]): Observable<GedDocument[]> {
    let params: any = {};
    if (searchTerm) params.search = searchTerm;
    if (categorie) params.categorie = categorie;
    if (tags && tags.length) params.tags = tags.join(',');
    
    return this.http.get<GedDocument[]>(`${this.apiUrl}/documents`, { params });
  }

  getDocumentById(id: number): Observable<GedDocument> {
    return this.http.get<GedDocument>(`${this.apiUrl}/documents/${id}`);
  }

  uploadDocument(file: File, metadata: Partial<GedDocument>): Observable<number> {
    const formData = new FormData();
    formData.append('file', file);
    formData.append('titre', metadata.titre || file.name);
    formData.append('description', metadata.description || '');
    formData.append('categorie', metadata.categorie || 'AUTRE');
    formData.append('tags', JSON.stringify(metadata.tags || []));

    const req = new HttpRequest('POST', `${this.apiUrl}/documents/upload`, formData, {
      reportProgress: true
    });

    return this.http.request(req).pipe(
      map((event: HttpEvent<any>) => {
        switch (event.type) {
          case HttpEventType.UploadProgress:
            return event.total ? Math.round(100 * event.loaded / event.total) : 0;
          case HttpEventType.Response:
            return 100;
          default:
            return 0;
        }
      })
    );
  }

  uploadDocumentSimple(file: File, metadata: Partial<GedDocument>): Observable<GedDocument> {
    const formData = new FormData();
    formData.append('file', file);
    formData.append('titre', metadata.titre || file.name);
    formData.append('description', metadata.description || '');
    formData.append('categorie', metadata.categorie || 'AUTRE');
    formData.append('tags', JSON.stringify(metadata.tags || []));
    if (metadata.parentId) {
      formData.append('parentId', String(metadata.parentId));
    }
    return this.http.post<GedDocument>(`${this.apiUrl}/documents/upload`, formData);
  }

  createFolder(titre: string, metadata: Partial<GedDocument>): Observable<GedDocument> {
    const formData = new FormData();
    formData.append('titre', titre);
    formData.append('description', metadata.description || '');
    formData.append('categorie', metadata.categorie || 'AUTRE');
    formData.append('tags', JSON.stringify(metadata.tags || []));
    return this.http.post<GedDocument>(`${this.apiUrl}/documents/create-folder`, formData);
  }

  getChildren(parentId: number): Observable<GedDocument[]> {
    return this.http.get<GedDocument[]>(`${this.apiUrl}/documents/${parentId}/children`);
  }

  deleteDocument(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/documents/${id}`);
  }

  updateDocument(id: number, updates: Partial<GedDocument>): Observable<GedDocument> {
    return this.http.put<GedDocument>(`${this.apiUrl}/documents/${id}`, updates);
  }

  downloadDocument(id: number): Observable<Blob> {
    return this.http.get(`${this.apiUrl}/documents/${id}/download`, { responseType: 'blob' });
  }

  downloadDocumentAsZip(id: number): Observable<Blob> {
    return this.http.get(`${this.apiUrl}/documents/${id}/download-zip`, { responseType: 'blob' });
  }

  exportDocumentAsPdf(id: number, options: { metadata?: boolean; comments?: boolean; margin?: number } = {}): Observable<Blob> {
    const params: any = {};
    if (options.metadata !== undefined) params.metadata = options.metadata;
    if (options.comments !== undefined) params.comments = options.comments;
    if (options.margin !== undefined) params.margin = options.margin;
    
    return this.http.get(`${this.apiUrl}/documents/${id}/export-pdf`, { responseType: 'blob', params });
  }

  // Tags
  getTags(): Observable<GedTag[]> {
    return this.http.get<GedTag[]>(`${this.apiUrl}/tags`);
  }

  createTag(tag: Partial<GedTag>): Observable<GedTag> {
    return this.http.post<GedTag>(`${this.apiUrl}/tags`, tag);
  }

  deleteTag(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/tags/${id}`);
  }

  // Activités
  getActivites(limit: number = 10): Observable<GedActivite[]> {
    return this.http.get<GedActivite[]>(`${this.apiUrl}/activites`, { params: { limit: limit.toString() } });
  }

  // Stats
  getStats(): Observable<{ totalDocuments: number; totalTaille: number; parCategorie: any }> {
    return this.http.get<any>(`${this.apiUrl}/stats`);
  }
}
