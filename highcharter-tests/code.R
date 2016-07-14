rm(list = ls())
require(highcharter)
data("citytemp")


hc <- highchart() %>% 
    hc_chart(type = "spline") %>%
    hc_xAxis(data = 1:12) %>% 
    hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
    hc_add_series(name = "London", data = citytemp$london) %>% 
    hc_add_series(name = "Other city",
                  data = (citytemp$tokyo + citytemp$london)/2)

hc
