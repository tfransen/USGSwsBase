#'Import Files
#'
#'Imports a formatted, tab-delimited file to a data frame.
#'
#'All of the dates in a date column must have the same format as the first
#'non-blank date in the column. Any date with a format different from that of
#'the first non-blank date in the column will be imported as \code{NA} (missing
#'value). By default, dates are imported as class "Date" using a 4-digit year,
#'2-digit month, and 2-digit day with the period (.), hyphen (-), slash (/), or
#'no separator.\cr
#'
#'If a valid \code{date.format} is supplied, then the data are imported using
#'\code{as.POSIXct} and time information can be included in the the data. If
#'\code{date.format} is "none," then conversion of the date information is
#'supressed and the data are retained as character strings.
#'
#' @param file.name a character string specifying the name of the RDB file
#'containing the data to be imported. This should be changed to file.name
#' @param date.format a character string specifying the format of all date
#'columns.
#' @param convert.type convert data according to the format line? Setting
#'\code{convert.type} to \code{FALSE} forces all data to be imported as
#'character.
#' @return A data frame with one column for each data column in the RDB or CSV
#'file.
#' @note A NULL data frame is created if there are no data in the file.
#'
#'The header information contained in the RDB file is retained in the output
#'dataset as \code{comment}.
#' @seealso \code{\link{scan}},
#'\code{\link{read.table}}, \code{\link{as.Date}}, \code{\link{as.POSIXct}},
#'\code{\link{comment}}
#' @keywords manip IO
#' @export
#' @examples
#'
#'## These datasets are available in USGSwsData as text files
#'TestDir <- system.file("misc", package="USGSwsData")
#'TestFull <- importRDB(file.path(TestDir, "TestFull.rdb"))
importRDB <- function(file.name="", date.format=NULL, convert.type=TRUE) {
  ## Coding history:
  ##    2000Feb03 DMierzeski (MathSoft) Original Coding
  ##    2000Aug08 JRSlack  Editorial cleanup
  ##    2001Feb05 JRSlack  Modified for USGS library
  ##    2001Mar08 JRSlack  Bug fixes
  ##    2002Mar26 JRSlack  Modified for S-PLUS 6
  ##    2002Aug21 JRSlack  GUI modifications
  ##    2005Mar11 JRSlack  Cleanup
  ##    2005Sep22 DLLorenz Extensive rewrite to handle wide RDB files
  ##    2005Nov02 DLLorenz Bug fix for identifying header lines
  ##    2011Jan12 DLLorenz Conversion to R
  ##    2011Jul06 DLLorenz Prep for package
  ##    2011Oct06 DLLorenz Bug Fix required for strsplit
  ##    2012Jan26 DLLorenz Tweaks for empty date column, do not understand why!
  ##    2012Jun04 DLLorenz Added Comment (header)
  ##    2012Aug11 DLLorenz Integer fixes
  ##    2012Aug14 DLLorenz Fix all NA dates to character
  ##    2012Oct27 DLLorenz Added date.format "none" to suppress conversion
  ##    2013Jan30 DLLorenz Added convert.type option to supress all type conversions
  ##    2013Feb02 DLLorenz Prep for gitHub
  ##
  if(missing(file.name)) stop("importRDB requires an RDB file name.")
  fileVecChar <- scan(file.name, what = "", sep = "\n", quiet=TRUE)
  pndIndx<-regexpr("^#", fileVecChar)
  hdr <- fileVecChar[pndIndx  > 0L]
  fileVecCharMinusForRow <- fileVecChar[pndIndx < 0L][-2L]
  formatRow <- fileVecChar[pndIndx<0][2]
  formatRow <- unlist(strsplit(formatRow, split='\t', fixed=TRUE))
  if(!convert.type) # Replace all formats with 10s to suppress conversion
    formatRow <- sub(".*", "10s", formatRow)
  if(length(fileVecCharMinusForRow) <= 1L) return(data.frame(NULL))
  assign("date.format", date.format, pos=-1L)
  ## Wide files have more than one column.
  ## Search for Dates columns
  ## More than one column.
  ColNames <- unlist( strsplit(t(fileVecCharMinusForRow)[1L], split="\t"))
  Ncol <- length(ColNames)
  if(Ncol > 1L) {
    temp.df <- strsplit(t(fileVecCharMinusForRow)[-1L], split="\t", fixed=TRUE)
    ## This step is required because strsplit drops the last column if blank
    temp.df <- lapply(temp.df, function(x, Ncol) {
      if(length(x) == Ncol)
        x
      else
        c(x, "") }, Ncol=Ncol ) # end of lapply
    temp.df <- do.call(rbind, temp.df)
    temp.df <- as.data.frame(temp.df, stringsAsFactors=FALSE)
    temp.df.mixedtype<-lapply(seq(ncol(temp.df)), function(i, mat, mat.for) {
      if(regexpr("[dD]", mat.for[i])>0L) {
        empty <- mat[,i] == ""
        if(all(empty)) {
          mat[,i] <- as.Date(NA)   # Empty date column
        }
        else if(!is.null(date.format)) {
          if(date.format != "none")
            mat[,i] <- as.POSIXct(as.character(mat[,i]),tz="UTC", format=date.format) # Date format specified
        }
        else if(regexpr("\\.",as.character(mat[,i][!empty][1])) > 0L) {
          mat[,i] <- as.Date(as.character(mat[,i]),zone="UTC", format="$Y.%m.%d") # Date with dots
        }   
        else if(regexpr("-",as.character(mat[,i][!empty][1])) > 0L) {
          mat[,i] <- as.Date(as.character(mat[,i]),zone="UTC ", format="%Y-%m-%d") # Date with dashes
        }   
        else if(regexpr("/",as.character(mat[,i][!empty][1])) > 0L) {
          mat[,i] <- as.Date(as.character(mat[,i]),zone="UTC", format="%Y/%m/%d") # Date with slashes
        }   
        else{
          tmat <- paste(substring(as.character(mat[,i]), 1L, 4L),
                        substring(as.character(mat[,i]), 5L, 6L),
                        substring(as.character(mat[,i]), 7L, 8L),sep="/")         
          tmat <- as.Date(as.character(tmat),zone="UTC", format="%Y/%m/%d") # Date with no separators
          if(!all(is.na(tmat)))
            mat[,i] <- tmat # this should preserve a failed conversion
        }               
      } 
      return(mat[,i])
    }, mat=temp.df, mat.for=formatRow) # end of lapply
    temp.df.mixedtype <- as.data.frame(temp.df.mixedtype, stringsAsFactors=FALSE)
    names(temp.df.mixedtype) <- make.names(ColNames)
    ## convert numeric columns
    numcol <- regexpr("[nN]",unlist(strsplit(formatRow, split="\t", fixed=TRUE))) > 0L
    if(any(numcol))
      for(i in which(numcol)) 
        temp.df.mixedtype[,i] <- as.double(temp.df.mixedtype[[i]])
    ## Fix rownames
    rownames(temp.df.mixedtype) <- as.character(seq(nrow(temp.df.mixedtype)))
    comment(temp.df.mixedtype) <- hdr
    return(temp.df.mixedtype)      
  } # end if more than 1 column
  ## Handle one column case separately.
  else {
    temp.df<-as.data.frame(fileVecCharMinusForRow[-1L], stringsAsFactors=FALSE, na.string="")
    if(regexpr("[dD]",formatRow) > 0L){
      empty <- temp.df[, 1L] == ""
      if(all(empty)) {
        temp.df[, 1L] <- as.Date(NA)   # Empty date column
      }
      else if(!is.null(date.format)) {
        temp.df[,1] <- as.POSIXct(as.character(temp.df[,i]),tz="UTC",format=date.format) # Date format specified
      }
      else if(regexpr("\\.", as.character(temp.df[,1][!empty][1]) ) > 0L) {
        temp.df[,1] <- as.Date(as.character(temp.df[,1]), format="%Y.%m.%d")
      }   
      else if(regexpr("-", as.character(temp.df[,1][!empty][1]) ) > 0L) {
        temp.df[,1] <- as.Date(as.character(temp.df[,1]), format="%Y-%m-%d")
      }   
         else if(regexpr("/", as.character(temp.df[,1][!empty][1]) ) > 0L) {
           temp.df[,1] <- as.Date(as.character(temp.df[,1]), format="%Y/%m/%d")
         }   
         else{
           tmat <- paste(substring(as.character(temp.df[,1]), 1L, 4L),
                         substring(as.character(temp.df[,1]), 5L, 6L),
                         substring(as.character(temp.df[,1]), 7L, 8L), sep=".")         
           tmat <- as.Date(as.character(tmat), format="%Y.%m.%d")
           if(!all(is.na(tmat)))
             temp.df[,i] <- tmat # this should preserve a failed conversion
         }               
    }
    else if(regexpr("[nN]",formatRow) > 0L) {
      temp.df[[1L]] <- as.double(temp.df[[1L]])
    } 
    names(temp.df) <- make.names(ColNames)
    comment(temp.df) <- hdr
    return(temp.df)
  }
}
