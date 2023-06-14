### test code
a <- 2

b <- 3

a + b -> c



# Create a 100000 by 10 matrix with the numbers 1:1000000
mat <- matrix(1:1000000, nrow = 100000, ncol = 10)
print(mat)

sum_row <- vector()
for(i in 1:nrow(mat)){
  sum_row[i] <- sum(mat[i,])
}

library(tictoc)
tic()
head(sum_row)
toc()

