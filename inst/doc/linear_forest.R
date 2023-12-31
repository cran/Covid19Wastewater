## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----load and show data, include = FALSE--------------------------------------
library(Covid19Wastewater)
library(zoo)
library(dplyr)
library(randomForest)
data(WasteWater_data, package = "Covid19Wastewater")
data(Case_data, package = "Covid19Wastewater")
data(Pop_data, package = "Covid19Wastewater")
data(Aux_info_data)

base_df <- inner_join(Case_data, WasteWater_data, by = c("site", "date"))%>%
  left_join(Pop_data)%>%
  left_join(Aux_info_data)%>%
  group_by(site)%>%
  arrange(date)%>%
  mutate(conf_case = rollmean(conf_case, 7, align = "center", na.pad = TRUE))%>%
  ungroup()%>%
  select(conf_case, N1, N2,
         regions, date, pop,
         PMMoV, flow,
         conductivity, temperature, ph, tests)%>%
   mutate(regions = factor(regions), date = as.numeric(date),
         conf_case = log(conf_case),
         N1 = log(N1 + 1),
         N2 = log(N2 + 1),
         PMMoV = log(PMMoV + 1))
#conductivity, temperature, ph, tests

base_df%>%
  na.roughfix(base_df)%>%
  summarise(across(everything(), function(x) sum(is.na(x))))

model_data <- base_df%>%
   na.roughfix()%>%
   filter(if_all(everything(), is.finite))


## ----explain all / most relavent functions------------------------------------
form <- conf_case ~ N1 + N2 | . - N1 - N2

forest_model <- random_linear_forest(data = na.roughfix(model_data),
                                     num_tree = 20, 
                                     model_formula = form,
                                     max_depth = 3,
                                     verbose = FALSE)

forest_model

