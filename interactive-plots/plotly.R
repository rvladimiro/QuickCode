# Clean it up ------------------------------------------------------------------

rm(list = ls())
require(plotly)

# Create the dataset -----------------------------------------------------------

# Fake monetisation vars
fmv <- data.frame(
    date = as.Date("2016-01-01") + 0:30,
    ARPDAU = rnorm(n = 31, mean = 0.5, sd = 0.01),
    ARPPU = rnorm(n = 31, mean = 6, sd = 1.5),
    cRate = rnorm(n = 31, mean = 0.01, sd = 0.0025)
)

# Show some lines --------------------------------------------------------------

subplot(
    plot_ly(fmv, type = "line", x = date, y = ARPDAU, name = "ARPDAU"),
    plot_ly(fmv, type = "line", x = date, y = ARPPU, name = "ARPPU"),
    plot_ly(fmv, type = "line", x = date, y = cRate, name = "Conversion Rate"),
    margin = 0.05
) %>% layout(showlegend = F)

# What about that ggplot to plotly thingy?

p <- ggplot(aes(x = date, y = ARPDAU), data = fmv) +
    geom_line()

ggplotly(p)
