install.packages("readr")
install.packages("GGally")
install.packages("corrplot")
install.packages("PerformanceAnalytics")
install.packages("Hmisc")
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

patients <- read.csv("/Users/dimitribadanigasdaglis/Desktop/risk_factors_cervical_cancer.csv")

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

#cor(patients$Age, patients$Smokes..packs.year.)


