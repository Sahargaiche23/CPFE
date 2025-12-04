# 🔧 Solution : Connexion Frontend ↔ Backend

## ✅ PROBLÈMES RÉSOLUS

### 1. Routes Gateway
**Problème** : Le Gateway utilisait `/api/employer/**` (singulier) mais le frontend appelait `/api/employers` (pluriel).

**Solution** : ✅ Corrigé dans `/gateway-service/src/main/resources/application.yml`
- `/api/employers/**` → employer-service
- `/api/affiliations/**` → affiliation-service  
- `/api/auth/**` → auth-service

### 2. Controllers avec `/api` en double
**Problème** : Les controllers avaient `@RequestMapping("/api/...")` mais le Gateway avec `StripPrefix=1` retirait déjà `/api`.

**Solution** : ✅ Corrigé dans tous les controllers :
- `EmployeurController`: `/employers` (sans `/api`)
- `AffiliationController`: `/affiliations` (sans `/api`)
- `AuthController`: `/auth` (sans `/api`)

### 3. Proxy Angular
**Solution** : ✅ Déjà configuré dans `frontend/proxy.conf.json`
```json
{
  "/api": {
    "target": "http://localhost:8080",
    "secure": false,
    "changeOrigin": true
  }
}
```

---

## ❌ PROBLÈME RESTANT : Oracle depuis Docker

### Symptôme
```bash
curl http://localhost:8081/actuator/health
# {"status":"DOWN"}
```

### Cause
Les containers Docker utilisent `localhost:1521` pour Oracle, mais **localhost dans un container ≠ localhost de l'hôte**.

### 🛠️ SOLUTIONS POSSIBLES

#### Option 1: Utiliser host.docker.internal (Linux)

Modifiez `docker-compose.yml` pour ajouter un extra_host :

```yaml
services:
  employer-service:
    extra_hosts:
      - "host.docker.internal:host-gateway"
```

Puis modifiez `application.yml` :
```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@host.docker.internal:1521/XEPDB1
```

#### Option 2: Oracle dans Docker (RECOMMANDÉ)

Ajoutez Oracle XE dans `docker-compose.yml` :

```yaml
services:
  oracle:
    image: gvenzl/oracle-xe:21-slim
    ports:
      - "1521:1521"
    environment:
      ORACLE_PASSWORD: copt123
      APP_USER: COPT
      APP_USER_PASSWORD: copt123
    volumes:
      - oracle-data:/opt/oracle/oradata
      - ./table:/docker-entrypoint-initdb.d
    healthcheck:
      test: ["CMD", "healthcheck.sh"]
      interval: 30s
      timeout: 10s
      retries: 5

volumes:
  oracle-data:
```

Et modifiez les `application.yml` pour utiliser :
```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@oracle:1521/XEPDB1
```

#### Option 3: Utiliser l'IP de l'hôte

Trouvez votre IP :
```bash
ip addr show | grep "inet " | grep -v 127.0.0.1
```

Puis modifiez les `application.yml` :
```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@192.168.X.X:1521/XEPDB1
```

---

## 🚀 SOLUTION IMMÉDIATE (SANS DOCKER)

Pour tester rapidement, **lancez les services en local** (sans Docker) :

### 1. Arrêter Docker
```bash
docker-compose down
```

### 2. Démarrer Eureka
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/eureka-server
mvn spring-boot:run
```

### 3. Démarrer Gateway (nouveau terminal)
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/gateway-service
mvn spring-boot:run
```

### 4. Démarrer Auth Service (nouveau terminal)
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/auth-service
mvn spring-boot:run
```

### 5. Démarrer Employer Service (nouveau terminal)
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/employer-service
mvn spring-boot:run
```

### 6. Démarrer Affiliation Service (nouveau terminal)
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/affiliation-service
mvn spring-boot:run
```

### 7. Démarrer Frontend (nouveau terminal)
```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project/frontend
npm start
```

Avec cette approche, tous les services utilisent `localhost:1521` pour Oracle et ça fonctionnera !

---

## ✅ VÉRIFICATION

### 1. Test Auth
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username": "admin", "password": "admin123"}'
```

**Résultat attendu** : Token JWT

### 2. Test Employers
```bash
curl http://localhost:8080/api/employers
```

**Résultat attendu** : Liste JSON des employeurs

### 3. Test Frontend
Ouvrez http://localhost:4200 et connectez-vous avec `admin` / `admin123`.

---

## 📊 RÉCAPITULATIF ARCHITECTURE

```
┌──────────────────────┐
│  Frontend Angular    │  Port 4200
│  (avec proxy)        │
└──────────┬───────────┘
           │ HTTP /api/*
           ▼
┌──────────────────────┐
│   API Gateway        │  Port 8080
│   Spring Cloud       │
└──────────┬───────────┘
           │ Load Balancing
           ▼
┌──────────────────────┐
│   Eureka Server      │  Port 8761
└──────────┬───────────┘
           │
      ┌────┴────┬──────────┐
      ▼         ▼          ▼
┌──────────┐ ┌─────────┐ ┌──────────┐
│  Auth    │ │Employer │ │Affiliation│
│  :8089   │ │  :8081  │ │  :8084   │
└────┬─────┘ └────┬────┘ └────┬─────┘
     │            │            │
     └────────────┴────────────┘
                  │
            ┌─────▼─────┐
            │ Oracle XE │
            │   :1521   │
            └───────────┘
```

---

## 🎯 ACTION RECOMMANDÉE

**Pour tester IMMÉDIATEMENT** :
1. Arrêtez Docker : `docker-compose down`
2. Démarrez les services en local avec `mvn spring-boot:run`
3. Démarrez le frontend avec `npm start`
4. Testez sur http://localhost:4200

**Pour une solution permanente** :
- Implémentez l'Option 2 (Oracle dans Docker)
- OU configurez `host.docker.internal` (Option 1)

---

## 📝 NOTES

- ✅ Auth Service fonctionne (JWT validé)
- ✅ Gateway routes corrigées
- ✅ Controllers corrigés
- ✅ Proxy Angular configuré
- ❌ Oracle non accessible depuis Docker (problème réseau)

**Solution rapide = Lancer services en local au lieu de Docker**
