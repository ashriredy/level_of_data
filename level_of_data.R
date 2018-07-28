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
dataset = fread("dummy.csv")

generate_column_combinations = function(dataset,n){
  utils::combn(names(dataset),n) %>% 
    t %>% 
    data.frame() %>% 
    setNames(paste0("V",1:length(.))) %>% 
    as.matrix()
}

check_for_level = function(dataset , column_combinations){
  for(i in 1:nrow(column_combinations)){
    vec = dataset %>% select(column_combinations[i,]) %>% 
      tidyr::unite(concatenated,sep = ";;;") %>% pull(concatenated)
    residual = length(vec) -  length(unique(vec))
    cat(paste(column_combinations[i,],collapse = " x "),"----","residual:",residual,"\n")
    if(residual == 0){
      print(paste(paste(column_combinations[i,],collapse = " x "),"IS A LEVEL"))
    }else{
      print(paste(paste(column_combinations[i,],collapse = " x "),"IS NOT A LEVEL"))
    }
    cat("")
  }
  rm(i,vec,residual)
}

#### 2 - column level ####
column_combinations = generate_column_combinations(dataset,2)  # Should return a dataset with column combinations (1 column)
check_for_level(dataset,column_combinations) 









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




















#get column combinations
column = combinations  = expand.grid(names(dataset),names(dataset)) %>% apply(MARGIN = 1,sort) %>% t %>% unique %>% as.data.frame() %>% 
  filter(apply(.,MARGIN = 1, function(x) length(unique(x))!=1))



































#### JUNK ####
# Pending tasks - 
# Interactive reader  
# Missing Values
# cnames = names(dataset)
# cnames %>% as.data.frame() %>% setNames(paste0("V",1:length(.)))


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

#readability
# make a function out of everything
# c1 x c2 x c3 - residual: 0  # insert tabs instead of space
# aesthetics
#print in red


# column names as first row


# best-practices / tips and tricsk
# if datasets is large, try removing columns that are obviously not part of level
# missing values

# Additional features
# drop columns feature

