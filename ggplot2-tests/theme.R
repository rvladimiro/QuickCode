theme_ognd =
    theme_bw(base_size = 10) +
    theme(
        axis.line = element_line(colour = "black"),
        #panel.grid.major = element_blank(),
        #panel.grid.minor = element_blank(),
        legend.position = 'bottom',
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = 
            element_text(hjust = 1, family = 'Trebuchet MS', face = 'bold', size = 16)
    )