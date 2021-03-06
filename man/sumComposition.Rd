\name{sumComposition}
\alias{sumComposition}
\title{Percentage Composition}
\usage{
  sumComposition(x, ..., Range = 100)
}
\arguments{
  \item{x}{any numeric vector, matrix, or data frame
  containing only numeric columns.}

  \item{\dots}{any additional vectors or matrices.}

  \item{Range}{the output range, generally 100 for
  percentages or 1 for proportions.}
}
\value{
  A matrix with columns matching all of the data in
  \code{x} and \code{\dots{}} with rows summing to
  \code{Range}.
}
\description{
  Compute percentage or proportion of elements in a
  composition
}
\details{
  Missing values are permitted in \code{x} or \code{\dots}
  and result in missing values for the row in the output.
}
\note{
  This function is designed to meet a very simple need in
  some applications like constructing data for Piper or
  trilinear diagrams. For more in-depth manipulations of
  compositional data, the user is directed to the
  \code{compositions} or other similar package.
}
\examples{
# Create tiny dataset
TinyCations <- data.frame(Ca=c(32, 47, 28), Mg=c(10,12,15), Na=c(7, 5, 7))
sumComposition(TinyCations)
}
\keyword{array}
\keyword{manip}

