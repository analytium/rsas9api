#' @title get_library_list
#'
#' @description Gets the list of libraries for the workspace server.
#' Workspace server can be connected either by server name or by server url with server port.
#' If none of these connections are provided, default workspace server from API configuration file will be used.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Workspace server name.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_library_list
get_library_list <- function(url, repositoryName = "Foundation",
                             serverName=NULL, serverUrl=NULL, serverPort=NULL,
                             asDataFrame = FALSE){
    serverAddress <- NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("sas/servers/%s/libraries",
                            serverName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- "sas/libraries/"
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        warning("Default workspace server from API configuration file is used")
        endpoint <- "sas/libraries/"
    }
    parameters <- c(serverAddress, list(repositoryName = repositoryName))
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)

}
