rm(list = ls())
source('ggplot2-tests/create_vars.R')
library(colorspace)
library(ggplot2)

# var_x = (var_x - min(var_x))
# var_x = var_x / max(var_x)
#
# color_var = colorRamp(c("red", "green"))(var_x)




ggplot() +
  geom_point(
    mapping = aes(x = x, y = y, color = 'foo'),
    data = df,
    color = diverge_hcl(length(var_x))[rank(var_x)],
    size = 3,
    show_guide = T
  ) + theme_bw()
