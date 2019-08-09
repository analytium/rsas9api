#' @title get_stp_server_list
#'
#' @description Gets the list of available Stored Process Servers and their connections from the metadata server.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_stp_server_list
get_stp_server_list <- function(url, repositoryName = "Foundation",
                                asDataFrame = FALSE){
    endpoint <- "/sas/stp"
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
