### 1 Task 1: A large matrix
## 1.1 Looping over a matrix

# Create a 100000 by 10 matrix with the numbers 1:1000000
mat <- matrix(1:1000000, nrow = 100000, ncol = 10)
print(mat)

# Write a for-loop that calculates the sum for each row of the matrix.
sum_row <- vector()
for(i in 1:nrow(mat)){
    sum_row[i] <- sum(mat[i,])
}

library(tictoc)
tic()
head(sum_row)
toc()

# Verify that your row counts are consistent with what you obtain with the apply() function
# MARGIN = 1 is rows, 2 is columns
apply_sum <- apply(mat, MARGIN = 1, sum)
head(apply_sum)

# Verify that your row counts are consistent with what you obtain with the apply() function rowSums() function
row_sum <- rowSums(mat)
head(row_sum)

identical(sum_row, apply_sum)

identical(sum_row, row_sum)

identical(apply_sum, as.integer(row_sum))

# 2.1 N-th Fibonacci number
# Write a function that generates Fibonacci number using a recursive approach.
fib_num <- function(n) {
  if (n == 0 || n == 1) { 
    return(n) 
  } else {
    return(fib_num(n - 1) + fib_num(n - 2))
  }
}

# Generate Fibonacci numbers from 0 to 10 using *apply* approach.
sapply(0:10, FUN = fib_num)

# Vectorize your Fibonacci number generating function.
Vec_fib <- Vectorize(fib_num)
Vec_fib(1:10)


### Parallelization
#install.packages("future")
library("future")

# Exercises
system.time({sample(100,200000000,replace=T)})

# 2.1 Sequential and Multi-
# Question1
tic()
future::plan(sequential)
a %<-% sample(100,200000000,replace=T)
toc()

# Question2
tic()
plan(multisession)
a %<-% sample(100,200000000,replace=T)
toc()

#Question3
plan(multisession)

tic()
a %<-% matrix(as.integer(runif(200, min = 1, max = 10000)))
b %<-% matrix(as.integer(runif(200, min = 500, max = 10000)))
  #evaluate futures by requesting outcome values
a + b 
toc()

plan(sequential)
tic()
a <- matrix(as.integer(runif(200, min = 1, max = 10000)))
b <- matrix(as.integer(runif(200, min = 500, max = 10000)))
#evaluate futures by requesting outcome values
a + b 
toc()


plan(multisession)
tic()
a %<-% {sample(100,20000,replace=T)}
b %<-% {sample(100,20000,replace=T)}
  #evaluate futures by requesting outcome values
a + b
toc()


## 2.3 For loops
plan(multisession)

#Create a new environment
v <- new.env()
for (name in c("a", "b", "c")) {
  v[[name]] %<-% {
    #expression(s)
  }
}
#Turn the environment back into a list
v <- as.list(v)

#To turn the list of vectors into the same format, one long vector, that we had above when running "a + b + c"
vec <- Reduce(c,v)

### Object-Oriented Programming in R
# What is the class of the object returned by the lm() function?
s3_obj <- lm(speed ~ dist, data = cars) 
class(s3_obj)

# What basic data type is it build upon?
typeof(s3_obj)

# What attributes does the object of the lm class have?
attributes(s3_obj)

# What is the structure of the lm object?
structure(s3_obj)
str(s3_obj)

# Does the lm class implement own str()?
str(s3_obj)
# compare to:
str(unclass(s3_obj)) 

# What is the class of a tibble? 
# You have to load the tidyverse package and use on of the built-in datasets, 
# e.g. mtcars as argument to as_tibble() to check the class.
library("tidyverse")
iris <- as_tibble(iris)










