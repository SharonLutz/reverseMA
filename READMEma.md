

## reverseC for Mediation Analysis
This package examines the performance of mediation analysis methods in the presence of reverse causality.

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization") #you need R v3.4 or higher

devtools::install_github("SharonLutz/reverseC")
```

## Example:
```
?reverseMAsim # For details on this function

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.1, varM = 1, beta0 = 0, betaX = 1, 
betaM = c(0, 0.1, 0.2), varY = 1, nSim = 100, nSimImai = 1000, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)
```

## Output
For the example, we get the following matrix of results and corresponding plot.

```
[[1]]
     DirectNR IndirectNR DirectR IndirectR
[1,]        1       0.01    0.38      0.06
[2,]        1       0.29    0.05      0.79
[3,]        1       0.38    0.40      1.00
```
<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMAplot.png" width="600">
