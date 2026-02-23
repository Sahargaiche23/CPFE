import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { InstitutionService, Institution } from '../../services/institution.service';
import { AgentService, AgentPublic } from '../../services/agent.service';

@Component({
  selector: 'app-institution-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="space-y-6" *ngIf="institution">
      <div class="flex items-center gap-3">
        <a routerLink="/institutions" class="text-gray-400 hover:text-blue-600"><span class="material-icons">arrow_back</span></a>
        <h2 class="text-2xl font-bold text-gray-900">{{ institution.raisonSociale }}</h2>
        <span class="px-2 py-0.5 rounded-full text-xs font-medium" [class]="institution.actif ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'">
          {{ institution.actif ? 'Actif' : 'Inactif' }}
        </span>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 lg:col-span-1">
          <h3 class="text-lg font-semibold mb-4">Informations</h3>
          <div class="space-y-3 text-sm">
            <div><span class="text-gray-500">N° Affiliation :</span><br><span class="font-mono font-medium text-blue-700">{{ institution.numAffiliation }}/{{ institution.brancheSociale }}</span></div>
            <div><span class="text-gray-500">Adresse :</span><br><span class="font-medium">{{ institution.adresse }}</span></div>
            <div><span class="text-gray-500">Gouvernorat :</span><br><span class="font-medium">{{ institution.gouvernorat }}</span></div>
            <div><span class="text-gray-500">Téléphone :</span><br><span class="font-medium">{{ institution.telephone }}</span></div>
            <div><span class="text-gray-500">Email :</span><br><span class="font-medium">{{ institution.email }}</span></div>
          </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 lg:col-span-2">
          <h3 class="text-lg font-semibold mb-4">Agents rattachés ({{ agents.length }})</h3>
          <table class="w-full text-sm" *ngIf="agents.length > 0">
            <thead class="bg-gray-50 border-b">
              <tr>
                <th class="text-left px-3 py-2 font-medium text-gray-600">N° Inscription</th>
                <th class="text-left px-3 py-2 font-medium text-gray-600">Nom & Prénom</th>
                <th class="text-left px-3 py-2 font-medium text-gray-600">CIN</th>
                <th class="text-right px-3 py-2 font-medium text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let a of agents" class="border-b border-gray-100 hover:bg-blue-50/30">
                <td class="px-3 py-2 font-mono text-blue-700">{{ a.numInscription }}</td>
                <td class="px-3 py-2 font-medium">{{ a.prenomFr }} {{ a.nomFr }}</td>
                <td class="px-3 py-2 text-gray-600">{{ a.cin }}</td>
                <td class="px-3 py-2 text-right">
                  <a [routerLink]="['/agents', a.id]" class="text-blue-600 hover:text-blue-800">
                    <span class="material-icons text-base">visibility</span>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
          <p *ngIf="agents.length === 0" class="text-gray-400 text-center py-8">Aucun agent rattaché</p>
        </div>
      </div>
    </div>
  `
})
export class InstitutionDetailComponent implements OnInit {
  institution: Institution | null = null;
  agents: AgentPublic[] = [];

  constructor(
    private route: ActivatedRoute,
    private institutionService: InstitutionService,
    private agentService: AgentService
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.institutionService.findById(id).subscribe(data => this.institution = data);
    this.agentService.findByInstitution(id).subscribe(data => this.agents = data);
  }
}
