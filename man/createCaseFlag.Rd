% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/library--analysis_tools--DHS_methods--flag_functions.R
\name{createCaseFlag}
\alias{createCaseFlag}
\title{Create Case flags}
\usage{
createCaseFlag(DF)
}
\arguments{
\item{DF}{Input data frame}
}
\value{
data frame with columns:
site: Location of flag
date: date of flag
case_flag: when the 7 day slope is above 5
case_flag_plus_comm.threshold: when case flag and more then 200 cases
slope_switch_flag: the first case flags in consecutive case flags
}
\description{
Create case flags created by the DHS to warn of increasing cases
}
\examples{
data(Example_data, package = "Covid19Wastewater")
data(Pop_data, package = "Covid19Wastewater")
Example_data <- Example_data[Example_data$site == 'Janesville',]
createCaseFlag(dplyr::left_join(Example_data, Pop_data))
}
