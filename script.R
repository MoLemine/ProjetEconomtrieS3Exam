############################################################
# PROJET D’ÉCONOMÉTRIE AVANCÉE – DONNÉES DE PANEL
# SCRIPT R COMPLET (QUESTIONS AVEC CODE UNIQUEMENT)

# ==============================
# 0. PACKAGES
# ==============================
library(readxl)
library(dplyr)
library(plm)
library(psych)
library(lmtest)
library(sandwich)

# ==============================
# 1. IMPORT ET PRÉPARATION DES DONNÉES
# ==============================

# Import des données Excel
data <- read_excel("eco/PD.xlsx")

# Vérification initiale
str(data)

# Nettoyage et conversion des variables (Excel → numérique)
data <- data %>%
  mutate(
    Investissement = as.numeric(gsub(",", ".", Investissement)),
    Valeur_Marche  = as.numeric(gsub(",", ".", Valeur_Marche)),
    stock_capital  = as.numeric(gsub(",", ".", stock_capital)),
    Cash_Flow      = as.numeric(gsub(",", ".", Cash_Flow)),
    Cout_Capital   = as.numeric(gsub(",", ".", Cout_Capital)),
    Annee          = as.numeric(Annee)
  )

# Déclaration des données de panel
pdata <- pdata.frame(data, index = c("ID_Entreprise", "Annee"))

# ==============================
# Q2 : STATISTIQUES DESCRIPTIVES
# ==============================

# Statistiques descriptives globales
describe(select(data,
                Investissement,
                Valeur_Marche,
                stock_capital,
                Cash_Flow,
                Cout_Capital))

# Statistiques descriptives par entreprise
data %>%
  group_by(ID_Entreprise) %>%
  summarise(across(c(Investissement, Valeur_Marche,
                     stock_capital, Cash_Flow, Cout_Capital),
                   list(mean = mean,
                        sd = sd,
                        min = min,
                        max = max),
                   na.rm = TRUE))



# ==============================
# Q4 : MODÈLE POOLÉ (Pooled OLS)
# ==============================

pool_ols <- plm(
  Investissement ~ Valeur_Marche + stock_capital +
    Cash_Flow + Cout_Capital,
  data  = pdata,
  model = "pooling"
)

summary(pool_ols)

# ==============================
# Q6 : MODÈLE À EFFETS FIXES (LSDV / WITHIN)
# ==============================

fe_model <- plm(
  Investissement ~ Valeur_Marche + stock_capital +
    Cash_Flow + Cout_Capital,
  data  = pdata,
  model = "within"
)

summary(fe_model)

# ==============================
# Q8 : TEST DE FISHER (CHOW)
# ==============================

pFtest(fe_model, pool_ols)

# ==============================
# Q9 : MODÈLE WITHIN (équivalent LSDV)
# ==============================

summary(fe_model)

# ==============================
# Q11 : MODÈLE À EFFETS ALÉATOIRES
# ==============================

re_model <- plm(
  Investissement ~ Valeur_Marche + stock_capital +
    Cash_Flow + Cout_Capital,
  data  = pdata,
  model = "random"
)

summary(re_model)

# ==============================
# Q13 : TEST LM DE BREUSCH–PAGAN
# ==============================

plmtest(pool_ols, type = "bp")

# ==============================
# Q14 : TEST DE HAUSMAN
# ==============================

phtest(fe_model, re_model)

# ==============================
# Q17 : DIAGNOSTICS ÉCONOMÉTRIQUES
# ==============================

# Hétéroscédasticité
bptest(fe_model)

# Autocorrélation
pbgtest(fe_model)

# Dépendance transversale
pcdtest(fe_model, test = "cd")

# ==============================
# Q18 : ERREURS ROBUSTES (DRISCOLL–KRAAY)
# ==============================

coeftest(
  fe_model,
  vcov = vcovSCC(fe_model, type = "HC1")
)

# FIN DU SCRIPT
