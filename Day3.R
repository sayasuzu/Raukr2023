### 1 General exercises

# 1.1 Pipes
# 1.1.1 Chunk 1
library(tidyverse)
library(magrittr)

#Rewrite the following code chunks as pipes (Load package magrittr because tidyverse supports only the %>% pipe!):

my_cars <- mtcars[, c(1:4, 10)]
my_cars <- my_cars[my_cars$disp > mean(my_cars$disp), ]
my_cars <- colMeans(my_cars)

print(my_cars)

## Answer
mtcars %>%
  select(c(1:4, 10)) %>%
  filter(disp > mean(disp)) %>%
  colMeans -> my_cars2

print(my_cars2)

# 1.1.2 Chunk 2
# pipe send the 
cars %T>% {print(summary(.))} %>% colSums(.)

cars %>% summary() %>% print()


cars %T>% {print(colSums(.))}

# 1.1.3 Chunk 3
# Rewrite the following correlations using pipes.
cor(mtcars$gear, mtcars$mpg)

# Rewrite version
mtcars %$% cor(gear, mpg)

# Givien code
cor(mtcars)

# Rewrite version
mtcars %>% cor()

# 1.1.4 Chunk 4
# Given is the dim_summary(nrows, ncols) function which takes nrows and ncols as arguments and prints this info:

dim_summary <- function(nrows, ncols) {
  print(
    paste0('Matrix M has: ', nrows, ' rows and ', ncols, ' columns.')
  )
}

# Rewrite each of the code chunks below using pipes:
# Given code
distr1 <- rnorm(16)
M <- matrix(distr1, ncol = 4)
plot(M)
M <- M + sample(M)
dim_summary(nrows = nrow(M), ncols = ncol(M))

# Rewrite version
M <- rnorm(16) %>%
  matrix(ncol = 4) %T>%
  plot() %>%
  `+`(., sample(.)) %T>%
  {dim_summary(nrow(.), ncol(.))}


M <- rnorm(16) %>%
  matrix(ncol = 4) %T>%
  plot() %>%
  `+`(., sample(.)) %>%
  {dim_summary(nrow(.), ncol(.))}


# Given code
distr2 <- rnorm(16)
N <- matrix(distr2, ncol = 4)
colnames(N) <- (letters[1:4])
summary(N)
N <- N + 0

# Rewrite version
N <- rnorm(16) %>%
  matrix(ncol = 4) %>%
  `colnames<-`(letters[1:4]) %T>%
  summary() %>% `+`(., 0)

# Given code
P <- M %x% t(N)
heatmap(P)
colnames(P) <- letters[1:dim(P)[2]]
cor(P[ ,'a'], P[ ,'i'])
  
# Rewrite version
P <- M %>%
  `%x%`(., t(N)) %T>%
  heatmap() %>%
  `colnames<-`(letters[1:dim(.)[2]]) %>%
  as_data_frame() %$%
  cor(a.i)


# 1.2 Tibbles
# 1.2.1 Task 1
#Convert the mtcars dataset to a tibble vehicles.
vehicles <- as_tibble(mtcars)

# Select the number of cylinders (cyl) variable using:
#the [[index]] accessor,
#the [[string]] accessor,
#the $ accessor.
head(vehicles)
vehicles[['cyl']]
vehicles[[2]]
vehicles$cyl

#Do the same selection as above, but using pipe and placeholders (use all three ways of accessing a variable).
vehicles %>% .[['cyl']]
vehicles %>% .[[2]]
vehicles %>% .$cyl

#Print the tibble.
print(vehicles)

#Print the 30 first rows of the tibble.
print(vehicles, n=30)

# Change the default behavior of printing a tibble so that at least 15 and at most 30 rows are printed.
options(tibble.print_min = 15, tibble.print_max = 25)
print(vehicles)

#What is the difference between the tibble.print_max and dplyr.print_min? Is there any? Test it.
options(dplyr.print_min = Inf)
print(vehicles)

options(tibble.width = Inf)
print(vehicles)

library(usethis)
git_sitrep()







