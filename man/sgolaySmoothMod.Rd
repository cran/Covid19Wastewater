% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/library--data_prep--smooth_tools--ts_trend_gen.R
\name{sgolaySmoothMod}
\alias{sgolaySmoothMod}
\title{sgolaySmoothMod
Add a column of the smoothed values using sgolayfilt}
\usage{
sgolaySmoothMod(DF, InVar, OutVar, poly = 5, n = "guess", Filter = NULL)
}
\arguments{
\item{DF}{dataframe containing the columns specified below}

\item{InVar}{The column to be smoothed}

\item{OutVar}{The name of the new column}

\item{poly}{The degree of the polynomial fit}

\item{n}{The number of points per polynomial fed into sgolayfilt. 
if it equals "guess" then it is found using parameterGuess}

\item{Filter}{Prefilter using the value of a Filter col}
}
\value{
DF with an extra col with a sgolayfilt smoothed version of InVar
}
\description{
sgolaySmoothMod
Add a column of the smoothed values using sgolayfilt
}
\examples{
data(Example_data, package = "Covid19Wastewater")
Example_data <- Example_data[Example_data$site == "Green Bay",]
Covid19Wastewater::sgolaySmoothMod(WasteWater_data,"N1","sgolayN1")
}
