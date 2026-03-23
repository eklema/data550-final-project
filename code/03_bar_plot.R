here::i_am(
  path = "code/03_bar_plot.R"
)

# Load in clean data
clean_data <- readRDS(
  file = here::here("output/clean_data.rds")
)

library(tidyverse)


# Create plot
bar_plot <- clean_data |> 
  group_by(uprevis_cat) |> 
  summarise(
    ptb_rate = mean(ptb, na.rm = T)*100,
    .groups = 'drop'
  ) |> 
  filter(!is.na(uprevis_cat)) |> 
  ggplot(aes(x = uprevis_cat, y = ptb_rate, fill = uprevis_cat)) +
  geom_col() +
  labs(
    x = "Prenatal care visit attendance",
    y = "Preterm birth incidence (%)",
    title = "Incidence of Preterm Birth by Prenatal Care Visit Attendance"
  ) +
  ylim(0,20) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 14, margin = margin(t = 10)),
    axis.text.x = element_text(size = 11),
    axis.title.y = element_text(size = 14),
    axis.text.y = element_text(size = 12)
  )

bar_plot


# Save bar plot as png
ggsave(
  plot = bar_plot,
  filename = here::here("output/bar_plot.png"),
  device = "png",
  units = "in",
  width = 8,
  height = 6,
)



