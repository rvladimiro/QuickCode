# Work in progress
rm(list = ls())
#source('ggplot2-tests/theme.R')
source('ggplot2-tests/format_plot.R')
library(ggplot2)

ognd_density_plot = function(measure, dimension = NULL, dataframe = NULL, title = NULL, x_label = NULL) {
    
    measure_name = deparse(substitute(measure))
    dimension_name = deparse(substitute(dimension))
    
    #if(dimension_name == 'NULL') dimension_name = 'dark blue'
    
    plot = ggplot() +
        geom_density(
            
            aes_string(
                
                x = measure_name,
                color = dimension_name,
                fill = dimension_name
                
            ),
            alpha = 0.15,
            data = dataframe
        )
    
    return(format_plot(plot, title, x_label, y_label = 'Density'))
}

# Set the seed
set.seed(1757)
# Test single vector
my_measures = rnorm(1000) + rep(c(0, 1.25, 1.5, 1.75, 5), 200)
my_dimensions = as.factor(rep(c('A', 'B', 'C', 'D', 'E'), 200))
ognd_density_plot(
    measure = my_measures,
    dimension = NULL, #my_dimensions,
    title = 'No dataframe\nbut with dimensions'
)
# Test dataframe
my_dataframe = data.frame(y = my_measures, x = my_dimensions)
ognd_density_plot(
    measure = y, 
    dimension = x, 
    dataframe = my_dataframe, 
    title = 'I haz df...\n...n dimz',
    x_label = 'My varz')