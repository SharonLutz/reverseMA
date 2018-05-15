# reverseC
This package examines the performance of mediation analysis (reverseMA) and Mendelian Randomization (reverseMR) methods in the presence of reverse causality. There are functions to test the performance of each in a hypothetical scenario (reverseMAsim, reverseMRsim) and functions to test the performance of each on a user input data set (reverseMAdata, reverseMRdata).

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

reverseMRsim(n = 1000, nSNP = 3, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.2, 0.2, 0.2), varM = 1, beta0 = 0, 
betaM = c(0, 0.1), varY = 1, nSim = 100, plot.pdf = T, plot.name = "reverseMRsim.pdf", alpha_level = 0.05, SEED = 1)

```

# Output
For this example, we get the following matrix of results and corresponding plot.

```

```

