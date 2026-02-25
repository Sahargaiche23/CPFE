import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { InstitutionService, Institution } from '../../services/institution.service';
import { AgentService, AgentPublic } from '../../services/agent.service';
import { DocumentService } from '../../services/document.service';
import { GedSharedDataService } from '../../services/ged-shared-data.service';

@Component({
  selector: 'app-dossier-registration',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <!-- Header -->
      <div class="bg-rose-700 text-white px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="material-icons">description</span>
          <div>
            <h2 class="font-bold text-lg">عدم المباشرة الخاصة</h2>
            <p class="text-rose-200 text-sm">قرارات الإحالة - Décisions d'affectation</p>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <button (click)="newRecord()" class="p-2 bg-rose-600 hover:bg-rose-500 rounded" title="جديد">
            <span class="material-icons">add</span>
          </button>
          <button (click)="save()" class="p-2 bg-green-600 hover:bg-green-500 rounded" title="حفظ">
            <span class="material-icons">save</span>
          </button>
          <button (click)="search()" class="p-2 bg-blue-600 hover:bg-blue-500 rounded" title="بحث">
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
            <input [(ngModel)]="institution.numAffiliation" (blur)="loadInstitution()"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500"
                   placeholder="64759">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الشعبة الاجتماعية / Branche Sociale</label>
            <input [(ngModel)]="institution.brancheSociale"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500"
                   placeholder="60">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600 mb-1">الاسم / Raison Sociale</label>
            <input [(ngModel)]="institution.raisonSociale"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500"
                   placeholder="اسم المؤسسة">
          </div>
          <div class="md:col-span-3">
            <label class="block text-sm font-medium text-gray-600 mb-1">العنوان / Adresse</label>
            <input [(ngModel)]="institution.adresse"
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-right focus:ring-2 focus:ring-rose-500">
          </div>
        </div>
      </div>

      <!-- Agents Section -->
      <div class="p-6">
        <div class="flex items-center justify-between mb-4">
          <div class="flex items-center gap-2">
            <span class="material-icons text-rose-600">people</span>
            <h3 class="font-bold text-gray-800">الأعوان العموميون</h3>
            <span class="text-gray-400 text-sm">/ Agents Publics</span>
          </div>
          <button (click)="addAgent()" class="px-3 py-1.5 bg-rose-100 text-rose-700 rounded-lg hover:bg-rose-200 text-sm flex items-center gap-1">
            <span class="material-icons text-sm">person_add</span>
            إضافة عون
          </button>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead class="bg-rose-50">
              <tr>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">رقم التسجيل<br><span class="text-xs text-gray-500">N° Inscription</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">الاسم واللقب<br><span class="text-xs text-gray-500">Nom & Prénom</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">العنوان<br><span class="text-xs text-gray-500">Adresse</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">بداء الإلحاق<br><span class="text-xs text-gray-500">Début Ilhaq</span></th>
                <th class="px-3 py-2 text-right font-medium text-rose-800 border-b">انتهاء الإلحاق<br><span class="text-xs text-gray-500">Fin Ilhaq</span></th>
                <th class="px-3 py-2 text-center font-medium text-rose-800 border-b">إجراءات</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let agent of agents; let i = index" class="border-b border-gray-100 hover:bg-rose-50/30">
                <td class="px-3 py-2">
                  <input [(ngModel)]="agent.numInscription" class="w-full border border-gray-300 rounded px-2 py-1 text-right text-sm">
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="agent.nomComplet" class="w-full border border-gray-300 rounded px-2 py-1 text-right text-sm">
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="agent.adresse" class="w-full border border-gray-300 rounded px-2 py-1 text-right text-sm">
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="agent.dateDebutIlhaq" type="date" class="w-full border border-gray-300 rounded px-2 py-1 text-sm">
                </td>
                <td class="px-3 py-2">
                  <input [(ngModel)]="agent.dateFinIlhaq" type="date" class="w-full border border-gray-300 rounded px-2 py-1 text-sm">
                </td>
                <td class="px-3 py-2 text-center">
                  <button (click)="removeAgent(i)" class="text-red-500 hover:text-red-700">
                    <span class="material-icons text-sm">delete</span>
                  </button>
                </td>
              </tr>
              <tr *ngIf="agents.length === 0">
                <td colspan="6" class="px-3 py-8 text-center text-gray-400">
                  لا يوجد أعوان مسجلين - Aucun agent enregistré
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Message -->
      <div *ngIf="message" class="px-6 pb-4">
        <div [class]="messageType === 'success' ? 'bg-green-50 text-green-700 border-green-200' : 'bg-red-50 text-red-700 border-red-200'"
             class="px-4 py-3 rounded-lg border text-sm">
          {{ message }}
        </div>
      </div>
    </div>
  `
})
export class DossierRegistrationComponent implements OnInit {
  institution: any = { numAffiliation: '', brancheSociale: '', raisonSociale: '', adresse: '' };
  agents: any[] = [];
  gedAgents: any[] = [];
  message = '';
  messageType = '';
  saving = false;
  salaireData: { salaire?: string; salaireDate?: string; salairePeriode?: string } = {};
  fromGed = false;

  constructor(
    private institutionService: InstitutionService,
    private agentService: AgentService,
    private documentService: DocumentService,
    private gedSharedData: GedSharedDataService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Auto-fill from GED scan navigation
    this.route.queryParams.subscribe(params => {
      if (params['numAffiliation'] || params['nom'] || params['prenom']) {
        this.fromGed = true;
        if (params['numAffiliation']) {
          let numAff = params['numAffiliation'];
          let branche = params['brancheSociale'] || '';
          // Parse '60-64759' → branche=60, numAffiliation=64759
          if (numAff.includes('-') && !branche) {
            const parts = numAff.split('-');
            branche = parts[0];
            numAff = parts.slice(1).join('-');
          }
          this.institution.numAffiliation = numAff;
          this.institution.brancheSociale = branche;
          if (params['raisonSociale']) {
            this.institution.raisonSociale = params['raisonSociale'];
          }
          this.loadInstitution();
        }
        // Store salary data for later navigation
        if (params['salaire']) this.salaireData.salaire = params['salaire'];
        if (params['salaireDate']) this.salaireData.salaireDate = params['salaireDate'];
        if (params['salairePeriode']) this.salaireData.salairePeriode = params['salairePeriode'];

        // Pre-fill agent from scanned data (accept even without numInscription)
        if (params['nom'] || params['prenom']) {
          const nomComplet = ((params['prenom'] || '') + ' ' + (params['nom'] || '')).trim();
          this.gedAgents = [{
            numInscription: params['numInscription'] || '',
            nomComplet: nomComplet,
            adresse: params['adresse'] || '',
            dateDebutIlhaq: params['dateDebutIlhaq'] || '',
            dateFinIlhaq: '',
            cin: params['cin'] || '',
            dateNaissance: params['dateNaissance'] || '',
            fromGed: true
          }];
          this.agents = [...this.gedAgents];
          this.message = 'تم ملء البيانات تلقائيا من المسح الضوئي - Données pré-remplies depuis le scan GED. يرجى إكمال البيانات الناقصة ثم الحفظ.';
          this.messageType = 'success';
        }
      }
    });
  }

  loadInstitution(): void {
    if (this.institution.numAffiliation) {
      this.message = '';
      const num = this.institution.numAffiliation;
      const br = this.institution.brancheSociale || '';
      const savedRaisonSociale = this.institution.raisonSociale || '';

      this.institutionService.findByAffiliation(num, '').subscribe({
        next: (list) => {
          const found = br ? list.find(i => i.brancheSociale === br) : list[0];
          if (found) {
            this.institution = { ...found };
            this.loadAgents(found.id!);
            this.message = 'تم تحميل المؤسسة - Institution chargée';
            this.messageType = 'success';
          } else if (list.length > 0) {
            this.institution = { ...list[0] };
            this.loadAgents(list[0].id!);
            this.message = 'تم تحميل المؤسسة - Institution chargée';
            this.messageType = 'success';
          } else {
            // Institution not found - keep GED-extracted raisonSociale
            if (savedRaisonSociale && !this.institution.raisonSociale) {
              this.institution.raisonSociale = savedRaisonSociale;
            }
            this.institution.brancheSociale = br;
            this.message = 'مؤسسة غير موجودة - Institution non trouvée. Vous pouvez la créer.';
            this.messageType = 'error';
          }
        },
        error: (err) => {
          // On error, keep GED-extracted data
          if (savedRaisonSociale && !this.institution.raisonSociale) {
            this.institution.raisonSociale = savedRaisonSociale;
          }
          this.message = 'خطأ في الاتصال بالخادم - Erreur de connexion au serveur';
          this.messageType = 'error';
        }
      });
    }
  }

  loadAgents(institutionId: number): void {
    this.agentService.findByInstitution(institutionId).subscribe({
      next: (data) => {
        const dbAgents = data.map(a => ({
          ...a,
          nomComplet: (a.prenom || '') + ' ' + (a.nom || ''),
          dateDebutIlhaq: a.dateDebutIlhaq || '',
          dateFinIlhaq: a.dateFinIlhaq || ''
        }));
        // Merge GED pre-filled agents with DB agents (avoid duplicates by numInscription)
        if (this.gedAgents.length > 0) {
          const dbNums = dbAgents.map(a => a.numInscription);
          const newFromGed = this.gedAgents.filter(g => !dbNums.includes(g.numInscription));
          this.agents = [...dbAgents, ...newFromGed];
        } else {
          this.agents = dbAgents;
        }
      },
      error: () => {
        this.agents = this.gedAgents.length > 0 ? [...this.gedAgents] : [];
      }
    });
  }

  addAgent(): void {
    this.agents.push({
      numInscription: '',
      nomComplet: '',
      adresse: '',
      dateDebutIlhaq: '',
      dateFinIlhaq: ''
    });
  }

  removeAgent(index: number): void {
    const agent = this.agents[index];
    if (agent.id) {
      this.agentService.delete(agent.id).subscribe({
        next: () => {
          this.agents.splice(index, 1);
          this.message = 'تم حذف العون - Agent supprimé';
          this.messageType = 'success';
        },
        error: () => {
          this.message = 'خطأ في الحذف - Erreur de suppression';
          this.messageType = 'error';
        }
      });
    } else {
      this.agents.splice(index, 1);
    }
  }

  newRecord(): void {
    this.institution = { numAffiliation: '', brancheSociale: '', raisonSociale: '', adresse: '' };
    this.agents = [];
    this.message = '';
  }

  save(): void {
    if (!this.institution.numAffiliation) {
      this.message = 'يجب إدخال رقم الانخراط - Veuillez saisir le N° Affiliation';
      this.messageType = 'error';
      return;
    }
    if (!this.institution.raisonSociale) {
      this.message = 'يجب إدخال اسم المؤسسة - Veuillez saisir la Raison Sociale';
      this.messageType = 'error';
      return;
    }
    this.saving = true;
    const instData: any = {
      numAffiliation: this.institution.numAffiliation,
      brancheSociale: this.institution.brancheSociale || '',
      raisonSociale: this.institution.raisonSociale,
      adresse: this.institution.adresse || '',
      telephone: this.institution.telephone || '',
      email: this.institution.email || '',
      gouvernorat: this.institution.gouvernorat || '',
      actif: true
    };

    const saveInst$ = this.institution.id
      ? this.institutionService.update(this.institution.id, instData)
      : this.institutionService.create(instData);

    saveInst$.subscribe({
      next: (savedInst) => {
        this.institution = { ...savedInst };
        this.saveAgents(savedInst.id!);
      },
      error: (err) => {
        this.message = 'خطأ - Erreur institution: ' + (err.error?.message || err.message);
        this.messageType = 'error';
        this.saving = false;
      }
    });
  }

  private saveAgents(institutionId: number): void {
    const agentsToSave = this.agents.filter(a => a.numInscription);
    if (agentsToSave.length === 0) {
      this.message = 'تم حفظ المؤسسة بنجاح - Institution enregistrée (ID: ' + institutionId + ')';
      this.messageType = 'success';
      this.saving = false;
      if (this.fromGed && this.salaireData.salaire) {
        setTimeout(() => this.navigateToSalaires(), 1500);
      }
      return;
    }

    let saved = 0;
    let errors = 0;
    const total = agentsToSave.length;

    const onComplete = () => {
      if (saved + errors === total) {
        this.saving = false;
        // Upload pending GED documents
        if (this.fromGed && this.gedSharedData.hasPendingFiles() && saved > 0) {
          const agentId = agentsToSave[0].id;
          if (agentId) {
            this.uploadGedDocuments(agentId);
          }
        }
        this.message = `تم الحفظ بنجاح - ${saved} agent(s) enregistré(s)` + (errors > 0 ? `, ${errors} erreur(s)` : '');
        this.messageType = errors > 0 && saved === 0 ? 'error' : 'success';
        if (this.fromGed && this.salaireData.salaire && saved > 0) {
          setTimeout(() => this.navigateToSalaires(), 2000);
        }
      }
    };

    agentsToSave.forEach(agent => {
      const names = (agent.nomComplet || '').split(' ');
      const agentData: any = {
        numInscription: agent.numInscription,
        nom: names.length > 1 ? names.slice(1).join(' ') : names[0] || '',
        prenom: names.length > 1 ? names[0] : '',
        nomFr: names.length > 1 ? names.slice(1).join(' ') : names[0] || '',
        prenomFr: names.length > 1 ? names[0] : '',
        cin: agent.cin || '',
        dateNaissance: agent.dateNaissance || null,
        adresse: agent.adresse || '',
        telephone: agent.telephone || '',
        email: agent.email || '',
        dateDebutIlhaq: agent.dateDebutIlhaq || null,
        dateFinIlhaq: agent.dateFinIlhaq || null,
        actif: true,
        institution: { id: institutionId }
      };

      if (agent.id) {
        // Agent already has an ID - update directly
        this.agentService.update(agent.id, agentData).subscribe({
          next: (sa) => { agent.id = sa.id; saved++; onComplete(); },
          error: () => { errors++; onComplete(); }
        });
      } else {
        // Check if agent already exists by numInscription
        this.agentService.searchByNumInscription(agent.numInscription).subscribe({
          next: (existing) => {
            if (existing.length > 0) {
              // Agent exists - update it
              this.agentService.update(existing[0].id!, agentData).subscribe({
                next: (sa) => { agent.id = sa.id; saved++; onComplete(); },
                error: () => { errors++; onComplete(); }
              });
            } else {
              // New agent - create
              this.agentService.create(agentData).subscribe({
                next: (sa) => { agent.id = sa.id; saved++; onComplete(); },
                error: () => { errors++; onComplete(); }
              });
            }
          },
          error: () => {
            // Search failed, try create anyway
            this.agentService.create(agentData).subscribe({
              next: (sa) => { agent.id = sa.id; saved++; onComplete(); },
              error: () => { errors++; onComplete(); }
            });
          }
        });
      }
    });
  }

  private uploadGedDocuments(agentId: number): void {
    const files = this.gedSharedData.pendingFiles;
    if (files.length === 0) return;
    let uploaded = 0;
    let uploadErrors = 0;
    files.forEach(pf => {
      this.documentService.upload(agentId, pf.type, pf.file).subscribe({
        next: () => {
          uploaded++;
          if (uploaded + uploadErrors === files.length) {
            this.message += ` | ${uploaded} document(s) déposé(s)`;
            this.gedSharedData.clear();
          }
        },
        error: () => {
          uploadErrors++;
          if (uploaded + uploadErrors === files.length) {
            this.message += ` | ${uploaded} doc(s) déposé(s), ${uploadErrors} erreur(s)`;
          }
        }
      });
    });
  }

  navigateToSalaires(): void {
    const params: any = {
      numAffiliation: this.institution.numAffiliation || '',
      brancheSociale: this.institution.brancheSociale || ''
    };
    if (this.salaireData.salaire) params.salaire = this.salaireData.salaire;
    if (this.salaireData.salaireDate) params.salaireDate = this.salaireData.salaireDate;
    if (this.salaireData.salairePeriode) params.salairePeriode = this.salaireData.salairePeriode;
    // Pass agent info for auto-select
    if (this.agents.length > 0) {
      const agent = this.agents[0];
      if (agent.numInscription) params.numInscription = agent.numInscription;
    }
    this.router.navigate(['/app/salaires'], { queryParams: params });
  }

  search(): void {
    this.loadInstitution();
  }
}
