#' @title delete_library
#'
#' @description Removes all libraries with matching library name.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Server name.
#' @param libraryName Library name.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr DELETE
#'
#' @export delete_library
delete_library <- function(url=NULL, repositoryName = "Foundation",
                           serverName, libraryName, asDataFrame = FALSE){
    endpoint <- sprintf("sas/servers/%s/libraries/%s",
                        serverName, libraryName)
    parameters <- list(repositoryName = repositoryName)
    response <- httr::DELETE(url = url,
                             path = URLencode(endpoint),
                             query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
