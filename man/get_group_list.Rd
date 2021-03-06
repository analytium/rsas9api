% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_group_list.R
\name{get_group_list}
\alias{get_group_list}
\title{get_group_list}
\usage{
get_group_list(url, repositoryName = "Foundation", asDataFrame = FALSE)
}
\arguments{
\item{url}{URL of the server with installed SAS9API.}

\item{repositoryName}{Repository name.}

\item{asDataFrame}{logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.}
}
\description{
Gets the list of groups and their associated groups and users.
}
