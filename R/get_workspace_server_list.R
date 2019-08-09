#' @title get_workspace_server_list
#'
#' @description Gets a list of available workspace servers and their connections from the metadata server.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_workspace_server_list
get_workspace_server_list <- function(url, repositoryName = "Foundation",
                                      asDataFrame = FALSE){
    endpoint <- "/sas/servers/"
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
