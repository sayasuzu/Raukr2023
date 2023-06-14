### R function
##Example
function_name <- function(param1, param2 = "Lucy"){
  if (param2 == "Lucy") {
    output <- paste("Lucy in the sky with ",param1,"\n",sep="")}
  else {
    output <- paste(param1," in the ocean with ",param2,"\n",sep="")}
  return(cat(output))
}

for (i in c("Tom","Mary","Mahesh","Henrik")){
  function_name(param1=i,param2="Brad")
  function_name(param1=i,param2="Lucy")
}

#### My function
my_function <- function(param1, param2 = ""){
  if(param2 == ""){
    output <- print("")
  }
    
}


### Data frame

data.frame(a=c(1:10))
df <- data.frame(a=c(as.integer(runif(5, min = 1, max = 100))),b=c(as.integer(runif(5, min = 1, max = 100))))

my_plot <- function(...){
  plot(df, ...)
}

help(plot)

my_plot(main="Test plot", xlab = "x-axis", ylab="y-axis")


### R script
source("rnorm_script.r")

setwd("/Users/sayaka.suzuki/Library/Group Containers/UBF8T346G9.OneDriveStandaloneSuite/OneDrive - Karolinska Institutet.noindex/OneDrive - Karolinska Institutet/Mac/Desktop")
getwd()



#### Documentation & Publishing with Quarto

library(ggplot2)
library(dplyr)
library(stringr)

##### Best Coding Practices
myIterAtoR.max <- 5
second_iterator.max<-7
col.NUM= 10
row.cnt =10
fwzy45 <- matrix(rep(1, col.NUM*row.cnt),nrow=row.cnt)
for(haystack in (2-1):col.NUM){
  for(needle in 1:row.cnt) {
    if(haystack>=myIterAtoR.max){
      fwzy45[haystack, needle]<-NA}
  }}


## Improve the code above
inter_max <- 5
col.num = 10
row.num = 10
function_inter <- matrix(rep(1, col.num*row.num), nrow = row.num)
for(i in 1: col.num){
  for(j in 1:row.num){
    if(i >= inter_max){
      function_inter[i,j] <- NA
    }
  }
}

### 1.3
## Initial script
simulate_genotype <- function( q, N=100 ) {
  if( length(q)==1 ){
    p <- (1 - q)
    f_gt <- c(p^2, 2*p*q, q^2) # AA, AB, BB
  }else{
    f_gt<-q
  }
  tmp <- sample( c('AA','AB','BB'), size =N, prob=f_gt, replace=T )
  return(tmp)
}

## Modified version
simulate_genotype <- function( q, N=100 ) {
  if( length(q)==1 ){
    p <- (1 - q)
    f_gt <- c(p^2, 2*p*q, q^2) # AA, AB, BB
  }else{
    f_gt<-q
  }
  sample( c('AA','AB','BB'), 
                 size =N, 
                 prob=f_gt, 
                 replace=TRUE)
}







