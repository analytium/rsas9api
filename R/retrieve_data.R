#' @title retrieve_data
#'
#' @description Retrieves data from the dataset by a dataset name and a library name.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Workspace server name. Either server name or server url with server port should be provided.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param datasetName Dataset name.
#' @param limit Number of records to retrieve (default is 100, maximum value is 10000).
#' @param offset Dataset record offset (default is 0).
#' @param filter Dataset filter in JSON format.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export retrieve_data
retrieve_data <- function(url, repositoryName = "Foundation",
                          serverName=NULL, serverUrl=NULL, serverPort=NULL,
                          libraryName, datasetName,
                          limit = 100, offset = 0, filter = NULL,
                          asDataFrame = FALSE){
    serverAddress = NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("sas/servers/%s/libraries/%s/datasets/%s/data",
                            serverName, libraryName, datasetName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- sprintf("sas/libraries/%s/datasets/%s/data",
                            libraryName, datasetName)
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        stop("Either serverName OR serverUrl with serverPort should be defined")
    }
    parameters <- c(serverAddress, list(repositoryName = repositoryName,
                                        limit = limit,
                                        offset = offset,
                                        filter = filter))
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
