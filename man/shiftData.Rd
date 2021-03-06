\name{shiftData}
\alias{shiftData}
\title{Shift Data}
\usage{
  shiftData(x, k = 1, fill = NA, circular = FALSE)
}
\arguments{
  \item{x}{any vector.}

  \item{k}{a positive or negative whole number of positions
  to shift the data. Positive values shift data to a higher
  position and negative values shift data to a lower
  position.}

  \item{fill}{a scalar value like \code{x} used to fill in
  the first \code{k} positions or the last -\code{k}
  positions if circular=FALSE. Ignored if circular=TRUE.
  The default value is NA.}

  \item{circular}{a logical value. If TRUE, then treat
  \code{x} as a circular buffer, rotating values from the
  end into the beginning if \code{k} is positive and vice
  versa if \code{k} is negative. If FALSE, then use the
  value of fill. The default value is FALSE.}
}
\value{
  A vector like \code{x}, with data shifted in position.
}
\description{
  Returns a vector like the input, but with the position of
  the data shifted up or down.
}
\examples{
shiftData(1:5, k=1)
# [1] NA  1  2  3  4
shiftData(1:5, k=1, circ=TRUE)
# [1] 5 1 2 3 4
}
\seealso{
  \code{\link{lag}}
}
\keyword{manip}

