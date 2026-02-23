import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AgentService, AgentPublic } from '../../services/agent.service';
import { CotisationService, Cotisation } from '../../services/cotisation.service';

@Component({
  selector: 'app-agent-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  template: `
    <div class="space-y-6" *ngIf="agent">
      <div class="flex items-center gap-3">
        <a routerLink="/agents" class="text-gray-400 hover:text-blue-600"><span class="material-icons">arrow_back</span></a>
        <h2 class="text-2xl font-bold text-gray-900">{{ agent.prenomFr }} {{ agent.nomFr }}</h2>
        <span class="text-sm text-gray-500 font-mono">({{ agent.numInscription }})</span>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Info Card -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <h3 class="text-lg font-semibold mb-4">Informations personnelles</h3>
          <div class="space-y-3 text-sm">
            <div><span class="text-gray-500">N° Inscription :</span><br><span class="font-mono font-medium text-blue-700">{{ agent.numInscription }}</span></div>
            <div><span class="text-gray-500">Code Exploitation :</span><br><span class="font-medium">{{ agent.codeExploitation }}</span></div>
            <div><span class="text-gray-500">Nom (AR) :</span><br><span class="font-medium" dir="rtl">{{ agent.prenom }} {{ agent.nom }}</span></div>
            <div><span class="text-gray-500">Nom (FR) :</span><br><span class="font-medium">{{ agent.prenomFr }} {{ agent.nomFr }}</span></div>
            <div><span class="text-gray-500">Date de naissance :</span><br><span class="font-medium">{{ agent.dateNaissance }}</span></div>
            <div><span class="text-gray-500">CIN :</span><br><span class="font-medium">{{ agent.cin }}</span></div>
            <div><span class="text-gray-500">Adresse :</span><br><span class="font-medium">{{ agent.adresse }}</span></div>
            <div><span class="text-gray-500">Téléphone :</span><br><span class="font-medium">{{ agent.telephone }}</span></div>
            <div><span class="text-gray-500">Email :</span><br><span class="font-medium">{{ agent.email }}</span></div>
            <div><span class="text-gray-500">Institution :</span><br><span class="font-medium">{{ agent.institution?.raisonSociale || '-' }}</span></div>
          </div>
        </div>

        <!-- Cotisations -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 lg:col-span-2">
          <h3 class="text-lg font-semibold mb-4">Cotisations ({{ cotisations.length }})</h3>
          <table class="w-full text-sm" *ngIf="cotisations.length > 0">
            <thead class="bg-gray-50 border-b">
              <tr>
                <th class="text-left px-3 py-2 font-medium text-gray-600">Période</th>
                <th class="text-right px-3 py-2 font-medium text-gray-600">Code 137</th>
                <th class="text-right px-3 py-2 font-medium text-gray-600">Code 138</th>
                <th class="text-right px-3 py-2 font-medium text-gray-600">Total</th>
                <th class="text-center px-3 py-2 font-medium text-gray-600">Statut</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let c of cotisations" class="border-b border-gray-100">
                <td class="px-3 py-2">T{{ c.trimestre }}/{{ c.annee }}</td>
                <td class="px-3 py-2 text-right font-mono">{{ c.montantCode137 | number:'1.3-3' }}</td>
                <td class="px-3 py-2 text-right font-mono">{{ c.montantCode138 | number:'1.3-3' }}</td>
                <td class="px-3 py-2 text-right font-mono font-medium">{{ c.montantTotal | number:'1.3-3' }}</td>
                <td class="px-3 py-2 text-center">
                  <span class="px-2 py-0.5 rounded-full text-xs font-medium"
                        [class]="c.statut === 'PAYE' ? 'bg-green-100 text-green-700' : c.statut === 'PARTIELLEMENT_PAYE' ? 'bg-yellow-100 text-yellow-700' : 'bg-red-100 text-red-700'">
                    {{ c.statut }}
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
          <p *ngIf="cotisations.length === 0" class="text-gray-400 text-center py-8">Aucune cotisation</p>
        </div>
      </div>
    </div>
  `
})
export class AgentDetailComponent implements OnInit {
  agent: AgentPublic | null = null;
  cotisations: Cotisation[] = [];

  constructor(
    private route: ActivatedRoute,
    private agentService: AgentService,
    private cotisationService: CotisationService
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.agentService.findById(id).subscribe(data => this.agent = data);
    this.cotisationService.findByAgent(id).subscribe(data => this.cotisations = data);
  }
}
