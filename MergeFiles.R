library(tidyverse)
youth_not_in_education_employment_training <- read.csv("/Users/anna/Downloads/data sets/youth-not-in-education-employment-training.csv")
ExtraFile <- read.csv("/Users/anna/Downloads/data sets/extra_population_devstatus.csv")
head(ExtraFile)

merged_data <- youth_not_in_education_employment_training %>%
  left_join(ExtraFile %>% select(Entity, Code, Year, pop_15_24), 
            by = c("Entity", "Code", "Year"))

#Load continents CSV  
continents <- read.csv("~/Desktop/Uni/Intro to Data Science/Group project/data sets/continents-according-to-our-world-in-data.csv") 
head(continents)  

#Add continent information  
merged_data <- youth_not_in_education_employment_training %>%  
  left_join(  
    continents %>% select(Code, Continent),   # join by country Code  
    by = "Code"  
  )  

head(merged_data)

write.csv(
  merged_data,
  file = "/Users/anna/Downloads/data sets/Youth_neet_final.csv", 
  row.names = FALSE 
)
