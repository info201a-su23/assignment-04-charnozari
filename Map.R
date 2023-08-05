library("maps")
library("ggplot2")
library("dplyr")
library("sf")

# Load the shapefile for US states using the maps package
usa_states <- map("state", plot = FALSE, fill = TRUE) %>% 
  st_as_sf()

# Assuming 'mean_black_pop_by_state' is your dataset
# Convert the column name to uppercase to match the name in 'usa_states' (ID_1)
mean_black_pop_by_state <- mean_black_pop_by_state %>%
  rename(ID_1 = state) %>%
  filter(!is.na(black_prison_pop))  # Remove rows with NA values

# Merge the shapefile with your mean_black_pop_by_state data using left_join
map_data <- usa_states %>%
  left_join(mean_black_pop_by_state, by = "ID_1")

# Create the map using ggplot2 and geom_sf
ggplot() +
  geom_sf(data = map_data, aes(fill = black_prison_pop)) +
  scale_fill_gradient(name = "Mean Black Prison Pop") +
  labs(title = "Mean Black Prison Population by State") +
  theme_minimal()
