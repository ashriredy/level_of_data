library(dplyr)

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
