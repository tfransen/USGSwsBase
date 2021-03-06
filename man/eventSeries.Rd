\name{eventSeries}
\alias{eventSeries}
\title{Regular Series}
\usage{
  eventSeries(times, period = "hour", which = "cumsum",
    begin, end, k.period = 1)
}
\arguments{
  \item{times}{a date like vector corresponding to data.}

  \item{period}{character string that is valid input to the
  the POSIXct method for seq is OK, specifying the spacing
  between successive periods. For example "year," "month,"
  or "day."}

  \item{which}{a character string indicating the method to
  use. See \bold{Details} for options.}

  \item{begin}{the beginning date as POSIXt or as
  character.}

  \item{end}{the end date as POSIXt or as character.}

  \item{k.period}{the number of units of \code{period} in
  each period of the output series.}
}
\value{
  The function \code{eventSeries} returns a data frame with
  two columns: \item{DateTime}{the date and time.}
  \item{Sum}{the sum of the number of events in the period
  if \code{which} is "sum" or} \item{CumSum}{the cumulative
  sum of the number of events up to and including the
  period if \code{which} is "cumsum."}
}
\description{
  Some time-series analyses require data that are uniformly
  spaced in time. This function will construct a regular
  series from randomly spaced events.
}
\details{
  If there is no observation during a period, then that
  value is set to 0 if \code{which} is "sum" and the value
  previous period if \code{which} is "cumsum." The initial
  value of the series is always 0.
}
\examples{
library(USGSwsData)
data(QW05078470)
# there should be no values for season numbers 2, 5, or 10
}
\seealso{
  Refer to the documentation for \code{seaken} in the
  USGSstats package if it is installed.
}
\keyword{manip}

