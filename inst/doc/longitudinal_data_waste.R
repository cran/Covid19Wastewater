## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, Warning = FALSE, message = FALSE)

## ----load and show data-------------------------------------------------------
#add start and end date?
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data(WasteWater_data, package = "Covid19Wastewater")

## ----explain most relavent columns, warning = FALSE---------------------------
#could put in the work to explain all 62 columns but it should be fine for now
WasteWater_data%>%
  filter(site == "Madison")%>%
  ggplot(aes(x = date), size = .3, alpha = .5)+
  geom_point(aes(y = N1, color = "N1"))+
  geom_point(aes(y = N2, color = "N2"))+
  scale_y_log10()+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(y = "Gene Concentration", color = "", title = "Log number of N1 and N2", x = "Date")

## ----explain show use case and link to other vignettes------------------------
Head_DF <- WasteWater_data%>%
  head()

Head_DF%>%
  select(sample_id:flow)%>%
  knitr::kable()

Head_DF%>%
  select(ph:n1_lod)%>%
  knitr::kable()

Head_DF%>%
  select(n1_loq:n2_loq)%>%
  knitr::kable()


