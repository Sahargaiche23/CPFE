# ⚠️ PROBLÈME ET SOLUTION - Frontend ↔ Backend

## 🔴 PROBLÈME ACTUEL

**Le frontend affiche des données statiques** parce que les services Docker ne peuvent pas se connecter à Oracle sur l'hôte.

### Pourquoi ?
- Oracle XE tourne sur votre machine (localhost:1521)
- Les services backend tournent dans Docker
- Dans Docker, "localhost" = le container lui-même, PAS votre machine

```
❌ SITUATION ACTUELLE:

Frontend (localhost:4200)
    ↓ Appel HTTP
Gateway Docker (localhost:8080) ✅
    ↓ Route vers
Employer Service Docker (localhost:8081) ❌ Health: DOWN
    ↓ Tente de se connecter à
Oracle (localhost:1521) ❌ INACCESSIBLE depuis Docker!
```

**Résultat** : Le service retourne 404, le frontend affiche des données statiques.

---

## ✅ SOLUTION IMMÉDIATE

### Option A: Lancer TOUT en local (SANS Docker)

**AVANTAGE** : Fonctionne immédiatement avec votre Oracle existant  
**INCONVÉNIENT** : 6 terminaux à gérer

#### Étapes:

**1. Arrêter Docker**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
docker-compose down
```

**2. Démarrer les services dans 6 terminaux séparés**

**Terminal 1 - Eureka Server**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/eureka-server
mvn spring-boot:run
```
⏳ Attendez le message: "Started EurekaServerApplication"

**Terminal 2 - Gateway Service (attendre 30 secondes après Eureka)**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/gateway-service
mvn spring-boot:run
```

**Terminal 3 - Auth Service**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/auth-service
mvn spring-boot:run
```

**Terminal 4 - Employer Service**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/employer-service
mvn spring-boot:run
```

**Terminal 5 - Affiliation Service**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/affiliation-service
mvn spring-boot:run
```

**Terminal 6 - Frontend Angular**
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/frontend
npm start
```

**3. Tester**
- Ouvrez http://localhost:4200
- Connectez-vous : `admin` / `admin123`
- ✅ Les employeurs devraient s'afficher depuis Oracle !

```
✅ AVEC SERVICES LOCAUX:

Frontend (localhost:4200)
    ↓ 
Gateway Local (localhost:8080) ✅
    ↓
Employer Service Local (localhost:8081) ✅ Health: UP
    ↓
Oracle (localhost:1521) ✅ ACCESSIBLE!

→ Données dynamiques affichées!
```

---

### Option B: Créer la table EMPLOYEUR dans Oracle

Si vous n'avez pas encore créé la table EMPLOYEUR, exécutez ce script :

```bash
sqlplus COPT/copt123@localhost:1521/XEPDB1 << 'EOSQL'
-- Vérifier si la table existe
SELECT COUNT(*) FROM USER_TABLES WHERE TABLE_NAME = 'EMPLOYEUR';

-- Si elle n'existe pas, la créer
CREATE TABLE EMPLOYEUR (
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
    PRIMARY KEY (EMP_MAT, EMP_CLE)
);

-- Insérer des données de test
INSERT INTO EMPLOYEUR VALUES (
    500380, 54, 
    'Test Company France', 
    'Entreprise Test SARL',
    '500', 'France',
    '123 Rue de Paris, Paris',
    '+33123456789',
    'contact@test.fr',
    'Actif', SYSDATE
);

INSERT INTO EMPLOYEUR VALUES (
    510245, 2, 
    'IntCorp Deutschland', 
    'International Corporation GmbH',
    '510', 'Allemagne',
    'Berliner Str. 45, Berlin',
    '+4930123456',
    'info@intcorp.de',
    'Actif', SYSDATE
);

INSERT INTO EMPLOYEUR VALUES (
    500380, 55, 
    'TechSol France', 
    'Tech Solutions SARL',
    '500', 'France',
    '456 Avenue Tech, Lyon',
    '+33987654321',
    'contact@techsol.fr',
    'Inactif', SYSDATE
);

