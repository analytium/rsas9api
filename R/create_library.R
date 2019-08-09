#' @title create_library
#'
#' @description Creates library at a given server with the given library name and parameters.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param serverName Server name.
#' @param libraryName Library name.
#' @param engine Library engine.
#' @param displayName Display name.
#' @param path Library data path.
#' @param location Folder to place metadata object in.
#' @param isPreassigned logical. TRUE if created library should be preassigned
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr POST
#' @importFrom httr content_type_json
#'
#' @examples create_library(url, serverName, libraryName = "new_lib_1",
#' engine = "V9", displayName = "New Library 1", path = "/pub/portal/data",
#' location = "/User Folders/User1", isPreassigned = TRUE)
#'
#' @export create_library
create_library <- function(url, repositoryName = "Foundation", serverName=NULL,
                           libraryName, engine, displayName, path, location,
                           isPreassigned, asDataFrame = FALSE){
    endpoint <- sprintf("sas/servers/%s/libraries/%s", serverName, libraryName)
    parameters <- list(repositoryName = repositoryName,
                       engine = engine,
                       displayName = displayName,
                       path = path,
                       location = location,
                       isPreassigned = isPreassigned)
    response <- httr::POST(url = url,
                           httr::content_type_json(),
                           path = URLencode(endpoint),
                           query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
