#' @title get_workspace_server_config
#'
#' @description Gets the workspace server information and its connections from the metadata server by server name.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Server name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_workspace_server_config
get_workspace_server_config <- function(url, repositoryName = "Foundation",
                                        serverName=NULL, asDataFrame = FALSE){
    endpoint <- sprintf("/sas/servers/%s", serverName)
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
