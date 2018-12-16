
## reverseC for Mendelian Randomization
These functions examines the performance of Mendelian Randomization (MR) methods in the presence of reverse causality. Through simulation studies, we examined the type 1 error rate and power for 3 popular MR methods when the role of the intermediate phenotype/ phenotype of interest and outcome were correctly specified and when they were reversed (i.e. reverse causality). 

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization") #you need R v3.4 or higher

devtools::install_github("SharonLutz/reverseC")
```

## Input
nSNP is the number of SNPs generated from a binomial distribution for n subjects (input n) for a given minor allele frequency (input vector MAF).

For the SNPs Xi, the mediator/ exposure M is generated from a normal distribution with the variance (input varM) and the mean as follows:

E\[M\] = &gamma;<sub>o</sub> + &sum; &gamma;<sub>X</sub>  X<sub>i</sub> 

All of these values are inputted by the user (i.e. the intercept gamma0, and the genetic effect size as a vector gammaX).

The outcome Y is generated from a normal distribution with the variance (input varY) and the mean as follows:

E\[Y\] = &beta;<sub>o</sub> +  &beta;<sub>M</sub> M 

All of these values are inputted by the user (i.e. the intercept beta0 and the effect of the mediator directly on the outcome as betaM).

After the SNPs X, mediator M, and outcome Y are generated, then the reverseMRsim function compares the power and type 1 error rate of the following 3 methods to detect the path from M to Y.

## Example:
Here, we consider 10 SNPs (nSNP=4) with MAF of 0.2. We vary the direct effect of the mediator M on the ouctome Y (i.e. betaM=c(0,0.2,0.3)). This code runs 500 simulations for n subjects with n=1000. 

For 1,000 subjects (n=1000), we generated 10 SNPs (nSNP=10) with a minor allele frequency of 20% (specified by MAF) that have a genetic effect size of 0.4 (specified by gammaX) on the normally distributed mediator and the mediator has an effect size varying from 0, 0.2 to 0.3 (specified by betaM) on the normally distributed outcome. We considered 3 MR approaches: Egger Regression, the Median Weighted Approach, and the Inverse Variance Weighted (IVW) Approach.

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