COMMIT;
EXIT;
EOSQL
```

---

## 🎯 TESTS DE VÉRIFICATION

### 1. Vérifier qu'Oracle a des données
```bash
sqlplus COPT/copt123@localhost:1521/XEPDB1 << 'EOSQL'
SELECT EMP_MAT, EMP_CLE, NOM_COMMERCIAL, STATUT FROM EMPLOYEUR;
EXIT;
EOSQL
```

**Résultat attendu** : Liste de 3 employeurs

### 2. Test Backend Auth
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username": "admin", "password": "admin123"}'
```

**Résultat attendu** : Token JWT

### 3. Test Backend Employers
```bash
curl http://localhost:8080/api/employers
```

**Résultat attendu** : JSON avec les employeurs

### 4. Test Frontend
- Ouvrez http://localhost:4200
- Login: `admin` / `admin123`
- Cliquez sur "Employeurs"
- ✅ Vous devriez voir la liste dynamique !

---

## 📋 CHECKLIST DE DÉMARRAGE

- [ ] Oracle XE démarré : `sudo systemctl status oracle-xe`
- [ ] Table EMPLOYEUR créée avec données de test
- [ ] Docker arrêté : `docker-compose down`
- [ ] Eureka démarré (Terminal 1)
- [ ] Gateway démarré (Terminal 2, après 30s)
- [ ] Auth Service démarré (Terminal 3)
- [ ] Employer Service démarré (Terminal 4)
- [ ] Affiliation Service démarré (Terminal 5)
- [ ] Frontend démarré (Terminal 6)
- [ ] Eureka Dashboard accessible : http://localhost:8761
- [ ] 5 services enregistrés dans Eureka
- [ ] Frontend accessible : http://localhost:4200
- [ ] Login fonctionne
- [ ] Liste employeurs dynamique affichée

---

## 📊 ÉTAT DES COMPOSANTS

| Composant | Statut | Port | Problème | Solution |
|-----------|--------|------|----------|----------|
| Frontend Angular | ✅ OK | 4200 | Proxy configuré | Aucune |
| API Gateway | ✅ OK | 8080 | Routes corrigées | Aucune |
| Auth Service | ✅ OK | 8089 | JWT fonctionne | Aucune |
| Employer Service | ⚠️ DOCKER | 8081 | Oracle inaccessible | Lancer en local |
| Affiliation Service | ⚠️ DOCKER | 8084 | Oracle inaccessible | Lancer en local |
| Oracle XE | ✅ OK | 1521 | Sur l'hôte | Aucune |
| Eureka Server | ✅ OK | 8761 | Fonctionne | Aucune |

---

## 🔍 DIAGNOSTIC

### Si Employer Service ne démarre pas en local

Vérifiez les logs pour voir les erreurs :

```bash
# Dans le terminal où vous avez lancé employer-service
# Cherchez des erreurs comme:
# - "Cannot create JDBC driver"
# - "ORA-12154: TNS:could not resolve"
# - "Table or view does not exist"
```

### Si le Frontend ne se connecte toujours pas

1. Vérifiez que le proxy Angular est actif :
   ```bash
   # Dans le terminal frontend, vous devez voir:
   # [HPM] Proxy created: /api -> http://localhost:8080
   ```

2. Testez directement l'API :
   ```bash
   curl http://localhost:8080/api/employers
   ```

3. Vérifiez la console du navigateur (F12) pour voir les erreurs réseau

---

## 🆘 AIDE SUPPLÉMENTAIRE

Consultez ces fichiers pour plus de détails :
- `SOLUTION_FRONTEND_BACKEND.md` - Explications détaillées du problème
- `README_FINAL.md` - Documentation complète de l'application
- `GUIDE_DEMARRAGE_COMPLET.md` - Guide de démarrage détaillé

---

## 🎯 RÉSUMÉ EN 3 POINTS

1. **PROBLÈME** : Docker ne peut pas accéder à Oracle sur localhost
2. **SOLUTION** : Lancer les services en local (6 terminaux) au lieu de Docker
3. **RÉSULTAT** : Frontend dynamique connecté à Oracle ✅

**⚡ ACTION IMMÉDIATE** : Exécutez les commandes de l'Option A ci-dessus !
