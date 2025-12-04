# 📋 Plan de Migration Complète vers Oracle - Coopération Technique CNSS

## 🎯 Objectif
Migrer l'application complète vers Oracle et implémenter le workflow exact de la Coopération Technique selon le cahier des charges.

---

## 📊 Analyse des Tables Oracle

### Tables Principales Identifiées

| Table | Description | Clé Primaire |
|-------|-------------|--------------|
| `APP_USER` | Utilisateurs | `ID` |
| `DOSSIER_COP` | Dossiers coopération | `(EMP_MAT, EMP_CLE, DCO_DTDEB)` |
| `ENGAGEMENT` | Engagements principaux | `(ENG_NUM)` |
| `ENG_COP` | Échéances engagement | `(ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB, ENO_NUMENG, ENO_DTECH)` |
| `SLAIRE_ETRANGER` | Salaires étrangers | À analyser |
| `TAU_COT_COP` | Taux de cotisation | À analyser |
| `REG_LEGAL_CNSS` | Régimes légaux | À analyser |
| `MVT_ENGAGEMENT` | Mouvements engagement | À analyser |

### Relations Détectées
- `DOSSIER_COP` ↔ `ENGAGEMENT` (un dossier → plusieurs engagements)
- `ENGAGEMENT` ↔ `ENG_COP` (un engagement → plusieurs échéances)
- `DOSSIER_COP` → `SLAIRE_ETRANGER` (salaire du pays de détachement)

---

## 🚀 Workflow de Coopération Technique

### Étape 1 : Attribution Numéro Employeur
**Écran** : Affiliation Employeur

**Champs** :
- N° affiliation (automatique)
- Régime : 500 (Régime Général) ou 510 (Régime Spécial)
- Raison Sociale
- Activité : COOPERATION TECHNIQUE
- Type Affiliation : Normale
- Nationalité
- Date Assujettissement
- Date Effet
- Estimation Intégrale

**Règles** :
- Numéro régime 500 ou 510 non affecté
- Pas de série numérique
- Date d'effet : Max 1 an depuis dépôt CNSS
- Périodes antérieures : Taux de rachat automatique

### Étape 2 : Saisie Dossier Coopération
**Écran** : Saisie Dossier

**Onglet 1 - Assuré** :
- N° affiliation
- Nom & prénom / Raison Sociale (FR + AR)
- Matricule assuré
- Date de naissance
- Situation (ACTIF, INACTIF)
- Date effet

**Onglet 2 - Coopération Technique** :
- **Entreprise employeur** :
  - Matricule
  - Code Régime Complémentaire
  - Désignation
- **Dossier** :
  - Pays de détachement (liste déroulante)
  - Période de détachement (Du → Au)
  - Salaire en Tunisie Trimestriel (TND)
  - **Bouton** : Ajouter salaire étranger
  - Salaire à l'étranger (devise étrangère)

**Onglet 3 - Gestion des Avantages** :
- Tableau : Régime | Avantage | Date
- Exemple : "500 COOP TECHNIQUE REGIME GENERAL | PAS ASS SOCIALE ET N'ADMET PAS COMPTE ETAT | 01-04-2025"

**Règles** :
- Conversion automatique : Salaire étranger → TND (taux BCT au 1er jour détachement)
- Détermination code exploitation selon note de service 18/2008
- Validation de la saisie

### Étape 3 : Génération Attestation
**Sortie** : Certificat d'Affiliation

**Contenu** :
- Logo CNSS
- Numéro affiliation
- Nom & prénom
- Matricule
- Employeur
- Régime
- Date effet
- Date génération

### Étape 4 : Création Débit
**Écran** : Création des Débits

**Paramètres** :
- Période :
  - ○ En cours
  - ○ Toutes
  - Trimestre/Année : [02] [2025]
- Dossier :
  - N° affiliation : [500380] [54]
  - Date début : [01-04-2025]
- **Boutons** : Créer | Supprimer

**Règle** :
- Génération automatique dès la date effet
- Si trimestre déjà déclaré par employeur tunisien → Pas de débit généré

**Sortie** : Avis de Paiement Cotisant

**Tableau** :
| Matricule | Date début | Salaire | Taux Retraite (%) | Taux AS (%) | Taux RCR (%) | Taux G. (%) | Montant à payé |
|-----------|------------|---------|-------------------|-------------|--------------|-------------|----------------|
| 500380-54 | 01-04-2025 | 12,053.857 | 13.5 | 0 | 9 | 13.5 | 2,712.118 |

**Calculs** :
- Taux Retraite : 13.5%
- Taux AS : 0%
- Taux RCR : 9%
- Taux Global : 13.5%
- Montant = Salaire × (Taux Global / 100)

