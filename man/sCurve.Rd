\name{sCurve}
\alias{IsCurve}
\alias{sCurve}
\title{S-Curve transform}
\usage{
  sCurve(x, location = 0, scale = 1, shape = 1)

  IsCurve(x, location = 0, scale = 1, shape = 1)
}
\arguments{
  \item{x}{a numeric vector to be transformed by
  \code{sCurve} or back-trasnformed by \code{IsCurve}.
  Missing values are allowed and result in corresponding
  missing values in the output.}

  \item{location}{the transition point in the s-curve
  transform.}

  \item{scale}{the scaling factor for the data, the slope
  at the transition point in the s-curve transform. Must be
  greater than 0.}

  \item{shape}{a value which determines how quickly the
  curve approaches the limits of -1 or 1. Must be greater
  than 0.}
}
\value{
  A numeric vector of the transformed or back-transformed
  values in \code{x}.
}
\description{
  Functions for transforming and back-transforming data
  using a s-shaped curve.
}
\details{
  The basic equation for the s-curve is z/(1 +
  abs(z)^shape)^(1/shape), where z is scale*(x -
  location).\cr

  The function \code{hyperbolic} computes the forward
  transform and the function \code{Ihyperbolic} computes
  the back-transform.
}
\note{
  The \code{sCurve} function is related to the
  \code{hyperbolic} function in that both can represent
  mixing models for flow in stream water chemistry. The
  \code{sCurve} function is more flexible when there are
  distinct upper and lower limits to the concentration. The
  \code{hyperbolic} function is more flexible for
  oipen-ended concentrations for either high or low flows.
  Also, \code{sCurve} would typically use log-transformed
  values for flow.
}
\examples{
\dontrun{
# Basic changes to the s-curve
curve(sCurve(x), -5,5, ylim=c(-1,1))
# Shift to left
curve(sCurve(x, location=1), -5,5, add=TRUE, col="red")
# increase slope
curve(sCurve(x, scale=2), -5,5, add=TRUE, col="cyan")
# increase rate
curve(sCurve(x, shape=2), -5,5, add=TRUE, col="purple")
}
}
\seealso{
  \code{\link{hyperbolic}}
}
\keyword{manip}

