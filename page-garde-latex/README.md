# Page de Garde - Rapport de Stage PFE ESPRIT

## Contenu

```
page-garde-latex/
├── main.tex          # Document LaTeX principal
├── Makefile          # Script de compilation
├── README.md         # Ce fichier
└── images/           # Images extraites du PDF
    ├── img-000.png   # Logo ESPRIT
    ├── img-001.png   # Background/Design
    ├── img-004.png   # Logo partenaire
    └── img-005.png   # Logo partenaire
```

## Structure du document

1. **Page 1** - Formulaire de validation (Encadrant Entreprise + Académique)
2. **Page 2** - Page de garde principale avec design ESPRIT

## Compilation

```bash
# Méthode 1: Makefile
make pdf

# Méthode 2: Manuelle
pdflatex main.tex
pdflatex main.tex
```

## Personnalisation

Modifier dans `main.tex` :
- **Année** : 2025 - 2026
- **Réalisé par** : Sahar Gaiche
- **Encadré par** : Oussema Cherif
- **Encadrant ESPRIT** : Hanene ENNINE
- **Encadrant Entreprise** : À compléter
- **Titre du projet** : Système de Gestion de la Coopération Technique - CNSS & Mise en Disponibilité

## Prérequis

```bash
sudo apt-get install texlive-full
```

## Design

- Triangles géométriques gris et rouge (style ESPRIT)
- Cadre rouge pour "DIPLÔME NATIONAL D'INGÉNIEUR"
- Logos en bas de page
