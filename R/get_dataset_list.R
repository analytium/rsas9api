#' @title get_dataset_list
#'
#' @description Gets the list of datasets for defined library.
#'
#' @param url URL of the server with installed SAS9API.
#' @param serverName Workspace server name. Either server name or server url with server port should be provided.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_dataset_list
get_dataset_list <- function(url, serverName=NULL, serverUrl=NULL, serverPort=NULL,
                             libraryName, asDataFrame = FALSE){
    if (!missing(serverName)) {
        endpoint <- sprintf("sas/servers/%s/libraries/%s/datasets",
                            serverName, libraryName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- sprintf("sas/libraries/%s/datasets", libraryName)
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        stop("Either serverName OR serverUrl with serverPort should be defined")
    }
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = serverAddress)
    return_response(response, asDataFrame = asDataFrame)
}
