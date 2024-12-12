if (!require("ggplot2")) install.packages("ggplot2", repos = "http://cran.us.r-project.org")

data <- read.csv("snowfall_data.csv")

data$date <- as.Date(data$date)

library(ggplot2)
p <- ggplot(data, aes(x = date, y = snowfall)) +
    geom_line(color = "blue") +
    labs(title = "Snowfall Trends",
        x = "Date",
        y = "Snowfall (cm)") +
    theme_minimal()

ggsave("snowfall_trends.png", plot = p)
