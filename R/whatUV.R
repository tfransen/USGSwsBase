#'Data Inventory
#'
#'Gets a description of unit-value data available for a USGS station and the
#'beginning and ending dates of each parameter.
#'
#'
#'@usage whatUV(gage)
#'@param gage a single USGS station identifier as a character string.
#'@return A data frame containing the columns Available Parameters, StartDate,
#'and EndDate.
#'@seealso \code{\link{readNWIS}}
#'@references Refer to NWIS web?
#'@keywords DataIO
#'@examples
#'
#'\dontrun{
#'# What has been collected at
#'# 04067500 MENOMINEE RIVER NEAR MC ALLISTER, WI
#'readNWIS("04067500")
#'}
#'

whatUV <- function(gage) {
  ## Coding history:
  ##    2012Dec20 DLLorenz original Coding
  ##    2013Feb15 DLLorenz Prep for gitHub
  ##
  require(XML)
  if(missing(gage))
    stop("gage is required")
  myurl <- paste("http://waterdata.usgs.gov/nwis/uv/?site_no=",
                 gage, "&PARAmeter_cd=", sep="")
  retval <- try(readHTMLTable(myurl, stringsAsFactors=FALSE), silent=TRUE)
  if(class(retval) == "try-error" || length(retval) < 8L)
    stop("no unit value data found for gage: ", gage)
  ## Get the data and proceed
  retval <- retval[[7L]] # That is the one
  retval <- retval[-1L, -1L] # Remove the all available row and empty column 1
  names(retval)[2:3] <- c("StartDate", "EndDate")
  ## Fix the columns
  retval$StartDate=as.Date(retval$StartDate, format="%Y-%m-%d")
  retval$EndDate=as.Date(retval$EndDate, format="%Y-%m-%d")
  return(retval)
}