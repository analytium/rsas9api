#' @title get_role_info
#'
#' @description Gets the role information and its associated groups and users by a role name.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param roleName Role name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_role_info
get_role_info <- function(url, repositoryName = "Foundation",
                          roleName, asDataFrame = FALSE){
    endpoint <- sprintf("/sas/meta/roles/%s", roleName)
    parameters <- list(repositoryName = repositoryName)
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
