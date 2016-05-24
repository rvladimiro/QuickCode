# Work in progress
rm(list = ls())
#source('ggplot2-tests/theme.R')
source('ggplot2-tests/format_plot.R')
library(ggplot2)


ognd_scatterplot = function(x, y, dataframe = NULL,          # Data
                            color = NULL, alpha = 0.66, # Aesthetics
                            title = NULL,                    # Title
                            x_label = NULL, y_label = NULL   # Labels
                            ) {
    
    # Get var names
    x_name = deparse(substitute(x))
    y_name = deparse(substitute(y))
    color_values = eval(substitute(color), dataframe, parent.frame())
    
    # No color plot
    if(is.null(color_values)) {
        plot = ggplot() +
            geom_point(
                aes_string(x = x_name, y = y_name),
                color = 'blue',
                alpha = alpha,
                size = 5,
                data = dataframe
            )
    # Color plot
    } else {
        color_name = deparse(substitute(color))
        plot = ggplot() +
            geom_point(
                aes_string(x = x_name, y = y_name, color = color_name),
                alpha = alpha,
                size = 5,
                data = dataframe
            )
        
        if(is.numeric(color_values)){
            plot = plot + scale_colour_gradient(low = 'green', high = 'red')
        } else {
            plot = plot + scale_colour_brewer(palette = 'Set1')
        }
        
    }
    
    return(format_plot(plot, title, x_label, y_label))
    
}

# Set some seed
set.seed(0027)
# Create variables
source('ggplot2-tests/create_vars.R')

# No data.frame no colors
ognd_scatterplot(x = var_x, y = var_y, title = 'No df no color')
# No data.frame with discrete colors
ognd_scatterplot(x = var_x, y = var_y, color = var_z, title = 'No df with discrete colors')
# data.frame no colors
ognd_scatterplot(x = x, y = y, dataframe = df, title = 'df no color')
# Test vectors with color in dataframe
ognd_scatterplot(x = x, y = y, dataframe = df, color = x, title = 'df with continuous colors')