import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AgentService, AgentPublic } from '../../services/agent.service';
import { InstitutionService } from '../../services/institution.service';
import { SalaireService, Salaire } from '../../services/salaire.service';

@Component({
  selector: 'app-salaire-update',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="material-icons">payments</span>
          <div>
            <h2 class="font-bold text-lg">عدم المباشرة الخاصة</h2>
            <p class="text-rose-200 text-sm">الأجور - Salaires</p>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <button (click)="save()" class="p-2 bg-green-600 hover:bg-green-500 rounded" title="حفظ">
            <span class="material-icons">save</span>
          </button>
          <button (click)="searchInstitution()" class="p-2 bg-blue-600 hover:bg-blue-500 rounded" title="بحث">
            <span class="material-icons">search</span>
          </button>
        </div>
      </div>

      <!-- Institution Section -->
      <div class="p-6 border-b border-gray-200">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-icons text-rose-600">business</span>
          <h3 class="font-bold text-gray-800">المؤسسة المشغلة</h3>
          <span class="text-gray-400 text-sm">/ Institution Employeur</span>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">رقم الانخراط / N° Affiliation</label>
            <input [(ngModel)]="institution.numAffiliation" (blur)="searchInstitution()"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الشعبة الاجتماعية / Branche Sociale</label>
            <input [(ngModel)]="institution.brancheSociale"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الاسم / Raison Sociale</label>
            <input [(ngModel)]="institution.raisonSociale" readonly
                   class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
        </div>
      </div>

      <!-- Agents List Section -->
      <div class="p-6 border-b border-gray-200" *ngIf="agents.length > 0">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-icons text-rose-600">people</span>
          <h3 class="font-bold text-gray-800">الأعوان العموميون</h3>
          <span class="text-gray-400 text-sm">/ Agents Publics</span>
        </div>
        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-rose-50">
              <tr>
                <th class="px-4 py-2 text-right font-medium text-rose-800 border-b">رقم التسجيل</th>
                <th class="px-4 py-2 text-right font-medium text-rose-800 border-b">الاسم واللقب</th>
                <th class="px-4 py-2 text-right font-medium text-rose-800 border-b">تاريخ الإلحاق</th>
                <th class="px-4 py-2 text-center font-medium text-rose-800 border-b">اختيار</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let agent of agents" 
                  [class.bg-green-100]="selectedAgent?.id === agent.id"
                  class="border-b border-gray-100 hover:bg-rose-50/50 cursor-pointer"
                  (click)="selectAgent(agent)">
                <td class="px-4 py-2">{{ agent.numInscription }}</td>
                <td class="px-4 py-2">{{ agent.prenom }} {{ agent.nom }}</td>
                <td class="px-4 py-2">{{ agent.dateDebutIlhaq }}</td>
                <td class="px-4 py-2 text-center">
                  <span *ngIf="selectedAgent?.id === agent.id" class="material-icons text-green-600">check_circle</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Selected Agent Info - Old Style Fields -->
      <div class="p-6 border-b border-gray-200" *ngIf="selectedAgent">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-icons text-rose-600">person</span>
          <h3 class="font-bold text-gray-800">العون العمومي</h3>
          <span class="text-gray-400 text-sm">/ Agent Public</span>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">المؤسسة المشغلة / Institution</label>
            <div class="flex gap-2">
              <input [value]="institution.numAffiliation" readonly class="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
              <input [value]="institution.brancheSociale" readonly class="w-20 border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الشعبة الاجتماعية</label>
            <input [value]="institution.raisonSociale" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">رقم التسجيل / N° Inscription</label>
            <input [value]="selectedAgent.numInscription" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الاسم واللقب / Nom & Prénom</label>
            <input [value]="(selectedAgent.prenom || '') + ' ' + (selectedAgent.nom || '')" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 text-right bg-gray-50">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">تاريخ الإلحاق / Date Ilhaq</label>
            <input [value]="selectedAgent.dateDebutIlhaq" type="date" readonly class="w-full border border-gray-200 rounded-lg px-3 py-2 bg-gray-50">
          </div>
        </div>
      </div>

      <!-- Salaires Section -->
      <div class="p-6" *ngIf="selectedAgent">
        <div class="flex items-center justify-between mb-4">
          <div class="flex items-center gap-2">
            <span class="material-icons text-green-600">monetization_on</span>
            <h3 class="font-bold text-gray-800">الأجور</h3>
            <span class="text-gray-400 text-sm">/ Salaires</span>
          </div>
          <button (click)="addSalaire()" class="px-3 py-1.5 bg-green-100 text-green-700 rounded-lg hover:bg-green-200 text-sm flex items-center gap-1">
            <span class="material-icons text-sm">add</span>
            إضافة أجر
          </button>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-green-50">
              <tr>
                <th class="px-4 py-3 text-right font-medium text-green-800 border-b">الأجر الشهري<br><span class="text-xs text-gray-500">Salaire Mensuel (DT)</span></th>
                <th class="px-4 py-3 text-right font-medium text-green-800 border-b">تاريخ الفاعلية<br><span class="text-xs text-gray-500">Date d'effet</span></th>
                <th class="px-4 py-3 text-center font-medium text-green-800 border-b">إجراءات</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let s of salaires; let i = index" class="border-b border-gray-100 hover:bg-green-50/30">
                <td class="px-4 py-2">
                  <input [(ngModel)]="s.salaireMensuel" type="number" step="0.001"
                         class="w-full border border-gray-300 rounded px-3 py-2 text-right">
                </td>
                <td class="px-4 py-2">
                  <input [(ngModel)]="s.dateEffet" type="date"
                         class="w-full border border-gray-300 rounded px-3 py-2">
                </td>
                <td class="px-4 py-2 text-center">
                  <button (click)="removeSalaire(i)" class="text-red-500 hover:text-red-700">
                    <span class="material-icons">delete</span>
                  </button>
                </td>
              </tr>
              <tr *ngIf="salaires.length === 0">
                <td colspan="3" class="px-4 py-8 text-center text-gray-400">
                  لا توجد أجور مسجلة - Aucun salaire enregistré
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Message -->
      <div *ngIf="message" class="px-6 pb-4">
        <div [class]="success ? 'bg-green-50 text-green-700 border-green-200' : 'bg-red-50 text-red-700 border-red-200'"
             class="px-4 py-3 rounded-lg border text-sm">{{ message }}</div>
      </div>
    </div>
  `
})
export class SalaireUpdateComponent {
  institution: any = { numAffiliation: '', brancheSociale: '', raisonSociale: '' };
  agents: AgentPublic[] = [];
  selectedAgent: AgentPublic | null = null;
  salaires: any[] = [];
  message = '';
  success = false;
  saving = false;

  constructor(
    private agentService: AgentService,
    private institutionService: InstitutionService,
    private salaireService: SalaireService
  ) {}

  searchInstitution(): void {
    if (this.institution.numAffiliation) {
      this.message = '';
      this.institutionService.findByAffiliation(this.institution.numAffiliation, '').subscribe({
        next: (list) => {
          if (list.length > 0) {
            const found = this.institution.brancheSociale 
              ? list.find(i => i.brancheSociale === this.institution.brancheSociale) 
              : list[0];
            if (found) {
              this.institution = { ...found };
              this.loadAgents(found.id!);
              this.message = 'تم تحميل المؤسسة - Institution chargée';
              this.success = true;
            } else {
              this.institution.raisonSociale = list[0].raisonSociale;
              this.loadAgents(list[0].id!);
            }
          } else {
            this.message = 'مؤسسة غير موجودة - Institution non trouvée';
            this.success = false;
            this.agents = [];
          }
        },
        error: () => {
          this.message = 'خطأ في الاتصال - Erreur de connexion';
          this.success = false;
        }
      });
    }
  }

  loadAgents(institutionId: number): void {
    this.agentService.findByInstitution(institutionId).subscribe({
      next: (data) => {
        this.agents = data;
        if (data.length === 1) {
          this.selectAgent(data[0]);
        }
      },
      error: () => {
        this.agents = [];
      }
    });
  }

  selectAgent(agent: AgentPublic): void {
    this.selectedAgent = agent;
    if (agent.id) {
      this.loadSalaires(agent.id);
    }
  }

  loadSalaires(agentId: number): void {
    this.salaireService.findByAgent(agentId).subscribe({
      next: (data) => {
        this.salaires = data.map(s => ({
          ...s,
          dateEffet: s.dateEffet || ''
        }));
      },
      error: () => {
        this.salaires = [];
      }
    });
  }

  addSalaire(): void {
    this.salaires.push({ 
      salaireMensuel: 0, 
      dateEffet: new Date().toISOString().split('T')[0],
      isNew: true
    });
  }

  removeSalaire(index: number): void {
    const salaire = this.salaires[index];
    if (salaire.id) {
      this.salaireService.delete(salaire.id).subscribe({
        next: () => {
          this.salaires.splice(index, 1);
          this.message = 'تم حذف الأجر - Salaire supprimé';
          this.success = true;
        },
        error: () => {
          this.message = 'خطأ في الحذف - Erreur de suppression';
          this.success = false;
        }
      });
    } else {
      this.salaires.splice(index, 1);
    }
  }

  save(): void {
    if (!this.selectedAgent?.id) {
      this.message = 'يرجى اختيار عون أولاً - Veuillez sélectionner un agent';
      this.success = false;
      return;
    }
    
    this.saving = true;
    const salairesToSave = this.salaires.filter(s => s.salaireMensuel > 0);
    if (salairesToSave.length === 0) {
      this.message = 'لا توجد أجور للحفظ - Aucun salaire à enregistrer';
      this.success = false;
      this.saving = false;
      return;
    }

    let saved = 0;
    let errors = 0;
    salairesToSave.forEach(s => {
      const salaireData: any = {
        salaireMensuel: s.salaireMensuel,
        dateEffet: s.dateEffet,
        agentPublic: { id: this.selectedAgent!.id }
      };

      const save$ = s.id
        ? this.salaireService.update(s.id, salaireData)
        : this.salaireService.create(salaireData);

      save$.subscribe({
        next: (savedSalaire) => {
          s.id = savedSalaire.id;
          s.isNew = false;
          saved++;
          if (saved + errors === salairesToSave.length) {
            this.message = `تم الحفظ - ${saved} salaire(s) enregistré(s)` + (errors > 0 ? `, ${errors} erreur(s)` : '');
            this.success = errors === 0;
            this.saving = false;
          }
        },
        error: () => {
          errors++;
          if (saved + errors === salairesToSave.length) {
            this.message = `${saved} salaire(s) enregistré(s), ${errors} erreur(s)`;
            this.success = false;
            this.saving = false;
          }
        }
      });
    });
  }
}
