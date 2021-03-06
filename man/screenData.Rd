\name{screenData}
\alias{screenData}
\title{Screen Data for Completeness}
\usage{
  screenData(dates, values, type = "DV", year = "calendar",
    printit = TRUE)
}
\arguments{
  \item{dates}{the sequence of dates for each value in
  \code{values}.}

  \item{values}{the sequence of observations.}

  \item{type}{the frequency of \code{values}. Only daily
  values ("DV") and intermittent, or discrete, values
  ("IV") are accepted in this version. The whole text is
  required, but not case sensitive.}

  \item{year}{the type of year "calendar" or "water," which
  begins on October 1 of the previous calendar year and
  ends on September 30.}

  \item{printit}{print the results in a pretty format?}
}
\value{
  For \code{type} = "DV," a matrix of the counts of
  \emph{missing} values, either coded as \code{NA} or not
  in the data set, for each month and each year within the
  range of \code{dates}.

  For \code{type} = "DV," a matrix of the counts of
  \emph{observed} values for each month and each year
  within the range of \code{dates}.
}
\description{
  Screens data for the completeness of record by calendar
  or water year.
}
\details{
  Missing values are permitted in either \code{dates} or
  \code{values}. Those missing values are tallied in the
  completeness of record.
}
\examples{
library(USGSwsData)
data(Q05078770)
# this should indicate no missing values.
with(Q05078770, screenData(DATES, FLOW))
# There should be missing values shown for the two water years.
with(Q05078770, screenData(DATES, FLOW, year="w"))
}
\references{
  Rutledge, A.T., 2007, Program user Guide for Recess:
  \url{http://water.usgs.gov/ogw/recess/UserManualRECESS.pdf}.
}
\keyword{missing}

