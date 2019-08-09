#' @title delete_dataset
#'
#' @description Deletes dataset from defined library.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Server name. Either server name or server url with server port should be provided.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param datasetName Dataset name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr DELETE
#'
#' @export delete_dataset
delete_dataset <- function(url=NULL, repositoryName = "Foundation",
                           serverName=NULL, serverUrl=NULL, serverPort=NULL,
                           libraryName=NULL, datasetName=NULL, asDataFrame = FALSE){
    serverAddress <- NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("/sas/servers/%s/libraries/%s/datasets/%s/data",
                            serverName, libraryName, datasetName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- sprintf("/sas/libraries/%s/datasets/%s/data",
                            libraryName, datasetName)
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        stop("Either serverName OR serverUrl with serverPort should be defined")
    }
    parameters <- c(serverAddress, list(repositoryName = repositoryName))
    response <- httr::DELETE(url = url,
                             path = URLencode(endpoint),
                             query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
