## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)
library(Covid19Wastewater)
library(dplyr)
library(RcppRoll)

## ----load and show data-------------------------------------------------------
data(Case_data, package = "Covid19Wastewater")
totalcases <- Case_data %>% 
  group_by(date) %>% 
  summarise(sum_case = sum(conf_case)) %>% 
  mutate(conf_case = roll_sum(sum_case,10,align = "right", fill = NA))

data(WasteWater_data, package = "Covid19Wastewater")

data(Covariants_data, package = "Covid19Wastewater")

data(Pop_data, package = "Covid19Wastewater")


WasteWater_data <- WasteWater_data%>%
  left_join(Pop_data)

data(Example_data, package = "Covid19Wastewater")

## ----finding offset-----------------------------------------------------------
offsetDF <- OffsetDFMaker(10, as.Date("2020-08-01"), as.Date("2023-01-01"), Case_data, WasteWater_data)

OffsetDF_Plot(offsetDF, "All Wisconsin data over all time")

## ----heatmap correlation finding offset---------------------------------------
heatmapcorfunc(Example_data)
heatmapcorfunc(Example_data, 10)

## ----using offset-------------------------------------------------------------
covarstarts <- c(as.Date("2020-08-17"),
                 as.Date("2021-03-29"),
                 as.Date("2021-07-05"),
                 as.Date("2021-12-20"),
                 as.Date("2022-03-28"),
                 as.Date("2022-05-23"),
                 as.Date("2022-07-04"))

covarends <- c(as.Date("2021-01-18"),
               as.Date("2021-05-24"),
               as.Date("2021-12-06"),
               as.Date("2022-03-14"),
               as.Date("2022-05-09"),
               as.Date("2022-06-06"),
               as.Date("2022-11-07"))

covarnames <- c("Robin1",
                "Alpha.V1",
                "Delta",
                "Omicron.21K",
                "Omicron.21L",
                "Omicron.22C",
                "Omicron.22B")


OffsetHeatmap("kendall_offset", 0, WasteWater_data, Case_data, Pop_data,
              covarstarts, covarends, covarnames, "region", TRUE, TRUE)



## ----explain / show use case and link to other vignettes----------------------
  
 


