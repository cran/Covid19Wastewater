## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, Warning = FALSE, message = FALSE)

## ----load and show data, include = FALSE--------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data(Case_data, package = "Covid19Wastewater")

## ----explain most relavent columns, echo = FALSE------------------------------
main_plot <- Case_data%>%
  filter(site == "Madison")%>%
  ggplot(aes(x = date), size = .3)+
  geom_point(aes(y = tests + 1, color = "Tests"))+
  geom_point(aes(y = conf_case + 1, color = "Confirmed Cases"))+
  scale_y_log10()+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(y = "Tests / Cases", color = "", title = "Log number of Cases vs Tests", x = "Date")

main_plot


## ----link to other vignettes, echo = FALSE------------------------------------
Case_data%>%
  head()%>%
  knitr::kable()

