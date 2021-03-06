\name{exportRDB}
\alias{exportRDB}
\title{Export Data}
\usage{
  exportRDB(x, file.name = "data.rdb", col.names = NULL,
    meta = FALSE, code.rule = 10)
}
\arguments{
  \item{x}{the data frame to be written.}

  \item{file.name}{a character string naming the file for
  output.}

  \item{col.names}{a vector of colum names to use instead
  of the column names in \code{x}.}

  \item{meta}{a logical value indicating whether the header
  should include a meta-data template for documentation or
  not.}

  \item{code.rule}{an integer value indicating how many
  unique numeric values should be included in the meta-data
  template for cases where each distinct value has a
  descriptive meaning rather than a numeric meaning.}
}
\value{
  The file name is returned.
}
\description{
  Exports a data frame to a text-based file.
}
\details{
  Setting the \code{meta} argument to \code{TRUE} generates
  a header that contains a template that can be edited by
  the user to describe the contents of the file.
}
\seealso{
  \code{\link{write.table}}, \code{\link{importRDB}}
}
\keyword{IO}
\keyword{manip}

