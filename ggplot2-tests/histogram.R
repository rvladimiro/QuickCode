# Work in progress
rm(list = ls())
# source('ggplot2-tests/theme.R')
source("ggplot2-tests/format_plot.R")
library(ggplot2)

ognd_hist = function(variable, dataframe = NULL, title = NULL, x_label = NULL) {
    
    # Get the values of the variable and compute the bin width
    variable_values = eval(substitute(variable), dataframe, parent.frame())
    distribution_range = range(variable_values)
    bin_width = ((max(distribution_range) - min(distribution_range)))/30
    
    # Get the variable name
    variable_name = deparse(substitute(variable))
    
    # Plot the histogram
    plot = ggplot() + geom_histogram(aes_string(x = variable_name), data = dataframe, fill = "dark blue", alpha = 0.5, 
        binwidth = bin_width)
    
    # Return the formated plot
    return(format_plot(plot, title, x_label, y_label = "Count"))
}

# Test
set.seed(1713)
# Simple Vector
ognd_hist(variable = rnorm(n = 1000), title = "Simple Histogram", x_label = "My Variable")
# Vector within data.frame
my_hist_df = data.frame(my_var = rnorm(n = 1000))
ognd_hist(variable = my_var, dataframe = my_hist_df) 
