# CNSS AI Document Extraction Service

Microservice Python (FastAPI) pour l'extraction intelligente de données depuis les documents CNSS via OCR (Tesseract) et parsing regex.

## Prérequis

- Python 3.10+
- Tesseract OCR installé avec les packs français et arabe

### Installation Tesseract (Ubuntu/Debian)
```bash
sudo apt-get install tesseract-ocr tesseract-ocr-fra tesseract-ocr-ara
```

## Installation

```bash
cd ai-extraction-service
pip install -r requirements.txt
```

## Démarrage

```bash
python main.py
# ou
uvicorn main:app --host 0.0.0.0 --port 8090
```

Le service sera disponible sur **http://localhost:8090**

## Docker

```bash
docker build -t cnss-ai-extraction .
docker run -p 8090:8090 cnss-ai-extraction
```

## Endpoints

| Méthode | URL | Description |
|---------|-----|-------------|
| GET | `/health` | Vérifier l'état du service |
| POST | `/extract` | Extraire les données d'un fichier (multipart) |
| GET | `/document-types` | Liste des types de documents supportés |

## Types de documents supportés

| Type | Description | Champs extraits |
|------|-------------|-----------------|
| `cin` | Carte d'Identité Nationale | N° CIN, Nom, Date naissance, Lieu, Adresse |
| `attestation_salaire` | Attestation de Salaire | Salaire, Employeur, Nom, Période, Matricule |
| `contrat` | Contrat de Coopérant | Nom, Pays, Organisme, Dates, Régime |
| `attestation_affiliation` | Attestation d'Affiliation | N° Affiliation, Nom, Régime, Date effet, Salaire |
| `generic` | Extraction générique | Dates, Montants, Numéros, Emails, Téléphones |

## Intégration

Le backend Java (file-service) proxifie les requêtes vers ce service via les endpoints :
- `POST /ged/documents/{id}/extract` — Extraire depuis un document GED existant
- `POST /ged/extract-file` — Extraire depuis un fichier uploadé
- `GET /ged/ai/health` — Santé du service AI
- `GET /ged/ai/document-types` — Types supportés

Configuration dans `application.properties` :
```properties
ai.extraction.url=http://localhost:8090
```

## Architecture

```
Frontend (Angular)
    ↓ POST /api/ged/documents/{id}/extract
Backend Java (file-service / GedController)
    ↓ RestTemplate POST multipart
Python AI Service (FastAPI, port 8090)
    ↓ Tesseract OCR + Regex parsing
Résultat JSON → Modal UI
```
