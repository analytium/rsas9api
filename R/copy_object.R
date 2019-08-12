#' @title copy_object
#'
#' @description Copies object.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param sourceLocation Object location.
#' @param sourceName Object name.
#' @param publicType Object public type.
#' @param destinationLocation Destination location.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr POST
#' @importFrom httr content_type_json
#'
#' @examples copy_object(url, sourceLocation = "User Folders/user1",
#' sourceName = "Library1", publicType = "Library", destinationLocation = "User Folders/user2")
#'
#' @export copy_object
copy_object <- function(url, repositoryName = "Foundation",
                        sourceLocation, sourceName, publicType, destinationLocation,
                        asDataFrame = FALSE){
    endpoint <- "/sas/meta/objects/copy"
    parameters <- list(repositoryName = repositoryName,
                       sourceLocation = sourceLocation,
                       sourceName = sourceName,
                       publicType = publicType,
                       destinationLocation = destinationLocation)
    response <- httr::POST(url = url,
                           httr::content_type_json(),
                           path = URLencode(endpoint),
                           query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
