# Guide de Build et Déploiement

## Build Maven

### Build complet (tous les modules)
```bash
# À la racine du projet
mvn clean install
```

### Build sans les tests
```bash
mvn clean install -DskipTests
```

### Build d'un service spécifique
```bash
cd employer-service
mvn clean package
```

## Build Docker

### Build toutes les images
```bash
# Compiler d'abord avec Maven
mvn clean package -DskipTests

# Builder les images Docker
docker-compose build
```

### Build une image spécifique
```bash
cd employer-service
mvn clean package -DskipTests
docker build -t cooperation-employer .
```

## Déploiement local

### 1. Démarrer Oracle XE
```bash
docker start oracle-xe
```

### 2. Initialiser la base de données
```bash
cd scripts
./init-oracle.sh
```

### 3. Démarrer les services
```bash
# Avec Docker Compose
docker-compose up -d

# Ou manuellement pour développement
cd eureka-server && mvn spring-boot:run &
cd gateway-service && mvn spring-boot:run &
cd auth-service && mvn spring-boot:run &
# etc.
```

## Vérification

```bash
# Services health check
curl http://localhost:8089/auth/health
curl http://localhost:8081/employer/health
curl http://localhost:8082/salary/health

# Eureka dashboard
open http://localhost:8761
```

## Logs

```bash
# Docker logs
docker-compose logs -f [service-name]

# Maven logs (si lancé avec mvn spring-boot:run)
# Visible directement dans le terminal
```

## Nettoyage

```bash
# Arrêter et supprimer les containers
docker-compose down

# Supprimer aussi les volumes
docker-compose down -v

# Nettoyer Maven
mvn clean
```

## Variables d'environnement importantes

```bash
# Oracle
SPRING_DATASOURCE_URL=jdbc:oracle:thin:@localhost:1521/XEPDB1
SPRING_DATASOURCE_USERNAME=COPT
SPRING_DATASOURCE_PASSWORD=copt123

# Eureka
EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://localhost:8761/eureka/

# RabbitMQ
SPRING_RABBITMQ_HOST=localhost
SPRING_RABBITMQ_PORT=5672

# Redis
SPRING_REDIS_HOST=localhost
SPRING_REDIS_PORT=6379
```

## Ordre de démarrage recommandé

1. Oracle XE
2. RabbitMQ
3. Redis
4. Eureka Server
5. Gateway Service
6. Auth Service
7. Autres microservices (ordre indifférent)
8. Frontend Angular

## Problèmes courants

### Port déjà utilisé
```bash
# Trouver le processus qui utilise le port
lsof -i :8080
# Tuer le processus
kill -9 <PID>
```

### Oracle connection refused
```bash
# Vérifier qu'Oracle est démarré
docker ps | grep oracle-xe
# Vérifier les logs
docker logs oracle-xe
```

### Eureka n'enregistre pas les services
- Attendre 1-2 minutes
- Vérifier les logs du service
- Vérifier la configuration eureka.client.serviceUrl.defaultZone
