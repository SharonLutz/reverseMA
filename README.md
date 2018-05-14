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

reverseMRsim(nSim=100,plot.pdf=T)
```

# Output
For this example, we get the following matrix of results and corresponding plot.

```

```

