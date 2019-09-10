reverseMA <- function(n=1000,pX=0.2,gamma0=0,gammaX=0.1,varM=1,beta0=0,betaX=1,betaM=c(0,0.1,0.2),varY=1,
                      nSim=100,nSimImai=1000,SEED=1,plot.pdf=T,plot.name="reverseMAsim.pdf",alpha_level=0.05,
                      use_multi_processing=F, num_jobs=1){
  pbapply::pboptions(style=1,type="timer")
  if(use_multi_processing){
    reverseMA.MultiProcess(n=n, pX=pX,gamma0=gamma0, gammaX=gammaX, varM=varM, beta0=beta0, betaX=betaX,
                           betaM=betaM, varY=varY, nSim=nSim, nSimImai=nSimImai, SEED=SEED, plot.pdf=plot.pdf,
                           plot.name=plot.name, alpha_level=alpha_level, 
                           num_jobs=num_jobs)
  } else {
    reverseMA.SingleProcess(n=n, pX=pX,gamma0=gamma0, gammaX=gammaX, varM=varM, beta0=beta0, betaX=betaX,
                            betaM=betaM, varY=varY, nSim=nSim, nSimImai=nSimImai, SEED=SEED, plot.pdf=plot.pdf,
                            plot.name=plot.name, alpha_level=alpha_level)
  }
}
