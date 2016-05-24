rm(list = ls())

df = data.frame(x = rnorm(1000), y = rnorm(1000), z = rnorm(1000))

ggplot() + geom_point(aes(x = x, y = y, color = NULL, size = NULL), data = df) 
