# 🎨 Architecture Frontend - Coopération Technique CNSS

## 📋 Vue d'Ensemble

Application Angular professionnelle pour la gestion de la Coopération Technique avec design moderne et workflow automatisé.

---

## 🎯 Workflow Métier (5 Étapes)

### Étape 1: Réception Dossier & Attribution Numéro
- **Déclencheur**: Dossier arrive à l'ATCT avec documents (Annexe 1)
- **Action**: Attribution automatique numéro employeur
- **Régimes**: 500 (TTE) ou 510 (Coopération Technique)
- **Règle**: Date d'effet max 1 an depuis dépôt CNSS
- **Périodes antérieures**: Taux de rachat automatique

### Étape 2: Saisie Dossier & Détermination Régime
- **Inputs**:
  - Dernier salaire déclaré (trimestre complet)
  - Nouveau salaire étranger (converti en TND)
  - Date de détachement
  - Pays destination
  - Type société (publique/privée)
- **Conversion**: Taux BCT à la date du 1er jour de détachement
- **Calcul cotisation**: Base = dernier salaire servi
- **Conditions TTE/Coop**:
  - Pays sans convention Tunisie
  - Société mère = établissement public

### Étape 3: Génération Affiliation & Débit
- **Automatique après validation**:
  - Attestation d'affiliation (arabe/français)
  - Débit trimestriel depuis date d'effet
  - **Exception**: Si trimestre déjà déclaré par employeur tunisien → pas de débit

### Étape 4: Notification Automatique
- **Email automatique** avec:
  - Attestation d'affiliation PDF
  - Avis de paiement
  - N° d'affiliation
  - Montant cotisations
  - RIB du bureau CNSS
- **Destinataire**: Email du dossier ou importé de l'affiliation

### Étape 5: Gestion Trimestre & Validation Salaire
- **Création débit trimestrielle**: Batch automatique pour tous les coopérants
- **Validation salaire**: Après paiement effectué
- **Cas spéciaux**: Règlements partiels ou redressements → validation individuelle

---

## 🏗️ Structure de l'Application

