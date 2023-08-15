## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, Warning = FALSE, message = FALSE)

## ----load data----------------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data("Example_data", package = "Covid19Wastewater")

smoothing_df <- Example_data%>%
  select(site, date, N1, N2)%>%
  filter(N1 != 0, N2 != 0)%>%
  mutate(N1 = log(N1), N2 = log(N2))

base_plot <- smoothing_df%>%
  ggplot(aes(x = date))+
  geom_point(aes(y = N1))+
  facet_wrap(~site)+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date")

base_plot

## ----sgolaySmoothMod----------------------------------------------------------
# Example code demonstrating sgolaySmoothMod() function
sgolay_smooth <- sgolaySmoothMod(smoothing_df, "N1", "N1_sgolay", poly=5,n="guess", Filter = NULL)

sgolay_plot <- base_plot + 
  geom_line(aes(y = N1_sgolay, color = "Default Savitzky-Golay Filter"), data = sgolay_smooth, linewidth = 1.25)

param_sgolay_smooth <- Covid19Wastewater::sgolaySmoothMod(sgolay_smooth, "N1", "N1_sgolay_2", poly=2, n = "guess", Filter = NULL)

alt_plot <- sgolay_plot + 
  geom_line(aes(y = N1_sgolay_2, color = "Polynomial 1"), data = param_sgolay_smooth, linewidth = 1.25)


param_sgolay_smooth_2 <- Covid19Wastewater::sgolaySmoothMod(sgolay_smooth, "N1", "N1_sgolay_3", poly = 5, n = 31, Filter = NULL)


show_plot <- alt_plot + 
  geom_line(aes(y = N1_sgolay_3, color = "N 31"), data = param_sgolay_smooth_2, linewidth = 1.25)

show_plot+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       title = "Savitzky-Golay Smoothing With Diffrent Parameters",
       color = "Smoothing Parameter"
       )

## ----loessSmoothMod-----------------------------------------------------------
# Example code demonstrating loessSmoothMod() function
#sgolay_smooth <- mutate(sgolay_smooth, N1 = exp(N1))
loess_smooth <- loessSmoothMod(DF = sgolay_smooth,
                               InVar = "N1",
                               OutVar ="N1_loess",
                               Span = "guess",
                               Filter = NULL)

all_smooth_plot <- sgolay_plot + geom_line(aes(y = N1_loess, color = "Default Loess"), data = loess_smooth, size = 1.25)

loess_plot <- base_plot + geom_line(aes(y = N1_loess, color = "Default Loess"), data = loess_smooth, size = 1.25)

param_loess_smooth <- loessSmoothMod(loess_smooth, "N1", "N1_loess_2", Span = .1, Filter = NULL)

alt_plot <- loess_plot + geom_line(aes(y = N1_loess_2, color = "Span .1 Loess"), data = param_loess_smooth, size = 1.25)


param_loess_smooth_2 <- loessSmoothMod(loess_smooth, "N1", "N1_loess_3", Span= .2, Filter = NULL)


show_plot <- alt_plot + geom_line(aes(y = N1_loess_3, color = "Span .2 Loess"), data = param_loess_smooth_2, size = 1.25)

show_plot+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       title = "Loess Smoothing With Diffrent Parameters",
       color = "Smoothing Parameter"
       )


## ----expsmoothMod, include = FALSE--------------------------------------------
# Example code demonstrating expSmoothMod() function
exp_smooth <- Covid19Wastewater::expSmoothMod(loess_smooth, "N1", "N1_exp", Filter = NULL)

all_smooth_plot <- all_smooth_plot + 
  geom_line(aes(y = N1_exp, color = "Default Exponential"), data = exp_smooth, size = 1.25)

exp_plot <- base_plot + 
  geom_line(aes(y = N1_exp, color = "Default Exponential"), data = exp_smooth, size = 1.25)

param_exp_smooth <- Covid19Wastewater::expSmoothMod(exp_smooth, "N1", "N1_exp_2", alpha = .3, Filter = NULL)

alt_plot <- exp_plot + geom_line(aes(y = N1_exp_2, color = "Alpha .3"), data = param_exp_smooth, size = 1.25)


param_exp_smooth_2 <- Covid19Wastewater::expSmoothMod(exp_smooth, "N1", "N1_exp_3", beta = .05, Filter = NULL)


show_plot <- alt_plot + geom_line(aes(y = N1_exp_3, color = "Beta .05"), data = param_exp_smooth_2, size = 1.25)

show_plot+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       title = "Exponential Smoothing With Diffrent Parameters",
       color = "Smoothing Parameter"
       )

## ----final compare------------------------------------------------------------
all_smooth_plot

