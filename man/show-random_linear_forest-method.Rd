% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/library--analysis_tools--lm_rand_forest--use.R
\name{show,random_linear_forest-method}
\alias{show,random_linear_forest-method}
\title{display form for random_linear_forest class}
\usage{
\S4method{show}{random_linear_forest}(object)
}
\arguments{
\item{object}{object with class random_linear_forest}
}
\value{
Prints to output a summary of the model
}
\description{
display form for random_linear_forest class
}
\examples{
data(Example_data, package = "Covid19Wastewater")
random_linear_forest(Example_data, 2, PMMoV ~ N1 + N2 | pcr_type)
}
