# CAHIER DES CHARGES
## Système de Gestion de la Coopération Technique - CNSS
 
**Projet:** CPFE - Coopération Technique ATCT  

---

## TABLE DES MATIÈRES

1. [Introduction](#1-introduction)
2. [Modules Développés](#2-modules-développés)
3. [Nouveaux Modules à Développer](#3-nouveaux-modules-à-développer)
4. [Exigences de Sécurité](#4-exigences-de-sécurité)
5. [Architecture Technique](#5-architecture-technique)

---

## 1. INTRODUCTION

### 1.1 Contexte
Le système de gestion de la Coopération Technique ATCT (Assistance Technique et Coopération Technique) est une application web destinée à la CNSS pour gérer les dossiers des coopérants tunisiens détachés à l'étranger. Le système permet la gestion complète du cycle de vie d'un coopérant : de l'inscription initiale jusqu'au suivi des paiements et des régularisations.

### 1.2 Objectifs
- Dématérialisation du processus de gestion des coopérants
- Automatisation des calculs de cotisations et débits
- Traçabilité complète des opérations
- Notification automatique des coopérants
- Sécurisation des données sensibles

### 1.3 Acteurs du Système
| Acteur | Description |
|--------|-------------|
| **Administrateur** | Gestion complète du système, utilisateurs, paramétrage |
| **Agent CNSS** | Traitement des dossiers, validation, création débits |
| **Coopérant** | Dépôt de dossiers, consultation de son compte |

---

## 2. MODULES DÉVELOPPÉS

### 2.1 Module Authentification et Gestion des Utilisateurs

**Statut:** ✅ Développé

**Description:**
Système d'authentification sécurisé basé sur JWT permettant la gestion des accès selon les rôles définis.

**Fonctionnalités:**
- Connexion sécurisée (Login/Logout)
- Gestion des sessions avec tokens JWT
- Gestion des rôles : Admin, Agent CNSS, Coopérant
- Profils utilisateurs avec informations personnelles
- Journal d'audit des connexions

**Interfaces:**
- Formulaire de connexion
- Gestion des utilisateurs (Admin)
- Page profil utilisateur

---

### 2.2 Module Coopérant (Saisie Dossier)

**Statut:** ✅ Développé

**Description:**
Module permettant la saisie et la gestion des dossiers de coopération technique. Correspond à l'interface "SAISIE DOSSIER" du système legacy.

**Fonctionnalités:**
- **Informations Assuré:**
  - N° affiliation
  - Situation (Actif/Inactif)
  - Date effet
  - Nom & prénom / Raison Sociale (FR/AR)
  - Matricule assuré
  - Date de naissance

- **Coopération Technique:**
  - Entreprise employeur (Matricule, Code Régime Compl., Désignation)
  - Pays de détachement
  - Période de détachement (Du/Au)
  - Salaire en Tunisie (Trimestriel)
  - Salaire à l'étranger

- **Gestion des Avantages:**
  - Tableau des régimes avec avantages et dates
  - Régimes supportés: 500, 510, 515

**Règles Métier:**
- Attribution numéro employeur régime 500 ou 510 non affecté
- Date d'effet au max 1 an de la date de dépôt CNSS
- Périodes antérieures: taux de rachat appliqué automatiquement
- Conversion du salaire étranger en dinar tunisien à la date du détachement
- La société mère doit être un établissement public

---

### 2.3 Module Affiliation Employeur

**Statut:** ✅ Développé

**Description:**
Gestion de l'affiliation des employeurs dans le cadre de la coopération technique.

**Fonctionnalités:**
- **Onglet Employeur:**
  - Raison Sociale (FR/AR)
  - Activité: COOPERATION TECHNIQUE
  - Type Affiliation
  - Nationalité
  - Estimation intégrale
  - Numéro Affiliation Préd.
  - Date Assujettissement / Date Effet

- **Onglet Adresse:**
  - Adresse complète
  - Voie et libellé
  - Numéro
  - Cité / Immeuble / Appartement
  - Code Postal / Localité

- **Onglet Responsable Légal:**
  - Pièce d'identité (Numéro)
  - Nom / Prénom
  - Adresse
  - Code Postal / Localité
  - Date Naissance / Lieu
  - Téléphone / Fax / Email
  - Numéro Sécurité Sociale
  - Nationalités

**Règles Métier:**
- Date d'assujettissement = Date d'effet (sauf cas particuliers)
- Pas d'arabisation requise
- Rubrique patente et activité non nécessaire pour régime coopération technique

---

### 2.4 Module Création des Débits

**Statut:** ✅ Développé (manuel)

**Description:**
Module de création des débits de cotisation pour les coopérants. Le premier débit est créé manuellement, les suivants peuvent être générés automatiquement.

**Fonctionnalités:**
- **Période:**
  - En cours / Toutes
  - Trimestre/Année

- **Dossier:**
  - N° affiliation
  - Date début

- **Actions:**
  - Créer
  - Supprimer

- **Procédure stockée:** `cs\p_06\copt_test_credeb`

**Règles Métier:**
- Si le trimestre de la date effet est déjà déclaré par l'employeur tunisien, ne pas générer le débit du trimestre
- Génération automatique trimestrielle après le 1er débit

---

### 2.5 Module Avis de Paiement Cotisant

**Statut:** ✅ Développé

**Description:**
Affichage et génération des avis de paiement pour les cotisants.

**Fonctionnalités:**
- Sélection Trimestre/Année
- N° affiliation
- Tableau détaillé:
  - Matricule
  - Date début
  - Salaire
  - Taux Retraite (%)
  - Taux AB (%)
  - Taux RCR (%)
  - Taux G (%)
  - Montant à payer
- Impression de l'avis (1 avis par coopérant)

---

### 2.6 Module Carte Salaire

**Statut:** ✅ Développé

**Description:**
Gestion et validation des salaires suite aux paiements effectués.

**Fonctionnalités:**
- Édition de carte salaire
- Envoi de carte salaire
- Ré-envoi de cartes salaires
- Filtrage par Matricule, Trimestre/Année
- Tableau: Matricule, C.Expl, Tr, Année, Date carte, Nom fichier, Ré-envoyer

**Règles Métier:**
- Suite à des règlements partiels ou redressement éventuel, les salaires sont validés individuellement après règlement total

---

### 2.7 Module Dashboard et Rapports

**Statut:** ✅ Développé

**Description:**
Tableau de bord avec statistiques et génération de rapports.

**Fonctionnalités:**
- Statistiques globales
- Liste des coopérants avec salaires et employeurs
- Export des données

---

## 3. NOUVEAUX MODULES À DÉVELOPPER

---

## 🔄 WORKFLOW GLOBAL - PROCESSUS INSCRIPTION COOPÉRANT

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                     PHASE 1: INSCRIPTION COOPÉRANT                                │
├─────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                   │
│  ┌────────────────┐    ┌────────────────┐    ┌──────────────────────────────────┐  │
│  │  Module ATCT     │    │   Validation     │    │  Mailing Inscription           │  │
│  │  (Agent ATCT /   │───▶│   Dossier        │───▶│  (Email + MDP pour connexion)  │  │
│  │   Agent CNSS)    │    │   (Agent)        │    │  Dépôt dossier inscription     │  │
│  └────────────────┘    └────────────────┘    └──────────────────────────────────┘  │
│        │                        │                                                   │
│        │ Création dossier        │ Après validation                                │
│        │ coopérant               │ envoi email au coopérant                        │
│        ▼                        ▼                                                   │
│  ┌───────────────────────────────────────────────────────────────────────────────┐  │
│  │  Coopérant se connecte avec Email + MDP                                          │  │
│  │  ─────────────────────────────────────────────────────────────────────────────  │  │
│  │  Dépose ses documents pour inscription CNSS via GED                             │  │
│  └───────────────────────────────────────────────────────────────────────────────┘  │
│                                         │                                          │
│                                         ▼                                          │
│  ┌───────────────────────────────────────────────────────────────────────────────┐  │
│  │  Agent CNSS crée l'AFFILIATION (Module déjà développé)                          │  │
│  │  → Génération attestation d'affiliation                                         │  │
│  │  → Création 1er débit (manuel)                                                  │  │
│  └───────────────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│                        PHASE 2: GESTION DES DÉBITS                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌────────────┐ │
│  │  1er Débit   │───▶│   Débits     │───▶│   Mailing    │───▶│  Rappel    │ │
│  │   MANUEL     │    │ Auto/Trim.   │    │ Avis Paiement│    │ 2T impayés │ │
│  │  (Agent)     │    │  (flag auto) │    │ (auto/débit) │    │  (auto)    │ │
│  └──────────────┘    └──────────────┘    └──────────────┘    └────────────┘ │
│                             │                                                │
│                             │ Retour 1 an à partir date dépôt               │
│                             ▼                                                │
│                      ┌──────────────┐                                        │
│                      │   Mailing    │                                        │
│                      │  Auto 6 mois │                                        │
│                      └──────────────┘                                        │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│                        PHASE 3: DEMANDES COOPÉRANT                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌────────────────────┐  ┌────────────────────┐  ┌────────────────────────┐ │
│  │ Dépôt Actualisation│  │ Dépôt Demande      │  │ Dépôt Demande          │ │
│  │ Salaire            │  │ Sortie Régime      │  │ Annulation Assurance   │ │
│  │                    │  │ Maladie            │  │ Maladie + Capital Décès│ │
│  └────────────────────┘  └────────────────────┘  └────────────────────────┘ │
│                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │  Débits réglés > 1 an → Dépôt Demande Rachat (Loi 105 - Taux 95%)   │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

### 3.1 Module ATCT - Interface Agent (Point d'entrée)

**Statut:** ✅ Développé

**Description:**
Module principal utilisé par l'**Agent ATCT** et l'**Agent CNSS** pour créer le dossier d'un coopérant. C'est le **point d'entrée** du processus d'inscription à la coopération technique.

**Acteurs:** 
- **Agent ATCT** (principal)
- **Agent CNSS** (peut aussi effectuer les tâches ATCT)
- **Admin**

**Fonctionnalités:**
- Création du dossier coopérant (informations de base)
- Saisie des informations de détachement
- Saisie du pays de détachement et période
- Saisie du salaire (Tunisie et étranger)
- Validation du dossier

**Workflow Après Validation:**
1. Agent valide le dossier coopérant
2. Système envoie **mailing automatique** au coopérant:
   - Email de connexion
   - Mot de passe temporaire
   - Instructions pour déposer ses documents
3. Coopérant se connecte et dépose ses documents pour inscription CNSS
4. **Agent CNSS** procède à la **création d'affiliation** (module déjà développé)

**Sortie:** Dossier validé → Mailing au coopérant (Email+MDP) → Dépôt documents → Affiliation CNSS

---

### 3.2 Module GED - Dépôt Dossier

**Statut:** 

**Description:**
Système de Gestion Électronique des Documents. Après création du dossier par l'agent ATCT, les documents sont déposés pour compléter le dossier.

**Fonctionnalités:**
- Upload de documents (PDF, images)
- Types de documents:
  - Contrat de travail à l'étranger
  - Pièce d'identité (CIN/Passeport)
  - Attestation employeur tunisien
  - Justificatifs de salaire
  - Formulaire de demande signé
- Versionning des documents
- Validation des formats et tailles
- Stockage sécurisé et chiffré
- Traçabilité des dépôts (date, heure, utilisateur)

**Exigences:**
- Taille max par fichier: 10 MB
- Formats acceptés: PDF, JPG, PNG
- Chiffrement AES-256 des documents stockés

**Lien workflow:** Dossier ATCT créé → Documents déposés → Validation Réception

---

### 3.3 Module Validation Réception

**Statut:** 

**Description:**
Module de validation de la réception et de la complétude des dossiers déposés. L'Agent CNSS valide que tous les documents requis sont présents et conformes.

**Fonctionnalités:**
- Liste des dossiers en attente de validation
- Checklist de vérification de complétude
- Validation/Rejet avec motif détaillé
- Génération automatique d'accusé de réception
- Demande de pièces complémentaires
- Historique des validations

**Workflow:**
```
1. Dossier déposé       → Statut "En attente de validation"
2. Agent en cours       → Statut "En cours de vérification"
3. Documents incomplets → Statut "En attente pièces" + Notification
4. Validation OK        → Statut "Validé" + Déclenchement Mailing Inscription
5. Rejet définitif      → Statut "Rejeté" + Motif + Notification
```

**Sortie:** Dossier validé → Mailing Inscription (Email + MDP)

---

### 3.4 Module Mailing Réclamation Inscription

**Statut:** 

**Description:**
Après validation du dossier, le système envoie automatiquement un email au coopérant contenant ses identifiants de connexion pour accéder à l'interface de dépôt.

**Fonctionnalités:**
- **Email d'inscription envoyé contenant:**
  - Confirmation de l'inscription
  - **Email de connexion** (identifiant)
  - **Mot de passe temporaire** (généré automatiquement)
  - Lien vers l'interface de connexion
  - Instructions pour le premier accès
  - Attestation d'affiliation en pièce jointe (PDF)

- **Sécurité:**
  - Mot de passe temporaire à changer à la première connexion
  - Lien de connexion sécurisé (HTTPS)
  - Expiration du lien après 48h si non utilisé

**Template Email:**
```
Objet: CNSS - Confirmation d'inscription Coopération Technique

Madame/Monsieur [NOM PRENOM],

Nous avons le plaisir de vous informer que votre inscription au régime 
de Coopération Technique a été validée.

Vos identifiants de connexion:
- Email: [EMAIL_COOPERANT]
- Mot de passe temporaire: [MDP_GENERE]

Connectez-vous sur: https://cnss.tn/cooperant/login

Vous pourrez ainsi:
- Déposer vos documents pour l'inscription CNSS
- Consulter vos avis de paiement
- Suivre vos cotisations

Cordialement,
CNSS - Caisse Nationale de Sécurité Sociale
```

**Lien workflow:** Validation OK → Email envoyé → Coopérant accède à son espace

---

### 3.5 Module Création des Débits (Cycle Complet)

**Statut:** (automatisation)

**Description:**
Gestion complète du cycle de création des débits, du premier débit manuel jusqu'à l'automatisation trimestrielle.

#### 3.5.1 Premier Débit (Manuel)
- Créé par l'Agent CNSS via interface existante
- Basé sur la date de dépôt du dossier
- Calcul selon salaire déclaré et taux applicables

#### 3.5.2 Débits Suivants (Automatique Trimestriel)
**Fonctionnalités:**
- **Flag automatique** à chaque trimestre
- Génération automatique des débits trimestriels
- **Retour 1 an** à partir de la date de dépôt création
- Calcul basé sur le dernier salaire validé

**Règles Métier:**
- Génération le 1er jour du trimestre (T1: 01/01, T2: 01/04, T3: 01/07, T4: 01/10)
- Vérification du statut actif du coopérant
- Si trimestre déjà déclaré par employeur tunisien → Ne pas générer
- Application automatique du taux de rachat pour périodes antérieures

**Scheduler Job:**
```
Cron: 0 0 1 1,4,7,10 * ?  (1er jour de chaque trimestre à minuit)
Actions:
  1. Récupérer tous les coopérants actifs
  2. Pour chaque coopérant:
     - Vérifier éligibilité
     - Calculer montant débit
     - Créer enregistrement débit
     - Déclencher mailing avis de paiement
  3. Logger résultats
  4. Alerter en cas d'erreur
```

#### 3.5.3 Mailing Avis de Paiement (Auto à chaque débit)
- **Déclenchement:** Automatique à chaque génération de débit
- **Contenu:**
  - N° affiliation
  - Période concernée (Trimestre/Année)
  - Montant à payer
  - Détail des taux (Retraite, AB, RCR, G)
  - RIB du bureau régional
  - Date limite de paiement
- **Format:** Email + PDF en pièce jointe

---

### 3.6 Module Actualisation des Salaires

**Statut:** 
**Description:**
Permet aux coopérants de mettre à jour leurs informations salariales via leur espace personnel.

**Fonctionnalités:**
- **Dépôt Actualisation Salaire (Coopérant):**
  - Formulaire de mise à jour en ligne
  - Nouveau salaire en devise étrangère
  - Conversion automatique en dinar tunisien (cours BCT)
  - Upload justificatifs obligatoires:
    - Bulletin de paie récent
    - Attestation employeur étranger

- **Validation par Agent CNSS:**
  - Liste des demandes d'actualisation
  - Vérification des justificatifs
  - Validation/Rejet avec motif
  - Impact automatique sur les débits futurs

**Règles Métier:**
- Actualisation possible une fois par an minimum
- Prise en compte à partir du trimestre suivant la validation
- Historique des salaires conservé

---

### 3.7 Module Demandes Diverses (Espace Coopérant)

**Statut:** 

**Description:**
Espace permettant aux coopérants de soumettre différentes demandes administratives.

#### 3.7.1 Dépôt Demande Sortie Régime Maladie
- Formulaire de demande en ligne
- Motifs de sortie (liste déroulante)
- Documents justificatifs à joindre
- Workflow de validation Agent CNSS
- Notification du résultat par email

#### 3.7.2 Dépôt Demande Annulation Assurance Maladie et Capital Décès
- Formulaire dédié
- Motif de la demande
- Impact calculé sur les cotisations futures
- Validation requise
- Recalcul automatique des débits après validation

#### 3.7.3 Dépôt Demande de Rachat (Débits > 1 an)
**Conditions d'éligibilité:**
- Débits réglés depuis plus de 1 an
- Coopérant en situation régulière

**Fonctionnalités:**
- Identification automatique des débits éligibles
- **Calcul selon Loi 105 - Taux 95%:**
  ```
  Montant Rachat = Montant Débit Original × 95%
  ```
- Génération du bordereau de rachat
- Possibilité de paiement échelonné
- Suivi de la demande

---

### 3.8 Module Rappels et Alertes Automatiques

**Statut:** 

**Description:**
Système complet de rappels automatiques pour le suivi des paiements et obligations des coopérants.

#### 3.8.1 Rappel Avis de Paiement
- **Déclenchement:** 15 jours avant la date limite de paiement
- **Contenu:** Rappel du montant dû et date limite
- **Fréquence:** Automatique pour chaque débit non réglé

#### 3.8.2 Rappel 2 Trimestres Non Payés
- **Déclenchement:** Automatique si 2 trimestres consécutifs impayés
- **Actions:**
  - Email de relance au coopérant
  - Mise en demeure formelle
  - Alerte vers Agent CNSS pour suivi
- **Template:** Lettre de relance officielle CNSS

#### 3.8.3 Mailing Automatique Semestriel (Chaque 6 mois)
- **Fréquence:** Automatique tous les 6 mois (01/01 et 01/07)
- **Contenu:**
  - Récapitulatif de la situation du compte
  - Historique des paiements
  - Débits en cours et à venir
  - Rappel des obligations
- **Objectif:** Maintenir le contact et prévenir les impayés

**Scheduler Jobs:**
```
Rappel Avis:     Quotidien à 08:00 (vérification échéances J+15)
Rappel 2T:       Hebdomadaire (détection retards)
Mailing 6 mois:  0 0 1 1,7 * ? (1er janvier et 1er juillet)
```

**Dashboard Alertes Agent:**
- Liste des coopérants en retard de paiement
- Indicateurs de risque (rouge/orange/vert)
- Actions rapides (envoyer rappel, bloquer compte)
- Export liste pour relance téléphonique

---

### 3.9 Module Actualisation Débits Anciens (Rachat Loi 105)

**Statut:** 

**Description:**
Gestion des débits anciens (>1 an) et possibilité de régularisation selon la Loi 105 avec taux de rachat à 95%.

**Conditions d'éligibilité:**
- Débits réglés depuis plus de 1 an à partir de la date de dépôt
- Coopérant toujours actif dans le régime

**Fonctionnalités:**
- Identification automatique des débits éligibles au rachat
- **Calcul selon Loi 105:**
  ```
  Montant à Payer = Montant Débit Original × 95%
  Réduction = 5% du montant original
  ```
- Génération du bordereau de rachat
- Plan de régularisation (paiement échelonné possible)
- Suivi des paiements de rachat
- Mise à jour automatique du statut après règlement

**Workflow:**
1. Coopérant dépose demande de rachat via son espace
2. Système vérifie éligibilité (débits > 1 an)
3. Calcul automatique avec taux 95%
4. Validation Agent CNSS
5. Génération bordereau + Notification coopérant
6. Suivi paiement et clôture

---

## 4. EXIGENCES DE SÉCURITÉ

### 4.1 Authentification et Autorisation
- **Authentification forte:** JWT avec refresh token
- **Durée de session:** 30 minutes (configurable)
- **Politique de mot de passe:**
  - Minimum 12 caractères
  - Majuscules, minuscules, chiffres, caractères spéciaux
  - Expiration tous les 90 jours
  - Historique des 5 derniers mots de passe
- **Verrouillage de compte:** Après 5 tentatives échouées
- **Authentification 2FA:** Optionnelle pour les admins

### 4.2 Protection des Données
- **Chiffrement:**
  - Données en transit: TLS 1.3
  - Données au repos: AES-256
  - Mots de passe: BCrypt (cost factor 12)
- **Anonymisation:** Données sensibles masquées dans les logs
- **Backup:** Sauvegarde quotidienne chiffrée

### 4.3 Audit et Traçabilité
- **Journal d'audit:**
  - Connexions/Déconnexions
  - Modifications de données
  - Accès aux documents sensibles
  - Actions administratives
- **Rétention:** 5 ans minimum
- **Non-répudiation:** Horodatage signé

### 4.4 Conformité
- Conformité RGPD/Protection des données personnelles
- Droits d'accès, de rectification et de suppression
- Consentement explicite pour les communications

### 4.5 Sécurité Applicative
- Protection CSRF
- Protection XSS
- Validation des entrées (côté serveur)
- Rate limiting sur les endpoints sensibles
- Headers de sécurité (CSP, HSTS, X-Frame-Options)

---

## 5. ARCHITECTURE TECHNIQUE

### 5.1 Stack Technologique
| Composant | Technologie |
|-----------|-------------|
| Frontend | Angular 17 + TailwindCSS |
| Backend | Spring Boot 3.x (Java 17) |
| Base de données | PostgreSQL 15 |
| Cache | Redis |
| Message Queue | RabbitMQ |
| Conteneurisation | Docker + Docker Compose |
| Gateway | Spring Cloud Gateway |
| Service Discovery | Eureka Server |

### 5.2 Microservices
- **auth-service:** Authentification et gestion utilisateurs
- **affiliation-service:** Gestion des affiliations
- **cooperation-service:** Gestion coopération technique (ATCT)
- **debit-service:** Création et gestion des débits
- **payment-service:** Gestion des paiements
- **notification-service:** Emails et notifications
- **file-service:** GED et gestion documents
- **salary-service:** Gestion des salaires
- **regime-service:** Paramétrage des régimes

### 5.3 Intégrations
- Système de mailing (SMTP/SendGrid)
- Conversion devises (API BCT)
- Système legacy CNSS (si applicable)

