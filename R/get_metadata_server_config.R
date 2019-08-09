#' @title get_metadata_server_config
#'
#' @description Gets the current metadata server configuration.
#'
#' @param url URL of the server with installed SAS9API.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_metadata_server_config
get_metadata_server_config <- function(url, asDataFrame = FALSE){
    endpoint <- "/sas/"
    response <- httr::GET(url = url,
                          path = URLencode(endpoint))
    return_response(response, asDataFrame = asDataFrame)
}
