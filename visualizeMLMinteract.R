# Packages you need for this figure (use sjPlot as base; modify with ggplot2)
library(ggplot2); library (sjPlot)

# Plot your estimated model object...
sjPlot::plot_model(
  
  # ...from lmer (or "full_model" from an afex model, shown below)
  mod01$full_model, 
  
  # Use estimated marginal means
  type = "emm", 
  
  # Specify interaction terms
  terms = c("RTlog_cwc", "sim"), 
  
  # Specify transparency of confidence intervals (you can also do it below)
  alpha = .4) +
  
  # Name x-axis and y-axis
  scale_x_continuous(name = expression(paste('RT (log-transformed)')),
                     limits = c(-2, 2), expand = c(0, 0)) +
  scale_y_continuous(name = "Self-Other Discrepancy", 
                     limits = c(0, 3), expand = c(0, 0)) +
  
  # Use classic theme
  theme_classic() + 
  
  # Specify legend position; remove plot title (you can keep it if you like)
  theme(legend.position = "bottom", plot.title = element_blank()) +
  
  # (Optional: Add reference line at x = 0)
  geom_vline(xintercept = 0, linetype = "dotted") +
  
  # (Optional: Manually specify colors of the confidence intervals)
  # The hex codes are from RColorBrewer and are colorblind friendly
  scale_color_manual(name = "Target Similarity",
                     values = c("Similar" = "#BD0026", "Dissimilar" = "#FD8D3C"),
                     guide = guide_legend(
                       override.aes = list(fill = c("#BD0026", "#FD8D3C")))) +
  
  # (Optional: Manually specify colors of the trend lines)
  scale_fill_manual(name = "Target Similarity",
                    values = c("Similar" = "#BD0026", "Dissimilar" = "#FD8D3C"))