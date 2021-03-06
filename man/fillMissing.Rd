\name{fillMissing}
\alias{fillMissing}
\title{Fill Missing Values}
\usage{
  fillMissing(x, span = 10, Dates = NULL, max.fill = 10)
}
\arguments{
  \item{x}{the sequence of observations. Missing values are
  permitted and will be replaced.}

  \item{span}{the maximum number of observations on each
  side of each range of missing values to use in
  constructing the time series model. See \bold{Details}.}

  \item{Dates}{an optional vector of dates/times associated
  weith each value in \code{x}. Useful if there are gaps in
  dates/times.}

  \item{max.fill}{the maximum gap to fill.}
}
\value{
  The observations in \code{x} with missing values replaced
  by interpolation.
}
\description{
  Replace missing values in time-series data by
  interpolation.
}
\details{
  Missing values at the beginning and end of \code{x} will
  not be replaced. \cr

  The argument \code{span} is used to help set the range of
  values used to construct the \code{StructTS} model. If
  \code{span} is set small, then the variance of epsilon
  dominates and the estimates are not smooth. If
  \code{span} is large, then the variance of level
  dominates and the estimates are linear interpolations.
  See \bold{Note} for more information about the method.\cr

  If \code{span} is set larger than 99, then the entire
  time series is used to estimate all missing values.  This
  approach may be useful if there are many periods of
  missing values. If \code{span} is set to any number less
  than 4, then simple linear interpolation will be used to
  replace missing values.
}
\note{
  The method used to interpolate missing values is based on
  \code{tsSmooth} constructed using \code{StructTS} on
  \code{x} with \code{type} set to "trend." The smoothing
  method basically uses the information (slope) from two
  values previous to missing values and the two values
  following missing values to smoothly interpolate values
  accounting for any change in slope. The group that is
  used to define the statistics that control the
  interpolation is very simply defined by \code{span}
  rather than the more in-depth measures described in
  Elshorbagy and others (2000).
}
\examples{
\dontrun{
library(USGSwsData)
data(Q05078470)
# Create missing values in flow, the first sequence is a peak and the second is a recession
Q05078470$FlowMiss <- Q05078470$FLOW
Q05078470$FlowMiss[c(109:111, 198:201)] <- NA
# Interpolate the missing values
Q05078470$FlowFill <- fillMissing(Q05078470$FlowMiss)
# How did we do (line is actual, points are filled values)?
par(mfrow=c(2,1), mar=c(5.1, 4.1, 1.1, 1.1))
with(Q05078470[100:120, ], plot(DATES, FLOW, type='l'))
with(Q05078470[109:111, ], points(DATES, FlowFill))
with(Q05078470[190:210, ], plot(DATES, FLOW, type='l'))
with(Q05078470[198:201, ], points(DATES, FlowFill))
}
}
\references{
  Beauchamp, J.J., 1989, Comparison of regression and
  time-series methods for synthesizing missing streamflow
  records, Water Resources Bulletin, v. 25, no. 5, p.
  961-975.\cr

  Elshorbagy, A.A., Panu, U.S., Simonovic, S.P., 2000,
  Group-based estimation of missing hydrological data: I.
  Approach and general methodology, Hydrological Sciences
  Journal, v. 45, no. 6, p. 849-866.
}
\seealso{
  \code{\link{tsSmooth}}, \code{\link{StructTS}}
}
\keyword{manip}

