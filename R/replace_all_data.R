#' @title replace_all_data
#'
#' @description Replaces all data in the dataset with input data.
#' Workspace server can be connected either by server name or by server url with server port.
#' If none of these connections are provided, default workspace server from API configuration file will be used.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Workspace server name.
#' @param serverUrl Workspace server URL.
#' @param serverPort Workspace server port.
#' @param libraryName Library name.
#' @param datasetName Dataset name.
#' @param data Data in JSON format. If data is in a file use upload_file(path = "/path"). See examples.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr POST
#' @importFrom httr content_type_json
#'
#' @examples replace_all_data(url, serverUrl, serverPort, libraryName, datasetName,
#' data = '[{"Name": "Andrew","Sex": "M","Age": 55,"Height": 184,"Weight": 91}]')
#'
#' @examples replace_all_data(url, serverUrl, serverPort, libraryName, datasetName,
#' data = upload_file(path = "D:/My Folder/data.txt"))
#'
#' @export replace_all_data
replace_all_data <- function(url, repositoryName = "Foundation",
                             serverName=NULL, serverUrl=NULL, serverPort=NULL,
                             libraryName, datasetName, data, asDataFrame = FALSE){
    serverAddress <- NULL
    if (!missing(serverName)) {
        endpoint <- sprintf("/sas/servers/%s/libraries/%s/datasets/%s/data",
                            serverName, libraryName, datasetName)
    } else if (!missing(serverUrl) & !missing(serverPort)) {
        endpoint <- sprintf("/sas/libraries/%s/datasets/%s/data",
                            libraryName, datasetName)
        serverAddress <- list(serverUrl = serverUrl, serverPort = serverPort)
    } else {
        warning("Default workspace server from API configuration file is used")
        endpoint <- sprintf("/sas/libraries/%s/datasets/%s/data",
                            libraryName, datasetName)
    }
    parameters <- c(serverAddress, list(repositoryName = repositoryName))
    response <- httr::POST(url = url,
                           httr::content_type_json(),
                           path = URLencode(endpoint),
                           query = parameters,
                           body = data)
    return_response(response, asDataFrame = asDataFrame)
}
