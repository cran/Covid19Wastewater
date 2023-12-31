% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/library--analysis_tools--lm_rand_forest--use.R
\name{predict,random_linear_forest-method}
\alias{predict,random_linear_forest-method}
\title{predict new data from random_linear_forest models}
\usage{
\S4method{predict}{random_linear_forest}(object, new_data, ...)
}
\arguments{
\item{object}{random_linear_forest being used}

\item{new_data}{data.frame.}

\item{...}{extra parameters ignored}
}
\value{
vector of predictions for each row
}
\description{
predict new data from random_linear_forest models
}
\examples{
data(Example_data, package = "Covid19Wastewater")
model <- random_linear_forest(Example_data, 2, PMMoV ~ N1 + N2 | pcr_type)
predict(model, Example_data)
}
