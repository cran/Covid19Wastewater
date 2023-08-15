## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, Warning = FALSE, message = FALSE)

## ----load and show data-------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data(InterceptorCase_data, package = "Covid19Wastewater")
head(InterceptorCase_data)%>%
  head()%>%
  knitr::kable()

## ----explain all / most relavent columns--------------------------------------


## ----explain / show use case and link to other vignettes----------------------

