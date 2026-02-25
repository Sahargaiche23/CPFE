import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface DocumentGed {
  id?: number;
  agentPublic?: any;
  typeDocument: string;
  nomFichier: string;
  cheminFichier?: string;
  contentType?: string;
  taille?: number;
  createdAt?: string;
}

export interface ExtractionResult {
  success: boolean;
  document_type: string;
  confidence: number;
  extracted_data: { [key: string]: any };
  raw_text: string;
  warnings: string[];
}

@Injectable({ providedIn: 'root' })
export class DocumentService {
  private api = `${environment.apiUrl}/api/disponibilite/documents`;
  private aiApi = 'http://localhost:8090';

  constructor(private http: HttpClient) {}

  findByAgent(agentId: number): Observable<DocumentGed[]> {
    return this.http.get<DocumentGed[]>(`${this.api}/agent/${agentId}`);
  }

  upload(agentId: number, typeDocument: string, file: File): Observable<DocumentGed> {
    const formData = new FormData();
    formData.append('agentId', agentId.toString());
    formData.append('typeDocument', typeDocument);
    formData.append('file', file);
    return this.http.post<DocumentGed>(`${this.api}/upload`, formData);
  }

  download(id: number): Observable<Blob> {
    return this.http.get(`${this.api}/${id}/download`, { responseType: 'blob' });
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.api}/${id}`);
  }

  extractFromFile(file: File, documentType?: string): Observable<ExtractionResult> {
    const formData = new FormData();
    formData.append('file', file);
    if (documentType) {
      formData.append('document_type', documentType);
    }
    return this.http.post<ExtractionResult>(`${this.aiApi}/extract`, formData);
  }
}
