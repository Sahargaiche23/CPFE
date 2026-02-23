import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TauxService, TauxCotisation } from '../../services/taux.service';

@Component({
  selector: 'app-taux-list',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="space-y-6">
      <div class="flex items-center justify-between">
        <h2 class="text-2xl font-bold text-gray-900">Taux de Cotisation</h2>
        <span class="text-sm text-gray-500">Loi n°16 de 2003 - عدم المباشرة الخاصة</span>
      </div>

      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <div class="mb-4">
          <h3 class="text-lg font-semibold text-gray-900">Historique des taux</h3>
          <p class="text-sm text-gray-500 mt-1">Évolution des taux de cotisation depuis 2007</p>
        </div>

        <div class="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
          <div class="grid grid-cols-2 gap-4 text-sm">
            <div>
              <p class="font-medium text-blue-800">Code 137 - Part patronale</p>
              <p class="text-blue-600">Cotisation à la charge de l'institution</p>
            </div>
            <div>
              <p class="font-medium text-blue-800">Code 138 - Part ouvrière</p>
              <p class="text-blue-600">Cotisation à la charge de l'agent public</p>
            </div>
          </div>
        </div>

        <table class="w-full text-sm">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="text-left px-4 py-3 font-medium text-gray-600">Période</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Code 137 (%)</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Code 138 (%)</th>
              <th class="text-right px-4 py-3 font-medium text-gray-600">Total (%)</th>
              <th class="text-center px-4 py-3 font-medium text-gray-600">Statut</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let t of taux" class="border-b border-gray-100 hover:bg-blue-50/30">
              <td class="px-4 py-3">
                <span class="font-medium">{{ t.dateDebut }}</span>
                <span class="text-gray-400 mx-1">→</span>
                <span class="font-medium">{{ t.dateFin || 'En cours' }}</span>
              </td>
              <td class="px-4 py-3 text-right font-mono font-medium text-blue-700">{{ t.tauxCode137 }}%</td>
              <td class="px-4 py-3 text-right font-mono font-medium text-rose-700">{{ t.tauxCode138 }}%</td>
              <td class="px-4 py-3 text-right font-mono font-bold">{{ t.tauxCode137 + t.tauxCode138 }}%</td>
              <td class="px-4 py-3 text-center">
                <span *ngIf="!t.dateFin" class="px-2 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-700">Actif</span>
                <span *ngIf="t.dateFin" class="px-2 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-500">Expiré</span>
              </td>
            </tr>
            <tr *ngIf="taux.length === 0">
              <td colspan="5" class="px-4 py-8 text-center text-gray-400">Aucun taux configuré</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-lg font-semibold text-gray-900 mb-3">Formule de calcul</h3>
        <div class="bg-gray-50 rounded-lg p-4 space-y-2 text-sm">
          <p class="font-mono"><strong>Cotisation trimestrielle</strong> = Salaire mensuel × 3 × Taux</p>
          <p class="text-gray-500">Exemple : 1 200.000 DT × 3 × 17.07% = <strong>614.520 DT</strong> (Code 137)</p>
          <p class="text-gray-500">Exemple : 1 200.000 DT × 3 × 9.68% = <strong>348.480 DT</strong> (Code 138)</p>
        </div>
      </div>
    </div>
  `
})
export class TauxListComponent implements OnInit {
  taux: TauxCotisation[] = [];

  constructor(private service: TauxService) {}

  ngOnInit(): void {
    this.service.findAll().subscribe(data => this.taux = data);
  }
}
