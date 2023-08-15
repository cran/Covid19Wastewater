## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)

## ----load and show data-------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data(HFGWaste_data, package = "Covid19Wastewater")

## ----catagorical variables----------------------------------------------------
#fix titles
#fix overploting points and axis
#drop well category in plot
HFGWaste_data%>%
  ggplot(aes(x = date, y = N1, color = as.factor(Filter)), size = .5)+
  geom_point(alpha = .5)+
  scale_y_log10()+
  facet_wrap(~site, scales = "free_y")+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 60, vjust = 0.5, hjust=1))+
  labs( color = "Filter", x = "Date", y = "Gene Concentration", title = "Log number of N1 and N2")

## ----explain / show use case and link to other vignettes----------------------
#change to table form
#over explain is better then under explain
#have explanation as an appendix



HFGWaste_data%>%
  head()%>%
  knitr::kable()

