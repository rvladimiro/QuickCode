rm(list = ls())

library(ggplot2)

qplotit = function(x, y, data = NULL, color = NULL) {
    qplot(x = x, y = y, data = data, geom = "point")
    
}

var_x = rnorm(100)
var_y = var_x * 3.14 + rnorm(100)

df = data.frame(x = var_x, y = var_y)

qplotit(x = x, y = y, data = df) 
