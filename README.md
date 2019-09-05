# reverseMA
Examines the indirect and direct path in mediation analysis when the mediator and outcome are either correctly or incorrectly specified

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation") # the mediation package is needed

devtools::install_github("SharonLutz/reverseMA")
```

## Test
```
library(reverseMA)
?reverseMA

reverseMA(n=100,nSim=10)
```



## Example:
```
library(reverseMA)
?reverseMA # For details on this function

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)

 reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0, varM = 1, beta0 = 0, betaX = 0.2, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplotDirect.pdf", alpha_level = 0.05)

 reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0.2, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplotBoth.pdf", alpha_level = 0.05)
```

## Output

<img src="plots/reverseMAplot.png" width="600">
