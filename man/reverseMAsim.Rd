\name{reverseMAsim}
\alias{reverseMAsim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
reverseMAsim
}
\description{
A function to similate the performance of the mediate function from the mediation package in scenarios of reverse causality.
}
\usage{
reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.1, varM = 1, beta0 = 0, betaX = 1, betaM = c(0, 0.1, 0.2), 
varY = 1, nSim = 100, nSimImai = 1000, SEED = 1, plot.pdf = T, plot.name = "reverseMAsim.pdf", alpha_level = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
is the sample size.
}
  \item{pX}{
is the minor allele frequency
}
  \item{gamma0}{
is the intercept for M
}
  \item{gammaX}{
is the association of X with M
}
  \item{varM}{
is the variance of M
}
  \item{beta0}{
is the intercept for Y
}
  \item{betaX}{
is the direct effect of X on Y
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
  \item{nSimImai}{
is the number of simulations to run in mediate from the mediation package
}
  \item{SEED}{
is the seed
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
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a matrix of the power of the mediate method from the mediation package to detect an effect of the mediator M on the outcome Y when M and Y are correctly specified and also when they are incorrectly specified (the true mediator is Y and the true outcome is M)
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

