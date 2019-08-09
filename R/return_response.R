#' @title return_response
#'
#' @description Base function for handling API response.
#'
#' @param response Response from API request.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#'
#' @export return_response
return_response <- function(response, asDataFrame){

    ## check response status code
    ## (200 = OK, 201 = Created for PUT and POST, 204 = No Content for DELETE)
    if (response$status_code %in% c(200, 201, 204)) {
        response <- httr::content(response,
                                  as = "text",
                                  type = "text/xml",
                                  encoding = "UTF-8")
        if (asDataFrame) {

            ## parse payload into a data frame
            response <- jsonlite::fromJSON(response, flatten = FALSE)
            response <- base::as.data.frame(response$payload,
                                            stringsAsFactors = FALSE)
        }
        return(response)
    } else {
        stop(response)
    }
}
