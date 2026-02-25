import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class GedSharedDataService {
  pendingFiles: { file: File; type: string }[] = [];
  extractedSalary: { salaire?: string; dateEffet?: string; periode?: string } = {};
  agentNumInscription = '';

  hasPendingFiles(): boolean {
    return this.pendingFiles.length > 0;
  }

  clear(): void {
    this.pendingFiles = [];
    this.extractedSalary = {};
    this.agentNumInscription = '';
  }
}
