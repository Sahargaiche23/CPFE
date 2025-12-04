# 🚀 Démarrage avec Docker + Oracle

## ✅ CE QUI A ÉTÉ CORRIGÉ

1. ✅ **docker-compose.yml** : Tous les services utilisent maintenant `host.docker.internal` pour accéder à Oracle
2. ✅ **Script automatique** : `scripts/setup-oracle-docker.sh` pour tout configurer

---

## 🎯 DÉMARRAGE EN 1 COMMANDE

```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
./scripts/setup-oracle-docker.sh
```

Ce script va :
1. ✅ Vérifier qu'Oracle XE est démarré
2. ✅ Créer la table EMPLOYEUR avec des données de test
3. ✅ Démarrer tous les services Docker
4. ✅ Afficher les URLs de test

**Durée** : ~2 minutes (selon vitesse réseau pour télécharger l'image Oracle)

---

## 📋 ÉTAPES DÉTAILLÉES (si vous préférez manuel)

### 1. Vérifier qu'Oracle est démarré

```bash
sudo systemctl status oracle-xe
# Si arrêté:
sudo systemctl start oracle-xe
```

### 2. Créer les tables Oracle

Le script utilise un container Docker temporaire avec sqlplus :

```bash
docker run --rm --network host \
  -v /tmp/create_all_tables.sql:/tmp/create_all_tables.sql:ro \
  gvenzl/oracle-xe:21-slim \
  sqlplus -S COPT/copt123@//localhost:1521/XEPDB1 @/tmp/create_all_tables.sql
```

### 3. Démarrer les services

```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
docker-compose up -d --build
```

### 4. Vérifier les services

```bash
# Attendre 30 secondes
sleep 30

# Vérifier que tout tourne
docker-compose ps

# Tester l'API
curl -X POST http://localhost:8080/api/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"username":"admin","password":"admin123"}'

curl http://localhost:8080/api/employers
```

### 5. Démarrer le frontend

```bash
cd frontend
npm install  # Si première fois
npm start
```

Ouvrez http://localhost:4200 et connectez-vous : `admin` / `admin123`

---

## 🔍 VÉRIFICATIONS

### Si un service est DOWN

```bash
# Voir les logs
docker logs cooperation-employer --tail 50

# Vérifier la santé
curl http://localhost:8081/actuator/health
```

### Si Oracle n'est pas accessible

```bash
# Test de connexion Oracle depuis l'hôte
timeout 5 bash -c '</dev/tcp/localhost/1521'
echo $?  # Doit retourner 0

# Test depuis un container
docker run --rm --network host gvenzl/oracle-xe:21-slim \
  sqlplus -S COPT/copt123@//localhost:1521/XEPDB1 <<< "SELECT 1 FROM DUAL;"
```

### Si le frontend ne récupère pas les données

1. **Vérifier le proxy Angular**
   - Le frontend doit être démarré avec `npm start` (pas `ng serve` direct)
   - Vérifiez dans les logs : `[HPM] Proxy created: /api -> http://localhost:8080`

2. **Tester l'API directement**
   ```bash
   curl http://localhost:8080/api/employers
   ```

3. **Vérifier Eureka**
   - Ouvrez http://localhost:8761
   - Tous les services doivent être enregistrés (vert)

---

## 🛑 ARRÊTER LES SERVICES

```bash
cd /home/sahar/Bureau/CNSS/CascadeProjects/windsurf-project
docker-compose down
```

---

## 🔄 REDÉMARRER APRÈS UN CHANGEMENT

Si vous modifiez le code :

```bash
# Rebuild le service modifié (exemple: employer-service)
cd employer-service
mvn clean package -DskipTests

# Redémarrer le container
cd ..
docker-compose up -d --build employer-service
```

---

## 📊 RÉSUMÉ ARCHITECTURE

```
┌──────────────────────┐
│  Frontend Angular    │  localhost:4200
│  (avec proxy /api)   │
└──────────┬───────────┘
           │ HTTP
           ▼
┌──────────────────────┐
│   Gateway Docker     │  localhost:8080
└──────────┬───────────┘
           │ Eureka Discovery
           ▼
┌──────────────────────┐
│ Services Docker      │  Ports 8081-8089
│ (avec extra_hosts)   │
└──────────┬───────────┘
           │ host.docker.internal:1521
           ▼
┌──────────────────────┐
│   Oracle XE (hôte)   │  localhost:1521/XEPDB1
│   Schema: COPT       │
└──────────────────────┘
```

**Clé** : `host.docker.internal` permet aux containers d'accéder à l'hôte !

---

## ✅ CHECKLIST FINALE

- [ ] Oracle XE démarré
- [ ] Table EMPLOYEUR créée (3 employeurs de test)
- [ ] Services Docker démarrés (12 containers)
- [ ] Tous les services sont "UP" dans `docker-compose ps`
- [ ] Eureka affiche 11 services (http://localhost:8761)
- [ ] Auth fonctionne (test curl ci-dessus)
- [ ] Employers API retourne du JSON (test curl ci-dessus)
- [ ] Frontend démarré avec `npm start`
- [ ] Login réussit sur http://localhost:4200
- [ ] Liste employeurs dynamique affichée

---

## 🆘 PROBLÈMES COURANTS

| Erreur | Cause | Solution |
|--------|-------|----------|
| `Cannot connect to Oracle` | Oracle pas démarré | `sudo systemctl start oracle-xe` |
| `Status: DOWN` | host.docker.internal pas résolu | Vérifier que Docker Desktop est à jour (>20.10) |
| `404 Not Found` | Routes Gateway incorrectes | Rebuild gateway : `docker-compose up -d --build gateway-service` |
| `Connection refused` | Service pas encore démarré | Attendre 30s de plus |
| Frontend données statiques | Proxy pas activé | Utiliser `npm start` (pas `ng serve`) |

---

**🎉 Une fois tout démarré, l'application est 100% fonctionnelle !**