### Étape 5 : Email Automatique
**Déclencheur** : Validation de l'affiliation

**Contenu Email** :
```
Objet : Affiliation Coopération Technique - N° [500380-54]

Bonjour,

Votre affiliation au régime de coopération technique a été enregistrée avec succès.

Détails de l'affiliation :
- N° Affiliation : 500380-54
- Date d'effet : 01/04/2025
- Régime : 500 - Coopération Technique Régime Général
- Employeur : NAJLA B MOHAMED HASSAN KASSAAJI

Montant de la cotisation trimestrielle : 2,712.118 TND

RIB du bureau : [RIB]

Merci de procéder au paiement avant la date limite.

Cordialement,
CNSS - Caisse Nationale de Sécurité Sociale
```

### Étape 6 : Validation Salaire (Carte Salaire)
**Écran** : Carte Salaire

**Actions** :
- **Éditer** : Modifier le salaire si redressement
- **Envoyer** : Envoyer la carte salaire par email

**Tableau Re-envoi** :
| Matricule | C.Expl | Tr | Année | Date carte | Nom fichier | Re-envoyer |
|-----------|--------|-----|-------|------------|-------------|------------|
| ... | ... | ... | ... | ... | ... | ☐ |

**Confirmation** :
- "Êtes-vous sûr d'envoyer la carte salaire"
- [Envoyer] [Annuler]

**Règles** :
- Validation après paiement total
- Redressement possible avant validation
- Génération d'un document officiel avec logo CNSS

---

## 🗂️ Structure des Entités JPA

### 1. User (APP_USER)
```java
@Entity
@Table(name = "APP_USER", schema = "COPT")
public class User {
    @Id
    @Column(name = "ID")
    private Long id;
    
    @Column(name = "USERNAME", length = 50)
    private String username;
    
    @Column(name = "PASSWORD", length = 50)
    private String password;
    
    @Column(name = "IDENTITE", length = 100)
    private String identite;
    
    @Column(name = "PROFIL", length = 10)
    private String profil;
    
    @Column(name = "BUR_COD")
    private Integer burCod;
}
```

### 2. DossierCoop (DOSSIER_COP)
```java
@Entity
@Table(name = "DOSSIER_COP", schema = "COPT")
@IdClass(DossierCoopId.class)
public class DossierCoop {
    @Id
    @Column(name = "EMP_MAT")
    private Long empMat;
    
    @Id
    @Column(name = "EMP_CLE")
    private Integer empCle;
    
    @Id
    @Column(name = "DCO_DTDEB")
    private Date dcoDateDebut;
    
    @Column(name = "ASS_MAT")
    private Long assureMat;
    
    @Column(name = "ASS_CLE")
    private Integer assureCle;
    
    @Column(name = "PAY_COD")
    private Integer paysCode;
    
    @Column(name = "DCO_DTFIN")
    private Date dcoDateFin;
    
    @Column(name = "DCO_SALAIRE")
    private BigDecimal dcoSalaire;
    
    @Column(name = "DCO_NUMAFF")
    private Long dcoNumAffiliation;
    
    @Column(name = "DCO_CLEAFF")
    private Integer dcoClefAffiliation;
    
    @Column(name = "DCO_NUMREGCPL")
    private Long dcoNumRegimeComplementaire;
    
    @Column(name = "DCO_CLLEREGCPL")
    private Integer dcoClefRegimeComplementaire;
    
    @Column(name = "DCO_SALID", length = 1)
    private String dcoSalaireId;
}
```

### 3. Engagement (ENGAGEMENT)
```java
@Entity
@Table(name = "ENGAGEMENT", schema = "COPT")
public class Engagement {
    @Id
    @Column(name = "ENG_NUM")
    private Long engNum;
    
    @Column(name = "EMP_MAT")
    private Long empMat;
    
    @Column(name = "EMP_CLE")
    private Integer empCle;
    
    @Column(name = "DCO_DTDEB")
    private Date dcoDateDebut;
    
    @Column(name = "ENO_NUM_PERIODE")
    private Integer enoNumPeriode;
    
    @Column(name = "ENG_DTECHEANCE")
    private Date engDateEcheance;
    
    @Column(name = "ENG_SITUATION")
    private Integer engSituation;
    
    @Column(name = "ENG_MONTANT")
    private BigDecimal engMontant;
    
    @Column(name = "ENG_CREE_LE")
    private Date engCreeLe;
}
```

