#install the RISmed package
install.packages("RISmed")
library(RISmed)
library(tidyverse)

# Use getwd() to check current working directory 

# Import data from input.csv
setwd("~/R-projects/Pubmed API search")
# Leave a header for the column name Genes / Proteins
data <- read.csv(file = 'input.csv', TRUE, ",", stringsAsFactors = FALSE)

# For each gene / protein
for (value in 1:nrow(data)){
  
  # Concatenate (paste) gene / protein + CFTR
  searchKey = paste(data[value,1],"%26CFTR")
  
  # Print Query
  cat(value," )",data[value,1],"CFTR","\n",file="outfile.txt",append=TRUE)
  
  # Query PubMed
  res <- EUtilsSummary(searchKey, type='esearch', db='pubmed')
  
  # Print results
  cat("Results:",attr(res,'count'),"\n\n",file="outfile.txt",append=TRUE)
  
  # If Count Results > 0 print Ids
  if(attr(res,'count')>0){
    
    # If results > 20, show only top 20
    if(length(attr(res,'PMID'))>20){
      cat("Latest 20 Article Ids:",attr(res,'PMID')[1:20],"\n",file="outfile.txt",sep="\n",append=TRUE) 
      
    } 
    # Else, if results < 20 show all
    else {
      cat("Article Ids:",attr(res,'PMID'),"\n",file="outfile.txt",sep="\n",append=TRUE) 
    }
  }
  
}



