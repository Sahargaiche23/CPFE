#!/bin/bash

set -e

echo "🔧 Test d'intégration Backend-Frontend-Oracle"
echo "=============================================="
echo ""

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

PROJECT_DIR="$(dirname "$0")/.."
cd "$PROJECT_DIR"

# 1. Test Oracle
echo -e "${YELLOW}1️⃣ Test connexion Oracle...${NC}"
if docker exec oracle-xe sqlplus -S COPT/copt123@//localhost:1521/XEPDB1 <<< "SELECT 'OK' FROM DUAL;" 2>/dev/null | grep -q "OK"; then
    echo -e "${GREEN}✅ Oracle COPT accessible${NC}"
else
    echo -e "${RED}❌ Erreur connexion Oracle${NC}"
    exit 1
fi

# 2. Vérifier les données utilisateur
echo -e "${YELLOW}2️⃣ Vérification données utilisateurs...${NC}"
USER_COUNT=$(docker exec oracle-xe sqlplus -S COPT/copt123@//localhost:1521/XEPDB1 <<< "SELECT COUNT(*) FROM APP_USER;" 2>/dev/null | grep -E "^\s*[0-9]+" | head -1 | tr -d ' ')
if [ "$USER_COUNT" -gt 0 ]; then
    echo -e "${GREEN}✅ $USER_COUNT utilisateurs trouvés dans APP_USER${NC}"
else
    echo -e "${RED}❌ Aucun utilisateur trouvé${NC}"
    exit 1
fi

# 3. Build des services si nécessaire
echo -e "${YELLOW}3️⃣ Build des services Maven...${NC}"
if [ ! -f eureka-server/target/*.jar ]; then
    echo "Build en cours..."
    mvn clean package -DskipTests -q
else
    echo -e "${GREEN}✅ JARs déjà construits${NC}"
fi

# 4. Démarrer Eureka Server
echo -e "${YELLOW}4️⃣ Démarrage Eureka Server (port 8761)...${NC}"
if curl -s http://localhost:8761 > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Eureka déjà en cours d'exécution${NC}"
else
    cd eureka-server
    nohup java -jar target/*.jar > /tmp/eureka.log 2>&1 &
    echo "Attente démarrage Eureka (30s)..."
    sleep 30
    cd ..
fi

# 5. Démarrer Gateway
echo -e "${YELLOW}5️⃣ Démarrage Gateway (port 8080)...${NC}"
if curl -s http://localhost:8080 > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Gateway déjà en cours d'exécution${NC}"
else
    cd gateway-service
    nohup java -jar target/*.jar > /tmp/gateway.log 2>&1 &
    sleep 10
    cd ..
fi

# 6. Démarrer Auth Service
echo -e "${YELLOW}6️⃣ Démarrage Auth Service (port 8089)...${NC}"
if curl -s http://localhost:8089/actuator/health > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Auth Service déjà en cours d'exécution${NC}"
else
    cd auth-service
    nohup java -jar target/*.jar > /tmp/auth.log 2>&1 &
    echo "Attente démarrage Auth (20s)..."
    sleep 20
    cd ..
fi

# 7. Test API Login
echo ""
echo -e "${YELLOW}7️⃣ Test API Login via Gateway...${NC}"
sleep 5

LOGIN_RESPONSE=$(curl -s -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}' 2>/dev/null)

if echo "$LOGIN_RESPONSE" | grep -q "token\|accessToken"; then
    echo -e "${GREEN}✅ Login réussi!${NC}"
    echo "Réponse: $LOGIN_RESPONSE"
else
    echo -e "${RED}❌ Échec du login${NC}"
    echo "Réponse: $LOGIN_RESPONSE"
    echo ""
    echo "Logs Auth Service:"
    tail -50 /tmp/auth.log 2>/dev/null || echo "Pas de logs disponibles"
fi

echo ""
echo "=========================================="
echo -e "${GREEN}🎉 Test d'intégration terminé!${NC}"
echo ""
echo "📊 URLs:"
echo "  • Eureka Dashboard: http://localhost:8761"
echo "  • API Gateway: http://localhost:8080"
echo "  • Auth Service: http://localhost:8089"
echo ""
echo "🌐 Pour le frontend:"
echo "  cd frontend && npm install && npm start"
echo "  Puis ouvrez: http://localhost:4200"
echo ""
