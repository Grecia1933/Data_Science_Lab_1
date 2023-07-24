install.packages("readr")
install.packages("GGally")
install.packages("corrplot")
install.packages("PerformanceAnalytics")
install.packages("Hmisc")
if(! "arules" %in% installed.packages()) install.packages("arules", depend = TRUE)
if(! "arulesViz" %in% installed.packages()) install.packages("arulesViz", depend = TRUE)
library(arules)
library(dplyr)
library(arulesViz)
library(readr)
options(scipen = 999)
library(dplyr)
library(ggplot2)
library(readxl)
library(gmodels)
library(Hmisc)
library(ggthemes)
library(GGally)
library(corrplot)
library(PerformanceAnalytics)

patients <- read.csv("./cancer.csv")

summary(patients)

glimpse(patients)

table(patients$Number.of.sexual.partners)

table(patients$Age)

hist(patients$Age)

describe(patients)

patients$First.sexual.intercourse <- as.integer(patients$First.sexual.intercourse)

patients$Smokes..years. <- as.integer(patients$Smokes..years.)

patients$Smokes..packs.year. <- as.integer(patients$Smokes..packs.year.)

patients$Hormonal.Contraceptives..years. <- as.integer(patients$Hormonal.Contraceptives..years.)

patients$IUD..years. <- as.integer(patients$IUD..years.)

patients$STDs..Time.since.first.diagnosis <- as.integer(patients$STDs..Time.since.first.diagnosis)

patients$STDs..Time.since.last.diagnosis <- as.integer(patients$STDs..Time.since.last.diagnosis)

patients$Number.of.sexual.partners <- as.integer(patients$Number.of.sexual.partners)

patients$Num.of.pregnancies <- as.integer(patients$Num.of.pregnancies)

patients$STDs..number. <- as.integer(patients$STDs..number.)

patients$STDs..Number.of.diagnosis <- as.integer(patients$STDs..Number.of.diagnosis)

table(patients$Smokes)

table(patients$Hormonal.Contraceptives)

table(patients$IUD)

table(patients$STDs)

table(patients$STDs.condylomatosis)

table(patients$STDs.cervical.condylomatosis)

table(patients$STDs.vaginal.condylomatosis)

table(patients$STDs.vulvo.perineal.condylomatosis)

table(patients$STDs.syphilis)

table(patients$STDs.pelvic.inflammatory.disease)

table(patients$STDs.genital.herpes)

table(patients$STDs.molluscum.contagiosum)

table(patients$STDs.AIDS)

table(patients$STDs.HIV)

table(patients$STDs.Hepatitis.B)

table(patients$STDs.HPV)

table(patients$Dx.Cancer)

table(patients$Dx.CIN)

table(patients$Dx.HPV)

table(patients$Dx)

table(patients$Hinselmann)

table(patients$Schiller)

table(patients$Citology)

table(patients$Biopsy)

# cor(patients$Age, patients$Smokes..packs.year.)


# Variables numéricas
df_num <- patients %>% select_if(is.numeric)

# Variables categóricas
df_cat <- patients %>% select_if(is.factor)

sapply(df_num, sd)
df_num <- df_num[sapply(df_num, function(x) sd(x, na.rm = TRUE) > 0)]


correlation_matrix <- cor(df_num, use = "complete.obs", method = "spearman")
print(correlation_matrix)

# Crea una copia de la matriz de correlación
correlation_matrix_copy <- correlation_matrix

# Reemplaza los valores donde la correlación es menor a 0.5 con NA
correlation_matrix_copy[abs(correlation_matrix_copy) < 0.5] <- NA

corrplot(correlation_matrix,
    method = "color",
    addCoef.col = "black", # color de los coeficientes
    number.cex = 0.7, # tamaño de los coeficientes
    addCoefasPercent = TRUE, # Muestra los coeficientes como porcentaje
    # Utiliza la matriz modificada para agregar los coeficientes
    addCoef.matrix = correlation_matrix_copy
)

# Reglas de Asociación 

reglas <- apriori(data = patients)

reglas <- apriori(data = patientsparameter = list(support = 0.35,
                                                  target = "frequent", 
                                                  minlen=3, maxlen=4))

inspect(sort(reglas))
