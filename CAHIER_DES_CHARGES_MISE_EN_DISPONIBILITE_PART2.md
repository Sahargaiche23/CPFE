# CAHIER DES CHARGES - PHASE 2 (Suite)
## Modules Fonctionnels, Workflow et Architecture

---

## 5. MODULES FONCTIONNELS

### 5.1 Module Enregistrement des Dossiers (تسجيل الملفات)

**Description:**
Module principal de l'Agent CNSS pour enregistrer un nouveau dossier. Correspond à l'écran "قرارات الإحالة" du legacy.

#### 5.1.1 Enregistrement Institution (المؤسسة المشغلة)
- Recherche par numéro d'affiliation (رقم الانخراط)
- Si nouvelle: formulaire de création complet
- Si existante: pré-remplissage automatique
- Affichage: `numAffiliation/brancheSociale` (ex: `64759/60`)

#### 5.1.2 Enregistrement Agent Public (العون العمومي)
- N° d'inscription CNSS (رقم التسجيل)
- Nom et prénom (AR et FR)
- Adresse, contact, email
- Rattachement à l'institution

#### 5.1.3 Enregistrement Ilhaq (الإلحاق)
- **Possibilité de plusieurs ilhaq par agent**
- Date de la décision d'إحالة
- Date début (تاريخ الالحاق) et date fin (تاريخ الانتهاء)
- Référence de l'arrêté
- Tableau récapitulatif des ilhaq existants

