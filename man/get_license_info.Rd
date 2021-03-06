% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_license_info.R
\name{get_license_info}
\alias{get_license_info}
\title{get_license_info}
\usage{
get_license_info(url, asDataFrame = FALSE)
}
\arguments{
\item{url}{URL of the server with installed SAS9API.}

\item{asDataFrame}{logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.}
}
\description{
Gets the information about active SAS Proxy license.
}
