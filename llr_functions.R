llr = function(x, y, z, omega) {
  fits = sapply(z, compute_f_hat, x, y, omega)
  return(fits)
}

compute_f_hat = function(z, x, y, omega) {
  Wz = diag(make_weight_vector(z, x, omega))
  X = make_predictor_matrix(x)
  Wz_x <- sweep(X,2,function(x)Wz*x)
  Wz_y <- Wz*y
  f_hat = c(1, z) %*% solve(t(X) %*% Wz_x) %*% t(X) %*% Wz_y
  return(f_hat)
}

make_weight_vector = function(z, x, omega) {
  r = (abs(x - z))/(omega)	
  w = ifelse((abs(r) < 1), (1-abs(r)^3)^3, 0)
  W = return(w)
}

make_predictor_matrix <- function(x){
  X<-cbind(1,x)
  return(X)
}
