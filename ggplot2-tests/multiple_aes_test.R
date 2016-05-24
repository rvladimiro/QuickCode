rm(list = ls())

maes_scatter = function(x, y, color = NULL, data = NULL) {
    x_name = deparse(substitute(x))
    y_name = deparse(substitute(y))
    color_name = deparse(substitute(color))
    print(color_name)
    cat("\n")
    
    plot_object = ggplot()
    
    aes_object = aes_string(x = x_name, y = y_name)
    if (color_name != "NULL") 
        aes_object = aes_object + aes_string(color = color_name)
    print(aes_object)
    cat("\n")
    
    geom_object = geom_point(aes_string(x = x_name, y = y_name), data)
    print(geom_object)
    cat("\n")
    
    plot_object + geom_point(aes_string(x = x_name, y = y_name), data)
}

# Set the seed
set.seed(2100)
# Create the vars
source("ggplot2-tests/create_vars.R")

# Plot no dataframe
maes_scatter(x = var_x, y = var_y)

# Plot no dataframe with factor colors
maes_scatter(x = var_x, y = var_y, color = var_z)

# Plot with dataframe
maes_scatter(x = x, y = y, data = df) 
