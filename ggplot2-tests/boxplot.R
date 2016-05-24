# Work in progress
rm(list = ls())
# source('ggplot2-tests/theme.R')
source("ggplot2-tests/format_plot.R")
library(ggplot2)

ognd_boxplot = function(measure, dimension, dataframe = NULL, notch = T, title = NULL, x_label = NULL, y_label = NULL, 
    facet_formula = NULL) {
    
    measure_name = deparse(substitute(measure))
    dimension_name = deparse(substitute(dimension))
    
    plot = ggplot() + geom_boxplot(aes_string(x = dimension_name, y = measure_name, color = dimension_name, 
        fill = dimension_name), data = dataframe, alpha = 0.5, outlier.colour = "gray30", outlier.shape = 1, 
        notch = notch)
    
    return(format_plot(plot, title, x_label, y_label, facet_formula))
}

# Set the seed
set.seed(1714)
# Test single vector
my_measures = rnorm(1000) + rep(c(0, 1.1, 1.2, 1.4, 1.8), 200)
my_dimensions = as.factor(rep(c("A", "B", "C", "D", "E"), 200))
my_facet = as.factor(rep(c("One", "Another"), 500))
ognd_boxplot(measure = my_measures, dimension = my_dimensions, title = "No dataframe")
# Test dataframe
my_dataframe = data.frame(x = my_dimensions, y = my_measures, f = my_facet)
ognd_boxplot(measure = y, dimension = x, dataframe = my_dataframe, title = "With dataframe", x_label = "Letters", 
    y_label = "Values", facet_formula = ~f) 
