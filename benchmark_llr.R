library(microbenchmark)
x <- runif(1e2)

microbenchmark(
  mean(x),
  mean.default(x), times= 1000
)