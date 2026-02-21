import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ExtractionResult {
  success: boolean;
  document_type: string;
  confidence: number;
  extracted_data: { [key: string]: any };
  raw_text: string;
  warnings: string[];
  document_id?: number;
  document_titre?: string;
  document_fichier?: string;
  error?: string;
}

export interface DocumentTypeInfo {
  id: string;
  label: string;
  label_ar: string;
}

export interface AiHealthStatus {
  status: string;
  tesseract_available?: boolean;
  version?: string;
  error?: string;
}

@Injectable({
  providedIn: 'root'
})
export class AiExtractionService {
  private apiUrl = '/api/ged';

  constructor(private http: HttpClient) {}

  /**
   * Extraire les données d'un document GED existant par son ID
   */
  extractFromDocument(documentId: number, documentType?: string): Observable<ExtractionResult> {
    const params: any = {};
    if (documentType) {
      params.documentType = documentType;
    }
    return this.http.post<ExtractionResult>(
      `${this.apiUrl}/documents/${documentId}/extract`, null, { params }
    );
  }

  /**
   * Extraire les données d'un fichier uploadé directement
   */
  extractFromFile(file: File, documentType?: string): Observable<ExtractionResult> {
    const formData = new FormData();
    formData.append('file', file);
    if (documentType) {
      formData.append('documentType', documentType);
    }
    return this.http.post<ExtractionResult>(`${this.apiUrl}/extract-file`, formData);
  }

  /**
   * Vérifier la santé du service AI
   */
  checkHealth(): Observable<AiHealthStatus> {
    return this.http.get<AiHealthStatus>(`${this.apiUrl}/ai/health`);
  }

  /**
   * Obtenir les types de documents supportés
   */
  getDocumentTypes(): Observable<{ types: DocumentTypeInfo[] }> {
    return this.http.get<{ types: DocumentTypeInfo[] }>(`${this.apiUrl}/ai/document-types`);
  }

  /**
   * Mapper le type de document GED tag vers le type AI extraction
   */
  mapTagToDocumentType(tag: string): string {
    const mapping: { [key: string]: string } = {
      'decision-affectation': 'decision_affectation',
      'contrat': 'contrat',
      'attestation-salaire': 'attestation_salaire',
      'cin': 'cin',
      'attestation-affiliation': 'attestation_affiliation',
      'autre-document': 'generic',
    };
    return mapping[tag] || 'generic';
  }

  /**
   * Obtenir le label français pour un champ extrait
   */
  getFieldLabel(field: string): string {
    const labels: { [key: string]: string } = {
      'numeroCIN': 'N° CIN',
      'nomPrenom': 'Nom & Prénom',
      'dateNaissance': 'Date de Naissance',
      'lieuNaissance': 'Lieu de Naissance',
      'adresse': 'Adresse',
      'salaire': 'Salaire',
      'employeur': 'Employeur',
      'nomEmploye': 'Nom Employé',
      'periode': 'Période',
      'matricule': 'Matricule',
      'nomCooperant': 'Nom Coopérant',
      'paysAffectation': 'Pays d\'Affectation',
      'organismeEtranger': 'Organisme Étranger',
      'dateDebut': 'Date Début',
      'dateFin': 'Date Fin',
      'codeRegime': 'Code Régime',
      'numAffiliation': 'N° Affiliation',
      'regime': 'Régime',
      'dateEffet': 'Date Effet',
      'dates_trouvees': 'Dates trouvées',
      'montants_trouves': 'Montants trouvés',
      'numeros_trouves': 'Numéros trouvés',
      'emails_trouves': 'Emails trouvés',
      'telephones_trouves': 'Téléphones trouvés',
    };
    return labels[field] || field;
  }
}
