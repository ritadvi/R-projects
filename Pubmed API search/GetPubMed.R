#install the RISmed package
install.packages("RISmed")
library(RISmed)
library(tidyverse)

# Use getwd() to check current working directory 
# Set working directory
#setwd("~/Desktop")

# Import the data, TRUE for header
data <- read.csv(file = 'genes.csv', TRUE, ",", stringsAsFactors = FALSE)

for (gene in 1:38){
  search = paste(data[gene,1],"%26CFTR")
  cat("\n\n\nGene",data[gene,1],"CFTR","\n\n")
  res <- EUtilsSummary(search, type='esearch', db='pubmed')
  cat("Results:",attr(res,'count'))
  # If results > 0 print ids
  if(attr(res,'count')>0){
    
    # If results > 20, show only top 20
    if(length(attr(res,'PMID'))>20){
      cat("\n\nLatest 20 Article Ids:",attr(res,'PMID')[1:20]) 
      
    } 
    # else show all
    else {
      
      cat("\n\nArticle Ids:",attr(res,'PMID')) 
    }
  }
  
}



