#'Methods for Function \code{as.timeDay}
#'
#'Valid conversion for function \code{as.timeDay}.
#'
#'Inconsistent formats for \code{time} will result in an error. Missing values in 
#'\code{time} will result in missing values in the output.
#'
#'@name as.timeDay-methods
#'@aliases as.timeDay-methods as.timeDay as.timeDay,character,character-method
#'as.timeDay,character,missing-method as.timeDay,numeric,missing-method
#'as.timeDay,timeDay,missing-method
#'@docType methods
#'@section Methods: \describe{
#'
#'\item{list("signature(time = \"character\", format = \"character\")")}{
#'Convert from character using a specific format. }
#'
#'\item{list("signature(time = \"character\", format = \"missing\")")}{ Convert
#'from character using a generic format. }
#'
#'\item{list("signature(time = \"numeric\", format = \"missing\")")}{ Convert
#'from seconds storead as numeric values. }
#'
#'\item{list("signature(time = \"timeDay\", format = \"missing\")")}{ No change
#'to "timeDay" objects. } }
#'@keywords methods manip

setGeneric("as.timeDay", function(time, format) standardGeneric("as.timeDay")
)

setMethod("as.timeDay", signature(time="timeDay", format="missing"),
          function(time, format)
          return(time))

setMethod("as.timeDay", signature(time="numeric", format="missing"),
          function(time, format)
          return(new("timeDay", time=time, format="%H:%M:%S")))

setMethod("as.timeDay", signature(time="character", format="character"),
          function(time, format) {
            tmp <- strptime(time, format=format)
            return(new("timeDay", time=tmp$hour*3600 + tmp$min*60 + tmp$sec, format=format))
          })

setMethod("as.timeDay", signature(time="character", format="missing"),
          function(time, format) {
            ckfmt <- unique(nchar(time[!is.na(time)]))
            if(length(ckfmt) != 1L)
              stop("format for time is not consistent")
            if(ckfmt == 4L)
              format="%H%M"
            else if(ckfmt == 5L)
              format="%H:%M"
            else if(ckfmt == 6L)
              format="%H%M%S"
            else if(ckfmt == 8L)
              format="%H:%M:%S"
            else
              stop("unable to guess a format for time")
            tmp <- strptime(time, format=format)
            return(new("timeDay", time=tmp$hour*3600 + tmp$min*60 + tmp$sec, format=format))
          })
