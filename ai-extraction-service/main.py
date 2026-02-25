"""
CNSS AI Document Extraction Service
Microservice FastAPI pour l'extraction intelligente de données depuis des documents
(images, PDFs) selon le type de document CNSS.
"""

from fastapi import FastAPI, UploadFile, File, Form, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional, Dict, Any, List
import pytesseract
from PIL import Image
import fitz  # PyMuPDF
import io
import re
import json
from datetime import datetime

app = FastAPI(
    title="CNSS AI Extraction Service",
    description="Service d'extraction intelligente de données depuis les documents CNSS",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ==================== MODELS ====================

class ExtractionResult(BaseModel):
    success: bool
    document_type: str
    confidence: float
    extracted_data: Dict[str, Any]
    raw_text: str
    warnings: List[str] = []

class HealthResponse(BaseModel):
    status: str
    tesseract_available: bool
    version: str


# ==================== OCR UTILS ====================

def extract_text_from_image(file_bytes: bytes, lang: str = "fra+ara") -> str:
    """Extrait le texte d'une image via Tesseract OCR"""
    try:
        image = Image.open(io.BytesIO(file_bytes))
        # Preprocessing: convert to RGB if needed
        if image.mode != 'RGB':
            image = image.convert('RGB')
        text = pytesseract.image_to_string(image, lang=lang)
        return text.strip()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Erreur OCR image: {str(e)}")


def extract_text_from_pdf(file_bytes: bytes) -> str:
    """Extrait le texte d'un PDF via PyMuPDF"""
    try:
        doc = fitz.open(stream=file_bytes, filetype="pdf")
        text = ""
        for page in doc:
            text += page.get_text() + "\n"
        
        # Si pas de texte (PDF scanné), utiliser OCR sur les images
        if not text.strip():
            for page in doc:
                pix = page.get_pixmap(dpi=300)
                img_bytes = pix.tobytes("png")
                page_text = extract_text_from_image(img_bytes, lang="fra+ara")
                text += page_text + "\n"
        
        doc.close()
        return text.strip()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Erreur extraction PDF: {str(e)}")


# ==================== DOCUMENT EXTRACTORS ====================

def extract_cin_data(text: str) -> Dict[str, Any]:
    """Extrait les données d'une Carte d'Identité Nationale tunisienne"""
    data = {}
    warnings = []
    confidence = 0.0
    fields_found = 0
    total_fields = 5
    
    # Numéro CIN (8 chiffres)
    cin_patterns = [
        r'[Nn]°?\s*[Cc]\.?[Ii]\.?[Nn]\.?\s*:?\s*(\d{8})',
        r'رقم\s*بطاقة\s*التعريف\s*:?\s*(\d{8})',
        r'رقم\s*:?\s*(\d{8})',
        r'\b(\d{8})\b',
    ]
    for pattern in cin_patterns:
        match = re.search(pattern, text)
        if match:
            data["numeroCIN"] = match.group(1)
            fields_found += 1
            break
    
    # Nom et prénom (FR + AR)
    name_patterns = [
        r'[Nn]om\s*(?:et\s*)?[Pp]r[ée]nom\s*:?\s*(.+?)(?:\n|$)',
        r'[Nn]om\s*:?\s*(.+?)(?:\n|$)',
        r'السيد[/ة]*\s*:?\s*(.+?)(?:\n|$)',
        r'الاسم\s*(?:و\s*اللقب)?\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in name_patterns:
        match = re.search(pattern, text)
        if match:
            name = match.group(1).strip()
            if name:
                data["nomPrenom"] = name
                fields_found += 1
                break
    
    # Date de naissance
    date_patterns = [
        r'[Nn][ée]\s*(?:le)?\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Dd]ate\s*(?:de)?\s*[Nn]aissance\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'تاريخ\s*الولادة\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'المولود[ة]?\s*(?:في|بتاريخ)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateNaissance"] = match.group(1)
            fields_found += 1
            break
    
    # Lieu de naissance
    lieu_patterns = [
        r'[Ll]ieu\s*(?:de)?\s*[Nn]aissance\s*:?\s*(.+?)(?:\n|$)',
        r'[Nn][ée]\s*à\s*:?\s*(.+?)(?:\n|$)',
        r'مكان\s*الولادة\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in lieu_patterns:
        match = re.search(pattern, text)
        if match:
            data["lieuNaissance"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Adresse
    addr_patterns = [
        r'[Aa]dresse\s*:?\s*(.+?)(?:\n|$)',
        r'[Dd]omicili[ée]\s*(?:à)?\s*:?\s*(.+?)(?:\n|$)',
        r'العنوان\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in addr_patterns:
        match = re.search(pattern, text)
        if match:
            data["adresse"] = match.group(1).strip()
            fields_found += 1
            break
    
    confidence = (fields_found / total_fields) * 100
    if fields_found == 0:
        warnings.append("Aucun champ CIN reconnu - vérifiez la qualité de l'image")
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


def extract_attestation_salaire_data(text: str) -> Dict[str, Any]:
    """Extrait les données d'une Attestation de Salaire"""
    data = {}
    warnings = []
    confidence = 0.0
    fields_found = 0
    total_fields = 9
    
    # Montant salaire
    salary_patterns = [
        r'[Ss]alaire\s*(?:mensuel|brut|net)?\s*:?\s*([\d\s,.]+)\s*(?:TND|DT|DIN|د\.ت)',
        r'[Mm]ontant\s*:?\s*([\d\s,.]+)\s*(?:TND|DT|DIN)',
        r'الأجر\s*:?\s*([\d\s,.]+)',
        r'المبلغ\s*:?\s*([\d\s,.]+)',
        r'([\d\s]{1,3}(?:[.,]\d{3})*(?:[.,]\d{1,3}))\s*(?:TND|DT|DIN)',
    ]
    for pattern in salary_patterns:
        match = re.search(pattern, text)
        if match:
            salary_str = match.group(1).strip().replace(' ', '').replace(',', '.')
            data["salaire"] = salary_str
            fields_found += 1
            break
    
    # Nom employeur
    employer_patterns = [
        r'[Ee]mployeur\s*:?\s*(.+?)(?:\n|$)',
        r'[Ss]oci[ée]t[ée]\s*:?\s*(.+?)(?:\n|$)',
        r'[Ee]ntreprise\s*:?\s*(.+?)(?:\n|$)',
        r'[Oo]rganisme\s*:?\s*(.+?)(?:\n|$)',
        r'المؤجر\s*:?\s*(.+?)(?:\n|$)',
        r'المؤسسة\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in employer_patterns:
        match = re.search(pattern, text)
        if match:
            data["employeur"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Nom employé
    emp_patterns = [
        r'[Nn]om\s*(?:et\s*)?[Pp]r[ée]nom\s*(?:de l.employ[ée])?\s*:?\s*(.+?)(?:\n|$)',
        r'M(?:r|me|lle)\.?\s+(.+?)(?:\n|,|$)',
        r'السيد[/ة]*\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in emp_patterns:
        match = re.search(pattern, text)
        if match:
            data["nomPrenom"] = match.group(1).strip()
            fields_found += 1
            break
    
    # N° Inscription
    insc_patterns = [
        r'[Nn]°?\s*[Ii]nscription\s*:?\s*([\d\-]+)',
        r'رقم\s*التسجيل\s*:?\s*([\d\-]+)',
    ]
    for pattern in insc_patterns:
        match = re.search(pattern, text)
        if match:
            data["numInscription"] = match.group(1).strip()
            fields_found += 1
            break
    
    # CIN
    cin_patterns = [
        r'[Cc]\.?[Ii]\.?[Nn]\.?\s*:?\s*(\d{8})',
        r'رقم\s*بطاقة\s*التعريف\s*:?\s*(\d{8})',
    ]
    for pattern in cin_patterns:
        match = re.search(pattern, text)
        if match:
            data["numeroCIN"] = match.group(1)
            fields_found += 1
            break
    
    # Période
    period_patterns = [
        r'[Pp][ée]riode\s*:?\s*(.+?)(?:\n|$)',
        r'[Dd]u\s+(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})\s*(?:au|à)\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'الفترة\s*:?\s*(.+?)(?:\n|$)',
        r'من\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})\s*(?:إلى|الى)\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Aa]nn[ée]e\s*:?\s*(\d{4})',
    ]
    for pattern in period_patterns:
        match = re.search(pattern, text)
        if match:
            if match.lastindex and match.lastindex >= 2:
                data["periode"] = f"{match.group(1)} - {match.group(2)}"
            else:
                data["periode"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Numéro affiliation
    aff_patterns = [
        r'[Nn]°?\s*(?:d\'?)?\s*[Aa]ffiliation\s*:?\s*([\d\-]+)',
        r'[Mm]atricule\s*[Ee]mployeur\s*:?\s*([\d\-]+)',
        r'رقم\s*(?:الإنخراط|الانخراط)\s*:?\s*([\d\-]+)',
    ]
    for pattern in aff_patterns:
        match = re.search(pattern, text)
        if match:
            data["numAffiliation"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Date d'effet
    date_patterns = [
        r'[Dd]ate\s*(?:d.?)?\s*[Ee]ffet\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'(?:[Àà]\s*(?:compter|partir)\s*(?:du)?|[Ee]ffet)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateEffet"] = match.group(1)
            fields_found += 1
            break
    
    # Adresse
    addr_patterns = [
        r'[Aa]dresse\s*:?\s*(.+?)(?:\n|$)',
        r'العنوان\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in addr_patterns:
        match = re.search(pattern, text)
        if match:
            data["adresse"] = match.group(1).strip()
            fields_found += 1
            break
    
    confidence = min((fields_found / total_fields) * 100, 100)
    if fields_found == 0:
        warnings.append("Aucun champ d'attestation de salaire reconnu")
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


def extract_contrat_data(text: str) -> Dict[str, Any]:
    """Extrait les données d'un Contrat de Coopérant"""
    data = {}
    warnings = []
    fields_found = 0
    total_fields = 6
    
    # Nom du coopérant
    coop_patterns = [
        r'[Cc]oop[ée]rant\s*:?\s*(.+?)(?:\n|$)',
        r'M(?:r|me|lle)\.?\s+(.+?)(?:\n|,|né)',
        r'[Ee]ntre\s+.*?(?:et|&)\s+(.+?)(?:\n|,)',
    ]
    for pattern in coop_patterns:
        match = re.search(pattern, text)
        if match:
            data["nomCooperant"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Pays d'affectation
    pays_patterns = [
        r'[Pp]ays\s*(?:d.affectation|d.d[ée]tachement|[ée]tranger)?\s*:?\s*(.+?)(?:\n|$)',
        r'(?:en|au|à)\s+([A-Z][a-zéèê]+(?:\s+[A-Z][a-zéèê]+)*)',
    ]
    for pattern in pays_patterns:
        match = re.search(pattern, text)
        if match:
            data["paysAffectation"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Organisme étranger
    org_patterns = [
        r'[Oo]rganisme\s*(?:[ée]tranger)?\s*:?\s*(.+?)(?:\n|$)',
        r'[Ee]tablissement\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in org_patterns:
        match = re.search(pattern, text)
        if match:
            data["organismeEtranger"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Dates début/fin
    date_debut_patterns = [
        r'[Dd][ée]but\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Àà]\s*(?:compter|partir)\s*(?:du)?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_debut_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateDebut"] = match.group(1)
            fields_found += 1
            break
    
    date_fin_patterns = [
        r'[Ff]in\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Jj]usqu.au?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_fin_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateFin"] = match.group(1)
            fields_found += 1
            break
    
    # Régime
    regime_patterns = [
        r'[Rr][ée]gime\s*:?\s*([\d]+)',
        r'[Cc]ode\s*[Rr][ée]gime\s*:?\s*([\d]+)',
    ]
    for pattern in regime_patterns:
        match = re.search(pattern, text)
        if match:
            data["codeRegime"] = match.group(1)
            fields_found += 1
            break
    
    confidence = (fields_found / total_fields) * 100
    if fields_found == 0:
        warnings.append("Aucun champ de contrat reconnu")
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


def extract_attestation_affiliation_data(text: str) -> Dict[str, Any]:
    """Extrait les données d'une Attestation d'Affiliation (FR + AR)"""
    data = {}
    warnings = []
    fields_found = 0
    total_fields = 5
    
    # Numéro d'affiliation (FR + AR)
    aff_patterns = [
        r'[Nn]°?\s*(?:d.?)?\s*[Aa]ffiliation\s*:?\s*([\d\-]+)',
        r'[Mm]atricule\s*(?:d.?)?\s*[Aa]ffiliation\s*:?\s*([\d\-]+)',
        r'[Aa]ffili[ée]\s*(?:sous\s*le\s*)?[Nn]°?\s*:?\s*([\d\-]+)',
        r'رقم\s*(?:الإنخراط|الانخراط)\s*:?\s*([\d\-]+)',
        r'رقم\s*الانضمام\s*:?\s*([\d\-]+)',
    ]
    for pattern in aff_patterns:
        match = re.search(pattern, text)
        if match:
            data["numAffiliation"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Numéro d'inscription / التسجيل
    reg_patterns = [
        r'رقم\s*التسجيل\s*:?\s*([\d\-]+)',
        r'[Nn]°?\s*(?:d.?)?\s*[Ii]nscription\s*:?\s*([\d\-]+)',
    ]
    for pattern in reg_patterns:
        match = re.search(pattern, text)
        if match:
            data["numInscription"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Nom et prénom (FR + AR)
    name_patterns = [
        r'[Nn]om\s*(?:et\s*)?[Pp]r[ée]nom\s*:?\s*(.+?)(?:\n|$)',
        r'[Cc]ertifie?\s*que\s+(.+?)\s+(?:est|a\s+[ée]t[ée])',
        r'السيد[/ة]*\s*:?\s*(.+?)(?:\n|$)',
        r'الاسم\s*(?:و\s*اللقب)?\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in name_patterns:
        match = re.search(pattern, text)
        if match:
            val = match.group(1).strip()
            if val and len(val) > 1:
                data["nomPrenom"] = val
                fields_found += 1
                break
    
    # Adresse / العنوان
    addr_patterns = [
        r'العنوان\s*:?\s*(.+?)(?:\n|$)',
        r'[Aa]dresse\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in addr_patterns:
        match = re.search(pattern, text)
        if match:
            data["adresse"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Dates (toutes les dates trouvées dans le texte)
    date_patterns = [
        r'[Dd]ate\s*(?:d.?)?\s*[Ee]ffet\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'(?:[Àà]\s*(?:compter|partir)\s*(?:du)?|[Ee]ffet)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'(?:من|بتاريخ|تاريخ)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'تونس\s*في\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateEffet"] = match.group(1)
            fields_found += 1
            break
    
    # Fallback: chercher toutes les dates dans le texte
    if "dateEffet" not in data:
        all_dates = re.findall(r'(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{4})', text)
        if all_dates:
            data["dateDocument"] = all_dates[0]
            if len(all_dates) > 1:
                data["autresDates"] = ", ".join(all_dates[1:])
            fields_found += 1
    
    confidence = (fields_found / total_fields) * 100
    if fields_found == 0:
        warnings.append("Aucun champ d'attestation d'affiliation reconnu")
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


def extract_decision_affectation_data(text: str) -> Dict[str, Any]:
    """Extrait les données d'une Décision d'Affectation / Moqarer Ilhaq"""
    data = {}
    warnings = []
    fields_found = 0
    total_fields = 6
    
    # Nom et prénom
    name_patterns = [
        r'[Nn]om\s*(?:et\s*)?[Pp]r[ée]nom\s*:?\s*(.+?)(?:\n|$)',
        r'السيد[/ة]*\s*:?\s*(.+?)(?:\n|$)',
        r'الاسم\s*(?:و\s*اللقب)?\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in name_patterns:
        match = re.search(pattern, text)
        if match:
            val = match.group(1).strip()
            if val and len(val) > 1:
                data["nomPrenom"] = val
                fields_found += 1
                break
    
    # N° Inscription
    insc_patterns = [
        r'[Nn]°?\s*[Ii]nscription\s*:?\s*([\d\-]+)',
        r'رقم\s*التسجيل\s*:?\s*([\d\-]+)',
    ]
    for pattern in insc_patterns:
        match = re.search(pattern, text)
        if match:
            data["numInscription"] = match.group(1).strip()
            fields_found += 1
            break
    
    # CIN
    cin_patterns = [
        r'[Cc]\.?[Ii]\.?[Nn]\.?\s*:?\s*(\d{8})',
        r'رقم\s*بطاقة\s*التعريف\s*:?\s*(\d{8})',
    ]
    for pattern in cin_patterns:
        match = re.search(pattern, text)
        if match:
            data["numeroCIN"] = match.group(1)
            fields_found += 1
            break
    
    # N° Affiliation
    aff_patterns = [
        r'[Nn]°?\s*(?:d\'?)?\s*[Aa]ffiliation\s*:?\s*([\d\-]+)',
        r'رقم\s*(?:الإنخراط|الانخراط)\s*:?\s*([\d\-]+)',
    ]
    for pattern in aff_patterns:
        match = re.search(pattern, text)
        if match:
            data["numAffiliation"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Institution
    inst_patterns = [
        r'[Ii]nstitution\s*:\s*(.+?)(?:\n|$)',
        r'[Oo]rganisme\s*:\s*(.+?)(?:\n|$)',
        r'المؤسسة\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in inst_patterns:
        match = re.search(pattern, text)
        if match:
            data["institution"] = match.group(1).strip()
            fields_found += 1
            break
    
    # Date d'effet / date de début
    date_patterns = [
        r'(?:[Àà]\s*compter\s*du|[Ee]ffet\s*(?:a\s*compter\s*du)?)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Dd]ate\s*(?:d.?)?\s*[Ee]ffet\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'[Pp]rend\s*effet\s*(?:a\s*compter\s*du|le)?\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
        r'(?:من|بتاريخ|تاريخ)\s*:?\s*(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4})',
    ]
    for pattern in date_patterns:
        match = re.search(pattern, text)
        if match:
            data["dateEffet"] = match.group(1)
            fields_found += 1
            break
    
    # Fallback dates
    if "dateEffet" not in data:
        all_dates = re.findall(r'(\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{4})', text)
        if all_dates:
            data["dateDocument"] = all_dates[0]
            fields_found += 1
    
    # Adresse
    addr_patterns = [
        r'[Aa]dresse\s*:?\s*(.+?)(?:\n|$)',
        r'العنوان\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in addr_patterns:
        match = re.search(pattern, text)
        if match:
            data["adresse"] = match.group(1).strip()
            fields_found += 1
            break
    
    confidence = min((fields_found / total_fields) * 100, 100)
    if fields_found == 0:
        warnings.append("Aucun champ de décision d'affectation reconnu")
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


def extract_generic_data(text: str) -> Dict[str, Any]:
    """Extraction générique - trouve tous les champs possibles"""
    data = {}
    warnings = ["Extraction générique - les résultats peuvent être moins précis"]
    
    # Dates
    dates = re.findall(r'\d{1,2}[/\-\.]\d{1,2}[/\-\.]\d{2,4}', text)
    if dates:
        data["dates_trouvees"] = list(set(dates))
    
    # Montants
    amounts = re.findall(r'([\d\s,.]+)\s*(?:TND|DT|DIN|د\.ت)', text)
    if amounts:
        data["montants_trouves"] = [a.strip() for a in amounts]
    
    # Numéros
    numbers = re.findall(r'[Nn]°?\s*:?\s*([\d\-/]+)', text)
    if numbers:
        data["numeros_trouves"] = list(set(numbers))
    
    # Nom et prénom
    name_patterns = [
        r'[Nn]om\s*(?:et\s*)?[Pp]r[ée]nom\s*:?\s*(.+?)(?:\n|$)',
        r'السيد[/ة]*\s*:?\s*(.+?)(?:\n|$)',
    ]
    for pattern in name_patterns:
        match = re.search(pattern, text)
        if match:
            data["nomPrenom"] = match.group(1).strip()
            break
    
    # N° Inscription
    insc_match = re.search(r'[Nn]°?\s*[Ii]nscription\s*:?\s*([\d\-]+)', text)
    if insc_match:
        data["numInscription"] = insc_match.group(1).strip()
    
    # CIN
    cin_match = re.search(r'[Cc]\.?[Ii]\.?[Nn]\.?\s*:?\s*(\d{8})', text)
    if cin_match:
        data["numeroCIN"] = cin_match.group(1)
    
    # Adresse
    addr_match = re.search(r'[Aa]dresse\s*:?\s*(.+?)(?:\n|$)', text)
    if addr_match:
        data["adresse"] = addr_match.group(1).strip()
    
    # Emails
    emails = re.findall(r'[\w.+-]+@[\w-]+\.[\w.-]+', text)
    if emails:
        data["emails_trouves"] = emails
    
    # Téléphones
    phones = re.findall(r'(?:\+216|00216)?\s*\d{2}\s*\d{3}\s*\d{3}', text)
    if phones:
        data["telephones_trouves"] = [p.strip() for p in phones]
    
    confidence = min(len(data) * 15, 60)
    
    return {"data": data, "confidence": confidence, "warnings": warnings}


# Document type mapping
EXTRACTORS = {
    "cin": extract_cin_data,
    "carte_identite": extract_cin_data,
    "attestation_salaire": extract_attestation_salaire_data,
    "contrat": extract_contrat_data,
    "contrat_cooperant": extract_contrat_data,
    "attestation_affiliation": extract_attestation_affiliation_data,
    "decision_affectation": extract_decision_affectation_data,
    "generic": extract_generic_data,
}

DOCUMENT_TYPE_LABELS = {
    "cin": "Carte d'Identité Nationale",
    "carte_identite": "Carte d'Identité Nationale",
    "attestation_salaire": "Attestation de Salaire",
    "contrat": "Contrat de Coopérant",
    "contrat_cooperant": "Contrat de Coopérant",
    "attestation_affiliation": "Attestation d'Affiliation",
    "decision_affectation": "Décision d'Affectation",
    "generic": "Document Générique",
}


def detect_document_type(text: str) -> str:
    """Détecte automatiquement le type de document à partir du texte.
    Order matters: check specific document types FIRST, CIN LAST
    because 'CIN' as a field reference appears in many documents."""
    text_lower = text.lower()
    
    # 1. Decision d'affectation / Moqarer Ilhaq (most specific keywords)
    if any(kw in text_lower for kw in [
        "decision d'affectation", "décision d'affectation",
        "decision affectation", "moqarer ilhaq", "مقرر الإلحاق",
        "مقرر إلحاق", "mis en disponibilite", "mise en disponibilite"
    ]):
        return "decision_affectation"
    
    # 2. Attestation de salaire / Certificat de salaire
    if any(kw in text_lower for kw in [
        "attestation de salaire", "certificat de salaire",
        "شهادة في الأجر", "شهادة الأجر", "salaire brut", "salaire net",
        "salaire mensuel", "retenue cnss"
    ]):
        return "attestation_salaire"
    
    # 3. Attestation d'affiliation
    if any(kw in text_lower for kw in [
        "attestation d'affiliation", "attestation d affiliation",
        "شهادة الإنخراط", "إعلام بالانخراط", "إعلام بالإنخراط",
        "certifie que", "est affili"
    ]):
        return "attestation_affiliation"
    
    # 4. Contrat de coopérant
    if any(kw in text_lower for kw in [
        "contrat de coop", "عقد التعاون", "contrat cooperant"
    ]):
        return "contrat"
    
    # 5. CIN - LAST, and require specific CIN document keywords (not just 'cin' as field)
    if any(kw in text_lower for kw in [
        "carte d'identité", "carte d'identite", "carte nationale",
        "بطاقة التعريف", "بطاقة تعريف", "republique tunisienne"
    ]):
        # Extra check: make sure it's primarily a CIN document, not just mentioning CIN
        if not any(kw in text_lower for kw in ["attestation", "decision", "certificat", "contrat"]):
            return "cin"
    
    # 6. If text starts with CIN-like header
    first_lines = text_lower[:200]
    if "n° cin" in first_lines or "n°cin" in first_lines:
        if not any(kw in text_lower for kw in ["attestation", "decision", "certificat"]):
            return "cin"
    
    return "generic"


# ==================== API ENDPOINTS ====================

@app.get("/health", response_model=HealthResponse)
def health_check():
    """Vérifie l'état du service"""
    tesseract_ok = False
    try:
        pytesseract.get_tesseract_version()
        tesseract_ok = True
    except:
        pass
    
    return HealthResponse(
        status="ok",
        tesseract_available=tesseract_ok,
        version="1.0.0"
    )


@app.post("/extract", response_model=ExtractionResult)
async def extract_document(
    file: UploadFile = File(...),
    document_type: Optional[str] = Form(None),
    lang: Optional[str] = Form("fra+ara")
):
    """
    Extrait les données d'un document (image ou PDF).
    
    - **file**: Fichier à analyser (image PNG/JPG ou PDF)
    - **document_type**: Type de document (cin, attestation_salaire, contrat, attestation_affiliation, generic). 
      Si non spécifié, le type est détecté automatiquement.
    - **lang**: Langues OCR (défaut: fra+ara pour français+arabe)
    """
    file_bytes = await file.read()
    content_type = file.content_type or ""
    
    # 1. Extraction du texte
    raw_text = ""
    if "pdf" in content_type:
        raw_text = extract_text_from_pdf(file_bytes)
    elif "image" in content_type:
        raw_text = extract_text_from_image(file_bytes, lang=lang or "fra+ara")
    else:
        # Tenter image puis PDF
        try:
            raw_text = extract_text_from_image(file_bytes, lang=lang or "fra+ara")
        except:
            try:
                raw_text = extract_text_from_pdf(file_bytes)
            except:
                raise HTTPException(status_code=400, detail="Format de fichier non supporté")
    
    if not raw_text.strip():
        return ExtractionResult(
            success=False,
            document_type=document_type or "unknown",
            confidence=0,
            extracted_data={},
            raw_text="",
            warnings=["Aucun texte détecté dans le document. Vérifiez la qualité de l'image/PDF."]
        )
    
    # 2. Détecter le type si non spécifié
    if not document_type or document_type not in EXTRACTORS:
        document_type = detect_document_type(raw_text)
    
    # 3. Extraire les données selon le type
    extractor = EXTRACTORS.get(document_type, extract_generic_data)
    result = extractor(raw_text)
    
    return ExtractionResult(
        success=len(result["data"]) > 0,
        document_type=document_type,
        confidence=result["confidence"],
        extracted_data=result["data"],
        raw_text=raw_text[:2000],  # Limiter la taille du texte brut
        warnings=result.get("warnings", [])
    )


@app.post("/extract-from-bytes")
async def extract_from_bytes(
    file_bytes: bytes,
    file_type: str,
    document_type: Optional[str] = None,
    lang: str = "fra+ara"
):
    """Endpoint interne pour extraction depuis des bytes (appelé par le backend Java)"""
    raw_text = ""
    if "pdf" in file_type:
        raw_text = extract_text_from_pdf(file_bytes)
    else:
        raw_text = extract_text_from_image(file_bytes, lang=lang)
    
    if not document_type or document_type not in EXTRACTORS:
        document_type = detect_document_type(raw_text)
    
    extractor = EXTRACTORS.get(document_type, extract_generic_data)
    result = extractor(raw_text)
    
    return {
        "success": len(result["data"]) > 0,
        "document_type": document_type,
        "confidence": result["confidence"],
        "extracted_data": result["data"],
        "raw_text": raw_text[:2000],
        "warnings": result.get("warnings", [])
    }


@app.get("/document-types")
def get_document_types():
    """Retourne la liste des types de documents supportés"""
    return {
        "types": [
            {"id": "cin", "label": "Carte d'Identité Nationale", "label_ar": "بطاقة التعريف الوطنية"},
            {"id": "attestation_salaire", "label": "Attestation de Salaire", "label_ar": "شهادة في الأجر"},
            {"id": "contrat", "label": "Contrat de Coopérant", "label_ar": "عقد التعاون المهني"},
            {"id": "attestation_affiliation", "label": "Attestation d'Affiliation", "label_ar": "شهادة الإنخراط"},
            {"id": "decision_affectation", "label": "Décision d'Affectation", "label_ar": "مقرر الإلحاق"},
            {"id": "generic", "label": "Document Générique", "label_ar": "وثيقة عامة"},
        ]
    }


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8090)
