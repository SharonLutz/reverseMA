

## reverseC for Mediation Analysis
These functions examines the performance of mediation analysis methods in the presence of reverse causality.

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
?reverseMAsim # For details on this function

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)
```

## Output

<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMAplot.png" width="600">
