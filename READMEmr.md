
## reverseC for Mendelian Randomization
This package examines the performance of Mendelian Randomization (MR) methods in the presence of reverse causality.

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization") #you need R v3.4 or higher

devtools::install_github("SharonLutz/reverseC")
```

## Example:
```
library(reverseC)
?reverseMRsim # For details on this function

reverseMRsim(n = 1000, nSNP = 3, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.2, 0.2, 0.2), 
varM = 1, beta0 = 0, betaM = c(0, 0.1,0.2), varY = 1, nSim = 100, plot.pdf = T, 
plot.name = "reverseMRplot.pdf", alpha_level = 0.05, SEED = 1)

```

## Output
For the example, we get the following matrix of results and corresponding plot.
```
[[1]]
             [,1] [,2] [,3]
PMR.EggerNR  0.02 0.03 0.06
PMR.IVWNR    0.07 0.08 0.31
PMR.MedianNR 0.03 0.02 0.09
PMR.EggerR   0.22 0.21 0.20
PMR.IVWR     0.72 0.72 0.89
PMR.MedianR  0.00 0.00 0.00
```
<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMRplot.png" width="600">
