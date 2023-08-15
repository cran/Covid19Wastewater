## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)

## ----load packages------------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)

## ----Population data head-----------------------------------------------------
data(Pop_data, package = "Covid19Wastewater")
Pop_data %>%
  head()%>%
  knitr::kable()

## ----Splitting population data by size----------------------------------------
population_split_by_size <- Pop_data %>% mutate(popgroup = case_when(pop >= 100000 ~ "Large",
                                                         pop >= 10000  ~ "Medium",
                                                         .default = "Small"))
population_split_by_size %>%
  head()%>%
  knitr::kable()

## ----Grouping data by city----------------------------------------------------
Madison_data <- Pop_data %>% filter(grepl("Madison|MMSD", site))
Madison_data %>%
  head()%>%
  knitr::kable()

