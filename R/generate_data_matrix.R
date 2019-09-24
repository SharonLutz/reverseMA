generate_data_matrix <- function(
  n=1000,pX=0.2,
  gamma0=0,gammaX=0.1,
  varM=1,varY=1,
  beta0=0,betaX=1,betaM=c(0,0.1,0.2),
  nSim=100, nSimImai=1000, SEED=1){
  
  num_betaM = length(betaM)
  
  mat_total <- matrix(0,nrow=num_betaM,ncol=4)
  colnames(mat_total) <- c("DirectNR","IndirectNR","DirectR","IndirectR")
  
  #generate the data needed to make linear models.
  data_matrix = matrix(list(), nrow=num_betaM, ncol=nSim)
  
  sd_M = sqrt(varM)
  sd_Y = sqrt(varY)
  old_rand_state = NULL
  
  if(exists(".Random.seed",envir = .GlobalEnv) && !is.null(.GlobalEnv[[".Random.seed"]])){
    old_rand_state = .GlobalEnv[[".Random.seed"]]
  }
  
  next_seed = SEED
  
  for(i in 1:nSim){
    
    for(bM.ind in 1:num_betaM){
      set.seed(next_seed)
      
      X = rbinom(n, 2, pX)
      X[X==2]<-1 #dominant model
      M = rnorm(n=n, mean = (gamma0 + gammaX * X), sd=sd_M)
      Y = rnorm(n=n, mean = (beta0 + betaX * X + betaM[[bM.ind]] * M), sd=sd_Y)
      
      data_element = list( X = X,
                           M = M,
                           Y = Y,
                           nSimImai=nSimImai,
                           RAND_STATE = .GlobalEnv[[".Random.seed"]])
      
      next_seed = next_seed + 1
      
      data_matrix[[bM.ind, i]] = data_element
    }
    
  }
  
  if(!is.null(old_rand_state)){
    .GlobalEnv[[".Random.seed"]] = old_rand_state
  }
  
  return(data_matrix)
  
}