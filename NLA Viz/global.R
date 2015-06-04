#NLA_MB <- data.table(read.csv("C:/Users/kmenciso/Desktop/EPA_Visualization/Vizualizing-Nutrients/NLAdataset.csv"))
NLA_MB.URL <- getURL("https://raw.githubusercontent.com/Monsauce/Vizualizing-Nutrients/master/NLAdataset.csv")
NLA_MB<-read.csv(text=NLA_MB.URL)