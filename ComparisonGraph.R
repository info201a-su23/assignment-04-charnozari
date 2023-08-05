library(ggplot2)
library(dplyr)
dataset1 <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
dataset1$year <- as.numeric(dataset1$year)
aggregated_blackmale_pop <- aggregate(black_male_prison_pop ~ year, data = dataset1, FUN = mean)
aggregated_blackmale_pop <- dataset1 %>%
  group_by(year) %>%
  summarize(black_male_prison_pop = mean(black_male_prison_pop, na.rm = T))
aggregated_blackfemale_pop <- aggregate(black_female_prison_pop ~ year, data = dataset1, FUN = mean)
aggregated_blackfemale_pop <- dataset1 %>%
  group_by(year) %>%
  summarize(black_female_prison_pop = mean(black_female_prison_pop, na.rm = T))
comparison_plot <- ggplot() +
  geom_line(data = aggregated_blackmale_pop, aes(x = year, y = black_male_prison_pop), color = "red") +
  geom_line(data = aggregated_blackfemale_pop, aes(x = year, y = black_female_prison_pop), color = "blue") +
  labs(title = "Prison Population Trends by Gender",
       x = "Year",
       y = "Population") +
  scale_color_manual(name = "Gender",
                     values = c("Black Male" = "red", "Black Female" = "blue"),
                     labels = c("Black Male", "Black Female"))
comparison_plot + theme_minimal()



