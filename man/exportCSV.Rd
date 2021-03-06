\name{exportCSV}
\alias{exportCSV}
\title{Export Data}
\usage{
  exportCSV(x, file.name = "")
}
\arguments{
  \item{x}{the data frame to be written.}

  \item{file.name}{a character string naming the file for
  output.}
}
\value{
  The file name is returned.
}
\description{
  Exports a data frame to a text-based file.
}
\note{
  The function \code{exportCSV} also writes a meta file
  that contins information about column formatting.
}
\seealso{
  \code{\link{write.table}}, \code{\link{importCSV}}
}
\keyword{IO}
\keyword{manip}

