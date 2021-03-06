#' @title get_user_info
#'
#' @description Gets the server user information and its identities by user name.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param userName User name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_user_info
get_user_info <- function(url, repositoryName = "Foundation",
                          userName, asDataFrame = FALSE){
    endpoint <- sprintf("/sas/meta/users/%s", userName)
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
