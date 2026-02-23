import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { InstitutionService } from '../../services/institution.service';
import { AgentService } from '../../services/agent.service';
import { CotisationService } from '../../services/cotisation.service';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Tableau de bord</h2>
        <span class="text-sm text-gray-500">Mise en Disponibilité Spéciale - عدم المباشرة الخاصة</span>
      </div>

      <!-- Stats Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-md transition-shadow">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm text-gray-500">Institutions</p>
              <p class="text-3xl font-bold text-blue-700 mt-1">{{ institutionCount }}</p>
            </div>
            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
              <span class="material-icons text-blue-600">business</span>
            </div>
          </div>
          <a routerLink="/institutions" class="text-xs text-blue-600 hover:underline mt-3 block">Voir tout →</a>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-md transition-shadow">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm text-gray-500">Agents Publics</p>
              <p class="text-3xl font-bold text-green-700 mt-1">{{ agentCount }}</p>
            </div>
            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
              <span class="material-icons text-green-600">people</span>
            </div>
          </div>
          <a routerLink="/agents" class="text-xs text-green-600 hover:underline mt-3 block">Voir tout →</a>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-md transition-shadow">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm text-gray-500">Cotisations</p>
              <p class="text-3xl font-bold text-orange-700 mt-1">{{ cotisationCount }}</p>
            </div>
            <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center">
              <span class="material-icons text-orange-600">receipt_long</span>
            </div>
          </div>
          <a routerLink="/cotisations" class="text-xs text-orange-600 hover:underline mt-3 block">Voir tout →</a>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-md transition-shadow">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm text-gray-500">En attente</p>
              <p class="text-3xl font-bold text-red-700 mt-1">{{ enAttenteCount }}</p>
            </div>
            <div class="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center">
              <span class="material-icons text-red-600">pending_actions</span>
            </div>
          </div>
          <a routerLink="/cotisations" class="text-xs text-red-600 hover:underline mt-3 block">Traiter →</a>
        </div>
      </div>

      <!-- Quick Actions & Info -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
            <span class="material-icons text-blue-600">bolt</span> Actions rapides
          </h3>
          <div class="space-y-3">
            <a routerLink="/institutions" class="flex items-center gap-3 p-3 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors cursor-pointer">
              <span class="material-icons text-blue-600">add_business</span>
              <span class="text-sm font-medium text-blue-800">Enregistrer une institution</span>
            </a>
            <a routerLink="/agents" class="flex items-center gap-3 p-3 bg-green-50 rounded-lg hover:bg-green-100 transition-colors cursor-pointer">
              <span class="material-icons text-green-600">person_add</span>
              <span class="text-sm font-medium text-green-800">Inscrire un agent public</span>
            </a>
            <a routerLink="/cotisations" class="flex items-center gap-3 p-3 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors cursor-pointer">
              <span class="material-icons text-orange-600">calculate</span>
              <span class="text-sm font-medium text-orange-800">Générer les cotisations trimestrielles</span>
            </a>
            <a routerLink="/paiements" class="flex items-center gap-3 p-3 bg-rose-50 rounded-lg hover:bg-rose-100 transition-colors cursor-pointer">
              <span class="material-icons text-rose-600">payments</span>
              <span class="text-sm font-medium text-rose-800">Enregistrer un paiement</span>
            </a>
          </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
            <span class="material-icons text-blue-600">info</span> À propos
          </h3>
          <div class="space-y-3 text-sm text-gray-600">
            <p>Application de gestion de la <strong>Mise en Disponibilité Spéciale</strong> conformément à la <strong>Loi n°16 de 2003</strong>.</p>
            <div class="bg-blue-50 p-3 rounded-lg">
              <p class="font-medium text-blue-800 mb-1">Codes de cotisation :</p>
              <ul class="space-y-1 text-blue-700">
                <li>• <strong>Code 137</strong> : Part patronale (17.07%)</li>
                <li>• <strong>Code 138</strong> : Part ouvrière (9.68%)</li>
              </ul>
            </div>
            <div class="bg-gray-50 p-3 rounded-lg">
              <p class="font-medium text-gray-800 mb-1">Formule trimestrielle :</p>
              <p class="text-gray-700 font-mono text-xs">Cotisation = Salaire × 3 mois × Taux</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
})
export class DashboardComponent implements OnInit {
  institutionCount = 0;
  agentCount = 0;
  cotisationCount = 0;
  enAttenteCount = 0;

  constructor(
    private institutionService: InstitutionService,
    private agentService: AgentService,
    private cotisationService: CotisationService
  ) {}

  ngOnInit(): void {
    this.institutionService.findAll().subscribe(d => this.institutionCount = d.length);
    this.agentService.findAll().subscribe(d => this.agentCount = d.length);
    this.cotisationService.findAll().subscribe(d => {
      this.cotisationCount = d.length;
      this.enAttenteCount = d.filter(c => c.statut === 'EN_ATTENTE').length;
    });
  }
}
