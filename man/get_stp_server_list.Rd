% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_stp_server_list.R
\name{get_stp_server_list}
\alias{get_stp_server_list}
\title{get_stp_server_list}
\usage{
get_stp_server_list(url, repositoryName = "Foundation",
  asDataFrame = FALSE)
}
\arguments{
\item{url}{URL of the server with installed SAS9API.}

\item{repositoryName}{Repository name.}

\item{asDataFrame}{logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.}
}
\description{
Gets the list of available Stored Process Servers and their connections from the metadata server.
}
