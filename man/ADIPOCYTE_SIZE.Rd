% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{ADIPOCYTE_SIZE}
\alias{ADIPOCYTE_SIZE}
\title{Measures of adipocyte size}
\format{
A \code{data.frame} with 55825 rows and 7 variables:

\describe{
  \item{\code{pid}}{integer; randomly generated 8-digit identifier used in
  linkage to phenotypic data. All samples from the same animal have the same
  PID.}
  \item{sex}{factor; the sex of the rat with 2 levels "Female" and "Male".}
  \item{timepoint}{factor; exercise training group. Either "SED"
  (sedentary) or the number of weeks of training ("1W", "2W", "4W", "8W").}
  \item{diameter}{numeric; adipocyte diameter in microns.}
  \item{diameter_bin}{ordered factor; diameter binned in approximately 5
  micron intervals.}
  \item{area}{numeric; adipocyte area in square microns.}
  \item{volume}{volume; adipocyte volume in cubic microns.}
  \item{n_adipocytes}{integer; total number of adipocytes across all images
  for a particular animal.}
}
}
\usage{
ADIPOCYTE_SIZE
}
\description{
Measures of adipocyte size: diameter, area, volume.
}
\details{
Adipocyte area was calculated using CellProfiler. Diameter was
  derived from area, under the assumption of circular cross-sections. Volume
  was derived from area, under the assumption of spherical adipocytes.
}
\examples{
print.data.frame(head(ADIPOCYTE_SIZE))

}
\keyword{datasets}