### 4. EngagementEcheance (ENG_COP)
```java
@Entity
@Table(name = "ENG_COP", schema = "COPT")
@IdClass(EngagementEcheanceId.class)
public class EngagementEcheance {
    @Id
    @Column(name = "ENG_NUM")
    private Long engNum;
    
    @Id
    @Column(name = "EMP_MAT")
    private Long empMat;
    
    @Id
    @Column(name = "EMP_CLE")
    private Integer empCle;
    
    @Id
    @Column(name = "DCO_DTDEB")
    private Date dcoDateDebut;
    
    @Id
    @Column(name = "ENO_NUMENG")
    private Integer enoNumEng;
    
    @Id
    @Column(name = "ENO_DTECH")
    private Date enoDateEcheance;
    
    @Column(name = "ENO_SITENG")
    private Integer enoSituation;
    
    @Column(name = "ENO_MNT")
    private BigDecimal enoMontant;
    
    @Column(name = "ENO_MNTECH")
    private BigDecimal enoMontantEcheance;
    
    @Column(name = "ENO_DTPAYECH")
    private Date enoDatePaiementEcheance;
    
    @Column(name = "ENO_DTDEB")
    private Date enoDateDebut;
    
    @Column(name = "ENO_DTFIN")
    private Date enoDateFin;
    
    @Column(name = "ENO_SALAIRE")
    private BigDecimal enoSalaire;
    
    @Column(name = "ENO_MNTPAY")
    private BigDecimal enoMontantPaye;
}
```

### 5. SalaireEtranger (SLAIRE_ETRANGER)
```java
@Entity
@Table(name = "SLAIRE_ETRANGER", schema = "COPT")
public class SalaireEtranger {
    @Id
    @GeneratedValue
    @Column(name = "ID")
    private Long id;
    
    @Column(name = "EMP_MAT")
    private Long empMat;
    
    @Column(name = "EMP_CLE")
    private Integer empCle;
    
    @Column(name = "DCO_DTDEB")
    private Date dcoDateDebut;
    
    @Column(name = "SAL_DEVISE", length = 10)
    private String salDevise;
    
    @Column(name = "SAL_MONTANT")
    private BigDecimal salMontant;
    
    @Column(name = "SAL_TAUX_CHANGE")
    private BigDecimal salTauxChange;
    
    @Column(name = "SAL_MONTANT_TND")
    private BigDecimal salMontantTnd;
    
    @Column(name = "SAL_DATE_CONVERSION")
    private Date salDateConversion;
}
```

### 6. TauxCotisation (TAU_COT_COP)
```java
@Entity
@Table(name = "TAU_COT_COP", schema = "COPT")
public class TauxCotisation {
    @Id
    @Column(name = "TAU_CODE")
    private String tauCode;
    
    @Column(name = "TAU_RETRAITE")
    private BigDecimal tauRetraite;
    
    @Column(name = "TAU_AS")
    private BigDecimal tauAS;
    
    @Column(name = "TAU_RCR")
    private BigDecimal tauRCR;
    
    @Column(name = "TAU_GLOBAL")
    private BigDecimal tauGlobal;
    
    @Column(name = "TAU_DATE_DEBUT")
    private Date tauDateDebut;
    
    @Column(name = "TAU_DATE_FIN")
    private Date tauDateFin;
}
```

---

## 🔧 Configuration Oracle

### 1. Dependencies (pom.xml)
```xml
<!-- Oracle JDBC Driver -->
<dependency>
    <groupId>com.oracle.database.jdbc</groupId>
    <artifactId>ojdbc8</artifactId>
    <version>21.9.0.0</version>
</dependency>

<!-- HikariCP pour connection pooling -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
</dependency>
```

### 2. Application Properties
```properties
# Oracle Database Configuration
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:COPT
spring.datasource.username=COPT
spring.datasource.password=${ORACLE_PASSWORD}
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

# JPA/Hibernate Configuration
spring.jpa.database-platform=org.hibernate.dialect.Oracle12cDialect
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

# Connection Pool
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=5
spring.datasource.hikari.connection-timeout=30000
```

---

## 📱 Services Backend à Créer

### 1. AffiliationService
**Méthodes** :
- `createEmployer(EmployerDTO)` : Créer employeur régime 500/510
- `assignAffiliationNumber()` : Attribuer numéro automatique
- `getNextAvailableNumber(regime)` : Prochain numéro disponible

### 2. DossierCoopService
**Méthodes** :
- `createDossier(DossierCoopDTO)` : Créer dossier
- `addPeriodeDetachement(periodeDTO)` : Ajouter période
- `convertSalaire(montant, devise, date)` : Convertir salaire
- `getTauxBCT(devise, date)` : Récupérer taux BCT
- `calculateCotisations(salaire)` : Calculer cotisations

