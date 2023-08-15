## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(Warning = FALSE, message = FALSE, echo = FALSE)

## ----load packages------------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)
library(tidyr)

## ----Example Data head--------------------------------------------------------
data(Aux_info_data, package = "Covid19Wastewater")
Aux_info_data%>%
  select(sample_id:bcov_rec_rate)%>%
  head()%>%
  knitr::kable()


Aux_info_data%>%
  select(sample_type:n2_num_ntc_amplify)%>%
  head()%>%
  knitr::kable()

Aux_info_data%>%
  select(avg_sars_cov2_conc:analytical_comments)%>%
  head()%>%
  knitr::kable()

Aux_info_data%>%
  select(inhibition_detect:equiv_sewage_amt)%>%
  head()%>%
  knitr::kable()

## ----all tables and Na%-------------------------------------------------------
Aux_info_data%>%
  summarise(across(everything(), ~100 * mean(is.na(.x))))%>%
  pivot_longer(everything(), names_to = "column name", values_to = "na %")%>%
  knitr::kable()

