# Guide DevOps CNSS - Version LaTeX

## Contenu du package

```
latex-guide/
├── main.tex          # Document LaTeX principal
├── Makefile          # Script de compilation
├── README.md         # Ce fichier
└── images/
    ├── architecture-cnss.svg    # Diagramme d'architecture
    ├── pipeline-cicd.svg        # Pipeline CI/CD
    ├── kubernetes-cluster.svg   # Cluster Kubernetes
    └── monitoring-stack.svg     # Stack monitoring
```

## Prérequis

### Ubuntu/Debian
```bash
sudo apt-get install texlive-full inkscape
```

### Fedora/RHEL
```bash
sudo dnf install texlive-scheme-full inkscape
```

### macOS (avec Homebrew)
```bash
brew install --cask mactex
brew install inkscape
```

## Compilation

### Méthode 1 : Makefile
```bash
cd latex-guide
make pdf
```

### Méthode 2 : Manuelle
```bash
cd latex-guide
pdflatex --shell-escape main.tex
pdflatex --shell-escape main.tex  # 2ème passage pour la table des matières
```

### Méthode 3 : latexmk
```bash
cd latex-guide
latexmk -pdf -shell-escape main.tex
```

## Packages LaTeX requis

- `inputenc`, `fontenc`, `babel` (encodage et langue)
- `geometry` (marges)
- `graphicx`, `svg` (images et SVG)
- `xcolor` (couleurs)
- `hyperref` (liens)
- `fancyhdr` (en-têtes/pieds de page)
- `titlesec` (formatage des titres)
- `booktabs`, `array`, `longtable`, `colortbl` (tableaux)
- `listings` (code source)
- `tcolorbox` (boîtes colorées)
- `enumitem` (listes)
- `tikz` (graphiques)

## Structure du document

1. **Architecture de l'application** - Diagramme des 15 microservices
2. **Outils CI/CD** - Comparatif et recommandations
3. **Pipeline GitHub Actions** - Workflow complet
4. **Orchestration Kubernetes** - Configuration k3s
5. **Monitoring et Logging** - Prometheus, Grafana, Loki
6. **Sécurité** - Checklist et bonnes pratiques
7. **Solutions Cloud** - Comparatif AWS/Azure/GCP/OVH
8. **Résumé** - Tableau récapitulatif des outils

## Personnalisation

### Couleurs
Les couleurs sont définies au début du fichier `main.tex` :
```latex
\definecolor{primary}{HTML}{E11D48}
\definecolor{secondary}{HTML}{0EA5E9}
\definecolor{success}{HTML}{10B981}
\definecolor{warning}{HTML}{F59E0B}
```

### Logo
Pour ajouter un logo sur la page de titre, ajoutez :
```latex
\includegraphics[width=3cm]{images/logo.png}
```

## Support

CNSS - Caisse Nationale de Sécurité Sociale
Tunisie - Mars 2026
