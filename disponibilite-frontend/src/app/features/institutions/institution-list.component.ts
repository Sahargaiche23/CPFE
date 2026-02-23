import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { InstitutionService, Institution } from '../../services/institution.service';

@Component({
  selector: 'app-institution-list',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Institutions</h2>
        <button (click)="showForm = !showForm"
                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 text-sm font-medium">
          <span class="material-icons text-base">add</span> Nouvelle institution
        </button>
      </div>

      <!-- Form -->
      <div *ngIf="showForm" class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-lg font-semibold mb-4">{{ editing ? 'Modifier' : 'Ajouter' }} une institution</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">N° Affiliation</label>
            <input [(ngModel)]="form.numAffiliation" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Branche Sociale</label>
            <input [(ngModel)]="form.brancheSociale" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Raison Sociale</label>
            <input [(ngModel)]="form.raisonSociale" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Adresse</label>
            <input [(ngModel)]="form.adresse" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Téléphone</label>
            <input [(ngModel)]="form.telephone" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input [(ngModel)]="form.email" type="email" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Gouvernorat</label>
            <input [(ngModel)]="form.gouvernorat" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
        </div>
        <div class="flex gap-3 mt-4">
          <button (click)="save()" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium">
            {{ editing ? 'Mettre à jour' : 'Enregistrer' }}
          </button>
          <button (click)="cancel()" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 text-sm font-medium">Annuler</button>
        </div>
      </div>

      <!-- Search -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <input [(ngModel)]="searchQuery" (input)="onSearch()" placeholder="Rechercher par raison sociale..."
               class="w-full border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
      </div>

      <!-- Table -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <table class="w-full text-sm">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="text-left px-4 py-3 font-medium text-gray-600">N° Affiliation</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Raison Sociale</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Gouvernorat</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Téléphone</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Statut</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let inst of institutions" class="border-b border-gray-100 hover:bg-blue-50/30">
              <td class="px-4 py-3 font-mono text-blue-700">{{ inst.numAffiliation }}/{{ inst.brancheSociale }}</td>
              <td class="px-4 py-3 font-medium">{{ inst.raisonSociale }}</td>
              <td class="px-4 py-3 text-gray-600">{{ inst.gouvernorat }}</td>
              <td class="px-4 py-3 text-gray-600">{{ inst.telephone }}</td>
              <td class="px-4 py-3">
                <span [class]="inst.actif ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'"
                      class="px-2 py-0.5 rounded-full text-xs font-medium">
                  {{ inst.actif ? 'Actif' : 'Inactif' }}
                </span>
              </td>
              <td class="px-4 py-3 text-right">
                <a [routerLink]="['/institutions', inst.id]" class="text-blue-600 hover:text-blue-800 mr-2">
                  <span class="material-icons text-base">visibility</span>
                </a>
                <button (click)="edit(inst)" class="text-gray-500 hover:text-blue-600">
                  <span class="material-icons text-base">edit</span>
                </button>
              </td>
            </tr>
            <tr *ngIf="institutions.length === 0">
              <td colspan="6" class="px-4 py-8 text-center text-gray-400">Aucune institution trouvée</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `
})
export class InstitutionListComponent implements OnInit {
  institutions: Institution[] = [];
  showForm = false;
  editing = false;
  editingId: number | null = null;
  searchQuery = '';
  form: Institution = this.emptyForm();

  constructor(private service: InstitutionService) {}

  ngOnInit(): void {
    this.load();
  }

  load(): void {
    this.service.findAll().subscribe(data => this.institutions = data);
  }

  onSearch(): void {
    if (this.searchQuery.trim()) {
      this.service.search(this.searchQuery).subscribe(data => this.institutions = data);
    } else {
      this.load();
    }
  }

  save(): void {
    if (this.editing && this.editingId) {
      this.service.update(this.editingId, this.form).subscribe(() => { this.cancel(); this.load(); });
    } else {
      this.service.create(this.form).subscribe(() => { this.cancel(); this.load(); });
    }
  }

  edit(inst: Institution): void {
    this.form = { ...inst };
    this.editingId = inst.id || null;
    this.editing = true;
    this.showForm = true;
  }

  cancel(): void {
    this.form = this.emptyForm();
    this.editing = false;
    this.editingId = null;
    this.showForm = false;
  }

  private emptyForm(): Institution {
    return { numAffiliation: '', brancheSociale: '', raisonSociale: '', adresse: '', telephone: '', email: '', gouvernorat: '', actif: true };
  }
}
