\name{reverseMRsim}
\alias{reverseMRsim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
reverseMRsim
}
\description{
A function to similate the performance of different MR methods from the MendelianRandomization package in scenarios of reverse causality.
}
\usage{
reverseMRsim(n = 1000, nSNP = 3, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.2, 0.2, 0.2), varM = 1, beta0 = 0, betaM = c(0, 0.1), varY = 1, nSim = 100, plot.pdf = T, plot.name = "reverseMRsim.pdf", alpha_level = 0.05, SEED = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
is the sample size
}
  \item{nSNP}{
is the number of SNPS to generate
}
  \item{MAF}{
is a vector of the MAF of each SNP
}
  \item{gamma0}{
is the intercept for M
}
  \item{gammaX}{
is a vector of the associations of each SNP with M
}
  \item{varM}{
is the variance of M
}
  \item{beta0}{
is the intercept for Y
}
  \item{betaM}{
is a vector of different associations of M with Y
}
  \item{varY}{
is the variance of Y
}
  \item{nSim}{
is the number of simulations to run
}
  \item{plot.pdf}{
is T to output a plot, is F to not output a plot
}
  \item{plot.name}{
is the name of the plot
}
  \item{alpha_level}{
is the significance level
}
  \item{SEED}{
is the seed
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a matrix of the power of three Mendelian Randomization approaches from the MendelianRandomization package to detect an effect of the mediator M on the outcome Y when M and Y are correctly specified and also when they are incorrectly specified (the true mediator is Y and the true outcome is M)
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
