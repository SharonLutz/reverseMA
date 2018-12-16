
## reverseC for Mendelian Randomization
These functions examines the performance of Mendelian Randomization (MR) methods in the presence of reverse causality.

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization") #you need R v3.4 or higher

devtools::install_github("SharonLutz/reverseC")
```

## Input
nSNP is the number of SNPs generated from a binomial distribution for n subjects (input n) for a given minor allele frequency (input vector MAF).

For the SNPs Xi and unmeasured confounder U, the mediator M is generated from a normal distribution with the variance (input varM) and the mean as follows:

E\[M\] = &gamma;<sub>o</sub> + &sum; &gamma;<sub>X</sub>  X<sub>i</sub> + &gamma;<sub>U</sub>  U

All of these values are inputted by the user (i.e. the intercept gamma0, the genetic effect size as a vector gammaX, and the effect of the unmeasured confounder U as gammaU).

The outcome Y is generated from a normal distribution with the variance (input varY) and the mean as follows:

E\[Y\] = &beta;<sub>o</sub> + &sum; &beta;<sub>X</sub> X<sub>i</sub> + &sum; &beta;<sub>I</sub> X<sub>i</sub>  M + &beta;<sub>M</sub> M + &beta;<sub>U</sub> U 

All of these values are inputted by the user (i.e. the intercept beta0, the direct effect from the SNPs X to the outcome Y as a vector betaX, the effect of the unmeasured confouder U as gammaU, the interaction effect of the SNPs with the mediator on the outcome Y as a vector betaI, and the effect of the mediator directly on the outcome as betaM).

After the SNPs X, mediator M, and outcome Y are generated, then the powerMRMA package compares the power and type 1 error rate of the following 6 methods to detect the path from M to Y (i.e. betaM) given that at least one SNP serves as an instrumental variable for the mediator. MethodNames denotes the possible methods used. (i.e. MethodNames= c("MR.Classical", "MR.Egger", "MR.IVW", "MR.Median", "MA.Imai", "MA.4Way")) where the citations are given at the end of this page.

The user can also generate measurement error. Please use ?powerMRMA to see the man page which gives full details for all of the input parameters.

## Example:
Here, we consider 4 SNPs (nSNP=4) with MAF of 0.2. We vary the direct effect of the mediator M on the ouctome Y (i.e. betaM=c(0.15,0.25)). We simulate no measurement error of the mediator, no unmeasured confounding of the mediator-outcome relationship, no direct effect from any SNP X to the outcome Y, and no interaction between any SNP X and mediator M on the outcome Y. This code runs 200 simulations for n subjects with n=1000.

```
library(reverseC)
?reverseMRsim # For details on this function

reverseMRsim(n = 1000, nSNP = 10, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.4, 0.4, 0.4), 
varM = 1, beta0 = 0, betaM = c(0, 0.2,0.3), varY = 1, nSim = 500, plot.pdf = T, 
plot.name = "reverseMRplot.pdf", alpha_level = 0.05, SEED = 1001)

```

## Output
For the example, we get the following matrix of results and corresponding plot.

<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMRplot.png" width="600">
