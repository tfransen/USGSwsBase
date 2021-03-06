\name{readNWIS}
\alias{readNWIS}
\title{Import Data}
\usage{
  readNWIS(gage, dtype = "swdv", begin.date = "",
    end.date = "", param = NULL, stat = NULL,
    convert.type = TRUE)
}
\arguments{
  \item{gage}{a single USGS station identifier as a
  character string.}

  \item{dtype}{the type of data, must be "swdv" for
  surface-water daily values, "peak" for annual peaks,
  "measurements" for discharge measurements, "gwdv" for
  groundwater daily values, "gwlevels" for groundwater
  level measurements, "uv" for unit values, "gage" for
  streamgage information, or "well" for well information.
  Only the first letter is required, except to distinguish
  between "gwdv," "gwlevels," and "gage."}

  \item{begin.date}{the data to use for the earliest value.
  Not used for \code{dtype} = "peak." If, "", then retrieve
  beginning with the first record in the database for
  "swdv" and "gwdv". If, "" for "uv", one week of data is
  returned.}

  \item{end.date}{the data to use for the latest value. Not
  used for \code{dtype} = "peak." If "", then retrieve the
  most recent values in the database.}

  \item{param}{the parameter code to retrieve. See
  \bold{Details}.}

  \item{stat}{the statistic codes or name of code to
  retrieve for \code{dtype} "swdv" or "gwdv." If
  \code{NULL}, then retrieve all. Otherwise, must be the
  5-digit code or one of "maximum,", "minimum,", "mean," or
  "median." May be uniquely abbreviated.}

  \item{convert.type}{Convert data to types indicated by
  the column type in the data or as indicated in
  \bold{Note}? See \bold{Details}.}
}
\value{
  A data frame of the appropriate data. See
  \url{http://waterdata.usgs.gov/usa/nwis/sw} for details
  about surface water or
  \url{http://waterdata.usgs.gov/usa/nwis/gw} for details
  about groundwater.
}
\description{
  Reads surface-water or groundwater data from NWISweb.
}
\details{
  The value for \code{param} must match a valid 5-digit
  USGS parameter code. Required only for \code{dtype}
  "swdv," "gwdv," and "uv." The default value for
  \code{dtype} = "swdv" is "00060" (daily streamflow) and
  for \code{dtype} = "gwdv" is "72019" (water level below
  land surface). If blank and \code{gage} has fewer than 15
  characters, then \code{param} is set to "00060,"
  otherwise "72019."\cr In some cases, daily values data
  can be tagged with additional nonnumeric flags. In those
  cases, the data would be converted to \code{NA}, but
  setting \code{convert.type} to \code{FALSE} will preserve
  all data as character and the all data can be converted
  manually by the user.
}
\note{
  Column names ending in "_va" are always forced to be
  numeric even if the column header information indicates
  otherwise. Other columns may need to be converted
  depending on user needs.\cr Peak flow data do not always
  have complete date information due to uncertainity in the
  exact day of the peak. The column \code{peak_dt} is
  always type "character" but can be converted by the user.
}
\examples{
\dontrun{
# Get the first 5 days in 2010 for USGS station identifier
# 01578310 SUSQUEHANNA RIVER AT CONOWINGO, MD
readNWIS("01578310", begin.date="2010-01-01", end.date="2010-01-05")
# Get the most recent groundwater levels, in feet below land surface,
# from a well south of Bend, Ore.
readNWIS("434400121275801", "gwl", begin.date="2010-01-01")
}
}
\author{
  Original coding by Tim Cohn \email{tacohn@usgs.gov}
  additional capabilities added by Dave Lorenz
  \email{lorenz@usgs.gov}.
}
\seealso{
  \code{\link{importRDB}}
}
\keyword{IO}
\keyword{manip}

