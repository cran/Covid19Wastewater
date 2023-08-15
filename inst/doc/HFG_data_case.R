## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, Warning = FALSE, message = FALSE, echo = FALSE)

## ----load and show data-------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data(HFGCase_data, package = "Covid19Wastewater")

## ----catagorical variables, warning = FALSE-----------------------------------

HFGCase_data%>%
  filter(!is.na(ReportedCases))%>%
  ggplot(aes(x = date), size = .2)+
  geom_point(aes(y = ReportedCases, color = "Reported"))+
  geom_point(aes(y = EpisodeCases, color = "Episode"))+
  geom_point(aes(y = CollectedCases, color = "Collected"))+
  geom_point(aes(y = ConfirmedCases, color = "Confirmed"))+
  scale_y_log10()+
  facet_wrap(~site, scales = "free_y")+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Number of Cases Reported", color = "Case Collection method", title = "Diffrent High Frequency Cases", x = "Date")

## ----explain / show use case and link to other vignettes----------------------
head(HFGCase_data)%>%
  head()%>%
  knitr::kable()


