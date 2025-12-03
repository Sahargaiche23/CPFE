# Installation et Démarrage du Frontend Angular - CNSS

## 📋 Guide d'Installation Rapide

### Étape 1: Naviguer vers le dossier frontend
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/frontend
```

### Étape 2: Installer les dépendances
```bash
npm install
```

Cette commande va installer:
- Angular 17+ et ses dépendances
- TailwindCSS pour le styling
- Angular Material pour les composants UI
- RxJS pour la programmation réactive
- TypeScript et tous les outils de build

⏱️ **Durée estimée**: 2-5 minutes (selon votre connexion internet)

### Étape 3: Démarrer l'application
```bash
npm start
```

L'application sera accessible sur: **http://localhost:4200**

## 🎨 Aperçu de l'Application

### Page de Connexion
- Logo CNSS officiel intégré
- Design moderne avec dégradé de couleurs CNSS
- Formulaire de connexion sécurisé
- Animations fluides

### Dashboard Principal
- Statistiques en temps réel (Employeurs, Affiliations, Débits, Paiements)
- Activités récentes
- Actions rapides pour créer des entités
- Navigation intuitive

### Modules Disponibles

1. **Employeurs** (`/employer`)
   - Liste des employeurs régime 500/510
   - Création nouvel employeur
   - Détails et modification

2. **Affiliations** (`/affiliation`)
   - Gestion des affiliations
   - Génération d'attestations
   - Calcul automatique des cotisations

3. **Salaires** (`/salary/convert`)
   - Conversion salaire étranger → TND
   - Taux de change automatiques
   - Calcul cotisations

4. **Débits** (`/debit`)
   - Génération débits trimestriels
   - Validation automatique
   - Suivi des échéances

5. **Paiements** (`/payment`)
   - Enregistrement paiements
   - Génération de reçus
   - Historique complet

## 🔧 Configuration

### Configuration Backend
Le frontend communique avec le backend sur: `http://localhost:8080/api`

Pour modifier l'URL du backend, éditez:
```typescript
// frontend/src/environments/environment.ts
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'  // Modifier ici si nécessaire
};
```

### Ports
- **Frontend**: Port 4200
- **Backend Gateway**: Port 8080

## 🎯 Workflow Complet

### 1. Démarrer Oracle XE
```bash
docker start oracle-xe
```

### 2. Démarrer les Microservices Backend
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
docker-compose up -d
```

Attendre que tous les services soient UP (environ 2-3 minutes)

### 3. Démarrer le Frontend
```bash
cd frontend
npm start
```

### 4. Accéder à l'Application
Ouvrir le navigateur sur: **http://localhost:4200**

### 5. Se Connecter
Utiliser les identifiants de test (configurés dans le backend):
- **Username**: admin
- **Password**: admin123

## 📦 Structure des Fichiers Créés

```
frontend/
├── src/
│   ├── app/
│   │   ├── core/                          # Services et Guards
│   │   │   ├── guards/auth.guard.ts       # Protection routes
│   │   │   ├── interceptors/              # HTTP Interceptors
│   │   │   └── services/                  # Services API
│   │   ├── features/                      # Modules métier
│   │   │   ├── auth/login/               # Page connexion
│   │   │   ├── dashboard/                # Dashboard principal
│   │   │   ├── employer/                 # Gestion employeurs
│   │   │   ├── affiliation/              # Gestion affiliations
│   │   │   ├── salary/                   # Conversion salaires
│   │   │   ├── debit/                    # Gestion débits
│   │   │   └── payment/                  # Gestion paiements
│   │   ├── shared/                        # Composants partagés
│   │   │   ├── components/header/        # En-tête avec logo CNSS
│   │   │   └── layouts/main-layout/      # Layout principal
│   │   ├── app.component.ts              # Composant racine
│   │   └── app.routes.ts                 # Routes de l'app
│   ├── environments/                      # Config environnements
│   ├── styles.scss                        # Styles globaux
│   └── index.html                         # Page HTML principale
├── angular.json                           # Configuration Angular
├── package.json                           # Dépendances npm
├── tailwind.config.js                     # Configuration Tailwind
├── tsconfig.json                          # Configuration TypeScript
└── README.md                              # Documentation
```

## 🎨 Design et Thème

### Couleurs CNSS Utilisées
- **Rouge Bordeaux** (`#8B1538`) - Couleur primaire CNSS
- **Vert** (`#2E7D32`) - Couleur secondaire
- **Vert Foncé** (`#00695C`) - Accent
- **Gris Clair** (`#F5F5F5`) - Fond
- **Gris Foncé** (`#212121`) - Texte

### Logo CNSS
Logo officiel intégré depuis:
```
https://www.cnss.tn/html/themes/images/logo.png
```

Visible sur:
- Page de connexion (grand format, centré)
- Header de l'application (format compact)
- Footer

## 🔍 Vérification de l'Installation

### 1. Vérifier que npm est installé
```bash
node --version  # Doit afficher v18.x ou supérieur
npm --version   # Doit afficher v9.x ou supérieur
```

### 2. Vérifier que les dépendances sont installées
```bash
ls -la node_modules/  # Doit contenir @angular, tailwindcss, etc.
```

### 3. Vérifier que l'application compile
```bash
npm run build  # Doit compiler sans erreurs
```

### 4. Vérifier l'accès au backend
Ouvrir: http://localhost:8080/actuator/health
Doit retourner: `{"status":"UP"}`

## 🐛 Résolution des Problèmes

### Erreur: "Port 4200 already in use"
```bash
# Tuer le processus sur le port 4200
lsof -ti:4200 | xargs kill -9

# Ou utiliser un autre port
ng serve --port 4300
```

### Erreur: "Cannot find module '@angular/...'"
```bash
# Supprimer node_modules et réinstaller
rm -rf node_modules package-lock.json
npm install
```

### Erreur: "CORS" ou "Connection refused"
- Vérifier que le backend est démarré: `docker-compose ps`
- Vérifier que le Gateway est UP sur le port 8080
- Attendre 2-3 minutes après le démarrage des services

### Les styles ne s'affichent pas correctement
```bash
# Reconstruire le projet
npm run build
npm start
```

## 📊 Monitoring et Logs

### Logs Frontend
Les logs sont visibles dans la console du navigateur (F12)

### Logs Backend
```bash
# Voir les logs d'un service
docker-compose logs -f gateway-service
docker-compose logs -f employer-service
```

### Vérifier l'état des services
```bash
docker-compose ps
```

Tous les services doivent être "Up"

## 🚀 Prochaines Étapes

Une fois l'application démarrée:

1. **Tester la connexion** avec admin/admin123
2. **Explorer le dashboard** pour voir les statistiques
3. **Créer un employeur** via le formulaire
4. **Créer une affiliation** pour un employeur
5. **Tester la conversion** de salaire
6. **Générer un débit** trimestriel
7. **Enregistrer un paiement**

## 📚 Documentation Supplémentaire

- **README Principal**: `../README.md`
- **Documentation Backend**: `../SWAGGER_SUCCESS_COMPLET.md`
- **Architecture Frontend**: `../FRONTEND_ARCHITECTURE.md`
- **Guide Complet**: `../PROJET_COMPLET_FINAL.md`

## 🤝 Support

Pour toute question:
- Email: sahar.gaiche@cnss.tn
- Documentation interne CNSS

---

**CNSS - Caisse Nationale de Sécurité Sociale**  
**République Tunisienne**  
Système de Gestion de la Coopération Technique - Frontend Angular
