% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/library--analysis_tools--lm_rand_forest--info.R
\name{bagging}
\alias{bagging}
\title{Bootstrap aggregating of dataset
gen a list of dataframes using row resampling and column downsizing}
\usage{
bagging(data, num_bags, num_features = NULL, include_first = 0)
}
\arguments{
\item{data}{data.frame info}

\item{num_bags}{number of resamplings done}

\item{num_features}{number of columns in each output data.frame}

\item{include_first}{auto include the first n rows}
}
\value{
return list of 2 list of data.frame given different bagged data
}
\description{
Bootstrap aggregating of dataset
gen a list of dataframes using row resampling and column downsizing
}
\examples{
data(Example_data, package = "Covid19Wastewater")
head(bagging(Example_data, 10, 5, 2))
}
