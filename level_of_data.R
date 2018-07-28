#### Setting Up ####
if(!require("data.table")){install.packages("data.table",dependencies = T);library("data.table")}
if(!require("dplyr")){install.packages("dplyr",dependencies = T);library("dplyr")}
if(!require("magrittr")){install.packages("magrittr",dependencies = T);library("magrittr")}
if(!require("tidyr")){install.packages("tidyr",dependencies = T);library("tidyr")}
if(!require("plyr")){install.packages("plyr",dependencies = T);library("plyr")}
if(!require("beepr")){install.packages("beepr",dependencies = T);library("beepr")}
gc()
options(scipen = 999)
setwd("C:/Users/Ashrith Reddy/Desktop/")
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
dev.off()
options(scipen=999)
rm(list=ls()); cat("\014")

#### Reeading Datasets #### 


a = read.csv("C:/Users/Ashrith Reddy/Desktop/Python Preparation/CreditScore.csv")
if( nrow(unique(a)) == nrow(a)){
  unique_rows_flag = T
}
print(unique_rows_flag)


for(i in names(a)){
  if(length(unique(a[[i]])) == length(a[[i]])){
    print(paste(i,"COULD BE A LEVEL"))
  }else{
    print(paste(i,"IS NOT A LEVEL"))
  }
}



#### JUNK ####
# Pending tasks - 
# Interactive reader  
# 
