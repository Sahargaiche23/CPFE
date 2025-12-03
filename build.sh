#!/bin/bash

echo "🔨 Build CNSS Coopération Technique"
echo "===================================="

# Configurer Java 17
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

echo "☕ Java version:"
java -version
echo ""

echo "📦 Maven version:"
mvn -version
echo ""

echo "🔨 Compilation des microservices..."
mvn clean install -DskipTests

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build réussi!"
    echo ""
    echo "Prochaine étape: ./scripts/start-services.sh"
else
    echo ""
    echo "❌ Build échoué!"
    echo "Vérifier les logs ci-dessus"
fi
