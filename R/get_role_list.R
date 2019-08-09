#' @title get_role_list
#'
#' @description Gets the list of roles and their associated groups and users.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_role_list
get_role_list <- function(url, repositoryName = "Foundation",
                          asDataFrame = FALSE){
    endpoint <- "/sas/meta/roles"
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
