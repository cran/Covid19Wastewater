## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)

## ----load packages------------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

## ----Example Data head--------------------------------------------------------
data(Example_data, package = "Covid19Wastewater")
head(Example_data)%>%
  head()%>%
  knitr::kable()

## ----plotting example data----------------------------------------------------
ggplot(Example_data, aes(x=date, y=geo_mean, color = site)) +
  geom_point()

