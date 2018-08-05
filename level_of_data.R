#### Setting Up ####
if(!require("data.table")){install.packages("data.table",dependencies = T);library("data.table")}
if(!require("dplyr")){install.packages("dplyr",dependencies = T);library("dplyr")}
if(!require("magrittr")){install.packages("magrittr",dependencies = T);library("magrittr")}
if(!require("tidyr")){install.packages("tidyr",dependencies = T);library("tidyr")}
if(!require("plyr")){install.packages("plyr",dependencies = T);library("plyr")}
if(!require("beepr")){install.packages("beepr",dependencies = T);library("beepr")}
if(!require("rstudioapi")){install.packages("rstudioapi",dependencies = T);library("rstudioapi")}
gc()
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
dev.off()
options(scipen=999)
rm(list=ls()); cat("\014")

#### Reeading Datasets #### 
dataset = fread("dummy.csv")
# dataset = fread("POS_stage_1_v2.csv") %>% setDF()

#### Defining Functions #### 
generate_column_combinations = function(dataset,n){
  utils::combn(names(dataset),n) %>% 
    t %>% 
    data.frame() %>% 
    setNames(paste0("V",1:length(.))) %>% 
    as.matrix()
}

check_for_level = function(dataset , column_combinations){
  for(j in 1:nrow(column_combinations)){
    concatenated_combination = dataset %>% 
      select(column_combinations[j,]) %>% 
      tidyr::unite(concatenated,sep = ";;;") %>% 
      pull(concatenated)
    
    residual = length(concatenated_combination) -  length(unique(concatenated_combination))
    
    cat(paste(column_combinations[j,],collapse = " x "),"----","residual:",format(residual,big.mark=","),"\n")
    
    if(residual == 0){
      message(paste(paste(column_combinations[j,],collapse = " x "),"IS A LEVEL"))
    }else{
      print(paste(paste(column_combinations[j,],collapse = " x "),"IS NOT A LEVEL"))
    }
    cat("\n")
    rm(concatenated_combination,residual);gc();
  }
}

#### Determine the level ####
for(i in 1:ncol(dataset)){
  column_combinations = generate_column_combinations(dataset,i)
  check_for_level(dataset,column_combinations) 
}

1:ncol(dataset) %>% sapply(function(x){
  column_combinations = generate_column_combinations(dataset,x)
  check_for_level(dataset,column_combinations)
}) %>% invisible()





