#!/bin/bash

set -e

echo "🚀 Démarrage Docker (Version Simple)"
echo "====================================="
echo ""

# Vérifier qu'Oracle est accessible
echo "1️⃣  Vérification d'Oracle XE..."
if timeout 5 bash -c '</dev/tcp/localhost/1521' 2>/dev/null; then
    echo "✅ Oracle XE est accessible sur localhost:1521"
else
    echo "❌ Oracle XE n'est pas accessible !"
    echo "   Démarrez Oracle avec: sudo systemctl start oracle-xe"
    exit 1
fi

# Démarrer les services Docker
echo ""
echo "2️⃣  Démarrage des services Docker..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"
echo "   Répertoire: $PROJECT_DIR"
docker-compose up -d --build

echo ""
echo "3️⃣  Attente du démarrage des services (45 secondes)..."
for i in {45..1}; do
    echo -ne "   ⏳ $i secondes restantes...\r"
    sleep 1
done
echo -e "\n"

echo "4️⃣  Vérification des services..."
docker-compose ps

echo ""
echo "=========================================="
echo "✅ Services Docker démarrés!"
echo ""
echo "📊 Prochaines étapes:"
echo ""
echo "1. Créer les tables Oracle (choisissez UNE méthode):"
echo ""
echo "   Méthode A - Avec Python (RAPIDE):"
echo "   pip3 install cx_Oracle"
echo "   python3 scripts/create-oracle-tables.py"
echo ""
echo "   Méthode B - Avec SQL Developer / DBeaver (GUI):"
echo "   - Ouvrez votre client SQL favori"
echo "   - Connectez-vous à COPT/copt123@localhost:1521/XEPDB1"
echo "   - Exécutez le contenu de: table/employeur.sql"
echo ""
echo "   Méthode C - Depuis un service déjà démarré:"
echo "   docker exec -it cooperation-employer sh -c 'echo CREATE TABLE...' "
echo ""
echo "2. Tester l'API:"
echo "   curl http://localhost:8080/api/employers"
echo ""
echo "3. Démarrer le frontend:"
echo "   cd frontend && npm start"
echo ""