#### 5.1.4 Scan et Dépôt de Documents (GED)
Documents obligatoires scannés par l'Agent CNSS:
- **Déclaration** (تصريح)
- **Attestation de salaire employeur** (شهادة الأجر من المؤسسة المشغلة)
- **مقرر الإعلام** (Décision d'information)

**Règles Métier:**
- Le numéro d'inscription CNSS doit être unique
- Les dates d'ilhaq ne doivent pas se chevaucher pour un même agent
- Date fin > Date début obligatoire
- Les 3 documents obligatoires doivent être scannés

---

### 5.2 Module Gestion des Salaires (تحيين الأجور)

**Description:**
Mise à jour des salaires avec date d'effet. Le salaire applicable pour un trimestre est le plus récent avant le début du trimestre.

**Fonctionnalités:**
- Sélection agent par numéro d'inscription ou recherche
- Affichage infos agent + institution
- Saisie nouveau salaire mensuel (الأجر الشهري) + date d'effet (تاريخ الفاعلية)
- Historique complet des salaires

**Règles Métier:**
- Le salaire est mensuel
- Chaque salaire a une date d'effet
- Pour un trimestre donné, le système utilise le salaire avec la date d'effet la plus récente et antérieure au début du trimestre
- Historique conservé intégralement

---

### 5.3 Module Génération des Cotisations (تنزيل المساهمات)

**Description:**
Génération des cotisations trimestrielles. Trois modes de génération disponibles.

#### Filtres de Génération

| Mode | Libellé AR | Description |
|------|-----------|-------------|
| **Toutes** | كافة المؤسسات المشغلة | Toutes institutions + tous agents |
| **Par Institution** | كافة اعوان مؤسسة واحدة | Tous agents d'une institution |
| **Par Agent** | عون عمومي واحد | Un seul agent |

#### Paramètres
- **Trimestre** (الثلاثية): 1, 2, 3, 4
- **Année** (السنة): ex: 2025
- **Institution** (المؤسسة المشغلة): si mode Institution ou Agent
- **Agent** (العون العمومي): si mode Agent
- **Date Ilhaq** (تاريخ الالحاق): pour identifier la période

#### Processus de Génération
```
Pour chaque agent éligible:
  1. Vérifier que l'ilhaq couvre le trimestre
  2. Récupérer le salaire applicable (dateEffet <= début trimestre)
  3. Déterminer les taux selon la période
  4. Calculer:
     montantCode137 = salaire × 3 × taux137
     montantCode138 = salaire × 3 × taux138
     montantCode197 = salaire × 3 × taux197 (si applicable)
     montantCode198 = salaire × 3 × taux198 (si applicable)
     montantTotal   = somme
  5. Créer l'enregistrement cotisation (statut: EN_ATTENTE)
```

**Règles Métier:**
- Cotisation impossible si l'ilhaq ne couvre pas le trimestre
- Pas de duplication: si cotisation existe déjà pour agent/trimestre/année, ignorer
- Taux déterminés automatiquement selon la période historique
- Salaire applicable = dernier salaire avec dateEffet <= début trimestre

---

### 5.4 Module Paiements (تحيين خلاص المساهمات)

**Description:**
Saisie et mise à jour des paiements effectués par employeurs (code 137) et agents (code 138).

**Fonctionnalités:**
- Sélection trimestre/année
- Sélection institution
- Affichage agent: N° inscription, code exploitation, montant dû, date ilhaq
- Saisie montant payé, code (137 ou 138), type, référence, date

**Règles Métier:**
- Paiement associé à une cotisation spécifique
- Paiements partiels possibles
- Mise à jour automatique du statut:
  - `EN_ATTENTE` → `PARTIELLEMENT_PAYE` (si montant < dû)
  - `EN_ATTENTE` ou `PARTIELLEMENT_PAYE` → `PAYE` (si total payé = dû)
- Paiement ne peut pas dépasser le montant restant dû

---

### 5.5 Module Carte de Paiement (بطاقة خلاص)

**Description:**
Fiche récapitulative de paiement d'un agent pour un trimestre.

**Fonctionnalités:**
- Recherche par institution et agent
- Affichage détaillé par trimestre: montant dû (137 + 138), montant payé, solde
- Historique complet des paiements
- Export PDF

---

### 5.6 Module Suivi des Paiements (متابعة خلاص المساهمات)

**Description:**
Suivi global des paiements par année, institution et agent.

**Fonctionnalités:**
- Filtrage: année, institution, agent, date ilhaq
- Tableau par trimestre (T1-T4): montant dû, payé, statut
- Indicateurs visuels: Vert (Payé), Orange (Partiel), Rouge (Retard)
- Export Excel/PDF

---

### 5.7 Module Espace Assuré (فضاء المضمون)

**Description:**
Espace personnel pour l'agent public en disponibilité.

#### 5.7.1 Dashboard Assuré
- Infos personnelles (nom, N° inscription, institution)
- Résumé situation: ilhaq en cours, salaire actuel, dernière cotisation, solde
- Cartes d'actions rapides

#### 5.7.2 Mes Cotisations
- Liste de toutes les cotisations
- Détail par trimestre (code 137, 138, total)
- Statut de paiement
- Téléchargement avis PDF

#### 5.7.3 Mon Historique de Paiements
- Liste chronologique des paiements
- Montant, date, référence, code
- Solde global restant

#### 5.7.4 Mes Documents
- Consultation documents scannés
- Téléchargement attestations et avis

#### 5.7.5 Demandes
- Demande de mise à jour de salaire
- Demande de prolongation d'ilhaq
- Demande d'attestation de situation
- Suivi état des demandes

---

### 5.8 Module Espace Employeur (فضاء المؤسسة)

**Description:**
Espace pour les institutions publiques.

#### 5.8.1 Dashboard Employeur
- Nombre d'agents en disponibilité
- Total cotisations dues (part patronale code 137)
- Cotisations en retard

#### 5.8.2 Liste des Agents
- Tableau agents en disponibilité
- Statut, période ilhaq, salaire

#### 5.8.3 Cotisations Dues
- Cotisations part patronale (code 137)
- Filtrage trimestre/année
- Montant total dû

#### 5.8.4 Historique Paiements
- Paiements effectués par l'institution
- Montant, date, référence, agent concerné

#### 5.8.5 Documents
- Téléchargement avis de paiement officiels
- Téléchargement notifications de retard

---

## 6. IMPRESSIONS ET DOCUMENTS OFFICIELS

### 6.1 Avis de Paiement pour Agents (إشعار للخلاص بالنسبة للاعوان)

**Contenu:**
- En-tête officiel CNSS
- N° inscription agent, nom, prénom
- Institution employeur
- Trimestre/année
- Détail: Code 138 (part salariale) + Code 198 (complémentaire si applicable)
- Montant total à payer
- Date limite + RIB CNSS

**Format:** PDF généré, envoyé par email et/ou imprimé

---

### 6.2 Suivi Paiements (متابعة خلاص المساهمات)

**Contenu:**
- En-tête CNSS
- Info agent ou institution
- Tableau par trimestre: dû, payé, solde, statut
- Total général

---

### 6.3 Notification de Retard (إعلام حول تأخير المؤسسات للتسديد)

**Contenu:**
- En-tête officiel CNSS
- Destinataire: Responsable institution
- Liste cotisations en retard: trimestre, agent(s), montant code 137, jours de retard
- Total en retard
- Rappel obligations légales (Loi 16/2003)
- Délai de régularisation

---

### 6.4 Avis de Paiement aux Institutions (إعلام لدفع المساهمات)

**Filtres d'envoi:**
- Toutes les institutions
- Une institution avec tous ses agents
- Une institution avec un agent spécifique

**Contenu:**
- En-tête CNSS
- Nom institution, N° affiliation/branche
- Trimestre/année
- Tableau:

| Agent | N° Inscription | Code | Montant |
|-------|---------------|------|---------|
| بن علي محمد | 16078805 | 137 | 768.150 |
| بن علي محمد | 16078805 | 138 | 435.600 |

- Total à régler
- Instructions de paiement

---

### 6.5 Notification aux Agents (إعلام الاعوان العموميين)

**Contenu:**
- En-tête CNSS
- Nom agent, N° inscription
- Institution employeur
- Trimestre/année
- Part salariale (code 138) + complémentaire (code 198)
- Total à payer par l'agent
- Modalités de paiement

---

## 7. WORKFLOW GLOBAL

### 7.1 Workflow Principal

```
PHASE 1: ENREGISTREMENT (Agent CNSS)
─────────────────────────────────────
  Réception documents ──> Enregistrement dossier ──> Scan GED
  (physiques)             (Institution+Agent+Ilhaq)   (Déclaration,
                                                       Attestation,
                                                       مقرر الإعلام)
                                    │
                                    ▼
                          Création comptes utilisateurs
                          → Assuré: Email + MDP
                          → Employeur: Email + MDP
                          → Envoi mailing notification


PHASE 2: SALAIRES (Agent CNSS)
──────────────────────────────
  Saisie salaire initial ──> Mise à jour salaire ──> Historique
  (1ère inscription)        (actualisation)          (dates d'effet)


PHASE 3: COTISATIONS (Agent CNSS / Auto)
────────────────────────────────────────
  Sélection filtre        ──> Calcul cotisation    ──> Envoi notifications
  (Toutes/Instit/Agent)      (salaire×3×taux)         - Avis agent (138)
  Trimestre/Année                                      - Avis employeur (137)


PHASE 4: PAIEMENT ET SUIVI
───────────────────────────
  Réception paiement ──> Enregistrement ──> Mise à jour statut
  (137 ou 138)           (Agent CNSS)       (automatique)
                                               │
                                               ▼
                                    Si retard:
                                    → Notification retard institution (137)
                                    → Notification retard agent (138)
                                    → Alerte dashboard Agent CNSS
```

### 7.2 Cycle de Vie d'une Cotisation

```
  GÉNÉRÉE ──> EN_ATTENTE ──> PARTIELLEMENT_PAYÉE ──> PAYÉE
                  │
                  │ (après date limite)
                  ▼
              EN_RETARD (relance envoyée)
```

---

## 8. ARCHITECTURE TECHNIQUE

### 8.1 Nouveau Microservice

| Service | Port | Description |
|---------|------|-------------|
| **disponibilite-service** | `8085` | Microservice dédié Mise en Disponibilité |

### 8.2 Structure du Microservice

```
disponibilite-service/
├── src/main/java/tn/cnss/disponibilite/
│   ├── DisponibiliteServiceApplication.java
│   ├── controller/
│   │   ├── InstitutionController.java
│   │   ├── AgentPublicController.java
│   │   ├── IlhaqController.java
│   │   ├── SalaireController.java
│   │   ├── CotisationController.java
│   │   ├── PaiementController.java
│   │   └── DocumentController.java
│   ├── entity/
│   │   ├── Institution.java
│   │   ├── AgentPublic.java
│   │   ├── Ilhaq.java
│   │   ├── Salaire.java
│   │   ├── Cotisation.java
│   │   ├── Paiement.java
│   │   └── DocumentGed.java
│   ├── repository/
│   │   └── (un repository par entité)
│   ├── service/
│   │   ├── InstitutionService.java
│   │   ├── AgentPublicService.java
│   │   ├── IlhaqService.java
│   │   ├── SalaireService.java
│   │   ├── CotisationService.java        # Logique calcul cotisations
│   │   ├── PaiementService.java
│   │   ├── DocumentGedService.java
│   │   └── TauxCotisationService.java    # Taux historiques
│   ├── dto/
│   │   ├── CotisationGenerationRequest.java
│   │   └── PaiementRequest.java
│   └── config/
│       └── TauxCotisationConfig.java
├── src/main/resources/
│   ├── application.yml
│   └── data/taux-cotisation.json
└── pom.xml
```

### 8.3 API REST Endpoints

#### Institution (`/api/disponibilite/institutions`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/` | Liste institutions |
| GET | `/{id}` | Détail |
| GET | `/search?numAffiliation=X&branche=Y` | Recherche |
| POST | `/` | Créer |
| PUT | `/{id}` | Modifier |

#### Agent Public (`/api/disponibilite/agents`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/` | Liste agents |
| GET | `/{id}` | Détail |
| GET | `/search?numInscription=X` | Recherche N° inscription |
| GET | `/institution/{institutionId}` | Agents par institution |
| POST | `/` | Créer |
| PUT | `/{id}` | Modifier |

#### Ilhaq (`/api/disponibilite/ilhaq`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/agent/{agentId}` | Liste ilhaq d'un agent |
| POST | `/` | Créer |
| PUT | `/{id}` | Modifier |
| DELETE | `/{id}` | Supprimer |

#### Salaire (`/api/disponibilite/salaires`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/agent/{agentId}` | Historique salaires |
| GET | `/applicable?agentId=X&date=Y` | Salaire applicable |
| POST | `/` | Ajouter |
| PUT | `/{id}` | Modifier |

#### Cotisation (`/api/disponibilite/cotisations`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/` | Liste (filtrable) |
| GET | `/{id}` | Détail |
| GET | `/agent/{agentId}` | Par agent |
| GET | `/institution/{instId}` | Par institution |
| POST | `/generer` | Générer (mode: TOUTES/INSTITUTION/AGENT) |
| GET | `/suivi?annee=X&institutionId=Y` | Suivi paiements |

#### Paiement (`/api/disponibilite/paiements`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/` | Liste |
| GET | `/cotisation/{cotisationId}` | Par cotisation |
| GET | `/agent/{agentId}` | Par agent |
| POST | `/` | Enregistrer |
| PUT | `/{id}` | Modifier |

#### Documents (`/api/disponibilite/documents`)
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/agent/{agentId}` | Documents d'un agent |
| POST | `/upload` | Upload |
| GET | `/{id}/download` | Télécharger |
| DELETE | `/{id}` | Supprimer |

### 8.4 Frontend - Structure Angular

```
frontend/src/app/features/disponibilite/
├── disponibilite.routes.ts
├── agent-cnss/
│   ├── dashboard/disponibilite-dashboard.component.ts
│   ├── dossier/
│   │   ├── dossier-list.component.ts
│   │   ├── dossier-form.component.ts
│   │   └── dossier-detail.component.ts
│   ├── salaire/salaire-form.component.ts
│   ├── cotisation/
│   │   ├── cotisation-generation.component.ts
│   │   └── cotisation-list.component.ts
│   ├── paiement/
│   │   ├── paiement-form.component.ts
│   │   └── paiement-suivi.component.ts
│   └── impression/
│       ├── avis-agent.component.ts
│       ├── avis-institution.component.ts
│       ├── suivi-paiement.component.ts
│       └── relance-retard.component.ts
├── assure/
│   ├── assure-dashboard.component.ts
│   ├── mes-cotisations.component.ts
│   ├── mon-historique.component.ts
│   ├── mes-documents.component.ts
│   └── mes-demandes.component.ts
└── employeur/
    ├── employeur-dashboard.component.ts
    ├── mes-agents.component.ts
    ├── cotisations-dues.component.ts
    └── historique-paiements.component.ts
```

### 8.5 Proxy Configuration Frontend

```json
{
  "/api/disponibilite": {
    "target": "http://localhost:8085",
    "secure": false,
    "changeOrigin": true,
    "logLevel": "debug"
  }
}
```

### 8.6 Rôles d'Authentification

| Rôle | Description |
|------|-------------|
| `agentCnssMiseEnDisponibilite` | Agent CNSS - accès complet gestion |
| `assureMiseEnDisponibilite` | Agent public assuré - espace personnel |
| `employerMiseEnDisponibilite` | Institution employeur - espace employeur |

### 8.7 Base de Données

- **Moteur:** Oracle (même instance CNSS)
- **DDL:** `spring.jpa.hibernate.ddl-auto: update`

**Tables:**
- `DISP_INSTITUTION`
- `DISP_AGENT_PUBLIC`
- `DISP_ILHAQ`
- `DISP_SALAIRE`
- `DISP_COTISATION`
- `DISP_PAIEMENT`
- `DISP_DOCUMENT_GED`
- `DISP_TAUX_COTISATION` (paramétrage taux historiques)

---

## 9. EXIGENCES DE SÉCURITÉ

### 9.1 Contrôle d'Accès

| Fonctionnalité | Agent CNSS | Assuré | Employeur |
|----------------|:----------:|:------:|:---------:|
| Enregistrement dossier | ✅ | ❌ | ❌ |
| Scan documents | ✅ | ❌ | ❌ |
| Gestion salaires | ✅ | ❌ | ❌ |
| Génération cotisations | ✅ | ❌ | ❌ |
| Saisie paiements | ✅ | ❌ | ❌ |
| Impressions officielles | ✅ | ❌ | ❌ |
| Consultation son dossier | ❌ | ✅ | ❌ |
| Consultation ses cotisations | ❌ | ✅ | ✅ |
| Historique ses paiements | ❌ | ✅ | ✅ |
| Télécharger avis | ❌ | ✅ | ✅ |
| Liste agents institution | ❌ | ❌ | ✅ |

### 9.2 Sécurité des Données
- Authentification JWT (même système que Coopération Technique)
- HTTPS obligatoire
- Chiffrement documents stockés
- Journalisation de toutes les opérations
- Sauvegarde quotidienne

### 9.3 Conformité
- Conformité réglementations tunisiennes
- Archivage documents minimum 10 ans
- Traçabilité complète des modifications

---

## ANNEXE: GLOSSAIRE ARABE-FRANÇAIS

| Arabe | Français |
|-------|----------|
| عدم المباشرة الخاصة | Mise en disponibilité spéciale |
| المؤسسة المشغلة | Institution employeur |
| العون العمومي | Agent public |
| المضمون الاجتماعي | Assuré social |
| الإلحاق | Ilhaq / Rattachement |
| رقم الانخراط | Numéro d'affiliation |
| الشعبة الاجتماعية | Branche sociale |
| رقم التسجيل | Numéro d'inscription |
| رقم الاستغلال | Code d'exploitation |
| الأجر الشهري | Salaire mensuel |
| تاريخ الفاعلية | Date d'effet |
| الثلاثية | Trimestre |
| المساهمة | Cotisation/Contribution |
| الخلاص | Paiement |
| المبلغ المستوجب | Montant dû |
| تنزيل المساهمات | Génération cotisations |
| تحيين الأجور | Mise à jour salaires |
| تحيين الخلاصات | Mise à jour paiements |
| بطاقة خلاص | Carte de paiement |
| إشعار للخلاص | Avis de paiement |
| متابعة خلاص المساهمات | Suivi paiements cotisations |
| إعلام حول تأخير المؤسسات | Notification retard institutions |
| قرارات الإحالة | Décisions de mise en disponibilité |
| مقرر الإعلام | Décision d'information |
| تصريح | Déclaration |
| شهادة الأجر | Attestation de salaire |
