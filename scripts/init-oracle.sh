#!/bin/bash

echo "🔧 Initialisation de la base de données Oracle pour CNSS Coopération Technique"

# Vérifier si Oracle est en cours d'exécution
if ! docker ps | grep -q oracle-xe; then
    echo "❌ Oracle XE n'est pas démarré!"
    echo "Démarrage: docker start oracle-xe"
    docker start oracle-xe
    echo "⏳ Attente 30 secondes..."
    sleep 30
fi

# Copier le fichier SQL dans le container
echo "📋 Copie du script SQL dans le container..."
docker cp scripts/sql/init.sql oracle-xe:/tmp/init.sql

# Exécuter le script SQL
echo "📝 Exécution du script d'initialisation..."
docker exec -i oracle-xe sqlplus sys/admin123@XEPDB1 as sysdba << EOF
@/tmp/init.sql
EXIT;
EOF

echo "✅ Initialisation terminée!"
echo ""
echo "Utilisateurs créés:"
echo "  - admin / admin123 (ADMIN)"
echo "  - agent / admin123 (AGENT_COOP_TECH)"
echo ""
echo "Connexion Oracle:"
echo "  - URL: jdbc:oracle:thin:@localhost:1521/XEPDB1"
echo "  - User: COPT"
echo "  - Password: copt123"
