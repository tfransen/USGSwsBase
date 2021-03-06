\name{select}
\alias{select}
\title{Conditional Element Selection}
\usage{
  select(test, ..., .pass = test, na = NA)
}
\arguments{
  \item{test}{a logical, numeric or character vector that
  indicates which value to select from the data supplied in
  \code{\dots{}}. See \bold{Details}.}

  \item{\dots}{the values to be selected.}

  \item{.pass}{the value to return for any element of
  \code{test} that does not match an argument name in
  \dots{}. Useful only when the class of \code{test} is
  "character" or "factor."}

  \item{na}{the value to return for any element of
  \code{test} is \code{NA}.}
}
\value{
  A vector of the same length as \code{test} and data
  values from the values list defined by \code{\dots{}}.
  The mode of the result will be coerced from the values
  list defined by \code{\dots{}}.
}
\description{
  Return the value associated with \code{test} from the
  supplied vectors.
}
\details{
  If \code{test} is logical, then if test is \code{TRUE},
  return the first argument in \dots{}, otherwise return
  the second argument.\cr If \code{test} is numeric, then
  return that value in the list defined by
  \code{\dots{}}.\cr If \code{test} is character, then
  return that value in the list defined by \code{\dots{}},
  which must be named in the call.\cr If \code{test} is
  \code{NA}, then return the value specified by \code{na}.
}
\note{
  This function is designed to replace nested \code{ifelse}
  expressions. See \bold{Examples}. It is different from
  \code{switch} in that the value selected from the
  possible alternatives is selected by the values in
  \code{test} rather than by a single value.\cr There is a
  function in the \code{MASS} package that is also called
  select. If \code{MASS} is loaded after \code{USGSwsBase},
  then this version of \code{select} will not be available
  to the user.
}
\examples{
## create the test vector
testselect <- c(1,2,3,1)
## Nested ifelse
ifelse(testselect == 1, 1,
 ifelse(testselect == 2, 3,
   ifelse(testselect == 3, 5, NA)))
## Results by select:
select(testselect, 1, 3, 5)
}
\seealso{
  \code{\link{ifelse}}, \code{\link{switch}}
}
\keyword{manip}

