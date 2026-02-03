# Analyse de l’Investissement des Entreprises à l’Aide des Modèles de Données de Panel

##  Présentation du projet
Ce dépôt contient le projet réalisé dans le cadre de l’examen d’**Économétrie Avancée**
(**Master SSD – Semestre 3**).  
Le travail porte sur l’application des **modèles économétriques de données de panel**
à l’analyse des déterminants de l’investissement des entreprises.

L’étude repose sur un panel équilibré de **100 entreprises observées sur la période 2020–2024**
(soit **500 observations**).

---

##  Objectifs
- Analyser empiriquement les déterminants de l’investissement des entreprises.
- Mettre en œuvre les modèles **poolé**, **à effets fixes** et **à effets aléatoires**.
- Tester la présence d’effets individuels non observés.
- Comparer les spécifications économétriques à l’aide de tests formels.
- Sélectionner le modèle final le plus approprié et robuste.

---

## 📁 Structure du projet



---

##  Données
- **Type** : Panel équilibré
- **Unités** : 100 entreprises
- **Période** : 2020 – 2024
- **Variables** :
  - `Investissement` : investissement annuel
  - `Valeur_Marche` : valeur de marché
  - `stock_capital` : stock de capital
  - `Cash_Flow` : cash-flow
  - `Cout_Capital` : coût du capital

---

##  Méthodologie économétrique
Les étapes de l’analyse incluent :
- Statistiques descriptives globales et par entreprise
- Estimation du modèle poolé (OLS)
- Estimation du modèle à effets fixes (Within / LSDV)
- Estimation du modèle à effets aléatoires (GLS)
- Tests de spécification :
  - Test de Fisher (Chow)
  - Test LM de Breusch–Pagan
  - Test de Hausman
- Tests de diagnostic :
  - Hétéroscédasticité
  - Autocorrélation
  - Dépendance transversale
- Estimation finale avec **erreurs robustes de Driscoll–Kraay**

---

##  Logiciels et packages
### R (version ≥ 4.0)
Packages utilisés :
- `readxl`
- `dplyr`
- `plm`
- `psych`
- `lmtest`
- `sandwich`

---

##  Rapport
Le rapport est rédigé sous **LaTeX (Overleaf)** et structuré en répondant
séquentiellement aux **20 questions de l’énoncé**, avec :
- tableaux de résultats,
- interprétations économétriques,
- justification des choix méthodologiques.

---

## Encadrement académique
**Matière** : Économétrie Avancée  
**Enseignant** : *Dr. Mohamed Saad Bouh ELEMINE VALL*

---

##  Auteur
- Étudiant : *Mohamed Lemine Abdallahi Tah*  
- Master SSD – Semestre 3  

---


