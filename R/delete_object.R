#' @title delete_object
#'
#' @description Deletes object by its name and location.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param sourceLocation Object location.
#' @param sourceName Object name.
#' @param publicType Object public type.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr POST
#'
#' @export delete_object
delete_object <- function(url, repositoryName = "Foundation",
                          sourceLocation, sourceName, publicType,
                          asDataFrame = FALSE){
    endpoint <- "/sas/meta/objects/delete"
    parameters <- list(repositoryName = repositoryName,
                       sourceLocation = sourceLocation,
                       sourceName = sourceName,
                       publicType = publicType)
    response <- httr::POST(url = url,
                           content_type_json(),
                           path = URLencode(endpoint),
                           query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
