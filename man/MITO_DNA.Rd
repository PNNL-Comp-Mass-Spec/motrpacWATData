% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{MITO_DNA}
\alias{MITO_DNA}
\title{Mitochondrial DNA qPCR}
\format{
\code{data.frame} with 30 rows and 8 columns:

\describe{
  \item{bid}{integer; unique 5 digit identifier of all samples collected for
  an acute test/sample collection period. All samples collected during that
  period will have the same BID.}
  \item{sex}{factor; the sex of the rat with 2 levels "Female" and "Male".}
  \item{timepoint}{factor; exercise training group. Either "SED"
  (sedentary) or the number of weeks of training ("1W", "2W", "4W", "8W").}
  \item{exp_group}{factor; unique combination of \code{sex} (first letter)
  and \code{timepoint}.}
  \item{mean_delta_CT}{numeric; mean of the duplicate \eqn{\Delta C_T} values
  from each sample.}
  \item{SE_delta_CT}{numeric; standard error of \code{mean_delta_CT}.}
  \item{delta_delta_CT}{numeric; \code{mean_delta_CT} values centered on the
  mean of the "F_SED" \code{exp_group}.}
  \item{relative_expr}{numeric; \eqn{2^{-\Delta \Delta C_T}} values.}
}
}
\usage{
MITO_DNA
}
\description{
Mitochondrial DNA quantitative polymerase chain reaction (qPCR)
  data.
}
\details{
Quantification of mitochondrial DNA (mtDNA) was performed and
  described by Amar, \emph{et al.}
  (\url{https://doi.org/10.1101/2023.01.13.523698}). Briefly, real-time
  quantitative PCR was performed in duplicate for each of the scWAT samples
  selected for -omics analysis. The \eqn{2^{-\Delta \Delta C_T}} method
  (\url{https://doi.org/10.1006/meth.2001.1262}) was then applied to estimate
  the relative expression of the mitochondrial D-loop. Since both target
  (D-loop) and internal control (\eqn{\beta}-actin) were amplified in the
  same well, \eqn{\Delta C_T} was calculated as the mean of
  (\eqn{C_{T,\beta-loop} - C_{T,\beta-actin}}) for each sample. Then,
  \eqn{\Delta \Delta C_T} values were obtained by subtracting each
  \eqn{\Delta C_T} value by the mean \eqn{\Delta C_T} of the sedentary female
  group (the calibrator).
}
\examples{
head(MITO_DNA, 10)
}
\references{
Amar, D., Gay, N. R., Jimenez-Morales, D., Beltran, P. M. J.,
  Ramaker, M. E., Raja, A. N., Zhao, B., Sun, Y., Marwaha, S., Gaul, D.,
  Hershman, S. G., Xia, A., Lanza, I., Fernandez, F. M., Montgomery, S. B.,
  Hevener, A. L., Ashley, E. A., Walsh, M. J., Sparks, L. M., … The MoTrPAC
  Study Group (2023). The mitochondrial multi-omic response to exercise
  training across tissues. \emph{BioRxiv}.
  \url{https://doi.org/10.1101/2023.01.13.523698}

  Livak, K. J., & Schmittgen, T. D. (2001). Analysis of Relative Gene
  Expression Data Using Real-Time Quantitative PCR and the 2−ΔΔCT Method.
  \emph{Methods, 25}(4), 402–408.
  \url{https://doi.org/10.1006/meth.2001.1262}
}
\keyword{datasets}
