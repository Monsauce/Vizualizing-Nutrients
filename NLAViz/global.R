library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

# Data
# Will need to change this in the production shiny app
NLA_MB <- data.table(read.csv("C:/Users/kmenciso/Desktop/EPA_Visualization/Vizualizing-Nutrients/NLAdataset.csv"))
# NLA_MB.URL <- getURL("https://raw.githubusercontent.com/Monsauce/Vizualizing-Nutrients/master/NLAdataset.csv")
# NLA_MB<-read.csv(text=NLA_MB.URL)
# 

NLA_MB <- data.table(NLA_MB)
# Renaming variables
# Using data.table syntax
setnames(NLA_MB, 
         c("MCYST_TL_UGL", "ALL.CYANOS"),
         c("MC", "CY"))

# Transform skewed variables
NLA_MB$log10MC <- log10(NLA_MB$MC)
NLA_MB$ssCY <- (NLA_MB$CY)^0.25
NLA_MB$log10NTL <- log10(NLA_MB$NTL)
NLA_MB$log10PTL <- log10(NLA_MB$PTL)

# new check_lake_depth for easier use in shiny app
NLA_MB[DEPTHMAX >= 5, `:=`(check_lake_depth = ">= 5m")]
NLA_MB[DEPTHMAX < 5, `:=`(check_lake_depth = "< 5m")]

# Model
mod<-glmer.nb(round(NLA_MB$ssCY,0) ~ log10NTL + (log10NTL|ECO_NUTA), data=NLA_MB)


