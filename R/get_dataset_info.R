#' @title get_dataset_info
#'
#' @description Gets the dataset information by defined library name and dataset name.
#' Workspace server can be connected either by server name or by server url with server port.
#' If none of these connections are provided, default workspace server from API configuration file will be used.
#'
#' @param url URL of the server with installed SAS9API.
#' @param serverName Workspace server name.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param datasetName Dataset name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_dataset_info
get_dataset_info <- function(url, serverName=NULL, serverUrl=NULL, serverPort=NULL,
                             libraryName, datasetName, asDataFrame = FALSE){
    serverAddress = NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("sas/servers/%s/libraries/%s/datasets/%s",
                            serverName, libraryName, datasetName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- sprintf("sas/libraries/%s/datasets/%s",
                            libraryName, datasetName)
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        warning("Default workspace server from API configuration file is used")
        endpoint <- sprintf("sas/libraries/%s/datasets/%s",
                            libraryName, datasetName)
    }
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = serverAddress)
    return_response(response, asDataFrame = asDataFrame)
}
