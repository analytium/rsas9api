#' @title execute_command
#'
#' @description Sends a SAS command to the workspace server for execution.
#' Workspace server can be connected either by server name or by server url with server port.
#' If none of these connections are provided, default workspace server from API configuration file will be used.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Workspace server name.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param logEnabled logical. Enables log output in endpoint response.
#' @param command SAS command to execute.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr PUT
#' @importFrom httr content_type_json
#'
#' @examples execute_command(url, serverUrl, serverPort,
#' command = "proc print data=sashelp.class; run;", logEnabled = TRUE)
#'
#' @export execute_command
execute_command <- function(url=NULL,
                            repositoryName = "Foundation",
                            serverName=NULL, serverUrl=NULL, serverPort=NULL,
                            logEnabled=TRUE, command, asDataFrame = FALSE){
    serverAddress <- NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("/sas/servers/%s/cmd", serverName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- "sas/cmd"
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        warning("Default workspace server from API configuration file is used")
        endpoint <- "/sas/cmd"
    }
    parameters <- c(serverAddress, list(repositoryName = repositoryName,
                                        logEnabled = logEnabled))
    response <- httr::PUT(url = url,
                          httr::content_type_json(),
                          path = URLencode(endpoint),
                          query = parameters,
                          body = command)
    return_response(response, asDataFrame = asDataFrame)
}
