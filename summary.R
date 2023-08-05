dataset <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")
mean_white_prison_pop_rate <- mean(dataset$white_prison_pop_rate, na.rm = T)
mean_black_prison_pop_rate <- mean(dataset$black_prison_pop_rate, na.rm = T)
mean_aapi_prison_pop_rate <- mean(dataset$aapi_prison_pop_rate, na.rm = T)
mean_latinx_prison_pop_rate <- mean(dataset$latinx_prison_pop_rate, na.rm = T)
mean_native_prison_pop_rate <- mean(dataset$native_prison_pop_rate, na.rm = T)
min_black_prison_pop_rate <- min(dataset$black_prison_pop_rate, na.rm = T)
dataset1 <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
mean_white_prison_pop_rate_function <- function(){
  i <- mean_white_prison_pop_rate
  return(i)
}
mean_latinx_prison_pop_rate_function <- function(){
  i <- mean_latinx_prison_pop_rate
  return(i)
}
mean_aapi_prison_pop_rate_function <- function(){
  i <- mean_aapi_prison_pop_rate
  return(i)
}
mean_native_prison_pop_rate_function <- function(){
  i <- mean_native_prison_pop_rate
  return(i)
}
mean_black_prison_pop_rate_function <- function(){
  i <- mean_black_prison_pop_rate
  return(i)
}