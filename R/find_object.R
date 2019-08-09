#' @title find_object
#'
#' @description Finds objects.
#'
#' @param url URL of the server with installed SAS9API.
#' @param repositoryName Repository name.
#' @param location Folder location to search in.
#' @param locationRecursive logical. Defines whether search should be done in subfolders.
#' @param objectId SAS Metadata object ID.
#' @param objectType SAS Metadata object type.
#' @param publicType Comma-separated list of target PublicType attributes.
#' @param nameEquals Search criteria: name matches (case-insensitive).
#' @param nameStarts Search criteria: name starts with (case-insensitive).
#' @param nameContains Search criteria: name contains (case-insensitive).
#' @param nameRegex Search criteria: name matches regex.
#' @param descriptionContains Search criteria: description contains (case-insensitive).
#' @param descriptionRegex Search criteria: description matches regex.
#' @param createdGt Search criteria: MetadataCreated greater than (ISO datatime format).
#' @param createdLt Search criteria: MetadataCreated lower than (ISO datatime format).
#' @param modifiedGt Search criteria: MetadataModified greater than (ISO datatime format).
#' @param modifiedLt Search criteria: MetadataModified lower than (ISO datatime format).
#' @param tableLibref Search criteria: libref name for associated library object for a table. For table types only.
#' @param tableDBMS Search criteria: DBMS engine name for associated library object for a table. For table types only.
#' @param includeAssociations logical. Defines whether to include object associations in the search.
#' @param includePermissions logical. Defines whether to include metadata object permissions in the search.
#' @param asDataFrame logical. Determines the content of the response returned by the function. If FALSE, the function will return full JSON response. If TRUE, the function will return only payload part of the response transformed into a dataframe.
#'
#' @importFrom httr GET
#'
#' @examples find_object(url, nameStarts = "customer", nameContains = "group",
#' publicType = "Column", asDataFrame = TRUE)
#'
#' @export find_object
find_object <- function(url, repositoryName = "Foundation",
                        location=NULL, locationRecursive=TRUE, objectId=NULL,
                        objectType=NULL, publicType=NULL, nameEquals=NULL,
                        nameStarts=NULL, nameContains=NULL, nameRegex=NULL,
                        descriptionContains=NULL, descriptionRegex=NULL,
                        createdGt=NULL, createdLt=NULL, modifiedGt=NULL,
                        modifiedLt=NULL, tableLibref=NULL, tableDBMS=NULL,
                        includeAssociations=FALSE, includePermissions=FALSE,
                        asDataFrame = FALSE){
    parameters <- list(repositoryName = repositoryName,
                       location = location,
                       locationRecursive = locationRecursive,
                       objectId = objectId,
                       objectType = objectType,
                       publicType = publicType,
                       nameEquals = nameEquals,
                       nameStarts = nameStarts,
                       nameContains = nameContains,
                       nameRegex = nameRegex,
                       descriptionContains = descriptionContains,
                       descriptionRegex = descriptionRegex,
                       createdGt = createdGt,
                       createdLt = createdLt,
                       modifiedGt = modifiedGt,
                       modifiedLt = modifiedLt,
                       tableLibref = tableLibref,
                       tableDBMS = tableDBMS,
                       includeAssociations = includeAssociations,
                       includePermissions = includePermissions)
    endpoint <- "/sas/meta/search"
    response <- httr::GET(url = url,
                          path = URLencode(endpoint),
                          query = parameters)
    return_response(response, asDataFrame = asDataFrame)
}
