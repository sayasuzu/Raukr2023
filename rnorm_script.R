# Example of a small script


mydata = data.frame(a=c(as.integer(runif(5, min = 1, max = 100))),b=c(as.integer(runif(5, min = 1, max = 100))))

my_plot <- function(...){
  plot(df, ...)
}

help(plot)

my_plot(main="Test plot", xlab = "x-axis", ylab="y-axis")


print(summary(mydata))


firstarg=as.numeric(commandArgs(trailingOnly = TRUE)[1])
mydata=rnorm(1000,mean = firstarg)
print(summary(mydata))


