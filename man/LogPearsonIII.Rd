\name{dlpearsonIII}
\alias{dlpearsonIII}
\alias{LogPearsonIII}
\alias{plpearsonIII}
\alias{qlpearsonIII}
\alias{rlpearsonIII}
\title{Log-Pearson Type III distribution}
\usage{
  dlpearsonIII(x, meanlog = 0, sdlog = 1, skew = 0)

  plpearsonIII(q, meanlog = 0, sdlog = 1, skew = 0)

  qlpearsonIII(p, meanlog = 0, sdlog = 1, skew = 0)

  rlpearsonIII(n, meanlog = 0, sdlog = 1, skew = 0)
}
\arguments{
  \item{x,q}{vector of quantiles.}

  \item{p}{vector of probabilities.}

  \item{n}{number of observations. If length(n) > 1, then
  the length is taken to be the number required.}

  \item{meanlog}{vector of means of the distribution of the
  log-transformed data.}

  \item{sdlog}{vector of standard deviation of the
  distribution of the log-transformed data.}

  \item{skew}{vector of skewness of the distribution of the
  log-transformed data.}
}
\value{
  Either the density (\code{dlpearsonIII}), cumulative
  probability (\code{plpearsonIII}), quantile
  (\code{qlpearsonIII}), or random sample
  (\code{rlpearsonIII}) for the described distribution.
}
\description{
  Density, cumulative probability, quantiles and random
  generation for the log-Pearson Type III distribution.
}
\details{
  Elements of x, q, or p that are missing will result in
  missing values in the retruned data.
}
\note{
  The log-Pearson Type III distribtuion is used
  extensitvely in flood- frequency analysis in the United
  States.
}
\examples{
## Simple examples
dlpearsonIII(c(.5, .75, .9), 1.5, .25, 0)
## compare to normal
qlnorm(c(.5, .75, .9), 1.5, .25)
## Make a skewed distribution
dlpearsonIII(c(.5, .75, .9), 1.5, .25, 0.25)
## Simple examples
plpearsonIII(c(.5, .75, .9), 1.5, .25, 0)
## compare to normal
qlnorm(c(.5, .75, .9), 1.5, .25)
## Make a skewed distribution
plpearsonIII(c(.5, .75, .9), 1.5, .25, 0.25)
## Simple examples
qlpearsonIII(c(.5, .75, .9), 1.5, .25, 0)
## compare to normal
qlnorm(c(.5, .75, .9), 1.5, .25)
## Make a skewed distribution
qlpearsonIII(c(.5, .75, .9), 1.5, .25, 0.25)
## Simple examples
rlpearsonIII(c(.5, .75, .9), 1.5, .25, 0)
## compare to normal
qlnorm(c(.5, .75, .9), 1.5, .25)
## Make a skewed distribution
rlpearsonIII(c(.5, .75, .9), 1.5, .25, 0.25)
}
\seealso{
  \code{\link{dpearsonIII}}, \code{\link{dlnorm}}
}
\keyword{distribution}
\keyword{manip}

