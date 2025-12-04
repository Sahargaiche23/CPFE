# 🚀 DÉMARRAGE RAPIDE - 3 ÉTAPES

## ✅ Corrections effectuées

1. ✅ **docker-compose.yml** : Tous les services utilisent `host.docker.internal`
2. ✅ **Gateway routes** : Corrigées pour utiliser le pluriel (/api/employers, /api/affiliations, etc.)
3. ✅ **Controllers** : Corrigés pour ne pas doubler `/api`

---

## 📋 ÉTAPE 1 : Démarrer Docker

```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
./scripts/start-docker-simple.sh
```

**Durée** : ~45 secondes

**Résultat** : Tous les services backend sont démarrés

---

## 📋 ÉTAPE 2 : Créer les tables Oracle

### Option A : Avec Python (RAPIDE - Recommandé) ⭐

```bash
# Installer le module Oracle pour Python
pip3 install cx_Oracle

# Créer les tables
python3 scripts/create-oracle-tables.py
```

**Durée** : ~10 secondes

### Option B : Avec un client SQL graphique

1. Ouvrez **SQL Developer** ou **DBeaver**
2. Connectez-vous :
   - Host: `localhost:1521`
   - Service: `XEPDB1`
   - User: `COPT`
   - Password: `copt123`
3. Exécutez le contenu du fichier `table/employeur.sql`

### Option C : Sans installer cx_Oracle

Créez manuellement via n'importe quel outil qui se connecte à Oracle :

```sql
CREATE TABLE COPT.EMPLOYEUR (
    EMP_MAT NUMBER(10) NOT NULL,
    EMP_CLE NUMBER(5) NOT NULL,
    NOM_COMMERCIAL VARCHAR2(200),
    RAISON_SOCIALE VARCHAR2(200),
    REGIME VARCHAR2(10),
    PAYS VARCHAR2(100),
    ADRESSE VARCHAR2(500),
    TELEPHONE VARCHAR2(50),
    EMAIL VARCHAR2(100),
    STATUT VARCHAR2(20),
    DATE_CREATION DATE,
    CONSTRAINT PK_EMPLOYEUR PRIMARY KEY (EMP_MAT, EMP_CLE)
);

INSERT INTO COPT.EMPLOYEUR VALUES (
    500380, 54, 'Test Company France', 'Entreprise Test SARL',
    '500', 'France', '123 Rue de Paris, 75001 Paris',
    '+33123456789', 'contact@testcompany.fr', 'Actif', SYSDATE
);

INSERT INTO COPT.EMPLOYEUR VALUES (
    510245, 2, 'IntCorp Deutschland', 'International Corporation GmbH',
    '510', 'Allemagne', 'Berliner Str. 45, 10115 Berlin',
    '+4930123456', 'info@intcorp.de', 'Actif', SYSDATE
);

INSERT INTO COPT.EMPLOYEUR VALUES (
    500380, 55, 'TechSol France', 'Tech Solutions SARL',
    '500', 'France', '456 Avenue Tech, 69000 Lyon',
    '+33987654321', 'contact@techsol.fr', 'Inactif', SYSDATE
);

COMMIT;
```

---

## 📋 ÉTAPE 3 : Tester et Démarrer le Frontend

### 1. Tester l'API

```bash
# Test Auth
curl -X POST http://localhost:8080/api/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"username":"admin","password":"admin123"}'

# Test Employers (doit retourner les 3 employeurs)
curl http://localhost:8080/api/employers
```

**Résultat attendu** : JSON avec les 3 employeurs

### 2. Démarrer le Frontend

```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/frontend
npm install  # Si première fois uniquement
npm start
```

### 3. Ouvrir le navigateur

```
http://localhost:4200
```

**Login** : `admin` / `admin123`

**Résultat** : Liste des employeurs dynamique s'affiche ! ✅

---

## 🔍 VÉRIFICATIONS

### Si l'API Employers retourne 404 ou []

```bash
# Vérifier que la table existe et a des données
# Utiliser SQL Developer ou DBeaver pour se connecter à Oracle
# et exécuter :
SELECT * FROM COPT.EMPLOYEUR;
```

### Si un service est DOWN

```bash
# Voir les logs
docker logs cooperation-employer --tail 50

# Vérifier la santé
curl http://localhost:8081/actuator/health
```

### Si le frontend ne récupère pas les données

1. Vérifiez que le proxy Angular est actif (doit voir dans les logs : `[HPM] Proxy created`)
2. Testez l'API directement : `curl http://localhost:8080/api/employers`
3. Vérifiez Eureka : http://localhost:8761 (tous les services doivent être verts)

---

## 🛑 ARRÊTER

```bash
# Arrêter Docker
docker-compose down

# Arrêter le frontend (dans le terminal frontend)
Ctrl+C
```

---

## 📊 PORTS UTILISÉS

| Service | Port | URL |
|---------|------|-----|
| Frontend | 4200 | http://localhost:4200 |
| Gateway | 8080 | http://localhost:8080 |
| Eureka | 8761 | http://localhost:8761 |
| Auth | 8089 | http://localhost:8089 |
| Employer | 8081 | http://localhost:8081 |
| Affiliation | 8084 | http://localhost:8084 |
| Oracle XE | 1521 | localhost:1521/XEPDB1 |

---

## ✅ RÉSUMÉ

```bash
# 1. Démarrer Docker
./scripts/start-docker-simple.sh

# 2. Créer les tables
pip3 install cx_Oracle
python3 scripts/create-oracle-tables.py

# 3. Tester
curl http://localhost:8080/api/employers

# 4. Frontend
cd frontend && npm start

# 5. Ouvrir navigateur
# http://localhost:4200
```

**🎉 Application 100% fonctionnelle en Docker !**
