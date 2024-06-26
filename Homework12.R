install.packages("devtools")
library(devtools)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(patchwork)
library(cowplot)
library(colorspace)
library(wesanderson)
library(ggsci)
library(scales)

data("iris")
species_labels <- c("Setosa" = "Species: Setosa", "Versicolor" = "Species: Versicolor", "Virginica" = "Species: Virginica") 
p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + labs(title = "Sepal Length vs Sepal Width by Species")  
p_facet <- p + facet_wrap(~Species, labeller = labeller(Species = species_labels)) 
p_custom <- p_facet + geom_text(aes(x = 5, y = 4, label = "Custom Annotation"), color = "blue") + geom_segment(aes(x = 6, xend = 6, y = 2, yend = 4), color = "red", size = 1) + geom_curve(aes(x = 6, y = 2, xend = 5.5, yend = 1), color = "green", linewidth = 1, curvature = .2) + theme_minimal() 
p_custom_colors <- p_custom + scale_color_manual(values = c("#FF5733", "#33FF57", "#3357FF")) + theme(legend.position = "bottom") 

ggsave("scatter_plot_faceted.pdf", plot = p_facet, width = 10, height = 7, units = "in", dpi = 300) 
ggsave("customized_plot_with_annotations.jpg", plot = p_custom_colors, width = 10, height = 7, dpi = 300) ggsave("customized_plot_with_annotations.eps", plot = p_custom_colors, width = 10, height = 7) 