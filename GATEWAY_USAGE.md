# 🌐 Guide d'Utilisation du Gateway (Port 8080)

## ℹ️ Pourquoi Erreur 404 sur http://localhost:8080 ?

Le Gateway est un **routeur**, pas un service web avec page d'accueil. C'est **normal** qu'il n'y ait rien sur `http://localhost:8080` directement.

---

## ✅ Comment Utiliser le Gateway

Le Gateway route les requêtes vers les microservices via des préfixes:

| Préfixe Gateway | Service Cible | Port Direct |
|----------------|---------------|-------------|
| `/api/auth/**` | Auth Service | 8089 |
| `/api/employer/**` | Employer Service | 8081 |
| `/api/salary/**` | Salary Service | 8082 |
| `/api/regime/**` | Regime Service | 8083 |
| `/api/affiliation/**` | Affiliation Service | 8084 |
| `/api/debit/**` | Debit Service | 8085 |
| `/api/payment/**` | Payment Service | 8086 |
| `/api/notification/**` | Notification Service | 8087 |
| `/api/files/**` | File Service | 8088 |

---

## 🎯 Exemples d'Utilisation

### Via Gateway (Port 8080)
```bash
# Login via Gateway
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# Créer dossier via Gateway
curl -X POST http://localhost:8080/api/employer/create \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{...}'
```

### Direct (Sans Gateway)
```bash
# Login direct
curl -X POST http://localhost:8089/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# Créer dossier direct
curl -X POST http://localhost:8081/employer/create \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{...}'
```

---

## 📊 Différence Gateway vs Direct

