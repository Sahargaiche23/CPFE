# PFE - Plateforme Cloud OSS Orange Tunisie

## Version LaTeX

Ce package contient le code source LaTeX du Projet de Fin d'Études.

## Contenu

```
pfe-latex/
├── main.tex              # Document LaTeX principal (82 pages)
├── Makefile              # Script de compilation
├── README.md             # Ce fichier
├── content_full.txt      # Contenu texte extrait du PDF
└── images/               # 44 images extraites
    ├── img-000.png       # Logo université
    ├── img-002.png       # Logo Orange
    ├── img-003.png       # Organigramme
    ├── ...
    └── img-043.png
```

## Structure du document

1. **Chapitre 1** - Cadre Initial et Préparation du Projet
   - Présentation Orange Tunisie
   - Contexte et problématique
   - Méthodologie Scrum

2. **Chapitre 2** - Étude Préliminaire et Choix Technologiques (Sprint 1)
   - OpenStack, Kubernetes, Rancher
   - Terraform, Ansible
   - Prometheus, Grafana, Graylog
   - GitLab CI/CD

3. **Chapitre 3** - Analyse des besoins (Sprint 1)
   - Besoins fonctionnels et non fonctionnels
   - Conception UML

4. **Chapitre 4** - Automatisation Cloud, Orchestration & Monitoring (Sprints 2-4)
   - Déploiement OpenStack/Kubernetes
   - Orchestration Camunda
   - Supervision Prometheus/Grafana

5. **Chapitre 5** - CI/CD, Gouvernance et Sécurité (Sprints 5-7)
   - GitLab CI/CD
   - KubeHunter, Graylog

6. **Chapitre 6** - Offres B2B (Sprint 8)
   - IaaS, PaaS, SaaS

## Compilation

### Prérequis

```bash
# Ubuntu/Debian
sudo apt-get install texlive-full

# Fedora/RHEL
sudo dnf install texlive-scheme-full

# macOS
brew install --cask mactex
```

### Compiler le PDF

```bash
cd pfe-latex

# Méthode 1: Makefile
make pdf

# Méthode 2: Manuelle
pdflatex main.tex
pdflatex main.tex  # 2ème passage pour TOC

# Méthode 3: latexmk
latexmk -pdf main.tex
```

### Nettoyer

```bash
make clean
```

## Packages LaTeX requis

- `inputenc`, `fontenc`, `babel`
- `geometry`, `graphicx`
- `xcolor`, `hyperref`
- `fancyhdr`, `titlesec`
- `booktabs`, `longtable`, `colortbl`
- `listings`, `tcolorbox`
- `tikz`, `float`

## Personnalisation

### Informations personnelles

Modifier dans `main.tex` :
- Nom de l'étudiant
- Nom de l'encadrant
- Nom de l'université
- Année universitaire

### Couleurs

```latex
\definecolor{orange}{HTML}{FF6600}
\definecolor{darkblue}{HTML}{003366}
```

## Notes

- Les images sont extraites automatiquement du PDF original
- Certaines images peuvent nécessiter un réajustement
- Le texte a été restructuré pour une meilleure lisibilité

## Auteur

Projet de Fin d'Études - Orange Tunisie
Année 2024-2025
