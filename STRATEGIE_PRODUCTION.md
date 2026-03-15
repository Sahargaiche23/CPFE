# 🏭 Stratégie de Mise en Production — CNSS Coopération Technique & Mise en Disponibilité

> **Document opérationnel — Aucune modification de code requise**
> Version 1.0 — Mars 2026

---

## Table des matières

1. [Vue d'ensemble](#1-vue-densemble)
2. [Architecture de production](#2-architecture-de-production)
3. [Prérequis serveur](#3-prérequis-serveur)
4. [Configuration Docker Production](#4-configuration-docker-production)
5. [Reverse Proxy Nginx + SSL](#5-reverse-proxy-nginx--ssl)
6. [Base de données Oracle — Production](#6-base-de-données-oracle--production)
7. [Sécurité](#7-sécurité)
8. [Sauvegarde & Restauration](#8-sauvegarde--restauration)
9. [Monitoring & Supervision](#9-monitoring--supervision)
10. [Procédure de déploiement pas à pas](#10-procédure-de-déploiement-pas-à-pas)
11. [Mise à jour & Rollback](#11-mise-à-jour--rollback)
12. [Plan de reprise d'activité (PRA)](#12-plan-de-reprise-dactivité-pra)

---

## 1. Vue d'ensemble

### 1.1 Applications

| Application | Technologie | Port dev | Description |
|---|---|---|---|
| **Coopération Technique** | Angular 17 | 4200 | Gestion des coopérants techniques étrangers |
| **Mise en Disponibilité** | Angular 17 | 4300 | Gestion de la mise en disponibilité spéciale |

### 1.2 Microservices Backend (12 services)

| Service | Port | Rôle |
|---|---|---|
| eureka-server | 8761 | Service Discovery |
| gateway-service | 8080 | API Gateway (point d'entrée unique) |
| auth-service | 8089 | Authentification & JWT |
| employer-service | 8081 | Gestion employeurs, coopérants, dossiers |
| salary-service | 8082 | Gestion salaires |
| regime-service | 8083 | Régimes de cotisation |
| affiliation-service | 8084 | Affiliations |
| debit-service | 8085 | Débits & contributions |
| payment-service | 8086 | Paiements |
| notification-service | 8087 | Notifications email/SMS |
| file-service (GED) | 8088 | Gestion électronique des documents |
| disponibilite-service | 8091 | Mise en disponibilité spéciale |
| ai-extraction-service | 8090 | IA extraction OCR (Python/FastAPI) |

### 1.3 Infrastructure actuelle (développement)

```
Développeur local
├── Oracle XE 21c (localhost:1521)
├── Docker Compose (13 conteneurs)
├── Angular CLI (ng serve)
└── Python venv (uvicorn)
```

### 1.4 Cible production

```
Serveur CNSS (ou Cloud privé)
├── Oracle Database 19c/21c (serveur dédié ou existant)
├── Docker Compose / Docker Swarm
├── Nginx (reverse proxy + SSL)
├── Frontends compilés (ng build --prod)
└── Monitoring (Prometheus + Grafana)
```

---

## 2. Architecture de production

### 2.1 Schéma réseau

```
                    Internet
                       │
                  ┌────▼────┐
                  │ Firewall│
                  │  CNSS   │
                  └────┬────┘
                       │
              ┌────────▼────────┐
              │   Nginx (443)   │  ← SSL/TLS (HTTPS)
              │  Reverse Proxy  │
              └───┬────────┬───┘
                  │        │
        ┌─────────▼──┐  ┌──▼─────────┐
        │ Frontend 1 │  │ Frontend 2 │
        │ Coopération│  │ Disponib.  │
        │ (statique) │  │ (statique) │
        └────────────┘  └────────────┘
                  │
          ┌───────▼───────┐
          │ API Gateway   │  ← Port 8080 (interne)
          │ Spring Cloud  │
          └───────┬───────┘
                  │
     ┌────────────┼────────────────────┐
     │            │                    │
  ┌──▼──┐  ┌─────▼──────┐  ┌──────────▼──┐
  │Auth │  │ Services   │  │  AI Service │
  │8089 │  │ métier     │  │  Python     │
  └──┬──┘  │8081-8088   │  │  8090       │
     │     └─────┬──────┘  └─────────────┘
     │           │
     └─────┬─────┘
           │
    ┌──────▼──────┐
    │ Oracle DB   │
    │ (dédié)     │
    └─────────────┘
```

### 2.2 Option minimale (1 serveur)

Pour un déploiement simple CNSS interne :

| Composant | Hébergement |
|---|---|
| Nginx + Frontends | Même serveur |
| Docker (13 services) | Même serveur |
| Oracle DB | Même serveur ou serveur existant |

### 2.3 Option recommandée (2-3 serveurs)

| Serveur | Composants | RAM min |
|---|---|---|
| **SRV-WEB** | Nginx + Frontends statiques | 4 Go |
| **SRV-APP** | Docker (13 microservices) | 16 Go |
| **SRV-DB** | Oracle Database | 8 Go |

---

## 3. Prérequis serveur

### 3.1 Système d'exploitation

- **OS** : Ubuntu Server 22.04 LTS ou RHEL 8/9
- **Architecture** : x86_64

### 3.2 Ressources minimales (1 serveur)

| Ressource | Minimum | Recommandé |
|---|---|---|
| **CPU** | 4 vCPU | 8 vCPU |
| **RAM** | 16 Go | 32 Go |
| **Disque** | 100 Go SSD | 200 Go SSD |
| **Réseau** | 100 Mbps | 1 Gbps |

### 3.3 Logiciels à installer

```bash
# Docker & Docker Compose
sudo apt update && sudo apt install -y docker.io docker-compose-plugin
sudo systemctl enable docker

# Nginx
sudo apt install -y nginx certbot python3-certbot-nginx

# Outils utilitaires
sudo apt install -y htop curl wget unzip jq

# Tesseract OCR (pour le service IA)
# → Déjà inclus dans le conteneur Docker ai-extraction-service
```

### 3.4 Ports réseau

| Port | Service | Exposition |
|---|---|---|
| 443 | HTTPS (Nginx) | **Public** |
| 80 | HTTP → redirige 443 | **Public** |
| 8080 | API Gateway | **Interne seulement** |
| 8761 | Eureka Dashboard | **Interne seulement** |
| 8081-8091 | Microservices | **Interne seulement** |
| 1521 | Oracle DB | **Interne seulement** |

> ⚠️ **Seuls les ports 80 et 443 doivent être exposés au réseau CNSS.**

---

## 4. Configuration Docker Production

### 4.1 Fichier docker-compose.prod.yml

Créer ce fichier à la racine du projet (à côté de `docker-compose.yml`) :

```yaml
# docker-compose.prod.yml — Production
services:

  eureka-server:
    build: ./eureka-server
    container_name: cnss-eureka
    restart: always
    networks:
      - cnss-prod
    environment:
      - SPRING_PROFILES_ACTIVE=docker
    deploy:
      resources:
        limits:
          memory: 512M

  gateway-service:
    build: ./gateway-service
    container_name: cnss-gateway
    restart: always
    ports:
      - "127.0.0.1:8080:8080"    # Accessible uniquement en local
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
    deploy:
      resources:
        limits:
          memory: 512M

  auth-service:
    build: ./auth-service
    container_name: cnss-auth
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 512M

  employer-service:
    build: ./employer-service
    container_name: cnss-employer
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    volumes:
      - cnss-documents:/tmp/cnss-documents
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 512M

  salary-service:
    build: ./salary-service
    container_name: cnss-salary
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  regime-service:
    build: ./regime-service
    container_name: cnss-regime
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  affiliation-service:
    build: ./affiliation-service
    container_name: cnss-affiliation
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  debit-service:
    build: ./debit-service
    container_name: cnss-debit
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  payment-service:
    build: ./payment-service
    container_name: cnss-payment
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  notification-service:
    build: ./notification-service
    container_name: cnss-notification
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SMTP_HOST=${SMTP_HOST}
      - SMTP_PORT=${SMTP_PORT}
      - SMTP_USER=${SMTP_USER}
      - SMTP_PASS=${SMTP_PASS}
    deploy:
      resources:
        limits:
          memory: 384M

  disponibilite-service:
    build: ./disponibilite-service
    container_name: cnss-disponibilite
    restart: always
    networks:
      - cnss-prod
    depends_on:
      - eureka-server
    volumes:
      - disponibilite-docs:/tmp/cnss-disponibilite-docs
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
    deploy:
      resources:
        limits:
          memory: 512M

  ai-extraction-service:
    build: ./ai-extraction-service
    container_name: cnss-ai-extraction
    restart: always
    networks:
      - cnss-prod
    deploy:
      resources:
        limits:
          memory: 1G

  file-service:
    build: ./file-service
    container_name: cnss-file
    restart: always
    networks:
      - cnss-prod
    volumes:
      - file-storage:/var/cnss/uploads
      - ged-storage:/opt/cnss/ged
    depends_on:
      - eureka-server
      - ai-extraction-service
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/
      - SPRING_DATASOURCE_URL=${DB_URL}
      - SPRING_DATASOURCE_USERNAME=${DB_USER}
      - SPRING_DATASOURCE_PASSWORD=${DB_PASS}
      - GED_UPLOAD_PATH=/opt/cnss/ged
      - AI_EXTRACTION_URL=http://ai-extraction-service:8090
    deploy:
      resources:
        limits:
          memory: 512M

networks:
  cnss-prod:
    driver: bridge

volumes:
  file-storage:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /data/cnss/uploads
  ged-storage:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /data/cnss/ged
  disponibilite-docs:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /data/cnss/disponibilite-docs
  cnss-documents:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /data/cnss/documents
```

### 4.2 Fichier .env de production

Créer le fichier `.env` sur le serveur (ne **jamais** le commiter dans Git) :

```env
# .env — Production (NE PAS COMMITER)

# Base de données Oracle
DB_URL=jdbc:oracle:thin:@<IP_SERVEUR_DB>:1521/CNSSPDB
DB_USER=CNSS_PROD
DB_PASS=<MOT_DE_PASSE_FORT>

# SMTP pour les notifications
SMTP_HOST=smtp.cnss.nat.tn
SMTP_PORT=587
SMTP_USER=noreply@cnss.nat.tn
SMTP_PASS=<MOT_DE_PASSE_SMTP>
```

### 4.3 Différences clés dev → prod

| Aspect | Développement | Production |
|---|---|---|
| `restart` | absent | `always` |
| Ports exposés | Tous les ports | **Seulement 8080 (local)** |
| `extra_hosts` | `host.docker.internal` | Non nécessaire (Oracle sur réseau) |
| Credentials | En dur (`copt123`) | Variables d'environnement `.env` |
| Volumes | Docker named volumes | **Bind mounts** sur `/data/cnss/` |
| Mémoire | Illimitée | Limitée par `deploy.resources` |
| Base de données | Oracle XE local | Oracle 19c/21c serveur |

---

## 5. Reverse Proxy Nginx + SSL

### 5.1 Compiler les frontends Angular

Sur la machine de développement :

```bash
# Frontend Coopération Technique
cd frontend
ng build --configuration=production
# → Résultat dans dist/frontend/browser/

# Frontend Mise en Disponibilité
cd ../disponibilite-frontend
ng build --configuration=production
# → Résultat dans dist/disponibilite-frontend/browser/
```

Transférer les dossiers `dist/` vers le serveur de production :

```bash
scp -r frontend/dist/frontend/browser/* user@srv-prod:/var/www/cnss/cooperation/
scp -r disponibilite-frontend/dist/disponibilite-frontend/browser/* user@srv-prod:/var/www/cnss/disponibilite/
```

### 5.2 Configuration Nginx

Fichier `/etc/nginx/sites-available/cnss` :

```nginx
# Redirection HTTP → HTTPS
server {
    listen 80;
    server_name cooperation.cnss.nat.tn disponibilite.cnss.nat.tn;
    return 301 https://$host$request_uri;
}

# ━━━━━━━━ Application 1 : Coopération Technique ━━━━━━━━
server {
    listen 443 ssl http2;
    server_name cooperation.cnss.nat.tn;

    # SSL
    ssl_certificate     /etc/ssl/cnss/cooperation.crt;
    ssl_certificate_key /etc/ssl/cnss/cooperation.key;
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    # Frontend Angular (fichiers statiques)
    root /var/www/cnss/cooperation;
    index index.html;

    # SPA : toutes les routes retournent index.html
    location / {
        try_files $uri $uri/ /index.html;
    }

    # API Gateway (backend)
    location /api/ {
        proxy_pass http://127.0.0.1:8080/api/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 120s;
        proxy_connect_timeout 10s;
        client_max_body_size 50M;    # Pour les uploads GED
    }

    # Sécurité
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    # Cache assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff2?)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Logs
    access_log /var/log/nginx/cooperation_access.log;
    error_log  /var/log/nginx/cooperation_error.log;
}

# ━━━━━━━━ Application 2 : Mise en Disponibilité ━━━━━━━━
server {
    listen 443 ssl http2;
    server_name disponibilite.cnss.nat.tn;

    ssl_certificate     /etc/ssl/cnss/disponibilite.crt;
    ssl_certificate_key /etc/ssl/cnss/disponibilite.key;
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    root /var/www/cnss/disponibilite;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # API Backend (disponibilite-service via gateway)
    location /api/ {
        proxy_pass http://127.0.0.1:8080/api/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 120s;
        client_max_body_size 50M;
    }

    # AI Extraction directe (pour le scan OCR)
    location /ai-api/ {
        proxy_pass http://127.0.0.1:8090/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_read_timeout 60s;
        client_max_body_size 20M;
    }

    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff2?)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    access_log /var/log/nginx/disponibilite_access.log;
    error_log  /var/log/nginx/disponibilite_error.log;
}
```

### 5.3 Activer le site

```bash
sudo ln -s /etc/nginx/sites-available/cnss /etc/nginx/sites-enabled/
sudo nginx -t                    # Tester la configuration
sudo systemctl reload nginx      # Appliquer
```

### 5.4 Option : un seul domaine avec sous-répertoires

Si vous ne disposez que d'un seul nom de domaine :

```nginx
server {
    listen 443 ssl http2;
    server_name cnss-app.cnss.nat.tn;

    # App 1 : Coopération → /cooperation/
    location /cooperation/ {
        alias /var/www/cnss/cooperation/;
        try_files $uri $uri/ /cooperation/index.html;
    }

    # App 2 : Disponibilité → /disponibilite/
    location /disponibilite/ {
        alias /var/www/cnss/disponibilite/;
        try_files $uri $uri/ /disponibilite/index.html;
    }

    # API commune
    location /api/ {
        proxy_pass http://127.0.0.1:8080/api/;
    }
}
```

> ⚠️ Nécessite `ng build --base-href /cooperation/` et `--base-href /disponibilite/`

---

## 6. Base de données Oracle — Production

### 6.1 Préparation

```sql
-- Créer le schéma de production
CREATE USER CNSS_PROD IDENTIFIED BY "<mot_de_passe_fort>"
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SEQUENCE TO CNSS_PROD;

-- Importer le schéma depuis le développement
-- Exporter depuis Oracle XE :
expdp COPT/copt123@XEPDB1 SCHEMAS=COPT DIRECTORY=DATA_PUMP_DIR DUMPFILE=cnss_export.dmp

-- Importer en production :
impdp CNSS_PROD/<mdp>@CNSSPDB REMAP_SCHEMA=COPT:CNSS_PROD DIRECTORY=DATA_PUMP_DIR DUMPFILE=cnss_export.dmp
```

### 6.2 Configuration recommandée

| Paramètre | Valeur |
|---|---|
| **SGA_TARGET** | 4 Go minimum |
| **PGA_AGGREGATE_TARGET** | 1 Go minimum |
| **PROCESSES** | 300 |
| **OPEN_CURSORS** | 500 |
| **Archivelog** | Activé |
| **Redo Log** | 3 groupes × 500 Mo |

### 6.3 Connexions pool

Chaque microservice Spring Boot crée un pool de connexions (HikariCP par défaut). Prévoir :
- **13 services × 10 connexions/service = 130 connexions simultanées**
- Paramètre Oracle `PROCESSES` ≥ 200 recommandé

---

## 7. Sécurité

### 7.1 Checklist sécurité pré-production

- [ ] **Mots de passe** : Changer tous les mots de passe par défaut (`copt123`, etc.)
- [ ] **JWT Secret** : Utiliser un secret fort (256 bits minimum), stocké en variable d'environnement
- [ ] **HTTPS** : Certificat SSL valide (Let's Encrypt ou CA interne CNSS)
- [ ] **Firewall** : Seuls ports 80/443 exposés au réseau
- [ ] **Docker** : Aucun port de microservice exposé à l'extérieur (`127.0.0.1:8080:8080`)
- [ ] **Base de données** : Accessible uniquement depuis le serveur d'application
- [ ] **Fichier `.env`** : Permissions 600, propriétaire root uniquement
- [ ] **Logs** : Ne pas logger les données personnelles en production
- [ ] **CORS** : Restreindre `allow_origins` aux domaines CNSS uniquement

### 7.2 Hardening Docker

```bash
# Ne pas exécuter Docker en root (créer un groupe docker)
sudo usermod -aG docker cnss-deployer

# Limiter les capabilities
# Dans docker-compose.prod.yml, ajouter à chaque service :
#   security_opt:
#     - no-new-privileges:true
```

### 7.3 Hardening réseau

```bash
# Firewall UFW
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp     # SSH (limiter aux IPs admin)
sudo ufw allow 80/tcp     # HTTP (redirige vers HTTPS)
sudo ufw allow 443/tcp    # HTTPS
sudo ufw enable
```

### 7.4 Rotation des secrets JWT

Le secret JWT doit être renouvelé périodiquement. Procédure :
1. Générer un nouveau secret : `openssl rand -base64 64`
2. Mettre à jour la variable d'environnement `JWT_SECRET` dans `.env`
3. Redémarrer `auth-service` : `docker compose -f docker-compose.prod.yml restart auth-service`
4. Les utilisateurs devront se reconnecter (les anciens tokens deviennent invalides)

---

## 8. Sauvegarde & Restauration

### 8.1 Éléments à sauvegarder

| Élément | Emplacement | Fréquence |
|---|---|---|
| **Base de données** | Oracle DB | Quotidien (RMAN) |
| **Documents GED** | `/data/cnss/ged/` | Quotidien |
| **Documents disponibilité** | `/data/cnss/disponibilite-docs/` | Quotidien |
| **Uploads** | `/data/cnss/uploads/` | Quotidien |
| **Configuration** | `.env`, `nginx.conf`, `docker-compose.prod.yml` | À chaque modification |
| **Certificats SSL** | `/etc/ssl/cnss/` | À chaque renouvellement |

### 8.2 Script de sauvegarde automatique

Fichier `/opt/cnss/scripts/backup.sh` :

```bash
#!/bin/bash
# Sauvegarde quotidienne CNSS
set -e

BACKUP_DIR="/data/backups/cnss/$(date +%Y-%m-%d)"
RETENTION_DAYS=30

echo "[$(date)] Début de la sauvegarde CNSS..."

# Créer le répertoire de sauvegarde
mkdir -p "$BACKUP_DIR"

# 1. Sauvegarde Oracle (RMAN)
rman target / <<EOF
RUN {
    BACKUP INCREMENTAL LEVEL 1 DATABASE
    FORMAT '${BACKUP_DIR}/db_%d_%T_%s.bkp';
    BACKUP ARCHIVELOG ALL DELETE INPUT
    FORMAT '${BACKUP_DIR}/arch_%d_%T_%s.bkp';
    DELETE NOPROMPT OBSOLETE RECOVERY WINDOW OF ${RETENTION_DAYS} DAYS;
}
EOF

# 2. Sauvegarde des documents
tar czf "${BACKUP_DIR}/ged-documents.tar.gz" /data/cnss/ged/
tar czf "${BACKUP_DIR}/disponibilite-docs.tar.gz" /data/cnss/disponibilite-docs/
tar czf "${BACKUP_DIR}/uploads.tar.gz" /data/cnss/uploads/

# 3. Sauvegarde de la configuration
tar czf "${BACKUP_DIR}/config.tar.gz" \
    /opt/cnss/.env \
    /etc/nginx/sites-available/cnss \
    /opt/cnss/docker-compose.prod.yml

# 4. Nettoyage des anciennes sauvegardes
find /data/backups/cnss/ -maxdepth 1 -type d -mtime +${RETENTION_DAYS} -exec rm -rf {} \;

echo "[$(date)] Sauvegarde terminée → $BACKUP_DIR"
```

### 8.3 Planification cron

```bash
# Sauvegarde quotidienne à 2h du matin
sudo crontab -e
0 2 * * * /opt/cnss/scripts/backup.sh >> /var/log/cnss-backup.log 2>&1
```

### 8.4 Restauration

```bash
# Restaurer les documents
cd /data/cnss
tar xzf /data/backups/cnss/<DATE>/ged-documents.tar.gz

# Restaurer la base Oracle
rman target / <<EOF
RUN {
    RESTORE DATABASE;
    RECOVER DATABASE;
    ALTER DATABASE OPEN RESETLOGS;
}
EOF
```

---

## 9. Monitoring & Supervision

### 9.1 Health checks Docker

Le `docker-compose.prod.yml` peut inclure des healthchecks :

```yaml
# Exemple pour gateway-service :
gateway-service:
  healthcheck:
    test: ["CMD", "curl", "-f", "http://localhost:8080/actuator/health"]
    interval: 30s
    timeout: 10s
    retries: 5
    start_period: 60s
```

### 9.2 Dashboard Eureka

Accessible en interne : `http://SRV-APP:8761`
- Vérifie que tous les 12 services sont **UP**
- Alerte si un service passe **DOWN**

### 9.3 Vérification quotidienne (script)

Fichier `/opt/cnss/scripts/health-check.sh` :

```bash
#!/bin/bash
# Vérification de santé de tous les services CNSS

SERVICES=(
    "gateway:8080/actuator/health"
    "auth:8089/actuator/health"
    "employer:8081/actuator/health"
    "salary:8082/actuator/health"
    "regime:8083/actuator/health"
    "affiliation:8084/actuator/health"
    "debit:8085/actuator/health"
    "payment:8086/actuator/health"
    "notification:8087/actuator/health"
    "file:8088/actuator/health"
    "disponibilite:8091/actuator/health"
    "ai-extraction:8090/health"
)

echo "=== CNSS Health Check — $(date) ==="
ALL_OK=true

for svc in "${SERVICES[@]}"; do
    NAME="${svc%%:*}"
    URL="http://127.0.0.1:${svc#*:}"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$URL" 2>/dev/null)
    
    if [ "$HTTP_CODE" = "200" ]; then
        echo "  ✅ $NAME — OK"
    else
        echo "  ❌ $NAME — ÉCHEC (HTTP $HTTP_CODE)"
        ALL_OK=false
    fi
done

# Vérification Nginx
if curl -s -o /dev/null -w "%{http_code}" --max-time 5 "https://cooperation.cnss.nat.tn" | grep -q "200"; then
    echo "  ✅ Nginx (cooperation) — OK"
else
    echo "  ❌ Nginx (cooperation) — ÉCHEC"
    ALL_OK=false
fi

if [ "$ALL_OK" = false ]; then
    echo ""
    echo "⚠️ CERTAINS SERVICES SONT EN PANNE — Intervention requise"
    # Optionnel : envoyer un email d'alerte
    # mail -s "CNSS ALERTE: Service en panne" admin@cnss.nat.tn < /tmp/health-report.txt
fi
```

### 9.4 Monitoring avancé (optionnel)

Pour une supervision complète, déployer **Prometheus + Grafana** :

```yaml
# Ajouter dans docker-compose.prod.yml :
  prometheus:
    image: prom/prometheus:latest
    container_name: cnss-prometheus
    restart: always
    ports:
      - "127.0.0.1:9090:9090"
    volumes:
      - ./monitoring/prometheus.yml:/etc/prometheus/prometheus.yml
    networks:
      - cnss-prod

  grafana:
    image: grafana/grafana:latest
    container_name: cnss-grafana
    restart: always
    ports:
      - "127.0.0.1:3000:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASS}
    networks:
      - cnss-prod
```

---

## 10. Procédure de déploiement pas à pas

### Phase 1 : Préparation du serveur (1 jour)

```bash
# 1. Installer les dépendances
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io docker-compose-plugin nginx

# 2. Créer l'utilisateur de déploiement
sudo useradd -m -s /bin/bash cnss-deployer
sudo usermod -aG docker cnss-deployer

# 3. Créer les répertoires
sudo mkdir -p /opt/cnss
sudo mkdir -p /data/cnss/{ged,uploads,documents,disponibilite-docs}
sudo mkdir -p /data/backups/cnss
sudo mkdir -p /var/www/cnss/{cooperation,disponibilite}
sudo chown -R cnss-deployer:cnss-deployer /opt/cnss /data/cnss /var/www/cnss

# 4. Configurer le firewall
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

### Phase 2 : Base de données (1 jour)

```bash
# 1. Installer Oracle ou utiliser le serveur Oracle existant CNSS
# 2. Créer le schéma CNSS_PROD (voir section 6.1)
# 3. Importer les données depuis l'environnement de développement
# 4. Vérifier la connexion depuis le serveur d'application
```

### Phase 3 : Déploiement des services (1 jour)

```bash
# 1. Transférer le code source sur le serveur
su - cnss-deployer
cd /opt/cnss
git clone <repository-url> app
cd app

# 2. Créer le fichier .env
cat > .env << 'EOF'
DB_URL=jdbc:oracle:thin:@<IP_DB>:1521/CNSSPDB
DB_USER=CNSS_PROD
DB_PASS=<MOT_DE_PASSE_FORT>
SMTP_HOST=smtp.cnss.nat.tn
SMTP_PORT=587
SMTP_USER=noreply@cnss.nat.tn
SMTP_PASS=<MOT_DE_PASSE_SMTP>
EOF
chmod 600 .env

# 3. Builder et lancer les conteneurs
docker compose -f docker-compose.prod.yml build
docker compose -f docker-compose.prod.yml up -d

# 4. Vérifier que tous les services sont UP
docker compose -f docker-compose.prod.yml ps
docker compose -f docker-compose.prod.yml logs --tail=50
```

### Phase 4 : Frontends + Nginx (1/2 jour)

```bash
# 1. Compiler les frontends (sur machine de dev)
cd frontend && ng build --configuration=production
cd ../disponibilite-frontend && ng build --configuration=production

# 2. Copier sur le serveur
scp -r frontend/dist/frontend/browser/* cnss-deployer@srv:/var/www/cnss/cooperation/
scp -r disponibilite-frontend/dist/disponibilite-frontend/browser/* cnss-deployer@srv:/var/www/cnss/disponibilite/

# 3. Configurer Nginx (voir section 5.2)
sudo cp cnss-nginx.conf /etc/nginx/sites-available/cnss
sudo ln -s /etc/nginx/sites-available/cnss /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx

# 4. Installer le certificat SSL
sudo certbot --nginx -d cooperation.cnss.nat.tn -d disponibilite.cnss.nat.tn
```

### Phase 5 : Validation (1/2 jour)

```bash
# 1. Tester les URLs
curl -s https://cooperation.cnss.nat.tn | head -5
curl -s https://disponibilite.cnss.nat.tn | head -5
curl -s http://127.0.0.1:8080/actuator/health

# 2. Tester l'authentification
# Se connecter via le navigateur avec un compte test

# 3. Tester le scan IA
# Uploader un document CIN dans la GED

# 4. Activer les sauvegardes
sudo crontab -e  # Ajouter le cron (section 8.3)

# 5. Documenter les accès
```

### Résumé du planning

| Phase | Durée | Description |
|---|---|---|
| Phase 1 | 1 jour | Préparation serveur |
| Phase 2 | 1 jour | Base de données |
| Phase 3 | 1 jour | Déploiement Docker |
| Phase 4 | ½ jour | Frontends + Nginx |
| Phase 5 | ½ jour | Validation |
| **Total** | **4 jours** | **Mise en production complète** |

---

## 11. Mise à jour & Rollback

### 11.1 Procédure de mise à jour

```bash
cd /opt/cnss/app

# 1. Sauvegarder l'état actuel
docker compose -f docker-compose.prod.yml ps > /tmp/state-before.txt

# 2. Récupérer les nouvelles versions
git pull origin main

# 3. Rebuilder les services modifiés
docker compose -f docker-compose.prod.yml build <service-modifié>

# 4. Redémarrer avec zéro downtime (un par un)
docker compose -f docker-compose.prod.yml up -d --no-deps <service-modifié>

# 5. Vérifier
docker compose -f docker-compose.prod.yml logs --tail=20 <service-modifié>
```

### 11.2 Rollback rapide

```bash
# Revenir à la version précédente
git checkout <commit-précédent>
docker compose -f docker-compose.prod.yml build <service>
docker compose -f docker-compose.prod.yml up -d --no-deps <service>
```

### 11.3 Mise à jour des frontends

```bash
# 1. Compiler la nouvelle version (sur machine de dev)
cd frontend && ng build --configuration=production

# 2. Remplacer sur le serveur
ssh cnss-deployer@srv "mv /var/www/cnss/cooperation /var/www/cnss/cooperation.bak"
scp -r dist/frontend/browser/* cnss-deployer@srv:/var/www/cnss/cooperation/

# Rollback si problème :
ssh cnss-deployer@srv "rm -rf /var/www/cnss/cooperation && mv /var/www/cnss/cooperation.bak /var/www/cnss/cooperation"
```

---

## 12. Plan de reprise d'activité (PRA)

### 12.1 Scénarios de panne

| Scénario | Impact | Temps de reprise | Action |
|---|---|---|---|
| **Service Docker crashé** | 1 fonction | < 1 min | `restart: always` (auto) |
| **Serveur reboot** | Complet | < 5 min | Docker redémarre auto |
| **Disque plein** | Documents | < 30 min | Nettoyer + étendre |
| **Corruption DB** | Complet | < 2h | Restauration RMAN |
| **Perte serveur** | Complet | < 4h | Restauration complète |

### 12.2 Contacts d'urgence

| Rôle | Responsable | Contact |
|---|---|---|
| Admin système | … | … |
| DBA Oracle | … | … |
| Développeur | … | … |
| Chef de projet | … | … |

### 12.3 Commandes d'urgence

```bash
# Redémarrer tous les services
docker compose -f docker-compose.prod.yml restart

# Voir les logs en temps réel
docker compose -f docker-compose.prod.yml logs -f

# Redémarrer un service spécifique
docker compose -f docker-compose.prod.yml restart gateway-service

# Vérifier l'espace disque
df -h /data/cnss/

# Vérifier la mémoire
free -h

# Voir les processus Docker
docker stats --no-stream
```

---

## Annexe A : Checklist finale avant Go-Live

- [ ] Tous les mots de passe par défaut sont changés
- [ ] Certificat SSL installé et valide
- [ ] Firewall configuré (80, 443 uniquement)
- [ ] Base de données Oracle production prête
- [ ] Tous les 13 services Docker démarrés et UP
- [ ] Frontends Angular compilés et déployés
- [ ] Nginx configuré et fonctionnel
- [ ] Sauvegardes automatiques configurées (cron)
- [ ] Script de health check en place
- [ ] Test de connexion avec chaque rôle (agent CNSS, assuré, employeur)
- [ ] Test de scan IA (upload + extraction OCR)
- [ ] Test de notification email
- [ ] Documentation des accès transmise à l'équipe
- [ ] Plan de rollback validé

---

## Annexe B : Résumé des commandes essentielles

```bash
# ━━━━ Démarrage ━━━━
docker compose -f docker-compose.prod.yml up -d

# ━━━━ Arrêt ━━━━
docker compose -f docker-compose.prod.yml down

# ━━━━ État ━━━━
docker compose -f docker-compose.prod.yml ps

# ━━━━ Logs ━━━━
docker compose -f docker-compose.prod.yml logs -f --tail=100

# ━━━━ Redémarrer un service ━━━━
docker compose -f docker-compose.prod.yml restart auth-service

# ━━━━ Mise à jour ━━━━
git pull && docker compose -f docker-compose.prod.yml build && docker compose -f docker-compose.prod.yml up -d

# ━━━━ Sauvegarde manuelle ━━━━
/opt/cnss/scripts/backup.sh

# ━━━━ Santé ━━━━
/opt/cnss/scripts/health-check.sh
```
