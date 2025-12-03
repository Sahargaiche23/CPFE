#!/bin/bash

echo "🧪 Test du Workflow Complet - CNSS Coopération Technique"
echo "=========================================================="

API_URL="http://localhost:8080/api"
TOKEN=""

# Couleurs
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction de test
test_endpoint() {
    local name=$1
    local method=$2
    local endpoint=$3
    local data=$4
    
    echo -e "\n${YELLOW}Test: $name${NC}"
    echo "Endpoint: $method $endpoint"
    
    if [ "$method" == "POST" ]; then
        response=$(curl -s -X POST "$endpoint" \
            -H "Content-Type: application/json" \
            -d "$data")
    else
        response=$(curl -s "$endpoint")
    fi
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Succès${NC}"
        echo "Réponse: $response" | jq '.' 2>/dev/null || echo "$response"
    else
        echo -e "${RED}✗ Échec${NC}"
    fi
}

echo ""
echo "1️⃣ Test Authentification"
echo "------------------------"
test_endpoint "Login Admin" "POST" "$API_URL/auth/login" '{
  "username": "admin",
  "password": "admin123"
}'

echo ""
echo "2️⃣ Test Employer Service"
echo "------------------------"
test_endpoint "Créer Dossier" "POST" "$API_URL/employer/create" '{
  "matricule": 500380,
  "cle": 54,
  "regime": "500",
  "dateDepotCnss": "2025-01-03",
  "dateEffet": "2024-03-01",
  "dateNaissance": "1980-05-15",
  "nomPrenom": "AHMED MOHAMED",
  "paysDetachement": "Qatar",
  "periodeDebut": "2024-03-01",
  "periodeFin": "2026-03-01"
}'

echo ""
echo "3️⃣ Test Salary Service"
echo "------------------------"
test_endpoint "Conversion Salaire" "POST" "$API_URL/salary/convert" '{
  "matricule": 500380,
  "cle": 54,
  "dernierSalaireTN": 4500.000,
  "nouveauSalaireEtranger": 2000.000,
  "devise": "EUR",
  "dateDetachement": "2024-03-01"
}'

echo ""
echo "4️⃣ Test Regime Service"
echo "------------------------"
test_endpoint "Détermination Régime" "POST" "$API_URL/regime/determine" '{
  "dernierSalaire": 4500.000,
  "nouveauSalaireTND": 6500.000,
  "pays": "Qatar",
  "societePublique": true,
  "dateDetachement": "2024-03-01"
}'

echo ""
echo "5️⃣ Test Affiliation Service"
echo "----------------------------"
test_endpoint "Créer Affiliation" "POST" "$API_URL/affiliation/create" '{
  "matricule": 500380,
  "cle": 54,
  "numEmployeur": "50038054",
  "regime": "500",
  "dateEffet": "2024-03-01",
  "dateAssujettissement": "2024-03-01"
}'

echo ""
echo "6️⃣ Test Debit Service"
echo "------------------------"
test_endpoint "Générer Débit" "POST" "$API_URL/debit/generate" '{
  "numAffiliation": "50050038054",
  "trimestre": "2025T1",
  "dateEffet": "2024-03-01",
  "trimestreDejaDeclare": false
}'

echo ""
echo "7️⃣ Test Payment Service"
echo "------------------------"
test_endpoint "Enregistrer Paiement" "POST" "$API_URL/payment" '{
  "numAffiliation": "50050038054",
  "trimestre": "2025T1",
  "montant": 600.000,
  "modePaiement": "Bureau",
  "paiementPartiel": false
}'

echo ""
echo "8️⃣ Test Notification Service"
echo "------------------------------"
test_endpoint "Envoyer Email" "POST" "$API_URL/notification/affiliation" '{
  "numAffiliation": "50050038054",
  "email": "test@example.com",
  "montantCotisation": 600.000,
  "rib": "TN59000000000000000000"
}'

echo ""
echo "=========================================================="
echo -e "${GREEN}Tests terminés!${NC}"
echo ""
echo "Pour voir les détails:"
echo "  - Eureka: http://localhost:8761"
echo "  - Logs: docker-compose logs -f"
