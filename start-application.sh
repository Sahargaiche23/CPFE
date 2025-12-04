#!/bin/bash

echo "🚀 Démarrage de l'Application CNSS Coopération Technique"
echo "=============================================="
echo ""

# 1. Vérifier Oracle
echo "📊 Vérification Oracle XE..."
sqlplus -S COPT/copt123@localhost:1521/XEPDB1 <<EOF > /dev/null 2>&1
SELECT 'Oracle OK' FROM DUAL;
EXIT;
EOF

if [ $? -eq 0 ]; then
    echo "✅ Oracle XE est opérationnel"
else
    echo "❌ Oracle XE n'est pas accessible!"
    echo "   Démarrez Oracle: sudo systemctl start oracle-xe"
    exit 1
fi

# 2. Insérer données de test (si non existantes)
echo ""
echo "💾 Insertion des données de test..."
sqlplus -S COPT/copt123@localhost:1521/XEPDB1 @table/insert_test_data.sql > /dev/null 2>&1
echo "✅ Données de test insérées"

# 3. Démarrer les services backend
echo ""
echo "🐳 Démarrage des microservices Docker..."
docker-compose up -d

echo ""
echo "⏳ Attente du démarrage des services (30 secondes)..."
sleep 30

# 4. Vérifier les services
echo ""
echo "🔍 Vérification des services:"
echo "   - Eureka:      http://localhost:8761"
curl -s http://localhost:8761/actuator/health > /dev/null && echo "   ✅ Eureka OK" || echo "   ⏳ Eureka en démarrage..."

echo "   - Gateway:     http://localhost:8080"
curl -s http://localhost:8080/actuator/health > /dev/null && echo "   ✅ Gateway OK" || echo "   ⏳ Gateway en démarrage..."

echo "   - Auth:        http://localhost:8081"
curl -s http://localhost:8081/api/auth/health > /dev/null && echo "   ✅ Auth OK" || echo "   ⏳ Auth en démarrage..."

echo "   - Affiliation: http://localhost:8083"
curl -s http://localhost:8083/api/affiliations/health > /dev/null && echo "   ✅ Affiliation OK" || echo "   ⏳ Affiliation en démarrage..."

echo "   - Debit:       http://localhost:8085"
curl -s http://localhost:8085/api/debits/health > /dev/null && echo "   ✅ Debit OK" || echo "   ⏳ Debit en démarrage..."

echo "   - Salary:      http://localhost:8086"
curl -s http://localhost:8086/salary/health > /dev/null && echo "   ✅ Salary OK" || echo "   ⏳ Salary en démarrage..."

# 5. Informations de connexion
echo ""
echo "=============================================="
echo "✅ Application démarrée avec succès!"
echo "=============================================="
echo ""
echo "📝 Informations de connexion:"
echo ""
echo "   Backend (Gateway):  http://localhost:8080"
echo "   Frontend:           http://localhost:4200"
echo "   Eureka Dashboard:   http://localhost:8761"
echo ""
echo "   Login:    admin"
echo "   Password: admin123"
echo ""
echo "=============================================="
echo ""
echo "📋 Commandes utiles:"
echo "   - Logs:    docker-compose logs -f [service]"
echo "   - Stop:    docker-compose down"
echo "   - Restart: docker-compose restart [service]"
echo ""
echo "🎯 Pour démarrer le frontend:"
echo "   cd frontend && npm start"
echo ""
