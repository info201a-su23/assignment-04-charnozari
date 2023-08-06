dataset2 <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")
library(tidyverse)
library(sf)
library(tigris)
options(sf_use_implementation = FALSE)
wa_counties <- counties(state = "WA", cb = TRUE)
intermediate_data_path <- "C:/Users/charl/info201/assignment-04-charnozari/wa_counties.rds"
if (!file.exists(intermediate_data_path)) {
  wa_counties <- counties(state = "WA", cb = TRUE)
  saveRDS(wa_counties, intermediate_data_path)
} else {
  wa_counties <- readRDS(intermediate_data_path)
}
avg_black_prison_rate_counties <- dataset2 %>%
  group_by(county_name) %>%
  summarize(avg_black_prison_pop_rate_counties = mean(black_prison_pop_rate, na.rm = TRUE))
avg_black_prison_rate_counties <- rename(avg_black_prison_rate_counties, NAMELSAD = county_name)
wa_counties_avg <- left_join(wa_counties, avg_black_prison_rate_counties, by = "NAMELSAD")
ggplot() +
  geom_sf(data = wa_counties_avg, aes(fill = avg_black_prison_pop_rate_counties)) +
  scale_fill_viridis_c(name = "Avg Black Prison Pop Rate") +
  labs(title = "Average Black Prison Population Rate by County in WA") +
  theme_minimal()
