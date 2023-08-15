## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, Warning = FALSE, message = FALSE)

## ----load packages------------------------------------------------------------
library(Covid19Wastewater)
library(data.table)
library(dplyr)
library(ggplot2)
library(tidyr)
data(Covariants_data, package = "Covid19Wastewater")

Covariants_data$category <- row.names(Covariants_data)
onlycovar <- Covariants_data[-c(1,2)]
mdfr <- pivot_longer(onlycovar, cols = -category, names_to = 'variable', values_to = 'value')
#melt(onlycovar, id.vars = "category")


## ----Variant data head--------------------------------------------------------
Covariants_data%>%
  select(week:X20J..Gamma..V3.)%>%
  head()%>%
  knitr::kable()

## ----Variant data percentages-------------------------------------------------
percentages <- mdfr %>%
  group_by(category) %>%
  mutate(sum = sum(value), percent = value/sum, majority = case_when(percent > .5 ~ paste(variable)))

per <- percentages %>% 
  drop_na(majority)

dates <- Covariants_data[c("week","category")]

perDates <- merge(per,dates,by="category")

## ----Variant data graph, fig.height = 6---------------------------------------
VariantPercentage <- mdfr%>%
  
    ggplot(aes(factor(category, levels = c(1:69)), value, fill = variable)) +
    geom_bar(position = "fill", stat = "identity") +
    labs(x = "bi-weekly (2020-08-17 to 2022-12-05)",
         y = "Covariant Percent",
         title = "All variants by percentage of cases reported")+
    theme(legend.position="bottom",
          axis.text.x = element_text(angle = 90, hjust=1))


VariantPercentage

#Run this for interactive graph
#ggplotly(VariantPercentage)

## ----Variant data percentages graph-------------------------------------------
ggplot(perDates, aes(x=week, y=percent,fill=majority)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90, hjust=1)) +
    labs(x = "bi-weekly (2020-08-17 to 2022-12-05)",
         y = "Percent of total cases",
         title = "Variants over 50% of reported cases")


