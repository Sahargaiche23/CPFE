"""
Génère des documents de test pour le module GED + AI Extraction
Usage: python generate_test_docs.py
"""
from PIL import Image, ImageDraw, ImageFont
import os

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

def get_font(size=24):
    """Try to get a font that supports Arabic, fallback to default"""
    font_paths = [
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/usr/share/fonts/truetype/freefont/FreeSans.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
        "/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf",
    ]
    for fp in font_paths:
        if os.path.exists(fp):
            return ImageFont.truetype(fp, size)
    return ImageFont.load_default()


def draw_text_lines(draw, lines, start_x, start_y, font, line_height=35, color="black"):
    y = start_y
    for line in lines:
        draw.text((start_x, y), line, fill=color, font=font)
        y += line_height
    return y


def generate_cin():
    """Génère une image simulant une CIN tunisienne"""
    img = Image.new('RGB', (900, 550), '#FFFDE7')
    draw = ImageDraw.Draw(img)
    font_title = get_font(28)
    font_text = get_font(22)
    font_small = get_font(18)

    # Border
    draw.rectangle([10, 10, 890, 540], outline='#1565C0', width=3)
    draw.rectangle([15, 15, 885, 535], outline='#1565C0', width=1)

    # Header
    draw.rectangle([15, 15, 885, 80], fill='#1565C0')
    draw.text((200, 25), "REPUBLIQUE TUNISIENNE", fill="white", font=font_title)
    draw.text((180, 55), "Carte d'Identite Nationale - CIN", fill="#FFEB3B", font=font_small)

    # Photo placeholder
    draw.rectangle([700, 100, 860, 300], outline='#666', width=2)
    draw.text((730, 190), "PHOTO", fill="#999", font=font_text)

    # Content
    lines = [
        "N° CIN : 07856234",
        "",
        "Nom et Prenom : Ben Salem Ahmed",
        "",
        "Date de Naissance : 15/03/1985",
        "",
        "Lieu de Naissance : Tunis",
        "",
        "Adresse : 25 Rue Ibn Khaldoun, Tunis 1002",
        "",
        "Profession : Enseignant",
    ]
    draw_text_lines(draw, lines, 40, 100, font_text, line_height=32)

    # Footer
    draw.line([15, 480, 885, 480], fill='#1565C0', width=2)
    draw.text((250, 490), "Delivree le : 20/06/2020 - Valable jusqu'au : 20/06/2030", fill="#555", font=font_small)

    path = os.path.join(OUTPUT_DIR, "test_cin.png")
    img.save(path)
    print(f"CIN generee: {path}")


def generate_attestation_salaire():
    """Génère une image simulant une attestation de salaire"""
    img = Image.new('RGB', (900, 700), 'white')
    draw = ImageDraw.Draw(img)
    font_title = get_font(26)
    font_text = get_font(20)
    font_small = get_font(16)

    # Header
    draw.rectangle([0, 0, 900, 90], fill='#2E7D32')
    draw.text((250, 15), "ATTESTATION DE SALAIRE", fill="white", font=font_title)
    draw.text((220, 50), "Certificat de Salaire / Declaration", fill="#C8E6C9", font=font_small)

    # Employer info
    lines_header = [
        "Employeur : Ministere de l'Education Nationale",
        "Matricule Employeur : 60-64759",
        "Adresse : Avenue Mohamed V, Tunis 1000",
    ]
    draw_text_lines(draw, lines_header, 40, 110, font_text, line_height=30)

    # Separator
    draw.line([40, 210, 860, 210], fill='#2E7D32', width=2)

    # Employee info
    lines_emp = [
        "Nom et Prenom : Ben Salem Ahmed",
        "N° Inscription : 0516078805",
        "CIN : 07856234",
        "Fonction : Enseignant",
        "Date d'effet : 01/01/2025",
    ]
    draw_text_lines(draw, lines_emp, 40, 230, font_text, line_height=30)

    # Separator
    draw.line([40, 400, 860, 400], fill='#2E7D32', width=2)

    # Salary info
    lines_sal = [
        "Periode : Janvier 2025 - Mars 2025",
        "Salaire Brut Mensuel : 1,850.000 TND",
        "Salaire Net Mensuel  : 1,520.500 TND",
        "Retenue CNSS         :   178.980 TND",
    ]
    draw_text_lines(draw, lines_sal, 40, 420, font_text, line_height=30)

    # Footer
    draw.line([40, 580, 860, 580], fill='#ccc', width=1)
    draw.text((40, 600), "Fait a Tunis, le 15/01/2025", fill="#555", font=font_text)
    draw.text((40, 640), "Signature et cachet de l'employeur", fill="#999", font=font_small)
    draw.rectangle([600, 590, 860, 680], outline='#999', width=1)
    draw.text((650, 625), "[Cachet]", fill="#ccc", font=font_text)

    path = os.path.join(OUTPUT_DIR, "test_attestation_salaire.png")
    img.save(path)
    print(f"Attestation salaire generee: {path}")


