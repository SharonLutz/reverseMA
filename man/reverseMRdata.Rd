\name{reverseMRdata}
\alias{reverseMRdata}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
reverseMRdata
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
reverseMRdata(nSNP = 3, X, M, Y, SEED = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nSNP}{
the number of SNPS
}
  \item{X}{
is a vector of SNP data, where each SNP is a column and the number of rows is the number of subjects
}
  \item{M}{
is the mediator
}
  \item{Y}{
is the outcome
}
  \item{SEED}{
is the seed
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a list of Estimates and p-values for the direct and indirect effects in situations with and without reverse causality.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Annie Thwing, Sharon Lutz
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
