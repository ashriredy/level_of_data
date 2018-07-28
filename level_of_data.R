#### Setting Up ####
if(!require("data.table")){install.packages("data.table",dependencies = T);library("data.table")}
if(!require("dplyr")){install.packages("dplyr",dependencies = T);library("dplyr")}
if(!require("magrittr")){install.packages("magrittr",dependencies = T);library("magrittr")}
if(!require("tidyr")){install.packages("tidyr",dependencies = T);library("tidyr")}
if(!require("plyr")){install.packages("plyr",dependencies = T);library("plyr")}
if(!require("beepr")){install.packages("beepr",dependencies = T);library("beepr")}
if(!require("rstudioapi")){install.packages("rstudioapi",dependencies = T);library("rstudioapi")}
gc()
options(scipen = 999)
setwd("C:/Users/Ashrith Reddy/Desktop/")
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
dev.off()
options(scipen=999)
rm(list=ls()); cat("\014")

#### Reeading Datasets #### 
# dataset = fread("POS_stage_1_v2.csv")
dataset = fread("dummy.csv")

#### 1 - column level ####
i = names(dataset)[1]
for(i in names(dataset)){
  vec = dataset[[i]]
  residual = length(vec) -  length(unique(vec))
  cat(i,"-",residual,"\n")
  if(residual == 0){
    print(paste(i,"IS A LEVEL"))
  }else{
    print(paste(i,"IS NOT A LEVEL"))
  }
}

#### 2 - column level ####
i = names(dataset)[1]
j = names(dataset)[2]

for(i in names(dataset)){
  for(j in names(dataset)){
    vec = paste(dataset[[i]],dataset[[j]],sep = "~~~")
    residual = length(vec) -  length(unique(vec))
    cat(i,j,"-",residual,"\n")
    if(residual == 0){
      print(paste(i,j,"IS A LEVEL"))
    }else{
      print(paste(i,j,"IS NOT A LEVEL"))
    }
    
  }
  
  
}
























































#### JUNK ####
# Pending tasks - 
# Interactive reader  
# Missing Values


# add assumptions #
# csv only?

# if(nrow(unique(a)) == nrow(a)){
#   unique_rows_flag = T
# }
# print(unique_rows_flag)

#efficiency #
data.table
gc
unique fast
fast accessging a column - check with microbenchmarking

# aesthetics
#print in red