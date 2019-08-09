#' @title insert_data
#'
#' @description Inserts data into the dataset or replaces data by key.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Workspace server name. Either server name or server url with server port should be provided.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param datasetName Dataset name.
#' @param byKey Dataset key for record matching.
#' @param data Data in JSON format.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr PUT
#' @importFrom httr content_type_json
#'
#' @examples insert_data(url, serverUrl, serverPort, libraryName, datasetName,
#' data = "[{'Customer_Country': 'AU'}]")
#'
#' @export insert_data
insert_data <- function(url=NULL,  repositoryName = "Foundation",
                        serverName=NULL, serverUrl=NULL, serverPort=NULL,
                        libraryName, datasetName, byKey=NULL, data,
                        asDataFrame = FALSE){
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
    parameters <- c(serverAddress, list(repositoryName = repositoryName,
                                        byKey = byKey))
    response <- httr::PUT(url = url,
                          httr::content_type_json(),
                          path = URLencode(endpoint),
                          query = parameters,
                          body = data)
    return_response(response, asDataFrame = asDataFrame)
}
