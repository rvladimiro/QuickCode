rm(list = ls())
library(ggplot2)
source('ggplot2-tests/create_vars.R')

my_sp = function(x, y, color = NULL, dataframe = NULL) {

  my_x <- x
  my_y <- y

  ggplot(aes(x = my_x, y = my_y), data = dataframe) + geom_point()

}

my_sp(var_x, var_y)

# ggplot(aes(var_x, var_y), data = NULL) + geom_point()
