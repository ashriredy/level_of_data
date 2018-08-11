#### Setting Up ####
if(!require("data.table")){install.packages("data.table");library("data.table")}
if(!require("dplyr")){install.packages("dplyr",dependencies = T);library("dplyr")}
gc()
options(scipen = 999)
setwd("C:/Users/Ashrith Reddy/Desktop/")
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
dev.off()
rm(list=ls()); cat("\014")

dataset = read.csv("C:/Users/Ashrith Reddy/Desktop/Python Preparation/CreditScore.csv")
column_names = dataset %>% names()

one_column_primary_key = function(dataset){
  
  uniques = sapply(dataset,function(x) length(unique(x)) )
  # for(i in seq_along(dataset)){
  #   paste(names(dataset)[[i]], "has ",length(unique(dataset[[i]])),"unique values") %>% print
  # }
  
  maximum_cols = c(which(uniques == max(uniques)) %>% names,"apple")
  paste(maximum_cols,"is a likely columns") %>% print
}


if(nrow(unique(dataset)) != nrow(dataset)){
  duplicate_rows = T
  warning("There are duplicate Rows")
}



one_column_primary_key(dataset)





if(duplicate_rows == F){

  
}else{
  
}







for(i in names(a)){
  if(length(unique(a[[i]])) == length(a[[i]])){
    print(paste(i,"COULD BE A LEVEL"))
  }else{
    print(paste(i,"IS NOT A LEVEL"))
  }
}


