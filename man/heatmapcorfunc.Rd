% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/library--analysis_tools--time_offset--Offset_Analysis_Plot.R
\name{heatmapcorfunc}
\alias{heatmapcorfunc}
\title{Outputs a heatmap where the color is the r squared of wastewater data and center day + x many future days and y many past days
Helps inform Offset Analysis}
\usage{
heatmapcorfunc(cordata, length = 14, case_column = conf_case)
}
\arguments{
\item{cordata}{DF with geo_mean and conf_case columns}

\item{length}{the length of the time window for the results / 2}

\item{case_column}{name of case column}
}
\value{
ggplot plot object (heatmap)
}
\description{
Outputs a heatmap where the color is the r squared of wastewater data and center day + x many future days and y many past days
Helps inform Offset Analysis
}
\examples{
 data(Example_data, package = "Covid19Wastewater")
 heatmapcorfunc(Example_data)
}
