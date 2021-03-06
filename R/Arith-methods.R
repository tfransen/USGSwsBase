#'Arithmetic Methods for \code{timeDay} objects
#'
#'Addition of time-of-day data to either "Date" or "POSIXt" classes.
#'
#'Missing values are permitted in either argument and result in a missing value in the 
#'output.
#'
#' @name Arith-methods
#' @rdname Arith-methods
#' @aliases Arith-methods Arith,Date,timeDay-method Arith,POSIXt,timeDay-method
#'Arith,timeDay,Date-method Arith,timeDay,POSIXt-method
#' @docType methods
#' @section Methods: \describe{
#'
#'\item{list("signature(e1 = \"Date\", e2 = \"timeDay\")")}{ Addition is
#'permissible for these data. }
#'
#'\item{list("signature(e1 = \"POSIXt\", e2 = \"timeDay\")")}{ Addition is
#'permissible for these data. }
#'
#'\item{list("signature(e1 = \"timeDay\", e2 = \"Date\")")}{ Addition is
#'permissible for these data. }
#'
#'\item{list("signature(e1 = \"timeDay\", e2 = \"POSIXt\")")}{ Addition is
#'permissible for these data. } }
#' @keywords methods manip
#' @exportMethod Arith
setMethod("Arith", signature(e1="timeDay", e2="POSIXt"), function(e1, e2) {
  ## Only addition allowed
  if(.Generic != "+")
    stop(gettextf("'%s' not defined for 'timeDay' objects", .Generic),
         domain=NA)
  retval <- e2 + e1@time
  retval}
          )

#' @rdname Arith-methods
#' @aliases Arith,POSIXt,timeDay
setMethod("Arith", signature( e1="POSIXt", e2="timeDay"), function(e1, e2) {
  ## Only addition allowed
  if(.Generic != "+")
    stop(gettextf("'%s' not defined for 'timeDay' objects", .Generic),
         domain=NA)
  retval <- e1 + e2@time
  retval}
          )
#' @rdname Arith-methods
#' @aliases Arith,timeDay,Date
setMethod("Arith", signature(e1="timeDay", e2="Date"), function(e1, e2) {
  ## Only addition allowed
  if(.Generic != "+")
    stop(gettextf("'%s' not defined for 'timeDay' objects", .Generic),
         domain=NA)
  ## Force e2 to POSIXct, format() required to preserve local time
  e2 <- as.POSIXct(format(e2))
  retval <- e2 + e1@time
  retval}
          )
#' @rdname Arith-methods
#' @aliases Arith,Date,timeDay
setMethod("Arith", signature( e1="Date", e2="timeDay"), function(e1, e2) {
  ## Only addition allowed
  if(.Generic != "+")
    stop(gettextf("'%s' not defined for 'timeDay' objects", .Generic),
         domain=NA)
  ## Force e1 to POSIXct, format() required to preserve local time
  e1 <- as.POSIXct(format(e1))
  retval <- e1 + e2@time
  retval}
          )

