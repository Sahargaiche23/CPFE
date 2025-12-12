import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { MainLayoutComponent } from '../../../shared/layouts/main-layout/main-layout.component';
import { CooperantService, Cooperant } from '../../../core/services/cooperant.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'app-cooperant-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, MainLayoutComponent],
  templateUrl: './cooperant-detail.component.html',
  styles: []
})
export class CooperantDetailComponent implements OnInit {
  loading = true;
  cooperant: Cooperant | null = null;
  id: number | null = null;

  constructor(
    private route: ActivatedRoute,
    private cooperantService: CooperantService
  ) {}

  ngOnInit(): void {
    const idParam = this.route.snapshot.paramMap.get('id');
    if (idParam) {
      this.id = parseInt(idParam, 10);
      this.load();
    }
  }

  load() {
    if (!this.id) return;
    this.loading = true;
    this.cooperantService.getById(this.id).subscribe({
      next: (c) => {
        this.cooperant = c;
        this.loading = false;
      },
      error: (err) => {
        console.error('Erreur chargement détail:', err);
        this.loading = false;
      }
    });
  }

  getDownloadUrl(filePath: string): string {
    // Extraire juste le nom du fichier du chemin
    const filename = filePath.includes('/') ? filePath.split('/').pop() : filePath;
    return `${environment.apiUrl}/cooperants/${this.cooperant?.id}/files/${filename}`;
  }
}
