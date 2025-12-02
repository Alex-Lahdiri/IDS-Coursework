library(tidyverse)
youth_not_in_education_employment_training <- read.csv("/Users/anna/Downloads/data sets/youth-not-in-education-employment-training.csv")
ExtraFile <- read.csv("/Users/anna/Downloads/data sets/extra_population_devstatus.csv")
head(ExtraFile)

merged_data <- youth_not_in_education_employment_training %>%
  left_join(ExtraFile %>% select(Entity, Code, Year, pop_15_24), 
            by = c("Entity", "Code", "Year"))
head(merged_data)

write.csv(
  merged_data,
  file = "/Users/anna/Downloads/data sets/Youth_not_in_education_employment_training_with_continent_merged.csv", 
  row.names = FALSE 
)