### 3. EngagementService
**Méthodes** :
- `generateDebit(dossierCoopId, trimestre, annee)` : Générer débit
- `createEcheances(engagementId)` : Créer échéances
- `checkTrimestreExistant(dossierCoopId, trimestre)` : Vérifier si trimestre déjà déclaré
- `calculateMontantDebit(salaire, taux)` : Calculer montant

### 4. AttestationService
**Méthodes** :
- `generateAttestationAffiliation(affiliationId)` : Générer attestation PDF
- `generateAvisPaiement(debitId)` : Générer avis paiement PDF

### 5. EmailService
**Méthodes** :
- `sendAffiliationEmail(affiliationId)` : Email affiliation
- `sendDebitEmail(debitId)` : Email débit
- `sendCarteSalaireEmail(matricule, trimestre, annee)` : Email carte salaire

### 6. CarteSalaireService
**Méthodes** :
- `getSalaires(matricule, trimestre, annee)` : Récupérer salaires
- `validateSalaire(salaireId)` : Valider salaire
- `editSalaire(salaireId, nouveauMontant)` : Modifier salaire
- `generateCarteSalaire(parametres)` : Générer carte PDF
- `sendCarteSalaire(parametres)` : Envoyer par email

---

## 🎨 Frontend Angular à Adapter

### Pages à Créer/Modifier

#### 1. Affiliation Employeur
**Route** : `/affiliation-employeur`

**Composant** : `AffiliationEmployeurComponent`

**Formulaire** :
- Régime (dropdown : 500, 510)
- Raison Sociale (FR + AR)
- Activité (fixe : COOPERATION TECHNIQUE)
- Type Affiliation (fixe : Normale)
- Nationalité
- Date Assujettissement
- Date Effet
- Estimation Intégrale

#### 2. Saisie Dossier Coopération
**Route** : `/dossier-cooperation/new`

**Composant** : `DossierCooperationFormComponent`

**Onglets** :
1. **Assuré** : Infos personnelles
2. **Coopération Technique** : Employeur + Période + Salaires
3. **Gestion Avantages** : Tableau avantages

**Fonctionnalités** :
- Multi-onglets avec `mat-tab-group`
- Conversion automatique salaire
- Ajout de périodes de détachement
- Validation complète

#### 3. Création Débits
**Route** : `/debits/create`

**Composant** : `DebitCreateComponent`

**Formulaire** :
- Radio buttons : En cours / Toutes périodes
- Trimestre / Année
- N° Affiliation
- Date début

**Fonctionnalités** :
- Génération automatique
- Affichage confirmation
- Bouton Créer/Supprimer

#### 4. Avis Paiement
**Route** : `/avis-paiement/:id`

**Composant** : `AvisPaiementComponent`

**Affichage** :
- Tableau cotisations
- Calculs détaillés
- Bouton Imprimer
- Bouton Email

#### 5. Carte Salaire
**Route** : `/carte-salaire`

**Composant** : `CarteSalaireComponent`

**Fonctionnalités** :
- Recherche par Matricule/Trimestre/Année
- Tableau salaires
- Bouton Éditer
- Bouton Envoyer
- Confirmation avant envoi
- Liste de re-envoi

---

## 📅 Planning de Migration

### Phase 1 : Backend Oracle (3 jours)
- [ ] Configuration Oracle
- [ ] Création entités JPA
- [ ] Tests de connexion
- [ ] Migration données test

### Phase 2 : Services Métier (5 jours)
- [ ] AffiliationService
- [ ] DossierCoopService
- [ ] EngagementService
- [ ] AttestationService
- [ ] EmailService
- [ ] CarteSalaireService

### Phase 3 : API REST (3 jours)
- [ ] Controllers
- [ ] DTOs
- [ ] Validation
- [ ] Tests unitaires

### Phase 4 : Frontend (5 jours)
- [ ] Affiliation Employeur
- [ ] Saisie Dossier
- [ ] Création Débits
- [ ] Avis Paiement
- [ ] Carte Salaire

### Phase 5 : Intégration & Tests (4 jours)
- [ ] Tests end-to-end
- [ ] Génération PDF
- [ ] Emails
- [ ] Documentation

---

## ✅ Livrables

1. ✅ Backend Spring Boot + Oracle
2. ✅ Frontend Angular complet
3. ✅ Documentation API
4. ✅ Guide d'installation
5. ✅ Scripts de migration
6. ✅ Tests automatisés

---

**Total estimé : 20 jours de développement**

🚀 **Prêt à démarrer la migration !**
