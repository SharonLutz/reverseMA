# reverseC
This package examines the performance of mediation analysis (reverseMA) and Mendelian Randomization (reverseMR) methods in the presence of reverse causality. 2 functions determine the power and type 1 error rate to detect the indirect and direct path when the mediator and outcome are switched. (reverseMAsim and reverseMRsim) 2 functions implement these methods for user inputted data. (reverseMAdata and reverseMRdata).

# Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization")

devtools::install_github("SharonLutz/reverseC")
```

# Example

```
library(reverseC)
?reverseMRsim # For details on this function

reverseMRsim(n = 1000, nSNP = 3, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.2, 0.2, 0.2), 
varM = 1, beta0 = 0, betaM = c(0, 0.1), varY = 1, nSim = 100, plot.pdf = T, 
plot.name = "reverseMRplot.pdf", alpha_level = 0.05, SEED = 1)

```

# Output
For this example, we get the following matrix of results and corresponding plot.

```
[[1]]
             [,1] [,2]
PMR.EggerNR  0.03 0.04
PMR.IVWNR    0.11 0.09
PMR.MedianNR 0.02 0.04
PMR.EggerR   0.23 0.19
PMR.IVWR     0.66 0.74
PMR.MedianR  0.00 0.00
```
<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMRplot.png" width="600">

