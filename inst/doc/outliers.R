## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, Warning = FALSE, message = FALSE)



## ----load and show data-------------------------------------------------------
library(Covid19Wastewater)
library(dplyr)
library(ggplot2)

data("example_data", package = "Covid19Wastewater")

smoothing_df <- Example_data%>%
  select(site, date, N1, N2)%>%
  filter(N1 != 0, N2 != 0)%>%
  mutate(N1 = log(N1), N2 = log(N2), N12_avg = (N1 + N2) / 2)

base_plot <- smoothing_df%>%
  ggplot(aes(x = date))+
  geom_point(aes(y = N12_avg))+
  facet_wrap(~site)+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date"
       )

base_plot



## ----adjacent outlier---------------------------------------------------------
df_data <- computeJumps(smoothing_df)
ranked_data <- rankJumps(df_data)
classied_data <- flagOutliers(ranked_data, 9, MessureRank)%>%
  select(site, date, N12_avg, MessureRank, FlaggedOutlier)

classied_data%>%
  ggplot(aes(x = date))+
  geom_point(aes(y = N12_avg, color = FlaggedOutlier))+
  facet_wrap(~site)+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       color = "Flagged Outlier"
       )
#result_df <- removeOutliers(classied_data, Messure = N12_avg)

## ----Trend outlier------------------------------------------------------------
df_data <- loessSmoothMod(smoothing_df, "N12_avg", "N12_avg_loess", Filter = NULL)
classied_data_trend <- df_data%>%
  group_by(site)%>%
  Flag_From_Trend( N12_avg, N12_avg_loess)%>%
  select(site, date, N12_avg, flagged_outlier)

classied_data_trend%>%
  ggplot(aes(x = date))+
  geom_point(aes(y = N12_avg, color = flagged_outlier))+
  facet_wrap(~site)+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       color = "Flagged Outlier"
       )

## ----compare outlier methods--------------------------------------------------
library(dplyr)
full_df <- full_join(classied_data, classied_data_trend)
full_df%>%
  ggplot(aes(x = date))+
  geom_point(aes(y = N12_avg, color = flagged_outlier, fill = FlaggedOutlier), 
             shape = 21, size = 1.5, alpha = .5, stroke = 1.5)+
  facet_wrap(~site)+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(y = "Covid-19 Gene Concentration",
       x = "Date",
       color = "Flagged Outlier"
       )

