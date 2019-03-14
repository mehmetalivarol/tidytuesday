library(tidyverse)
library(ggwordcloud)

proj_set("C:/Users/mali/Documents/R/tidytuesday")

board_games <-
  readr::read_csv(
    "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-12/board_games.csv"
  )

wc <- board_games %>%
  group_by(name) %>%
  summarise(UsrRating = sum(users_rated)) %>%
  filter(UsrRating > 10000)

wc %>%
  ggplot(aes(
    label = name,
    size = UsrRating,
    color = UsrRating
  )) + geom_text_wordcloud() + scale_color_gradient(low = "#FF6347", high = "#40E0D0") +
  theme_light()