```
frontend/
├── src/
│   ├── app/
│   │   ├── core/                          # Services core, guards, interceptors
│   │   │   ├── guards/
│   │   │   │   ├── auth.guard.ts
│   │   │   │   └── role.guard.ts
│   │   │   ├── interceptors/
│   │   │   │   ├── auth.interceptor.ts
│   │   │   │   └── error.interceptor.ts
│   │   │   ├── services/
│   │   │   │   ├── auth.service.ts
│   │   │   │   ├── notification.service.ts
│   │   │   │   └── theme.service.ts
│   │   │   └── models/
│   │   │       ├── user.model.ts
│   │   │       └── response.model.ts
│   │   │
│   │   ├── features/                      # Modules métier
│   │   │   ├── dashboard/
│   │   │   │   ├── dashboard.component.ts
│   │   │   │   ├── dashboard.component.html
│   │   │   │   ├── dashboard.component.scss
│   │   │   │   └── dashboard.module.ts
│   │   │   │
│   │   │   ├── dossier/                   # Étapes 1 & 2
│   │   │   │   ├── components/
│   │   │   │   │   ├── dossier-list/
│   │   │   │   │   ├── dossier-form/
│   │   │   │   │   ├── dossier-detail/
│   │   │   │   │   └── numero-attribution/
│   │   │   │   ├── services/
│   │   │   │   │   └── dossier.service.ts
│   │   │   │   ├── models/
│   │   │   │   │   └── dossier.model.ts
│   │   │   │   └── dossier-routing.module.ts
│   │   │   │
│   │   │   ├── salary/                    # Conversion salaire
│   │   │   │   ├── components/
│   │   │   │   │   ├── salary-converter/
│   │   │   │   │   └── bct-rate-viewer/
│   │   │   │   └── services/
│   │   │   │       └── salary.service.ts
│   │   │   │
│   │   │   ├── regime/                    # Détermination régime
│   │   │   │   ├── components/
│   │   │   │   │   └── regime-selector/
│   │   │   │   └── services/
│   │   │   │       └── regime.service.ts
│   │   │   │
│   │   │   ├── affiliation/               # Étape 3
│   │   │   │   ├── components/
│   │   │   │   │   ├── affiliation-form/
│   │   │   │   │   ├── affiliation-certificate/
│   │   │   │   │   └── affiliation-list/
│   │   │   │   ├── services/
│   │   │   │   │   └── affiliation.service.ts
│   │   │   │   └── models/
│   │   │   │       └── affiliation.model.ts
│   │   │   │
│   │   │   ├── debit/                     # Étape 3 & 5
│   │   │   │   ├── components/
│   │   │   │   │   ├── debit-list/
│   │   │   │   │   ├── debit-creation/
│   │   │   │   │   └── debit-quarterly/
│   │   │   │   └── services/
│   │   │   │       └── debit.service.ts
│   │   │   │
│   │   │   ├── payment/                   # Paiement
│   │   │   │   ├── components/
│   │   │   │   │   ├── payment-form/
│   │   │   │   │   ├── payment-list/
│   │   │   │   │   └── payment-notice/
│   │   │   │   └── services/
│   │   │   │       └── payment.service.ts
│   │   │   │
│   │   │   ├── notification/              # Étape 4
│   │   │   │   ├── components/
│   │   │   │   │   ├── email-sender/
│   │   │   │   │   └── notification-history/
│   │   │   │   └── services/
│   │   │   │       └── email.service.ts
│   │   │   │
│   │   │   ├── documents/                 # Gestion fichiers
│   │   │   │   ├── components/
│   │   │   │   │   ├── document-upload/
│   │   │   │   │   └── document-viewer/
│   │   │   │   └── services/
│   │   │   │       └── document.service.ts
│   │   │   │
│   │   │   └── reports/                   # Rapports
│   │   │       ├── components/
│   │   │       │   ├── attestation-generator/
│   │   │       │   └── avis-paiement/
│   │   │       └── services/
│   │   │           └── report.service.ts
│   │   │
│   │   ├── shared/                        # Composants réutilisables
│   │   │   ├── components/
│   │   │   │   ├── header/
│   │   │   │   ├── sidebar/
│   │   │   │   ├── breadcrumb/
│   │   │   │   ├── data-table/
│   │   │   │   ├── loading-spinner/
│   │   │   │   ├── confirmation-dialog/
│   │   │   │   ├── stepper-workflow/       # Pour les 5 étapes
│   │   │   │   └── arabic-form-input/      # Support arabisation
│   │   │   ├── directives/
│   │   │   ├── pipes/
│   │   │   │   ├── date-format.pipe.ts
│   │   │   │   ├── currency-tnd.pipe.ts
│   │   │   │   └── arabic-number.pipe.ts
│   │   │   └── shared.module.ts
│   │   │
│   │   ├── layout/                        # Layout principal
│   │   │   ├── main-layout/
│   │   │   ├── auth-layout/
│   │   │   └── print-layout/              # Pour impressions
│   │   │
│   │   ├── app-routing.module.ts
│   │   └── app.module.ts
│   │
│   ├── assets/
│   │   ├── images/
│   │   │   ├── logo-cnss.png
│   │   │   ├── logo-tunisie.png
│   │   │   └── background-pattern.svg
│   │   ├── icons/
│   │   └── i18n/                          # Traductions
│   │       ├── fr.json
│   │       └── ar.json
│   │
│   ├── environments/
│   │   ├── environment.ts                 # Dev
│   │   └── environment.prod.ts            # Production
│   │
│   └── styles/
│       ├── _variables.scss                # Couleurs CNSS
│       ├── _mixins.scss
│       ├── _typography.scss
│       └── styles.scss                    # Global styles
│
└── package.json
```

---

## 🎨 Design System

