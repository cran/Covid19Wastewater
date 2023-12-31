% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/library--data_prep--filter_tools--outlier_tools.R
\name{computeRankQuantiles}
\alias{computeRankQuantiles}
\title{computeRankQuantiles}
\usage{
computeRankQuantiles(df)
}
\arguments{
\item{df}{dataframe. needs Column n1.jumpFromLeft, n1.jumpFromRight, 
          n2.jumpFromLeft, n2.jumpFromRight, site
          
First 4 gen from computeJumps}
}
\value{
dataframe with 4 columns appended: ranks of each of the 4 jumps;
}
\description{
Convert jumps from last step into a ordering quintile
}
\examples{
data(Example_data, package = "Covid19Wastewater")
Example_data$site = "Madison"
df_data <- computeJumps(Example_data)
ranked_data <- rankJumps(df_data)
computeRankQuantiles(ranked_data)
}
