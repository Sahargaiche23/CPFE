# Système de Gestion de la Coopération Technique - CNSS

## Vue d'ensemble
Système complet de gestion des dossiers de coopération technique pour les assurés tunisiens détachés à l'étranger via l'ATCT.

## Architecture Microservices

### Services Backend (Spring Boot + Oracle XE)
1. **employer-service** (Port: 8081) - Gestion numéro employeur régime 500/510
2. **salary-service** (Port: 8082) - Conversion salaire étranger + calcul cotisation
3. **regime-service** (Port: 8083) - Détermination régime (TTE/Coop Technique)
4. **affiliation-service** (Port: 8084) - Affiliation + attestation
5. **debit-service** (Port: 8085) - Débit trimestriel automatique
6. **payment-service** (Port: 8086) - Gestion paiements
7. **notification-service** (Port: 8087) - Emails automatiques
8. **file-service** (Port: 8088) - Gestion fichiers/documents
9. **auth-service** (Port: 8089) - Authentification JWT
10. **gateway-service** (Port: 8080) - API Gateway
11. **eureka-server** (Port: 8761) - Service Discovery

### Frontend
- **Angular 17+** (Port: 4200)

### Infrastructure
- **Oracle XE 21c** - Base de données
- **RabbitMQ** - Messagerie asynchrone
- **Redis** - Cache
- **Eureka** - Service Discovery

## Configuration Oracle XE

```bash
# Connexion Oracle
Host: localhost
Port: 1521
SID: XE
PDB: XEPDB1
User: SYS as SYSDBA / COPT (à créer)
Password: admin123
```

## Démarrage

### 1. Démarrer Oracle XE
```bash
docker start oracle-xe
```

### 2. Initialiser la base de données
```bash
cd scripts/sql
sqlplus sys/admin123@//localhost:1521/XEPDB1 as sysdba @init.sql
```

### 3. Démarrer les microservices
```bash
docker-compose up -d
```

### 4. Démarrer le frontend
```bash
cd frontend
npm install
ng serve
```

## Endpoints Principaux

### Gateway: http://localhost:8080
- Auth: `/api/auth/**`
- Employer: `/api/employer/**`
- Salary: `/api/salary/**`
- Regime: `/api/regime/**`
- Affiliation: `/api/affiliation/**`
- Debit: `/api/debit/**`
- Payment: `/api/payment/**`
- Notification: `/api/notification/**`
- Files: `/api/files/**`

## Workflow Complet

```
Dossier ATCT arrive
    ↓
1. Attribution numéro employeur (Régime 500/510)
    ↓
2. Conversion salaire + Détermination régime
    ↓
3. Génération affiliation + débit automatique
    ↓
4. Envoi email (attestation + avis paiement)
    ↓
5. Création débit trimestriel + validation salaire
```

## Technologies
- Java 17
- Spring Boot 3.2+
- Spring Cloud
- Oracle XE 21c
- Angular 17
- RabbitMQ
- Redis
- Docker

## Auteur
CNSS - Sahar Gaiche
