library(ggplot2)
library(dplyr)
dataset1 <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
dataset1$year <- as.numeric(dataset1$year)
aggregated_blackmale_pop <- aggregate(black_male_prison_pop ~ year, data = dataset1, FUN = mean)
aggregated_blackmale_pop <- dataset1 %>%
  group_by(year) %>%
  summarize(black_male_prison_pop = mean(black_male_prison_pop, na.rm = T))
aggregated_whitemale_pop <- aggregate(white_male_prison_pop ~ year, data = dataset1, FUN = mean)
aggregated_whitemale_pop <- dataset1 %>%
  group_by(year) %>%
  summarize(white_male_prison_pop = mean(white_male_prison_pop, na.rm = T))
comparison_plot <- ggplot() +
  geom_line(data = aggregated_blackmale_pop, aes(x = year, y = black_male_prison_pop), color = "red") +
  geom_line(data = aggregated_whitemale_pop, aes(x = year, y = white_male_prison_pop), color = "blue") +
  labs(title = "Average Prison Population in White and Black men over time",
       x = "Year",
       y = "Population") +
  scale_color_manual(name = "Race",
                     values = c("Black Male" = "red", "White Male" = "blue"),
                     labels = c("Black Male", "White Male"))
comparison_plot + theme_minimal()



