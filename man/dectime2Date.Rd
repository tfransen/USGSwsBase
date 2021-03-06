\name{dectime2Date}
\alias{dectime2Date}
\title{Date Conversion}
\usage{
  dectime2Date(x)
}
\arguments{
  \item{x}{the decimal date to convert.}
}
\value{
  A vector of class "Date" cooresponding to each value in
  \code{x}.
}
\description{
  Convert time data expressed as year and fractional part
  of year to class "Date."
}
\note{
  A small value, representing about 1 minute, is added to
  each value in \code{x} to prevent truncation errors in
  the conversion. This can cause some errors if the data
  were converted from date and time data.
}
\examples{
dectime("02/07/2013", date.format="\%m/\%d/\%Y")
# Convert back the printed result:
dectime2Date(2013.101)
# Convert a more precise value:
dectime2Date(2013.1013699)
}
\seealso{
  \code{\link{dectime}}, \code{\link{as.Date}}
}
\keyword{manip}

