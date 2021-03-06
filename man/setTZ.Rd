\name{setTZ}
\alias{setTZ}
\title{Set Time Zone}
\usage{
  setTZ(x, TZ, force.stz = FALSE)
}
\arguments{
  \item{x}{the date-time data, generally class "POSIXct."}

  \item{TZ}{time zone, see \bold{Details}.}

  \item{force.stz}{force standard time specified in
  \code{TZ}. Useful for Arizona times, where daylight
  savings is not used, or in other cases where all times
  are recorded as standard time. Valid only in the
  continental US.}
}
\value{
  Data like \code{x}, but with times adjusted by the time
  zone information.
}
\description{
  Set the time zone information for dates and times.
}
\details{
  The time zone information should be a standard format
  like those described in
  \url{"http://en.wikipedia.org/wiki/List_of_zoneinfo_time_zones"}.
  For the convenience of users in the United States,
  correct conversion is provided for EST, EDT, CST, CDT,
  MST, MDT, PST, PDT, AKST, AKDT, HAST, and HST. However,
  time zones data in states like Arizona, where savings
  time is never used would use time zone information
  specified like "America/Phoenix" to avoid the possibility
  of setting savings time when it is not appropriate.
}
\note{
  The timezone information is a characterisitic of the data
  and not of each individual value. If the data in \code{x}
  come from different time zones, then a time zone is
  selected from the data and used as the base---the dats in
  \code{x} are correctly converted to the selected time
  zone and a warning is issued.
}
\examples{
TestDts <- as.POSIXct(c("2010-05-28 09:50:00", "2010-11-29 15:20:00"))
setTZ(TestDts, c("PDT", "PST"))
# Try setting to different Time zones
setTZ(TestDts, c("PDT", "CST"))
}
\seealso{
  \code{\link{as.POSIXct}}
}
\keyword{chron}
\keyword{manip}