### Palette de Couleurs CNSS
```scss
$cnss-primary: #1e3a8a;        // Bleu CNSS
$cnss-secondary: #3b82f6;      // Bleu clair
$cnss-accent: #10b981;         // Vert succès
$cnss-warning: #f59e0b;        // Orange warning
$cnss-danger: #ef4444;         // Rouge erreur
$cnss-dark: #1f2937;           // Texte principal
$cnss-light: #f3f4f6;          // Fond clair
$cnss-white: #ffffff;
```

### Typographie
```scss
$font-primary: 'Roboto', 'Arial', sans-serif;
$font-arabic: 'Cairo', 'Arial', sans-serif;
$font-size-base: 16px;
$font-weight-normal: 400;
$font-weight-medium: 500;
$font-weight-bold: 700;
```

---

## 🔗 Routing & Navigation

```typescript
const routes: Routes = [
  {
    path: '',
    component: MainLayoutComponent,
    canActivate: [AuthGuard],
    children: [
      { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
      { path: 'dashboard', loadChildren: () => import('./features/dashboard/dashboard.module').then(m => m.DashboardModule) },
      { path: 'dossiers', loadChildren: () => import('./features/dossier/dossier.module').then(m => m.DossierModule) },
      { path: 'affiliation', loadChildren: () => import('./features/affiliation/affiliation.module').then(m => m.AffiliationModule) },
      { path: 'debits', loadChildren: () => import('./features/debit/debit.module').then(m => m.DebitModule) },
      { path: 'paiements', loadChildren: () => import('./features/payment/payment.module').then(m => m.PaymentModule) },
      { path: 'notifications', loadChildren: () => import('./features/notification/notification.module').then(m => m.NotificationModule) },
      { path: 'documents', loadChildren: () => import('./features/documents/documents.module').then(m => m.DocumentsModule) },
      { path: 'rapports', loadChildren: () => import('./features/reports/reports.module').then(m => m.ReportsModule) }
    ]
  },
  {
    path: 'auth',
    component: AuthLayoutComponent,
    loadChildren: () => import('./features/auth/auth.module').then(m => m.AuthModule)
  },
  { path: '**', redirectTo: '/dashboard' }
];
```

---

## 📊 Composants Clés

### 1. Dashboard (Page d'accueil)
```
- Statistiques globales (cartes KPI)
- Dossiers en cours de traitement
- Notifications importantes
- Débits à créer ce trimestre
- Graphiques: évolution affiliations, paiements mensuels
```

### 2. Workflow Stepper (5 Étapes)
```
┌─────────────────────────────────────────────────────────────┐
│  1️⃣ Attribution  →  2️⃣ Saisie  →  3️⃣ Affiliation          │
│                     ↓                     ↓                  │
│              4️⃣ Notification  →  5️⃣ Validation              │
└─────────────────────────────────────────────────────────────┘
```

### 3. Formulaire Dossier (Étape 2)
```
Sections:
- Informations employeur (matricule, clé, régime)
- Informations salarié (nom, prénom, fonction)
- Détachement (pays, dates, durée mission)
- Salaire Tunisie (dernier déclaré)
- Salaire Étranger (montant devise, conversion TND)
- Employeurs (tunisien, étranger, adresses)
- Documents joints
```

### 4. Attestation d'Affiliation (PDF bilingue)
```
┌──────────────────────────────────────────┐
│  🇹🇳 CNSS - République Tunisienne        │
│                                          │
│  Certificat d'Affiliation                │
│  N°: 500380-54-2024                      │
│                                          │
│  Nom: [Nom Prénom]                       │
│  Régime: Coopération Technique (500)     │
│  Date d'effet: 01/03/2024                │
│  Montant cotisation: 1,925.440 TND       │
│                                          │
│  [Version Arabe]                         │
└──────────────────────────────────────────┘
```

---

## 🔌 Services API

