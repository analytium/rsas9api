% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delete_object.R
\name{delete_object}
\alias{delete_object}
\title{delete_object}
\usage{
delete_object(url, repositoryName = "Foundation", sourceLocation,
  sourceName, publicType, asDataFrame = FALSE)
}
\arguments{
\item{url}{URL of the server with installed SAS9API.}

\item{repositoryName}{Repository name.}

\item{sourceLocation}{Object location.}

\item{sourceName}{Object name.}

\item{publicType}{Object public type.}

\item{asDataFrame}{logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.}
}
\description{
Deletes object by its name and location.
}
