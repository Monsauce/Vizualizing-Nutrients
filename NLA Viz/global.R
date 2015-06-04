NLA_MB <- data.table(read.csv("C:/Users/kmenciso/Desktop/EPA_Visualization/Vizualizing-Nutrients/NLAdataset.csv"))
# NLA_MB.URL <- getURL("https://raw.githubusercontent.com/Monsauce/Vizualizing-Nutrients/master/NLAdataset.csv")
# NLA_MB<-read.csv(text=NLA_MB.URL)


# Renaming variables
NLA_MB$MC <- NLA_MB$MCYST_TL_UGL
NLA_MB$CY <- NLA_MB$ALL.CYANOS

# Transform skewed variables
NLA_MB$log10MC <- log10(NLA_MB$MC)
NLA_MB$ssCY <- (NLA_MB$CY)^0.25
NLA_MB$log10NTL <- log10(NLA_MB$NTL)
NLA_MB$log10PTL <- log10(NLA_MB$PTL)
mod<-glmer.nb(round(NLA_MB$ssCY,0) ~ log10NTL + (log10NTL|ECO_NUTA), data=NLA_MB)
