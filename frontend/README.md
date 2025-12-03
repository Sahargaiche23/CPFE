# CNSS - Système de Gestion de la Coopération Technique - Frontend

Application Angular moderne et élégante pour la gestion des dossiers de coopération technique.

## 🎨 Caractéristiques

- **Design Moderne** : Interface utilisateur élégante avec TailwindCSS et Angular Material
- **Logo CNSS Intégré** : Logo officiel de la CNSS sur toutes les pages
- **Architecture Modulaire** : Structure par fonctionnalités (feature-based)
- **Reactive Programming** : Utilisation de RxJS et Observables
- **Routing Lazy-Loading** : Chargement optimisé des modules
- **Authentication JWT** : Système d'authentification sécurisé
- **Responsive Design** : Compatible mobile, tablette et desktop

## 🚀 Technologies

- **Angular 17+** - Framework frontend
- **TailwindCSS** - Framework CSS utilitaire
- **Angular Material** - Composants UI
- **RxJS** - Programmation réactive
- **TypeScript** - Langage typé
- **Material Icons** - Icônes

## 📋 Prérequis

- Node.js 18+ 
- npm 9+

## 🔧 Installation

```bash
# Installer les dépendances
cd frontend
npm install

# Lancer le serveur de développement
npm start

# L'application sera accessible sur http://localhost:4200
```

## 🏗️ Structure du Projet

```
frontend/
├── src/
│   ├── app/
│   │   ├── core/                    # Services core et guards
│   │   │   ├── guards/
│   │   │   │   └── auth.guard.ts
│   │   │   ├── interceptors/
│   │   │   │   ├── auth.interceptor.ts
│   │   │   │   └── error.interceptor.ts
│   │   │   └── services/
│   │   │       ├── auth.service.ts
│   │   │       ├── employer.service.ts
│   │   │       ├── affiliation.service.ts
│   │   │       ├── salary.service.ts
│   │   │       ├── debit.service.ts
│   │   │       └── payment.service.ts
│   │   ├── features/                # Modules métier
│   │   │   ├── auth/
│   │   │   │   └── login/
│   │   │   ├── dashboard/
│   │   │   ├── employer/
│   │   │   ├── affiliation/
│   │   │   ├── salary/
│   │   │   ├── debit/
│   │   │   └── payment/
│   │   ├── shared/                  # Composants partagés
│   │   │   ├── components/
│   │   │   │   └── header/
│   │   │   └── layouts/
│   │   │       └── main-layout/
│   │   ├── app.component.ts
│   │   └── app.routes.ts
│   ├── environments/
│   ├── assets/
│   ├── styles.scss
│   └── index.html
├── angular.json
├── package.json
├── tailwind.config.js
└── tsconfig.json
```

## 🎯 Fonctionnalités Principales

### Authentification
- Page de connexion avec logo CNSS
- Gestion JWT
- Guard de protection des routes
- Intercepteurs HTTP

### Dashboard
- Statistiques en temps réel
- Activités récentes
- Actions rapides
- Design moderne avec cartes

### Gestion Employeurs
- Liste des employeurs (régime 500/510)
- Formulaire de création
- Détails employeur
- Attribution numéro automatique

### Gestion Affiliations
- Liste des affiliations
- Création d'affiliation
- Génération d'attestation
- Calcul cotisations

### Gestion Débits
- Liste des débits trimestriels
- Génération automatique
- Validation débit

### Gestion Paiements
- Liste des paiements
- Enregistrement paiement
- Génération reçu

## 🎨 Thème et Design

### Couleurs CNSS
```scss
--cnss-primary: #8B1538    // Rouge bordeaux CNSS
--cnss-secondary: #2E7D32  // Vert
--cnss-accent: #00695C     // Vert foncé
--cnss-light: #F5F5F5      // Gris clair
--cnss-dark: #212121       // Gris foncé
```

### Logo
Le logo officiel de la CNSS est intégré depuis:
```
https://www.cnss.tn/html/themes/images/logo.png
```

## 🔌 API Backend

L'application communique avec le backend Spring Boot via:
```
http://localhost:8080/api
```

### Endpoints
- `/api/auth/*` - Authentification
- `/api/employer/*` - Gestion employeurs
- `/api/affiliation/*` - Gestion affiliations
- `/api/salary/*` - Conversion salaires
- `/api/debit/*` - Gestion débits
- `/api/payment/*` - Gestion paiements

## 📦 Scripts Disponibles

```bash
# Développement
npm start                 # Démarre le serveur de dev (port 4200)
npm run watch            # Build en mode watch

# Build
npm run build            # Build production
npm run build:dev        # Build développement

# Tests
npm test                 # Lance les tests unitaires
```

## 🌐 Configuration Environnement

### Développement (`environment.ts`)
```typescript
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
```

### Production (`environment.prod.ts`)
```typescript
export const environment = {
  production: true,
  apiUrl: 'http://localhost:8080/api'
};
```

## 🔒 Sécurité

- **JWT Authentication** : Tokens stockés dans localStorage
- **Route Guards** : Protection des routes authentifiées
- **HTTP Interceptors** : Ajout automatique du token JWT
- **Error Handling** : Gestion centralisée des erreurs

## 📱 Responsive Design

L'application est entièrement responsive:
- **Mobile** : < 768px
- **Tablet** : 768px - 1024px
- **Desktop** : > 1024px

## 🎓 Standards de Code

- **Standalone Components** : Architecture Angular moderne
- **Lazy Loading** : Chargement optimisé des modules
- **TypeScript Strict Mode** : Typage strict
- **SCSS** : Préprocesseur CSS avec TailwindCSS
- **RxJS Best Practices** : Programmation réactive

## 🐛 Debugging

### DevTools
Utilisez les Angular DevTools pour le debugging:
```bash
# Installation
npm install -g @angular/cli

# Inspection
ng serve --open
```

### Console Logs
Les logs sont visibles dans la console du navigateur.

## 🚀 Déploiement

### Build Production
```bash
npm run build
# Les fichiers sont dans dist/cnss-frontend/
```

### Serveur de Production
```bash
# Avec un serveur Node.js
npm install -g http-server
http-server dist/cnss-frontend/ -p 4200
```

## 👨‍💻 Développement

### Ajouter un Nouveau Module
```bash
# Créer un nouveau module feature
ng generate component features/mon-module
```

### Ajouter un Service
```bash
# Créer un nouveau service
ng generate service core/services/mon-service
```

## 📚 Documentation API

La documentation Swagger du backend est accessible sur:
```
http://localhost:8080/swagger-ui.html
```

## 🤝 Contribution

Ce projet a été développé par l'équipe CNSS - Sahar Gaiche.

## 📝 License

© 2024 CNSS - Caisse Nationale de Sécurité Sociale. Tous droits réservés.

## 📞 Support

Pour toute question ou assistance:
- Email: support@cnss.tn
- Site: https://www.cnss.tn

---

**République Tunisienne**  
**Caisse Nationale de Sécurité Sociale**  
Système de Gestion de la Coopération Technique
