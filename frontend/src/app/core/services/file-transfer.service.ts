import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FileTransferService {
  private pendingFiles: File[] = [];

  setFiles(files: File[]): void {
    this.pendingFiles = files;
  }

  getFiles(): File[] {
    return this.pendingFiles;
  }

  clearFiles(): void {
    this.pendingFiles = [];
  }

  hasFiles(): boolean {
    return this.pendingFiles.length > 0;
  }
}
