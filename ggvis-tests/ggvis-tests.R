require(dplyr)
require(ggvis)

mtcars %>%
    ggvis(~wt, ~mpg, size = ~cyl, fill = ~cyl) %>%
    layer_points() %>%
    add_legend(c('size', 'fill')) %>%
    add_tooltip(function(df) df$mpg)
    
