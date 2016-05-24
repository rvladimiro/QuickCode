# Work in progress
rm(list = ls())
source('ggplot2-tests/theme.R')
library(ggplot2)

ognd_column_chart = function(measure, dimension, dataframe = NULL) {
    
    measure_name = deparse(substitute(measure), dataframe, parent.frame())
    dimension_name = deparse(substitute(dimension), dataframe, parent.frame())
    
    ggplot() +
        geom_bar(
            aes_string(
                x = dimension_name,
                y = measure_name,
                #color = dimension_name,
                fill = dimension_name
            ),
            data = dataframe,
            alpha = 0.5,
            stat = 'identity'
        ) +
        ggtitle('Barchart') +
        theme_ognd
}

# Set the seed
set.seed(1714)

# Test single vector
my_measures = abs(rnorm(1000)) + rep(c(1, 1.1, 1.2, 1.4, 1.8), 200)
my_dimensions = as.factor(rep(c('A', 'B', 'C', 'D', 'E'), 200))

ognd_column_chart(measure = my_measures, dimension = my_dimensions)