### API Endpoints
```typescript
// Auth Service
POST /api/auth/login
POST /api/auth/logout
POST /api/auth/refresh

// Employer Service (Dossier)
GET  /api/employer/all
GET  /api/employer/{id}
POST /api/employer/create
PUT  /api/employer/{id}
DELETE /api/employer/{id}
GET  /api/employer/numero-available/{regime}

// Salary Service (Conversion)
POST /api/salary/convert
GET  /api/salary/{id}
GET  /api/salary/dossier/{dossierId}
GET  /api/salary/bct-rate/{date}/{currency}

// Regime Service (Détermination)
POST /api/regime/determine
GET  /api/regime/{id}
GET  /api/regime/check-eligibility

// Affiliation Service
POST /api/affiliation/create
GET  /api/affiliation/{id}
GET  /api/affiliation/dossier/{dossierId}
GET  /api/affiliation/certificate/{id}
GET  /api/affiliation/list

// Debit Service
POST /api/debit/calculate
POST /api/debit/create-quarterly
GET  /api/debit/affiliation/{affiliationId}
GET  /api/debit/pending
PUT  /api/debit/{id}/validate

// Payment Service
POST /api/payment/create
GET  /api/payment/{id}
GET  /api/payment/debit/{debitId}
GET  /api/payment/notice/{id}

// Notification Service (Email)
POST /api/notification/send
POST /api/notification/send-affiliation
GET  /api/notification/history

// File Service (Documents)
POST /api/files/upload
GET  /api/files/{id}
GET  /api/files/dossier/{dossierId}
DELETE /api/files/{id}
```

---

## 🛡️ Sécurité

### Guards
- **AuthGuard**: Vérifie authentification JWT
- **RoleGuard**: Vérifie rôles utilisateur (AGENT, MANAGER, ADMIN)

### Interceptors
- **AuthInterceptor**: Ajoute token JWT aux requêtes
- **ErrorInterceptor**: Gestion centralisée des erreurs

---

## 📱 Features Avancées

### 1. Multi-langue (i18n)
- Français (par défaut)
- Arabe (RTL support)
- Switch dynamique

### 2. Génération PDF
- Attestations d'affiliation
- Avis de paiement
- Rapports statistiques

### 3. Email Automatique
- Template professionnel CNSS
- Pièces jointes PDF
- Historique d'envoi

### 4. Batch Trimestriel
- Création automatique débits
- Notifications rappel
- Export Excel

### 5. Validation Progressive
- Formulaires multi-étapes
- Sauvegarde brouillon
- Validation métier temps réel

---

## 🚀 Technologies

### Core
- **Angular 15+**
- **TypeScript 4.8+**
- **RxJS 7+**

### UI Framework
- **Angular Material** (components UI)
- **Tailwind CSS** (utility classes)
- **ngx-charts** (graphiques)

### Utilities
- **ngx-translate** (i18n)
- **jsPDF** (génération PDF)
- **moment.js** (manipulation dates)
- **ngx-mask** (masques input)

---

## 📦 Build & Deploy

### Development
```bash
npm install
ng serve --open
```

### Production
```bash
ng build --configuration=production
```

### Docker
```dockerfile
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration=production

FROM nginx:alpine
COPY --from=build /app/dist/cooperation-technique-frontend /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

## ✅ Checklist Développement

### Phase 1: Setup
- [ ] Créer projet Angular
- [ ] Installer Angular Material
- [ ] Configurer Tailwind CSS
- [ ] Setup i18n (fr/ar)
- [ ] Créer structure modules

### Phase 2: Core
- [ ] Auth Guard + Interceptor
- [ ] Services API de base
- [ ] Layout principal
- [ ] Navigation sidebar

### Phase 3: Features
- [ ] Dashboard statistiques
- [ ] Workflow 5 étapes
- [ ] Formulaire dossier complet
- [ ] Conversion salaire BCT
- [ ] Détermination régime
- [ ] Affiliation + certificat
- [ ] Génération débit
- [ ] Paiement + avis
- [ ] Email automatique

### Phase 4: Polish
- [ ] Design professionnel CNSS
- [ ] Responsive mobile/tablet
- [ ] Arabisation complète
- [ ] Tests unitaires
- [ ] Documentation utilisateur

---

**Prêt à développer une interface moderne et professionnelle! 🎨🚀**
