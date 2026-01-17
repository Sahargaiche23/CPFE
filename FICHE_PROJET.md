# FICHE PROJET - CNSS Coopération Technique

---

## 📋 DÉTAILS DU PLAN DE TRAVAIL

### Titre Projet (*)
**Système de Gestion de la Coopération Technique - CNSS**

### Description Projet
Application web complète pour la gestion des coopérants de la Caisse Nationale de Sécurité Sociale (CNSS). Le système permet la gestion des affiliations, des débits, des paiements et le suivi des dossiers des coopérants selon différents régimes (500, 510, 515).

### Problématique Projet (*)
La CNSS fait face à plusieurs défis dans la gestion de la coopération technique :
- Gestion manuelle et dispersée des dossiers coopérants
- Difficulté de suivi des affiliations et des paiements
- Manque de traçabilité des opérations
- Absence d'un système centralisé de gestion des régimes
- Besoin d'automatisation des processus administratifs

---

## ⚙️ FONCTIONNALITÉS / TÂCHES

### 1. Gestion des Coopérants
**Libellé Fonctionnalité / Tâche (*) :** Module de gestion des coopérants

**Description Fonctionnalité / Tâche :**
- Création et modification des dossiers coopérants (FR/AR)
- Upload de documents (dossier, pièce d'identité)
- Validation des dossiers
- Gestion des différents régimes (500, 510, 515)

---

### 2. Gestion des Affiliations
**Libellé Fonctionnalité / Tâche (*) :** Module d'affiliation

**Description Fonctionnalité / Tâche :**
- Enregistrement des affiliations
- Suivi de l'état des affiliations
- Historique des affiliations

---

### 3. Gestion des Débits
**Libellé Fonctionnalité / Tâche (*) :** Module de gestion des débits

**Description Fonctionnalité / Tâche :**
- Création et suivi des débits
- Calcul automatique des montants
- Génération des bordereaux

---

### 4. Gestion des Paiements
**Libellé Fonctionnalité / Tâche (*) :** Module de paiement

**Description Fonctionnalité / Tâche :**
- Enregistrement des paiements
- Suivi des échéances
- Rapports de paiements

---

### 5. Authentification et Sécurité
**Libellé Fonctionnalité / Tâche (*) :** Module d'authentification

**Description Fonctionnalité / Tâche :**
- Connexion sécurisée (JWT)
- Gestion des rôles (Admin, Agent, Coopérant)
- Journal d'audit

---

### 6. Tableau de Bord et Rapports
**Libellé Fonctionnalité / Tâche (*) :** Module de reporting

**Description Fonctionnalité / Tâche :**
- Dashboard avec statistiques
- Génération de rapports (PDF, Excel)
- Indicateurs clés de performance

---

## 🛠️ TECHNOLOGIES

| Catégorie | Technologie | Description |
|-----------|-------------|-------------|
| **Frontend** | Angular 17 | Framework web moderne |
| **Frontend** | TailwindCSS | Framework CSS utilitaire |
| **Frontend** | TypeScript | Langage typé pour JavaScript |
| **Backend** | Spring Boot | Framework Java pour microservices |
| **Backend** | Java 17 | Langage de programmation |
| **Base de données** | PostgreSQL | Base de données relationnelle |
| **DevOps** | Docker | Conteneurisation |
| **DevOps** | Docker Compose | Orchestration des conteneurs |
| **API Gateway** | Spring Cloud Gateway | Passerelle API |
| **Service Discovery** | Eureka Server | Découverte de services |
| **Versioning** | Git | Contrôle de version |

---

## 📅 DIAGRAMME DE GANTT (01/12/2025 - 30/05/2026)

```
Décembre 2025
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4

Janvier 2026
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4

Février 2026
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4

Mars 2026
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4

Avril 2026
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4

Mai 2026
├─────────────────────────────────────────────────────────────────────┤
  S1      S2      S3      S4      S5
```

### Planning des Tâches

| # | Tâche | Début | Fin | Durée | Progression |
|---|-------|-------|-----|-------|-------------|
| 1 | **Analyse et Conception** | 01/12/2025 | 31/12/2025 | 4 sem | ██████████ 100% |
| 2 | **Configuration Infrastructure** | 01/01/2026 | 15/01/2026 | 2 sem | ██████████ 100% |
| 3 | **Développement Auth Service** | 16/01/2026 | 31/01/2026 | 2 sem | ████████░░ 80% |
| 4 | **Développement Module Coopérants** | 01/02/2026 | 28/02/2026 | 4 sem | ██████░░░░ 60% |
| 5 | **Développement Module Affiliations** | 01/03/2026 | 21/03/2026 | 3 sem | ████░░░░░░ 40% |
| 6 | **Développement Module Débits** | 22/03/2026 | 11/04/2026 | 3 sem | ██░░░░░░░░ 20% |
| 7 | **Développement Module Paiements** | 12/04/2026 | 02/05/2026 | 3 sem | ░░░░░░░░░░ 0% |
| 8 | **Tests et Intégration** | 03/05/2026 | 23/05/2026 | 3 sem | ░░░░░░░░░░ 0% |
| 9 | **Déploiement et Formation** | 24/05/2026 | 30/05/2026 | 1 sem | ░░░░░░░░░░ 0% |

### Visualisation Gantt

```
Tâche                          |Déc 25|Jan 26|Fév 26|Mar 26|Avr 26|Mai 26|
-------------------------------|------|------|------|------|------|------|
1. Analyse et Conception       |██████|      |      |      |      |      |
2. Config Infrastructure       |      |███   |      |      |      |      |
3. Auth Service                |      |   ███|      |      |      |      |
4. Module Coopérants           |      |      |██████|      |      |      |
5. Module Affiliations         |      |      |      |█████ |      |      |
6. Module Débits               |      |      |      |   ███|███   |      |
7. Module Paiements            |      |      |      |      |  ████|█     |
8. Tests et Intégration        |      |      |      |      |      |█████ |
9. Déploiement et Formation    |      |      |      |      |      |    ██|
```

---

## 📊 JALONS CLÉS

| Date | Jalon |
|------|-------|
| 31/12/2025 | ✅ Fin de la phase d'analyse |
| 31/01/2026 | 🔄 Livraison authentification |
| 28/02/2026 | 🔄 Livraison module coopérants |
| 11/04/2026 | ⏳ Livraison modules métier |
| 23/05/2026 | ⏳ Fin des tests |
| 30/05/2026 | ⏳ Mise en production |

---

## 👥 ÉQUIPE PROJET

| Rôle | Responsabilités |
|------|-----------------|
| Chef de Projet | Coordination, planification, suivi |
| Développeur Frontend | Angular, TailwindCSS, UI/UX |
| Développeur Backend | Spring Boot, API REST, Microservices |
| DBA | PostgreSQL, modélisation données |
| DevOps | Docker, CI/CD, déploiement |
| Testeur | Tests fonctionnels, tests d'intégration |

---

## 📝 LIVRABLES

1. **Documentation technique**
2. **Code source (Frontend + Backend)**
3. **Base de données configurée**
4. **Environnement Docker**
5. **Manuel utilisateur**
6. **Rapport de tests**

---

*Document généré le 29/12/2025*
*CNSS - Caisse Nationale de Sécurité Sociale*