### Via Gateway (8080)
✅ **Point d'entrée unique** pour tous les services  
✅ **CORS configuré** pour Angular (localhost:4200)  
✅ **Load balancing** automatique  
✅ **URL unifiées** avec `/api/` prefix  
❌ Pas de Swagger UI (c'est un routeur)

### Direct (8089, 8081, 8082...)
✅ **Swagger UI disponible** sur chaque service  
✅ **Tests rapides** sans routage  
✅ **Logs spécifiques** par service  
❌ Plusieurs URLs à gérer  
❌ CORS à configurer par service

---

## 🔍 Vérifier que le Gateway Fonctionne

### 1. Test Health
```bash
curl http://localhost:8080/actuator/health
```
Résultat attendu:
```json
{
  "status": "UP"
}
```

### 2. Test Login via Gateway
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
```
Résultat attendu: Token JWT

### 3. Test Routes
```bash
# Test chaque route
curl http://localhost:8080/api/auth/health
curl http://localhost:8080/api/employer/health
curl http://localhost:8080/api/salary/health
```

---

## 🎨 Interface Frontend (Angular)

Votre application Angular doit utiliser le Gateway:

```typescript
// environment.ts
export const environment = {
  apiUrl: 'http://localhost:8080/api'
};

// auth.service.ts
login(credentials) {
  return this.http.post(`${environment.apiUrl}/auth/login`, credentials);
}

// employer.service.ts
createDossier(data) {
  return this.http.post(`${environment.apiUrl}/employer/create`, data);
}
```

---

## 🚀 URLs Complètes via Gateway

### Auth Service
```
Login:          POST http://localhost:8080/api/auth/login
Register:       POST http://localhost:8080/api/auth/register
Refresh:        POST http://localhost:8080/api/auth/refresh
Health:         GET  http://localhost:8080/api/auth/health
```

### Employer Service
```
Create:         POST http://localhost:8080/api/employer/create
Get:            GET  http://localhost:8080/api/employer/{id}
Update:         PUT  http://localhost:8080/api/employer/{id}
Delete:         DELETE http://localhost:8080/api/employer/{id}
List:           GET  http://localhost:8080/api/employer/all
```

### Salary Service
```
Convert:        POST http://localhost:8080/api/salary/convert
Get:            GET  http://localhost:8080/api/salary/{id}
By Dossier:     GET  http://localhost:8080/api/salary/dossier/{dossierId}
```

### Regime Service
```
Determine:      POST http://localhost:8080/api/regime/determine
Get:            GET  http://localhost:8080/api/regime/{id}
By Dossier:     GET  http://localhost:8080/api/regime/dossier/{dossierId}
```

### Affiliation Service
```
Create:         POST http://localhost:8080/api/affiliation/create
Get:            GET  http://localhost:8080/api/affiliation/{id}
By Dossier:     GET  http://localhost:8080/api/affiliation/dossier/{dossierId}
```

### Debit Service
```
Calculate:      POST http://localhost:8080/api/debit/calculate
Get:            GET  http://localhost:8080/api/debit/{id}
By Affiliation: GET  http://localhost:8080/api/debit/affiliation/{affiliationId}
```

### Payment Service
```
Create:         POST http://localhost:8080/api/payment/create
Get:            GET  http://localhost:8080/api/payment/{id}
By Debit:       GET  http://localhost:8080/api/payment/debit/{debitId}
```

### Notification Service
```
Send:           POST http://localhost:8080/api/notification/send
Get:            GET  http://localhost:8080/api/notification/{id}
By User:        GET  http://localhost:8080/api/notification/user/{userId}
```

### File Service
```
Upload:         POST http://localhost:8080/api/files/upload
Download:       GET  http://localhost:8080/api/files/{id}
By Dossier:     GET  http://localhost:8080/api/files/dossier/{dossierId}
```

---

## 🔧 Configuration Gateway

Le Gateway est configuré dans `gateway-service/src/main/resources/application.yml`:

```yaml
spring:
  cloud:
    gateway:
      routes:
        - id: auth-service
          uri: lb://auth-service        # Load balanced
          predicates:
            - Path=/api/auth/**         # Match path
          filters:
            - StripPrefix=1             # Remove /api
```

### Comment Ça Marche?

1. **Requête**: `http://localhost:8080/api/auth/login`
2. **Gateway match**: Path `/api/auth/**` → route `auth-service`
3. **StripPrefix=1**: Enlève `/api` → `/auth/login`
4. **Load Balancer**: Résout `lb://auth-service` via Eureka
5. **Routage**: `http://auth-service:8089/auth/login`

---

## 📝 Pour les Tests

### Utiliser Swagger Direct (Plus Simple)
```
Auth:     http://localhost:8089/swagger-ui/index.html
Employer: http://localhost:8081/swagger-ui/index.html
Salary:   http://localhost:8082/swagger-ui/index.html
etc.
```

### Utiliser Gateway (Production)
```
Login:           http://localhost:8080/api/auth/login
Create Dossier:  http://localhost:8080/api/employer/create
Convert Salary:  http://localhost:8080/api/salary/convert
```

---

## 🎯 Résumé

| Aspect | Gateway (8080) | Direct (8089+) |
|--------|---------------|----------------|
| **Page d'accueil** | ❌ Aucune (routeur) | ❌ Aucune |
| **Swagger UI** | ❌ Non | ✅ Oui |
| **API Endpoints** | ✅ Tous via `/api/` | ✅ Endpoints directs |
| **CORS** | ✅ Configuré | ⚠️ À configurer |
| **Load Balancing** | ✅ Oui | ❌ Non |
| **Pour tests** | ⚠️ Moins pratique | ✅ Plus pratique |
| **Pour production** | ✅ Recommandé | ❌ Non recommandé |

---

## ✅ Verdict

**Le Gateway fonctionne parfaitement!**

- ✅ Tous les services sont routés
- ✅ CORS configuré pour Angular
- ✅ Load balancing actif
- ✅ Enregistré dans Eureka

**Il est normal qu'il n'y ait pas de page sur http://localhost:8080**

---

## 🚀 Pour Tester Maintenant

### Option 1: Via Swagger (Recommandé pour tests)
```
Utiliser les Swagger UI directs:
http://localhost:8089/swagger-ui/index.html
http://localhost:8081/swagger-ui/index.html
etc.
```

### Option 2: Via Gateway (curl)
```bash
# Login
TOKEN=$(curl -s -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}' | jq -r '.token')

# Créer dossier
curl -X POST http://localhost:8080/api/employer/create \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "matricule": 500380,
    "cle": 54,
    "regime": "500",
    "nomPrenom": "Test User"
  }'
```

---

## 📚 Documentation

- Voir `SWAGGER_SUCCESS_COMPLET.md` pour les Swagger UI
- Voir `gateway-service/src/main/resources/application.yml` pour les routes

**Le Gateway est opérationnel! Utilisez-le pour votre application Angular.** 🎉
