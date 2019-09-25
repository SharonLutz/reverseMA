\name{reverseMA}
\alias{reverseMA}
\title{reverseMA}
\description{
The reverseMA function examines the direct and indirect path in mediation analysis when the mediator and outcome are (1) correctly specified and (2) incorrectly specified.
}
\usage{
reverseMA(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.1, varM = 1, beta0 = 0, betaX = 1, betaM = c(0, 0.1, 0.2), varY = 1, nSim = 100, nSimImai = 1000, SEED = 1, plot.pdf = T, plot.name = "reverseMAsim.pdf", alpha_level = 0.05)
}
\arguments{
  \item{n}{
        is the sample size of the population that is being simulated.
}
  \item{pX}{
  is the MAF of the SNP
}
  \item{gamma0}{
is the intercept for the effect of the SNP on the mediator M
}
  \item{gammaX}{
is the effect of the SNP X on the mediator M
}
  \item{varM}{
varM
}
  \item{beta0}{
beta0
}
  \item{betaX}{
betaX
}
  \item{betaM}{
betaM
}
  \item{varY}{
varY
}
  \item{nSim}{
nSim
}
  \item{nSimImai}{
nSimImai
}
  \item{SEED}{
SEED
}
  \item{plot.pdf}{
T then a plot is produced
}
  \item{plot.name}{
the name of the plot produced
}
  \item{alpha_level}{
the significance level
}
}
\value{
The function outputs a matrix of the results and produces a plot.
}
\author{
Sharon Lutz, Annie Thwing
}
\examples{
	reverseMA(n = 100,nSim = 10)
}

\keyword{reverseMA}
\keyword{ mediation}
