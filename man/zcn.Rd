\name{\%cn\%}
\alias{\%cn\%}
\title{Partial Value Matching}
\usage{
  %cn%(x, pattern)
}
\arguments{
  \item{x}{the character vector to be matched. Missing
  values are permitted.}

  \item{pattern}{the pattern to be matched against, may be
  a regular expression.}
}
\value{
  A vector the same length as \code{x} of locical values
  indicating whether \code{pattern} is found in the element
  of \code{x} or not.
}
\description{
  Matches partial values, such as substrings.
}
\examples{
## A simple example
c("abc", "def") \%cn\% 'c'
}
\seealso{
  \code{\link{\%in\%}}, \code{\link{regexpr}}
}
\keyword{manip}

