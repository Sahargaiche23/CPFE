#!/bin/bash

set -e

echo "🔧 Configuration Oracle + Démarrage Docker"
echo "==========================================="
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

# Créer le script SQL
echo ""
echo "2️⃣  Création du script SQL..."
cat > /tmp/create_all_tables.sql << 'EOSQL'
-- Supprimer les tables si elles existent
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE COPT.EMPLOYEUR CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Créer la table EMPLOYEUR
CREATE TABLE COPT.EMPLOYEUR (
    EMP_MAT NUMBER(10) NOT NULL,
    EMP_CLE NUMBER(5) NOT NULL,
    NOM_COMMERCIAL VARCHAR2(200),
    RAISON_SOCIALE VARCHAR2(200),
    REGIME VARCHAR2(10),
    PAYS VARCHAR2(100),
    ADRESSE VARCHAR2(500),
    TELEPHONE VARCHAR2(50),
    EMAIL VARCHAR2(100),
    STATUT VARCHAR2(20),
    DATE_CREATION DATE,
    CONSTRAINT PK_EMPLOYEUR PRIMARY KEY (EMP_MAT, EMP_CLE)
);

-- Insérer des données de test
INSERT INTO COPT.EMPLOYEUR VALUES (
    500380, 54, 
    'Test Company France', 
    'Entreprise Test SARL',
    '500', 'France',
    '123 Rue de Paris, 75001 Paris',
    '+33123456789',
    'contact@testcompany.fr',
    'Actif',
    SYSDATE
);

INSERT INTO COPT.EMPLOYEUR VALUES (
    510245, 2, 
    'IntCorp Deutschland', 
    'International Corporation GmbH',
    '510', 'Allemagne',
    'Berliner Str. 45, 10115 Berlin',
    '+4930123456',
    'info@intcorp.de',
    'Actif',
    SYSDATE
);

INSERT INTO COPT.EMPLOYEUR VALUES (
    500380, 55, 
    'TechSol France', 
    'Tech Solutions SARL',
    '500', 'France',
    '456 Avenue Tech, 69000 Lyon',
    '+33987654321',
    'contact@techsol.fr',
    'Inactif',
    SYSDATE
);

COMMIT;

-- Vérification
SELECT 'Table EMPLOYEUR créée avec ' || COUNT(*) || ' enregistrements' AS RESULTAT FROM COPT.EMPLOYEUR;

EXIT;
EOSQL

echo "✅ Script SQL créé: /tmp/create_all_tables.sql"

# Option A: Utiliser docker pour exécuter sqlplus
echo ""
echo "3️⃣  Exécution du script SQL via Docker..."
echo "   (Téléchargement de l'image Oracle client si nécessaire...)"

docker run --rm --network host \
  -v /tmp/create_all_tables.sql:/tmp/create_all_tables.sql:ro \
  gvenzl/oracle-xe:21-slim \
  sqlplus -S COPT/copt123@//localhost:1521/XEPDB1 @/tmp/create_all_tables.sql

if [ $? -eq 0 ]; then
    echo "✅ Tables créées avec succès!"
else
    echo "❌ Erreur lors de la création des tables"
    exit 1
fi

# Démarrer les services Docker
echo ""
echo "4️⃣  Démarrage des services Docker..."
cd "$(dirname "$0")/.."
docker-compose up -d --build

echo ""
echo "5️⃣  Attente du démarrage des services (30 secondes)..."
sleep 30

echo ""
echo "6️⃣  Vérification des services..."
docker-compose ps

echo ""
echo "=========================================="
echo "✅ Configuration terminée!"
echo ""
echo "📊 Vérifications:"
echo "  • Eureka Dashboard: http://localhost:8761"
echo "  • API Gateway: http://localhost:8080"
echo "  • Test Auth: curl -X POST http://localhost:8080/api/auth/login -H 'Content-Type: application/json' -d '{\"username\":\"admin\",\"password\":\"admin123\"}'"
echo "  • Test Employers: curl http://localhost:8080/api/employers"
echo ""
echo "🌐 Frontend:"
echo "  cd frontend && npm start"
echo "  Puis ouvrez: http://localhost:4200"
echo ""
