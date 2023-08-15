## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)

## ----load and show data-------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
data(WasteWater_data, package = "Covid19Wastewater")
data(Pop_data, package = "Covid19Wastewater")

WasteWater_data%>%
  left_join(Pop_data)%>%
  buildWasteAnalysisDF()%>%
  head()%>%
  knitr::kable()

## ----explain all / most relavent functions------------------------------------


data(Case_data, package = "Covid19Wastewater")
data("Pop_data", package = "Covid19Wastewater")#need to fix Pop_data

case_df <- left_join(Case_data, Pop_data)%>%
  rename(population_served = pop)%>%
  buildCaseAnalysisDF()%>%
  head()#



case_df%>%
  select(site:regions)%>%
  knitr::kable()
  
case_df%>%
  select(county:FirstConfirmed.Per100K)%>%
  knitr::kable()

case_df%>%
  select(pastwk.sum.casesperday.Per100K:pastwk.avg.casesperday.Per100K)%>%
  knitr::kable()
  

## ----explain / show use case and link to other vignettes----------------------
#TODO work on comparing the output of these methods 

