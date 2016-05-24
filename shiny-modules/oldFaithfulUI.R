# Use the id to modularise the function
# Then use NS(id) to create a unique version of inputs and outputs
# This is only useful if we want to create modular code
# It doesn't have to be used if the objective is to keep more source code files
# with less code each

ofSliderInput <- function(id) {
    ns <- NS(id)
    tagList(
        sliderInput(ns("bins"),
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
    )
}

ofPlot <- function(id) {
    ns <- NS(id)
    tagList(
        plotOutput(ns("distPlot"))
    )
}