def generate_moqarer_ilhaq():
    """Génère une image simulant un مقرر الإلحاق (Decision d'Affectation)"""
    img = Image.new('RGB', (900, 750), 'white')
    draw = ImageDraw.Draw(img)
    font_title = get_font(26)
    font_text = get_font(20)
    font_small = get_font(16)

    # Header
    draw.rectangle([0, 0, 900, 100], fill='#B71C1C')
    draw.text((180, 10), "DECISION D'AFFECTATION", fill="white", font=font_title)
    draw.text((300, 45), "Moqarer Ilhaq", fill="#FFCDD2", font=font_text)
    draw.text((200, 75), "Caisse Nationale de Securite Sociale", fill="#EF9A9A", font=font_small)

    # Reference
    draw.text((40, 120), "Ref: DEC-2025-00142", fill="#333", font=font_text)
    draw.text((600, 120), "Date: 01/01/2025", fill="#333", font=font_text)

    # Separator
    draw.line([40, 155, 860, 155], fill='#B71C1C', width=2)

    # Content
    lines = [
        "Le Directeur General de la Caisse Nationale de Securite Sociale,",
        "",
        "Vu la loi n° 2003-16 du 24 fevrier 2003 relative a la mise",
        "en disponibilite speciale,",
        "",
        "Decide:",
        "",
        "Article 1: L'agent ci-apres designe est mis en disponibilite",
        "speciale aupres de l'institution mentionnee ci-dessous:",
        "",
        "  Nom et Prenom    : Ben Salem Ahmed",
        "  N° Inscription   : 0516078805",
        "  CIN              : 07856234",
        "  Institution       : Ministere de l'Education Nationale",
        "  N° Affiliation   : 60-64759",
        "",
        "Article 2: Cette decision prend effet a compter du 01/01/2025",
        "",
        "Article 3: L'interessse est tenu de verser les cotisations",
        "  prevues par la legislation en vigueur.",
    ]
    draw_text_lines(draw, lines, 40, 170, font_text, line_height=26)

    # Footer
    draw.line([40, 700, 860, 700], fill='#ccc', width=1)
    draw.text((500, 710), "Le Directeur General", fill="#555", font=font_text)
    draw.text((550, 735), "[Signature]", fill="#ccc", font=font_small)

    path = os.path.join(OUTPUT_DIR, "test_moqarer_ilhaq.png")
    img.save(path)
    print(f"Moqarer Ilhaq genere: {path}")


def generate_declaration():
    """Génère une image simulant une déclaration / attestation d'affiliation"""
    img = Image.new('RGB', (900, 650), 'white')
    draw = ImageDraw.Draw(img)
    font_title = get_font(26)
    font_text = get_font(20)
    font_small = get_font(16)

    # Header
    draw.rectangle([0, 0, 900, 90], fill='#1565C0')
    draw.text((200, 15), "ATTESTATION D'AFFILIATION", fill="white", font=font_title)
    draw.text((170, 50), "Caisse Nationale de Securite Sociale - CNSS", fill="#90CAF9", font=font_small)

    lines = [
        "La Caisse Nationale de Securite Sociale certifie que:",
        "",
        "Nom et Prenom : Ben Salem Ahmed",
        "N° Inscription : 0516078805",
        "N° Affiliation : 60-64759",
        "CIN : 07856234",
        "",
        "Est affilie(e) a la CNSS au titre du regime de mise en",
        "disponibilite speciale (Loi 2003-16 du 24/02/2003).",
        "",
        "Adresse : 25 Rue Ibn Khaldoun, Tunis 1002",
        "",
        "Date d'effet : 01/01/2025",
        "",
        "La presente attestation est delivree pour servir et",
        "valoir ce que de droit.",
    ]
    draw_text_lines(draw, lines, 40, 110, font_text, line_height=30)

    draw.line([40, 580, 860, 580], fill='#ccc', width=1)
    draw.text((40, 590), "Fait a Tunis, le 15/01/2025", fill="#555", font=font_text)
    draw.text((550, 590), "Le Directeur Regional", fill="#555", font=font_text)

    path = os.path.join(OUTPUT_DIR, "test_declaration.png")
    img.save(path)
    print(f"Declaration generee: {path}")


if __name__ == "__main__":
    print("=== Generation des documents de test ===")
    print(f"Dossier: {OUTPUT_DIR}\n")
    generate_cin()
    generate_attestation_salaire()
    generate_moqarer_ilhaq()
    generate_declaration()
    print(f"\n=== Termine! 4 fichiers generes dans {OUTPUT_DIR} ===")
    print("Utilisez ces fichiers pour tester le module GED + AI Extraction")
