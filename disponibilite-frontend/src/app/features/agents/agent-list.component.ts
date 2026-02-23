import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AgentService, AgentPublic } from '../../services/agent.service';
import { InstitutionService, Institution } from '../../services/institution.service';

@Component({
  selector: 'app-agent-list',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Agents Publics</h2>
        <button (click)="showForm = !showForm"
                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 flex items-center gap-2 text-sm font-medium">
          <span class="material-icons text-base">person_add</span> Nouvel agent
        </button>
      </div>

      <!-- Form -->
      <div *ngIf="showForm" class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-lg font-semibold mb-4">{{ editing ? 'Modifier' : 'Inscrire' }} un agent public</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">N° Inscription</label>
            <input [(ngModel)]="form.numInscription" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Code Exploitation</label>
            <input [(ngModel)]="form.codeExploitation" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">اسم (Nom AR)</label>
            <input [(ngModel)]="form.nom" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500" dir="rtl">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">لقب (Prénom AR)</label>
            <input [(ngModel)]="form.prenom" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500" dir="rtl">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Nom (FR)</label>
            <input [(ngModel)]="form.nomFr" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Prénom (FR)</label>
            <input [(ngModel)]="form.prenomFr" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Date de naissance</label>
            <input [(ngModel)]="form.dateNaissance" type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">CIN</label>
            <input [(ngModel)]="form.cin" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Téléphone</label>
            <input [(ngModel)]="form.telephone" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input [(ngModel)]="form.email" type="email" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div class="md:col-span-2">
            <label class="block text-sm font-medium text-gray-700 mb-1">Adresse</label>
            <input [(ngModel)]="form.adresse" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Institution</label>
            <select [(ngModel)]="selectedInstitutionId" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
              <option [ngValue]="null">-- Sélectionner --</option>
              <option *ngFor="let inst of institutions" [ngValue]="inst.id">{{ inst.raisonSociale }}</option>
            </select>
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
        <input [(ngModel)]="searchQuery" (input)="onSearch()" placeholder="Rechercher par nom ou prénom..."
               class="w-full border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
      </div>

      <!-- Table -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <table class="w-full text-sm">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="text-left px-4 py-3 font-medium text-gray-600">N° Inscription</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Nom & Prénom (FR)</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">CIN</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Institution</th>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Statut</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let a of agents" class="border-b border-gray-100 hover:bg-blue-50/30">
              <td class="px-4 py-3 font-mono text-blue-700">{{ a.numInscription }}</td>
              <td class="px-4 py-3 font-medium">{{ a.prenomFr }} {{ a.nomFr }}</td>
              <td class="px-4 py-3 text-gray-600">{{ a.cin }}</td>
              <td class="px-4 py-3 text-gray-600">{{ a.institution?.raisonSociale || '-' }}</td>
              <td class="px-4 py-3">
                <span [class]="a.actif ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'"
                      class="px-2 py-0.5 rounded-full text-xs font-medium">{{ a.actif ? 'Actif' : 'Inactif' }}</span>
              </td>
              <td class="px-4 py-3 text-right">
                <a [routerLink]="['/agents', a.id]" class="text-blue-600 hover:text-blue-800 mr-2">
                  <span class="material-icons text-base">visibility</span>
                </a>
                <button (click)="edit(a)" class="text-gray-500 hover:text-blue-600">
                  <span class="material-icons text-base">edit</span>
                </button>
              </td>
            </tr>
            <tr *ngIf="agents.length === 0">
              <td colspan="6" class="px-4 py-8 text-center text-gray-400">Aucun agent trouvé</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `
})
export class AgentListComponent implements OnInit {
  agents: AgentPublic[] = [];
  institutions: Institution[] = [];
  showForm = false;
  editing = false;
  editingId: number | null = null;
  searchQuery = '';
  selectedInstitutionId: number | null = null;
  form: AgentPublic = this.emptyForm();

  constructor(private service: AgentService, private instService: InstitutionService) {}

  ngOnInit(): void {
    this.load();
    this.instService.findAll().subscribe(data => this.institutions = data);
  }

  load(): void {
    this.service.findAll().subscribe(data => this.agents = data);
  }

  onSearch(): void {
    if (this.searchQuery.trim()) {
      this.service.search(this.searchQuery).subscribe(data => this.agents = data);
    } else {
      this.load();
    }
  }

  save(): void {
    const payload: any = { ...this.form };
    if (this.selectedInstitutionId) {
      payload.institution = { id: this.selectedInstitutionId };
    }
    if (this.editing && this.editingId) {
      this.service.update(this.editingId, payload).subscribe(() => { this.cancel(); this.load(); });
    } else {
      this.service.create(payload).subscribe(() => { this.cancel(); this.load(); });
    }
  }

  edit(agent: AgentPublic): void {
    this.form = { ...agent };
    this.editingId = agent.id || null;
    this.selectedInstitutionId = agent.institution?.id || null;
    this.editing = true;
    this.showForm = true;
  }

  cancel(): void {
    this.form = this.emptyForm();
    this.editing = false;
    this.editingId = null;
    this.selectedInstitutionId = null;
    this.showForm = false;
  }

  private emptyForm(): AgentPublic {
    return { numInscription: '', codeExploitation: '', nom: '', prenom: '', nomFr: '', prenomFr: '', dateNaissance: '', cin: '', adresse: '', email: '', telephone: '', actif: true };
  }
}
