#' @title get_license_info
#'
#' @description Gets the information about active SAS Proxy license.
#'
#' @param url URL of the server with installed SAS9API.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @export get_license_info
get_license_info <- function(url, asDataFrame = FALSE){
    endpoint <- "/sas/license/"
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
