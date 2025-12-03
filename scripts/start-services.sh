#!/bin/bash

# Configurer Java 17
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

echo "🚀 Démarrage des services CNSS Coopération Technique"

# Vérifier si Oracle est démarré
echo "📊 Vérification Oracle XE..."
if ! docker ps | grep -q oracle-xe; then
    echo "⚠️  Oracle XE n'est pas démarré. Démarrage..."
    docker start oracle-xe
    echo "⏳ Attente démarrage Oracle (30s)..."
    sleep 30
fi

# Vérifier si RabbitMQ est démarré
echo "🐰 Vérification RabbitMQ..."
if ! docker ps | grep -q erp_rabbitmq; then
    echo "⚠️  RabbitMQ n'est pas démarré. Veuillez le démarrer manuellement."
fi

# Vérifier si Redis est démarré
echo "💾 Vérification Redis..."
if ! docker ps | grep -q erp_redis; then
    echo "⚠️  Redis n'est pas démarré. Veuillez le démarrer manuellement."
fi

# Compilation Maven (optionnel, décommenter si nécessaire)
# echo "🔨 Compilation des microservices..."
# mvn clean package -DskipTests

# Démarrage des services avec Docker Compose
echo "🐳 Démarrage des microservices..."
docker-compose up -d

# Attendre que les services soient prêts
echo "⏳ Attente démarrage des services (60s)..."
sleep 60

# Vérifier l'état des services
echo "✅ Vérification de l'état des services:"
echo "-------------------------------------------"
curl -s http://localhost:8761 > /dev/null && echo "✓ Eureka Server (8761) - OK" || echo "✗ Eureka Server (8761) - ERREUR"
curl -s http://localhost:8080/actuator/health > /dev/null && echo "✓ Gateway (8080) - OK" || echo "✗ Gateway (8080) - ERREUR"
curl -s http://localhost:8089/auth/health > /dev/null && echo "✓ Auth Service (8089) - OK" || echo "✗ Auth Service (8089) - ERREUR"
curl -s http://localhost:8081/employer/health > /dev/null && echo "✓ Employer Service (8081) - OK" || echo "✗ Employer Service (8081) - ERREUR"
curl -s http://localhost:8082/salary/health > /dev/null && echo "✓ Salary Service (8082) - OK" || echo "✗ Salary Service (8082) - ERREUR"
curl -s http://localhost:8083/regime/health > /dev/null && echo "✓ Regime Service (8083) - OK" || echo "✗ Regime Service (8083) - ERREUR"
curl -s http://localhost:8084/affiliation/health > /dev/null && echo "✓ Affiliation Service (8084) - OK" || echo "✗ Affiliation Service (8084) - ERREUR"
curl -s http://localhost:8085/debit/health > /dev/null && echo "✓ Debit Service (8085) - OK" || echo "✗ Debit Service (8085) - ERREUR"
curl -s http://localhost:8086/payment/health > /dev/null && echo "✓ Payment Service (8086) - OK" || echo "✗ Payment Service (8086) - ERREUR"
curl -s http://localhost:8087/notification/health > /dev/null && echo "✓ Notification Service (8087) - OK" || echo "✗ Notification Service (8087) - ERREUR"
curl -s http://localhost:8088/files/health > /dev/null && echo "✓ File Service (8088) - OK" || echo "✗ File Service (8088) - ERREUR"
echo "-------------------------------------------"

echo ""
echo "🎉 Services démarrés!"
echo "📊 Eureka Dashboard: http://localhost:8761"
echo "🌐 API Gateway: http://localhost:8080"
echo "📧 RabbitMQ Management: http://localhost:15672 (guest/guest)"
echo ""
echo "📝 Pour voir les logs: docker-compose logs -f [service-name]"
echo "🛑 Pour arrêter: docker-compose down"
