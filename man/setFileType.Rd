\name{setFileType}
\alias{setFileType}
\title{File or Object Name}
\usage{
  setFileType(filename, type = "tmp", replace = FALSE)
}
\arguments{
  \item{filename}{a single character string of the name of
  the file or object.}

  \item{type}{character string identifying the new suffix.}

  \item{replace}{logical: replace the current suffix?}
}
\value{
  A character string like filename but with a new suffix.
}
\description{
  Create a new file or object name from an old name with an
  optional new suffix.
}
\note{
  This function is designed as a support function for many
  USGS functions.
}
\examples{
# Replace the .dat suffixze with .txt
setFileType("TestName.dat", "txt", replace=TRUE)
}
\author{
  Dave Lorenz, original coding by Jim Slack, retired.
}
\keyword{MANIP}

