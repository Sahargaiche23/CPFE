# PRÉSENTATION DE STAGE
## Système de Gestion de la Coopération Technique et Mise en Disponibilité Spéciale
### CNSS - Caisse Nationale de Sécurité Sociale

**Stagiaire :** Sahar Gaiche
**Encadrant :** [Nom de l'encadrant]
**Période :** Décembre 2025 - Mai 2026
**Durée présentation :** ~20 minutes

---

# PLAN DE LA PRÉSENTATION

| # | Section | Durée |
|---|---------|-------|
| 1 | Introduction | 1 min |
| 2 | Description du Sujet | 4 min |
| 3 | Méthodologie Adoptée | 3 min |
| 4 | Conception | 5 min |
| 5 | Travail Réalisé | 6 min |
| 6 | Conclusion et Perspectives | 1 min |

---

# 1. INTRODUCTION (1 min)

## Organisme d'accueil

La **Caisse Nationale de Sécurité Sociale (CNSS)** est un établissement public tunisien chargé de la gestion des régimes de sécurité sociale. Elle assure la couverture de millions de travailleurs, y compris ceux détachés à l'étranger et les agents publics mis en disponibilité.

## Cadre du stage

Le stage s'inscrit dans la **modernisation des systèmes d'information** de la CNSS. Deux applications legacy (Visual Basic / Oracle) nécessitaient une refonte complète en applications web modernes :

| Existant (Legacy) | Nouveau système développé |
|---|---|
| Application VB — Coopération Technique | **Phase 1** — Application web Coopération Technique ATCT |
| Application VB — Bureau CNSS Tunis | **Phase 2** — Application web Mise en Disponibilité Spéciale |

---

# 2. DESCRIPTION DU SUJET (4 min)

## 2.1 Problématique

La CNSS fait face à plusieurs défis dans la gestion de ces deux activités :

- **Gestion manuelle et dispersée** des dossiers sur des applications obsolètes (VB6)
- **Absence de traçabilité** complète des opérations
- **Aucun espace en ligne** pour les coopérants, assurés et employeurs
- **Calculs manuels** des cotisations et débits trimestriels
- **Pas de GED** — documents papier uniquement, aucune dématérialisation
- **Notifications manuelles** — courrier postal, pas d'emails automatiques
- **Difficulté de suivi** des paiements, arriérés et relances

## 2.2 Objectifs

| Objectif | Description |
|----------|-------------|
| **Dématérialisation** | Numériser l'ensemble des processus de gestion |
| **Automatisation** | Calcul automatique des cotisations, débits trimestriels, notifications |
| **Espaces personnels** | Portails web pour coopérants, assurés et employeurs |
| **GED + IA** | Gestion Électronique des Documents avec extraction IA (OCR) |
| **Traçabilité** | Journal d'audit complet de toutes les opérations |
| **Sécurité** | Authentification JWT, chiffrement, contrôle d'accès par rôle |

## 2.3 Phase 1 — Coopération Technique ATCT

La **Coopération Technique** concerne les travailleurs tunisiens détachés à l'étranger via l'**ATCT**. Ces coopérants doivent maintenir leur couverture sociale CNSS pendant leur détachement.

**Acteurs :**

| Acteur | Rôle |
|--------|------|
| **Agent ATCT** | Crée les dossiers coopérants, saisit les informations de détachement |
| **Agent CNSS** | Valide les dossiers, crée les affiliations, gère débits et paiements |
| **Administrateur** | Gestion des utilisateurs et paramétrage système |
| **Coopérant** | Dépose ses documents, consulte son espace, suit ses cotisations |

**Régimes gérés :** Régime 500 (standard), Régime 510 (complémentaire), Régime 515 (cas particuliers)

**Workflow principal :**

```
Agent ATCT → Création dossier → Validation Agent CNSS → Email identifiants
    → Coopérant se connecte → Dépôt documents GED (CIN, Contrat, Attestation)
    → Agent CNSS → Affiliation (Régime 500/510) → 1er Débit manuel
    → Système → Débits trimestriels automatiques → Avis paiement email (PDF)
    → Coopérant → Demandes : Actualisation salaire, Sortie régime, Rachat Loi 105
```

## 2.4 Phase 2 — Mise en Disponibilité Spéciale

Application **indépendante** pour la gestion de la couverture sociale des **agents publics** mis en disponibilité, conformément à la **Loi n°16 de 2003**.

**Acteurs :**

| Acteur | Rôle |
|--------|------|
| **Agent CNSS** | Gestion complète : dossiers, cotisations, paiements, impressions |
| **Assuré** (Agent Public) | Consultation dossier, cotisations, historique paiements |
| **Employeur** (Institution) | Consultation cotisations patronales et paiements |

**Codes de cotisation :**

| Code | Libellé | Payeur | Taux |
|------|---------|--------|------|
| **137** | Cotisation patronale | Employeur | **17.07%** |
| **138** | Cotisation salariale | Assuré | **9.68%** |
| **197/198** | Complémentaires | Employeur/Assuré | Variable |

**Formule :** `Montant Trimestriel = Salaire Mensuel × 3 × Taux (selon période historique)`

**Workflow principal :**

```
Agent CNSS → Réception documents → Enregistrement (Institution + Agent + Ilhaq)
    → Scan GED (Déclaration, Attestation salaire, مقرر الإعلام)
    → Saisie salaire → Génération cotisations (3 modes)
    → Paiements (Code 137 employeur + Code 138 assuré)
    → Impressions (5 types de documents officiels)
```

## 2.5 Besoins Fonctionnels

### Phase 1 — Coopération Technique

| ID | Besoin fonctionnel | Priorité |
|----|-------------------|----------|
| **BF1.1** | Authentification sécurisée (login/mot de passe) avec gestion des rôles (Admin, Agent CNSS, Agent ATCT, Coopérant) | Haute |
| **BF1.2** | Création et validation des dossiers coopérants ATCT (saisie bilingue FR/AR) | Haute |
| **BF1.3** | Gestion du cycle de vie du dossier (EN_ATTENTE → VALIDE → AFFILIE / REJETE) | Haute |
| **BF1.4** | Création d'affiliation employeur (Régime 500, 510, 515) | Haute |
| **BF1.5** | Calcul et génération automatique des débits trimestriels | Haute |
| **BF1.6** | Enregistrement et suivi des paiements | Haute |
| **BF1.7** | GED : dépôt, catégorisation et consultation des documents (PDF, images) | Haute |
| **BF1.8** | Extraction intelligente des données depuis les documents (IA / OCR) | Moyenne |
| **BF1.9** | Envoi automatique de notifications email (identifiants, avis paiement, rappels) | Haute |
| **BF1.10** | Espace Coopérant : consultation dossier, cotisations, documents, demandes | Moyenne |
| **BF1.11** | Dashboard statistique (dossiers, documents, paiements) | Moyenne |
| **BF1.12** | Convertisseur de salaires multi-devises avec taux actualisés | Basse |
| **BF1.13** | Guide IA multilingue (chatbot FR/AR/EN) pour l'assistance coopérant | Basse |

### Phase 2 — Mise en Disponibilité Spéciale

| ID | Besoin fonctionnel | Priorité |
|----|-------------------|----------|
| **BF2.1** | Enregistrement des institutions (numAffiliation, brancheSociale, raison sociale) | Haute |
| **BF2.2** | Enregistrement des agents publics (nom FR/AR, CIN, N° inscription) | Haute |
| **BF2.3** | Gestion des périodes d'Ilhaq (plusieurs périodes par agent, dates début/fin) | Haute |
| **BF2.4** | Saisie et historique des salaires mensuels avec date d'effet | Haute |
| **BF2.5** | Génération automatique des cotisations trimestrielles (3 modes : toutes / par institution / par agent) | Haute |
| **BF2.6** | Application des taux historiques (code 137 = 17.07%, code 138 = 9.68%) | Haute |
| **BF2.7** | Enregistrement des paiements (code 137 employeur, code 138 assuré) avec paiements partiels | Haute |
| **BF2.8** | Scan GED avec extraction IA des documents (Déclaration, Attestation salaire, مقرر الإعلام) | Moyenne |
| **BF2.9** | Impressions officielles (5 types : avis paiement agents, suivi, notification retard, avis institutions, notification agents) | Haute |
| **BF2.10** | Espace Assuré : consultation dossier, cotisations, paiements, documents | Moyenne |
| **BF2.11** | Espace Employeur : consultation agents, cotisations patronales, paiements | Moyenne |
| **BF2.12** | Relance automatique des institutions en retard de paiement | Moyenne |

## 2.6 Besoins Non Fonctionnels

| ID | Besoin non fonctionnel | Catégorie | Description |
|----|----------------------|-----------|-------------|
| **BNF1** | Sécurité | Authentification | JWT (JSON Web Token) avec refresh token, expiration configurable |
| **BNF2** | Sécurité | Autorisation | Contrôle d'accès par rôle (RBAC) — chaque endpoint protégé selon le profil |
| **BNF3** | Sécurité | Chiffrement | HTTPS/TLS en production, mots de passe hashés (BCrypt) |
| **BNF4** | Performance | Temps de réponse | < 2 secondes pour les opérations courantes, < 10s pour l'extraction IA |
| **BNF5** | Scalabilité | Architecture | Microservices indépendants, déployables et scalables individuellement |
| **BNF6** | Disponibilité | Résilience | Redémarrage automatique des conteneurs (`restart: always`), service discovery Eureka |
| **BNF7** | Maintenabilité | Modularité | 13 microservices avec responsabilités claires, couplage faible |
| **BNF8** | Ergonomie | Interface | Interface bilingue (Français / Arabe), support RTL, responsive design |
| **BNF9** | Ergonomie | Accessibilité | Interface web accessible depuis tout navigateur moderne (Chrome, Firefox, Edge) |
| **BNF10** | Portabilité | Conteneurisation | Déploiement Docker — même comportement en développement et production |
| **BNF11** | Interopérabilité | API REST | Communication inter-services via HTTP/JSON, documentation Swagger/OpenAPI |
| **BNF12** | Fiabilité | Données | Base de données Oracle avec intégrité référentielle, protection contre les doublons de cotisation |
| **BNF13** | Traçabilité | Audit | Journal d'audit des opérations critiques (connexions, modifications dossiers) |

---

# 3. MÉTHODOLOGIE ADOPTÉE (3 min)

## 3.1 Approche Agile itérative

```
Sprint 1 (Déc 2025)  → Analyse des besoins, Conception, Infrastructure
Sprint 2 (Jan 2026)  → Auth Service, Gateway, Eureka, Frontend base
Sprint 3 (Fév 2026)  → Modules Coopérants, Affiliation, Salaires, GED
Sprint 4 (Mar 2026)  → Débits automatiques, Paiements, Notifications
Sprint 5 (Avr 2026)  → Phase 2 (Mise en Disponibilité) + Service IA Python
Sprint 6 (Mai 2026)  → Tests, Corrections, Intégration, Déploiement
```

## 3.2 Processus de développement

```
Analyse cahier des charges → Conception UML → Backend (Spring Boot)
    → Frontend (Angular 17) → Service IA (Python) → Tests → Déploiement Docker
```

## 3.3 Outils et environnement

| Catégorie | Outil |
|-----------|-------|
| **IDE** | IntelliJ IDEA / VS Code |
| **Versioning** | Git / GitHub |
| **Conteneurisation** | Docker / Docker Compose |
| **Base de données** | Oracle XE 21c |
| **Tests API** | Postman swager
| **Diagrammes** | PlantUML / Draw.io |

## 3.4 Stack technologique

| Couche | Technologie |
|--------|-------------|
| **Frontend** | Angular 17 + TailwindCSS |
| **Backend** | Spring Boot 3.2 + Java 17 |
| **IA / OCR** | Python 3.11 + FastAPI + Tesseract OCR |
| **Base de données** | Oracle XE 21c |
| **Gateway** | Spring Cloud Gateway |
| **Discovery** | Eureka Server |
| **Messagerie** | RabbitMQ |
| **Cache** | Redis |
| **Conteneurs** | Docker + Docker Compose |

---

# 4. CONCEPTION (5 min)

## 4.1 Architecture Microservices

**Code PlantUML** (coller dans https://www.plantuml.com/plantuml/uml/) :

```plantuml
@startuml
skinparam backgroundColor #FEFEFE
skinparam componentStyle rectangle
skinparam defaultFontSize 11
skinparam shadowing false
skinparam roundCorner 10

package "Frontend" #E3F2FD {
  [Angular 17 + TailwindCSS\nPort 4200 / 1200] as FE #90CAF9
}

package "API Gateway" #FFF3E0 {
  [Spring Cloud Gateway\nPort 8080] as GW #FFB74D
}

package "Microservices Backend" #E8F5E9 {
  [auth-service\n8089] as AUTH #A5D6A7
  [employer-service\n8081] as EMPL #A5D6A7
  [salary-service\n8082] as SAL #A5D6A7
  [regime-service\n8083] as REG #A5D6A7
  [affiliation-service\n8084] as AFF #A5D6A7
  [debit-service\n8085] as DEB #A5D6A7
  [payment-service\n8086] as PAY #A5D6A7
  [notification-service\n8087] as NOTIF #A5D6A7
  [file-service\n8088] as FILE #A5D6A7
  [disponibilite-service\n8091] as DISPO #81C784
}

package "Service IA" #F3E5F5 {
  [ai-extraction-service\nPython FastAPI\nPort 8090] as AI #CE93D8
}

package "Infrastructure" #EFEBE9 {
  database "Oracle XE 21c" as DB #BCAAA4
  [Eureka Server\n8761] as EUR #BCAAA4
  [RabbitMQ] as MQ #BCAAA4
  [Redis] as REDIS #BCAAA4
}

FE -down-> GW : HTTP REST
GW -down-> AUTH
GW -down-> EMPL
GW -down-> SAL
GW -down-> REG
GW -down-> AFF
GW -down-> DEB
GW -down-> PAY
GW -down-> NOTIF
GW -down-> FILE
GW -down-> DISPO

FILE -right-> AI : HTTP POST

AUTH -down-> DB
EMPL -down-> DB
SAL -down-> DB
REG -down-> DB
AFF -down-> DB
DEB -down-> DB
PAY -down-> DB
FILE -down-> DB
DISPO -down-> DB

NOTIF -down-> MQ
AUTH -down-> REDIS

AUTH ..> EUR : register
EMPL ..> EUR : register
SAL ..> EUR : register
DISPO ..> EUR : register
@enduml
```

## 4.2 Liste des 13 microservices

| # | Service | Port | Rôle |
|---|---------|------|------|
| 1 | **eureka-server** | 8761 | Service Discovery |
| 2 | **gateway-service** | 8080 | API Gateway — point d'entrée unique |
| 3 | **auth-service** | 8089 | Authentification JWT, gestion utilisateurs |
| 4 | **employer-service** | 8081 | Dossiers ATCT, coopérants, employeurs |
| 5 | **salary-service** | 8082 | Conversion salaires, calcul cotisations |
| 6 | **regime-service** | 8083 | Paramétrage régimes (500, 510, 515) |
| 7 | **affiliation-service** | 8084 | Affiliations et attestations |
| 8 | **debit-service** | 8085 | Débits trimestriels automatiques |
| 9 | **payment-service** | 8086 | Gestion paiements |
| 10 | **notification-service** | 8087 | Emails et notifications |
| 11 | **file-service** | 8088 | GED + appel service IA |
| 12 | **ai-extraction-service** | 8090 | Python — OCR + extraction intelligente |
| 13 | **disponibilite-service** | 8091 | Phase 2 — Mise en Disponibilité Spéciale |

## 4.3 Diagramme de Cas d'Utilisation — Phase 1 (Coopération Technique)

**Code PlantUML** (coller dans https://www.plantuml.com/plantuml/uml/) :

```plantuml
@startuml
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam roundCorner 10
skinparam actorStyle awesome
skinparam usecaseBackgroundColor #E8F5E9
skinparam usecaseBorderColor #388E3C
skinparam packageBackgroundColor #F1F8E9
skinparam packageBorderColor #66BB6A

left to right direction

actor "Administrateur" as ADMIN #FFE082
actor "Agent CNSS" as CNSS #90CAF9
actor "Agent ATCT" as ATCT #A5D6A7
actor "Coopérant" as COOP #CE93D8

rectangle "Système Coopération Technique ATCT" {

  package "Authentification" {
    usecase "Se connecter (JWT)" as UC_LOGIN
    usecase "Gérer les utilisateurs" as UC_USERS
    usecase "Gérer les rôles" as UC_ROLES
  }

  package "Gestion Dossiers ATCT" {
    usecase "Créer un dossier\ncoopérant" as UC_CREATE
    usecase "Valider / Rejeter\nun dossier" as UC_VALIDATE
    usecase "Consulter les\ndossiers" as UC_LIST
    usecase "Modifier un dossier" as UC_EDIT
  }

  package "Affiliation" {
    usecase "Créer une affiliation\nemployeur (Régime 500/510)" as UC_AFFIL
    usecase "Générer attestation\nd'affiliation" as UC_ATT_AFFIL
  }

  package "Débits & Paiements" {
    usecase "Créer le 1er débit\nmanuel" as UC_DEBIT1
    usecase "Générer débits\ntrimestriels auto" as UC_DEBIT_AUTO
    usecase "Enregistrer un\npaiement" as UC_PAY
    usecase "Consulter l'historique\ndes paiements" as UC_PAY_HIST
  }

  package "GED & IA" {
    usecase "Déposer un document\n(PDF/Image)" as UC_UPLOAD
    usecase "Extraire données\npar IA (OCR)" as UC_AI
    usecase "Consulter les\ndocuments" as UC_DOC_VIEW
  }

  package "Notifications" {
    usecase "Envoyer email\nidentifiants" as UC_NOTIF_ID
    usecase "Envoyer avis de\npaiement (PDF)" as UC_NOTIF_PAY
    usecase "Envoyer rappels\néchéances" as UC_NOTIF_RAPPEL
  }

  package "Espace Coopérant" {
    usecase "Consulter mon\ndossier" as UC_COOP_DOSSIER
    usecase "Suivre mes\ncotisations" as UC_COOP_COT
    usecase "Consulter mes\ndocuments" as UC_COOP_DOC
    usecase "Faire une demande\n(actualisation, sortie)" as UC_COOP_DEM
    usecase "Utiliser le guide\nIA (chatbot)" as UC_CHATBOT
  }

  package "Salaires" {
    usecase "Convertir salaire\nmulti-devises" as UC_CONVERT
  }
}

' --- Relations Administrateur ---
ADMIN --> UC_LOGIN
ADMIN --> UC_USERS
ADMIN --> UC_ROLES

' --- Relations Agent ATCT ---
ATCT --> UC_LOGIN
ATCT --> UC_CREATE
ATCT --> UC_LIST
ATCT --> UC_EDIT
ATCT --> UC_UPLOAD

' --- Relations Agent CNSS ---
CNSS --> UC_LOGIN
CNSS --> UC_VALIDATE
CNSS --> UC_LIST
CNSS --> UC_AFFIL
CNSS --> UC_ATT_AFFIL
CNSS --> UC_DEBIT1
CNSS --> UC_DEBIT_AUTO
CNSS --> UC_PAY
CNSS --> UC_PAY_HIST
CNSS --> UC_UPLOAD
CNSS --> UC_AI
CNSS --> UC_DOC_VIEW
CNSS --> UC_NOTIF_ID
CNSS --> UC_NOTIF_PAY
CNSS --> UC_NOTIF_RAPPEL
CNSS --> UC_CONVERT

' --- Relations Coopérant ---
COOP --> UC_LOGIN
COOP --> UC_COOP_DOSSIER
COOP --> UC_COOP_COT
COOP --> UC_COOP_DOC
COOP --> UC_COOP_DEM
COOP --> UC_CHATBOT
COOP --> UC_UPLOAD

' --- Include / Extend ---
UC_AI ..> UC_UPLOAD : <<include>>
UC_NOTIF_PAY ..> UC_DEBIT_AUTO : <<include>>
UC_VALIDATE ..> UC_NOTIF_ID : <<include>>

@enduml
```

## 4.4 Diagramme de Cas d'Utilisation — Phase 2 (Mise en Disponibilité)

**Code PlantUML** :

```plantuml
@startuml
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam roundCorner 10
skinparam actorStyle awesome
skinparam usecaseBackgroundColor #E3F2FD
skinparam usecaseBorderColor #1565C0
skinparam packageBackgroundColor #E8EAF6
skinparam packageBorderColor #5C6BC0

left to right direction

actor "Agent CNSS\nMise en Disponibilité" as AGENT #90CAF9
actor "Assuré\n(Agent Public)" as ASSURE #CE93D8
actor "Employeur\n(Institution)" as EMPLOYER #FFB74D

rectangle "Système Mise en Disponibilité Spéciale" {

  package "Enregistrement Dossiers" {
    usecase "Rechercher / Créer\nune institution" as UC2_INST
    usecase "Enregistrer un\nagent public" as UC2_AGENT
    usecase "Enregistrer une période\nd'Ilhaq (إلحاق)" as UC2_ILHAQ
    usecase "Scanner documents\n(Déclaration, Attestation,\nمقرر الإعلام)" as UC2_SCAN
    usecase "Extraire données\npar IA (OCR)" as UC2_AI
  }

  package "Gestion Salaires" {
    usecase "Saisir un salaire\nmensuel" as UC2_SAL
    usecase "Consulter historique\ndes salaires" as UC2_SAL_HIST
  }

  package "Cotisations" {
    usecase "Générer cotisations\n(mode: Toutes)" as UC2_COT_ALL
    usecase "Générer cotisations\n(mode: Par Institution)" as UC2_COT_INST
    usecase "Générer cotisations\n(mode: Par Agent)" as UC2_COT_AGT
    usecase "Consulter les\ncotisations" as UC2_COT_VIEW
  }

  package "Paiements" {
    usecase "Enregistrer paiement\n(Code 137 — Employeur)" as UC2_PAY137
    usecase "Enregistrer paiement\n(Code 138 — Assuré)" as UC2_PAY138
    usecase "Consulter historique\npaiements" as UC2_PAY_HIST
  }

  package "Impressions" {
    usecase "Imprimer avis paiement\nagents (إشعار للخلاص)" as UC2_IMP1
    usecase "Imprimer suivi paiements\n(متابعة خلاص)" as UC2_IMP2
    usecase "Imprimer notification\nretard (إعلام تأخير)" as UC2_IMP3
    usecase "Imprimer avis institutions\n(إعلام لدفع المساهمات)" as UC2_IMP4
    usecase "Imprimer notification\nagents (إعلام الاعوان)" as UC2_IMP5
  }

  package "Espace Assuré" {
    usecase "Consulter mon dossier\net situation" as UC2_ASS_DOSS
    usecase "Consulter mes\ncotisations" as UC2_ASS_COT
    usecase "Consulter mes\npaiements" as UC2_ASS_PAY
    usecase "Consulter mes\ndocuments" as UC2_ASS_DOC
  }

  package "Espace Employeur" {
    usecase "Consulter la liste\ndes agents" as UC2_EMP_AGT
    usecase "Consulter cotisations\npatronales (Code 137)" as UC2_EMP_COT
    usecase "Consulter historique\npaiements employeur" as UC2_EMP_PAY
  }
}

' --- Relations Agent CNSS ---
AGENT --> UC2_INST
AGENT --> UC2_AGENT
AGENT --> UC2_ILHAQ
AGENT --> UC2_SCAN
AGENT --> UC2_AI
AGENT --> UC2_SAL
AGENT --> UC2_SAL_HIST
AGENT --> UC2_COT_ALL
AGENT --> UC2_COT_INST
AGENT --> UC2_COT_AGT
AGENT --> UC2_COT_VIEW
AGENT --> UC2_PAY137
AGENT --> UC2_PAY138
AGENT --> UC2_PAY_HIST
AGENT --> UC2_IMP1
AGENT --> UC2_IMP2
AGENT --> UC2_IMP3
AGENT --> UC2_IMP4
AGENT --> UC2_IMP5

' --- Relations Assuré ---
ASSURE --> UC2_ASS_DOSS
ASSURE --> UC2_ASS_COT
ASSURE --> UC2_ASS_PAY
ASSURE --> UC2_ASS_DOC

' --- Relations Employeur ---
EMPLOYER --> UC2_EMP_AGT
EMPLOYER --> UC2_EMP_COT
EMPLOYER --> UC2_EMP_PAY

' --- Include / Extend ---
UC2_AI ..> UC2_SCAN : <<include>>
UC2_COT_ALL ..> UC2_SAL : <<include>>
UC2_AGENT ..> UC2_INST : <<include>>

@enduml
```

## 4.5 Diagramme de Classes — Phase 1 (Coopération Technique)

**Code PlantUML** :

```plantuml
@startuml
skinparam classAttributeIconSize 0
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam roundCorner 5
skinparam class {
  BackgroundColor #E8F5E9
  BorderColor #388E3C
  ArrowColor #388E3C
}

class DossierATCT {
  +Long id
  +String nomFr
  +String prenomFr
  +String nomAr
  +String prenomAr
  +Date dateDetachement
  +Double salaireTunisie
  +Double salaireEtranger
  +String paysEtranger
  +String email
  +String statut
  +Boolean actif
}
note right of DossierATCT::statut
  EN_ATTENTE → VALIDE → AFFILIE
  | REJETE | RECLAMATION
end note

class User {
  +Long id
  +String username
  +String email
  +String password
  +String profil
}
note right of User::profil
  ADMIN | AGENT_CNSS
  | AGENT_ATCT | COOPERANT
end note

class GedDocument {
  +Long id
  +String titre
  +String fichierNom
  +Long fichierTaille
  +String categorie
  +String[] tags
  +Long parentId
  +Date dateCreation
}

class Affiliation {
  +Long id
  +String numAffiliation
  +Date dateEffet
  +String regime
}
note right of Affiliation::regime
  500 | 510 | 515
end note

class Debit {
  +Long id
  +Integer trimestre
  +Integer annee
  +Double montant
  +String statut
  +Date dateCreation
}

class Paiement {
  +Long id
  +Double montant
  +Date datePaiement
  +String reference
}

class Notification {
  +Long id
  +String type
  +String destinataire
  +String sujet
  +String contenu
  +Boolean envoye
  +Date dateEnvoi
}

class Reclamation {
  +Long id
  +String objet
  +String description
  +String statut
  +Date dateCreation
}

DossierATCT "1" -- "1" User : compte
DossierATCT "1" -- "0..*" GedDocument : documents
DossierATCT "1" -- "0..1" Affiliation : affiliation
User "1" -- "0..*" Debit : debits
Debit "1" -- "0..*" Paiement : paiements
User "1" -- "0..*" Notification : notifications
DossierATCT "1" -- "0..*" Reclamation : reclamations
@enduml
```

Statuts dossier : `EN_ATTENTE` → `VALIDE` → `AFFILIE` | `REJETE` | `RECLAMATION`

## 4.6 Diagramme de Classes — Phase 2 (Mise en Disponibilité)

**Code PlantUML** :

```plantuml
@startuml
skinparam classAttributeIconSize 0
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam roundCorner 5
skinparam class {
  BackgroundColor #E3F2FD
  BorderColor #1565C0
  ArrowColor #1565C0
}

class Institution {
  +Long id
  +String numAffiliation
  +String brancheSociale
  +String raisonSociale
  +String adresse
  +String telephone
  +String email
  +String gouvernorat
  +Boolean actif
}

class AgentPublic {
  +Long id
  +String numInscription
  +String nom
  +String prenom
  +String nomAr
  +String prenomAr
  +String cin
  +String email
  +String telephone
  +String adresse
  +Date dateNaissance
  +Boolean actif
}

class Ilhaq {
  +Long id
  +Date dateDebut
  +Date dateFin
  +String referenceArrete
  +String motif
}
note right of Ilhaq
  Un agent peut avoir
  plusieurs périodes
  d'Ilhaq (إلحاق)
end note

class Salaire {
  +Long id
  +Double salaireMensuel
  +Date dateEffet
}
note right of Salaire
  Règle : salaire applicable =
  dernier salaire avec
  dateEffet ≤ début trimestre
end note

class Cotisation {
  +Long id
  +Integer trimestre
  +Integer annee
  +Double montantCode137
  +Double montantCode138
  +Double montantTotal
  +String statut
  +Date dateLimite
  +Date dateGeneration
}
note right of Cotisation::statut
  EN_ATTENTE
  → PARTIELLEMENT_PAYE
  → PAYE | EN_RETARD
end note

class Paiement {
  +Long id
  +Double montantPaye
  +String codePaiement
  +String typePaiement
  +Date datePaiement
  +String reference
}
note left of Paiement::codePaiement
  137 = Employeur (17.07%)
  138 = Assuré (9.68%)
end note

class DocumentGed {
  +Long id
  +String nomFichier
  +String typeDocument
  +String contentType
  +Long taille
  +String cheminFichier
  +Date createdAt
}
note right of DocumentGed::typeDocument
  DECLARATION | ATTESTATION_SALAIRE
  | MOGARER_IAALEM | CIN | AUTRE
end note

class TauxHistorique <<Enum>> {
  +Date dateDebut
  +Date dateFin
  +Double tauxPatronal
  +Double tauxSalarial
}

Institution "1" -- "0..*" AgentPublic : agents
AgentPublic "1" -- "1..*" Ilhaq : periodes
AgentPublic "1" -- "0..*" Salaire : salaires
AgentPublic "1" -- "0..*" Cotisation : cotisations
AgentPublic "1" -- "0..*" DocumentGed : documents
Cotisation "1" -- "0..*" Paiement : paiements
Cotisation ..> TauxHistorique : <<utilise>>
@enduml
```

Statuts cotisation : `EN_ATTENTE` → `PARTIELLEMENT_PAYE` → `PAYE` | `EN_RETARD`

**Formule cotisation :** `Montant Trimestriel = Salaire Mensuel × 3 × Taux (selon TauxHistorique de la période)`

## 4.7 Conception du Service IA (Python)

**Code PlantUML** :

```plantuml
@startuml
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam activityBackgroundColor #F3E5F5
skinparam activityBorderColor #7B1FA2
skinparam activityDiamondBackgroundColor #CE93D8

title ai-extraction-service (Python 3.11 + FastAPI) — Port 8090

start

:Document uploade\n(PDF ou Image);

if (Type de fichier?) then (PDF)
  :Extraction texte\nvia PyMuPDF;
  if (Texte trouve?) then (Non - PDF scanne)
    :OCR Tesseract\nsur chaque page (300 DPI)\n**lang: fra + ara**;
  else (Oui - PDF natif)
    :Texte extrait directement;
  endif
else (Image)
  :OCR Tesseract\n**lang: fra + ara**;
endif

:Detection automatique du type\npar mots-cles (FR + AR);

note right
  Priorite de detection:
  1. Decision affectation
  2. Attestation salaire
  3. Attestation affiliation
  4. Contrat cooperant
  5. CIN
  6. Generique (fallback)
end note

switch (Type detecte?)
case (CIN)
  :Extraction:\nN° CIN, Nom, Date naissance\nLieu naissance, Adresse;
case (Attestation Salaire)
  :Extraction:\nSalaire, Employeur, Nom\nN° inscription, Periode;
case (Contrat)
  :Extraction:\nNom, Pays, Organisme\nDates debut/fin, Regime;
case (Attestation Affiliation)
  :Extraction:\nN° affiliation, N° inscription\nNom, Date effet;
case (Decision Affectation)
  :Extraction:\nNom, N° inscription, CIN\nInstitution, Date effet;
case (Generique)
  :Extraction heuristique:\nDates, Montants, Numeros\nEmails, Telephones;
endswitch

:Calcul du taux de confiance (%);

:Reponse JSON\n{ success, document_type,\nconfidence, extracted_data,\nwarnings };

stop

@enduml
```

**6 types de documents reconnus automatiquement :**

| # | Type | Champs extraits |
|---|------|-----------------|
| 1 | **CIN** (بطاقة التعريف) | N° CIN, Nom, Date/Lieu naissance, Adresse |
| 2 | **Attestation Salaire** (شهادة الأجر) | Salaire, Employeur, Nom, N° inscription, Période |
| 3 | **Contrat Coopérant** (عقد التعاون) | Nom, Pays, Organisme étranger, Dates, Régime |
| 4 | **Attestation Affiliation** (شهادة الإنخراط) | N° affiliation, N° inscription, Nom, Date effet |
| 5 | **Décision Affectation** (مقرر الإلحاق) | Nom, N° inscription, CIN, Institution, Date effet |
| 6 | **Générique** | Dates, Montants, Numéros, Emails, Téléphones |

**Stack Python :** FastAPI 0.104, pytesseract 0.3.10, PyMuPDF 1.23.7, Pillow 10.1, Pydantic 2.5

## 4.8 Flux d'intégration IA

**Code PlantUML** :

```plantuml
@startuml
skinparam backgroundColor #FEFEFE
skinparam shadowing false
skinparam sequenceArrowThickness 2
skinparam roundCorner 10
skinparam sequenceParticipantBorderColor #1565C0
skinparam sequenceLifeLineBorderColor #90CAF9

title Flux d'integration IA — Extraction de documents

actor "Agent CNSS /\nCooperant" as USER #E3F2FD
participant "Frontend\nAngular 17\nPort 4200" as FE #90CAF9
participant "API Gateway\nSpring Cloud\nPort 8080" as GW #FFB74D
participant "file-service\nSpring Boot\nPort 8088" as FILE #A5D6A7
participant "ai-extraction-service\nPython FastAPI\nPort 8090" as AI #CE93D8
database "Oracle XE 21c" as DB #BCAAA4

== 1. Declenchement extraction ==

USER -> FE : Clic bouton\n"Extraire donnees IA"
activate FE
FE -> GW : POST /api/ged/documents/{id}/extract
activate GW
GW -> FILE : Route vers file-service
activate FILE

== 2. Recuperation du document ==

FILE -> DB : Recherche document par ID
activate DB
DB --> FILE : Document (fichier binaire)
deactivate DB

== 3. Appel service IA Python ==

FILE -> AI : POST /extract\n(fichier + documentType hint)
activate AI

group Traitement IA
  AI -> AI : Detection format\n(PDF / Image)
  alt PDF natif
    AI -> AI : Extraction texte\nvia PyMuPDF
  else PDF scanne / Image
    AI -> AI : OCR Tesseract\n(fra + ara, 300 DPI)
  end
  AI -> AI : Detection automatique\ndu type de document\n(mots-cles FR + AR)
  AI -> AI : Extraction specialisee\n(Regex multilingue)
  AI -> AI : Calcul confiance (%)
end

AI --> FILE : JSON Response\n{ success, document_type,\nconfidence, extracted_data,\nwarnings }
deactivate AI

== 4. Retour au Frontend ==

FILE --> GW : JSON ExtractionResult
deactivate FILE
GW --> FE : JSON ExtractionResult
deactivate GW

FE -> FE : Affichage modale\n- Badge type detecte\n- Barre confiance (%)\n- Champs extraits\n- Texte brut OCR

FE --> USER : Modale "Resultat\nExtraction IA"
deactivate FE

@enduml
```

---

# 5. TRAVAIL RÉALISÉ (6 min)

## 5.1 Phase 1 — Modules Coopération Technique

### Module Authentification et Sécurité
- Connexion sécurisée JWT avec refresh token
- 3 rôles : Administrateur, Agent CNSS, Coopérant
- Gestion des sessions actives et journal d'audit

### Module Dossier ATCT
- Formulaire complet de création (bilingue FR/AR)
- Pays de détachement, période, salaire Tunisie/Étranger + conversion TND
- Validation par Agent CNSS + envoi automatique email identifiants
- Statuts : EN_ATTENTE → VALIDE → AFFILIE | REJETE | RECLAMATION

### Module GED (Gestion Électronique des Documents)
- Upload documents (PDF, images) avec catégorisation et tags
- Arborescence documents parent/enfant par dossier
- **Intégration IA** : bouton "Extraire données IA" sur chaque document
- Modale résultat : type détecté, barre de confiance (%), champs extraits

### Module Affiliation Employeur
- Attribution numéro employeur (Régime 500/510)
- Génération attestation d'affiliation
- Onglets : Employeur, Adresse, Responsable Légal

### Module Création des Débits
- 1er débit manuel par l'Agent CNSS
- **Débits automatiques trimestriels** via Scheduler cron
- Calcul selon salaire déclaré et taux applicables
- Envoi automatique avis de paiement (Email + PDF)

### Module Paiements et Carte Salaire
- Enregistrement des paiements reçus
- Suivi des échéances et validation salaires

### Module Dashboard
- 5 cartes statistiques : Total, En Attente, Validés, Affiliés, Retours CNSS
- Compteur documents GED, dossiers récents, actions rapides

### Module Espace Coopérant
- Dashboard personnel avec statut du dossier
- Suivi dossier en temps réel
- **Guide IA multilingue** (Chatbot FR/AR/EN) pour les démarches

### Module Notifications Automatiques
- Email inscription (identifiants connexion)
- Avis de paiement (PDF joint)
- Rappels (15j avant échéance, 2 trimestres impayés)
- Mailing semestriel récapitulatif

## 5.2 Phase 2 — Modules Mise en Disponibilité

### Module Enregistrement Dossiers
- Enregistrement **Institution** (recherche par numAffiliation/brancheSociale)
- Enregistrement **Agent Public** (N° inscription CNSS, nom FR/AR)
- Enregistrement **Ilhaq** (plusieurs périodes par agent)
- Scan et dépôt GED (3 documents obligatoires)

### Module Gestion des Salaires
- Saisie salaire mensuel + date d'effet
- Historique complet des salaires
- Règle : salaire applicable = dernier salaire avec dateEffet ≤ début trimestre

### Module Génération des Cotisations
- **3 modes** : Toutes / Par Institution / Par Agent
- Paramètres : Trimestre (1-4), Année, Institution, Agent
- Calcul automatique avec taux historiques
- Protection contre les doublons

### Module Paiements
- Saisie paiements (code 137 ou 138, type, référence)
- Paiements partiels possibles
- Statuts automatiques : EN_ATTENTE → PARTIELLEMENT_PAYE → PAYE | EN_RETARD

### Module Impressions (5 documents officiels)
1. Avis de paiement agents (إشعار للخلاص بالنسبة للاعوان)
2. Suivi paiements (متابعة خلاص المساهمات)
3. Notification de retard (إعلام حول تأخير المؤسسات)
4. Avis paiement institutions (إعلام لدفع المساهمات)
5. Notification agents publics (إعلام الاعوان العموميين)

### Module Espace Assuré
- Dashboard personnel, résumé situation, ilhaq en cours
- Cotisations par trimestre, historique paiements, documents, demandes

### Module Espace Employeur
- Dashboard (nombre agents, total cotisations dues)
- Liste agents, cotisations patronales (code 137), historique paiements

## 5.3 Modules IA développés en Python

### Service d'Extraction IA (ai-extraction-service)
- **Technologie :** Python 3.11, FastAPI, Tesseract OCR (français + arabe), PyMuPDF
- **Déploiement :** Conteneur Docker sur port 8090
- **Fonctionnement :**
  1. Réception du document (PDF ou Image)
  2. Extraction texte brut via OCR (Tesseract fra+ara) ou texte PDF natif
  3. Si PDF scanné → OCR sur chaque page à 300 DPI
  4. Détection automatique du type par mots-clés bilingues (FR + AR)
  5. Extraction spécialisée par Regex multilingue (patterns par type)
  6. Réponse JSON : { success, document_type, confidence %, extracted_data, warnings }
- **6 types reconnus :** CIN, Attestation salaire, Contrat, Attestation affiliation, Décision affectation, Générique
- **Intégration Frontend :**
  - Bouton "Extraire données IA" dans le détail dossier ATCT (4 documents)
  - Bouton "Extraire données IA" dans le détail document GED
  - Modale de résultat avec badge type, barre de confiance colorée, champs extraits
- **4 endpoints :** POST /extract, POST /extract-from-bytes, GET /document-types, GET /health

### Guide IA Multilingue (Chatbot Coopérant)
- **Langues :** Français, Arabe, Anglais (changement en temps réel)
- **Intégration :** Chat intégré dans l'Espace Coopérant (Angular)
- **8 thèmes couverts :**
  - Mon Dossier (dossier, ملف, file)
  - Cotisations (cotisation, مساهمة, contribution)
  - Paiements (paiement, خلاص, payment)
  - Actualisation Salaire (salaire, أجر, salary)
  - Régime Maladie (regime, مرض, health)
  - Rachat Loi 105 (rachat, استرداد, buyback)
  - Documents Requis (document, وثيقة, paper)
  - Navigation générale (fallback)
- **Interface :** Header gradient, bulles de chat, support RTL pour l'arabe, indicateur de saisie animé

## 5.4 Chiffres clés du projet

| Métrique | Valeur |
|----------|--------|
| **Microservices** | 11 Spring Boot + 2 Python IA |
| **Applications Angular** | 2 (Coopération Technique + Disponibilité) |
| **Endpoints API REST** | ~120+ |
| **Tables base de données** | ~25+ |
| **Conteneurs Docker** | 14 (services + infrastructure) |
| **Types documents IA** | 6 types reconnus automatiquement |
| **Chatbot multilingue** | 3 langues, 8 thèmes |

---

# 6. CONCLUSION ET PERSPECTIVES 

## Bilan

Durant ce stage, j'ai conçu et développé **deux applications web complètes** pour la CNSS :

- **Phase 1 — Coopération Technique ATCT :** Système complet de gestion des coopérants détachés à l'étranger, avec dématérialisation, GED avec extraction IA, notifications automatiques et espaces personnalisés.

- **Phase 2 — Mise en Disponibilité Spéciale :** Système de gestion de la couverture sociale des agents publics, avec calcul automatique des cotisations, suivi des paiements et génération de documents officiels.

- **Modules IA Python :** Service d'extraction OCR intelligent (6 types de documents, bilingue FR/AR) et chatbot multilingue d'assistance (FR/AR/EN).

## Compétences acquises

| Domaine | Compétences |
|---------|-------------|
| **Backend** | Architecture microservices, Spring Boot, Spring Cloud, JPA/Hibernate |
| **Frontend** | Angular 17, TailwindCSS, composants standalone |
| **IA / Python** | FastAPI, Tesseract OCR, extraction Regex multilingue |
| **DevOps** | Docker, Docker Compose, orchestration conteneurs |
| **Sécurité** | JWT, RBAC, chiffrement |
| **Métier** | Sécurité sociale, régimes CNSS, cotisations |

## Perspectives

- Déploiement en production sur l'infrastructure CNSS
- Intégration avec le SI existant (systèmes legacy)
- Conversion devises en temps réel (API Banque Centrale de Tunisie)
- Application mobile pour les coopérants et assurés
- Pipeline CI/CD automatisé

---

# MERCI POUR VOTRE ATTENTION

## Questions ?

---

**Stagiaire :** Sahar Gaiche
**Projet :** Système de Gestion CNSS — Coopération Technique et Mise en Disponibilité
**Technologies :** Angular 17 · Spring Boot 3.2 · Python FastAPI · Oracle XE · Docker · Microservices
**Période :** Décembre 2025 — Mai 2026
