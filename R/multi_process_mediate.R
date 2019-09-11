
simulate_and_mediate <- function(data_element){
  
  df = data.frame(X=data_element$X, Y1=data_element$Y, M1=data_element$M, M2=data_element$Y, Y2=data_element$M)

  med.fit = lm("M1~X", data=df)
  out.fit = lm("Y1~X+M1", data=df)
  med.fit.r = lm("M2~X", data=df)
  out.fit.r = lm("Y2~X+M2", data=df)

  set.seed(data_element$SEED)
  
  med.out <- mediation::mediate(med.fit, out.fit, treat = "X",mediator = "M1",sims = data_element$nSimImai)
  med.out.r <- mediation::mediate(med.fit.r, out.fit.r, treat = "X",mediator = "M2",sims = data_element$nSimImai)
  
  summary_obj = summary(med.out)
  summary_obj.r = summary(med.out.r)
  
  result = list(pval_direct = summary_obj$z.avg.p,
                pval_indirect = summary_obj$d.avg.p,
                pval_direct_r = summary_obj.r$z.avg.p,
                pval_indirect_r = summary_obj.r$d.avg.p)
  
  return(result)
}

mediate_parallel.unix <- function(list_of_job_args, nSimImai=1000, num_jobs=getOption("mediate.jobs", parallel::detectCores() - 1)) {
  g_env = globalenv()
  if(exists("nSimImai", envir = g_env)){
    old_nSimImai = g_env[["nSimImai"]]
  } else {
    old_nSimImai = NULL
  }
  
  # TODO: make sure nSimImai value exists for all processes created by mclapply
  g_env[["nSimImai"]]=nSimImai
  options(mc.cores = num_jobs)
  
  result <- pbapply::pblapply(list_of_job_args, simulate_and_mediate, cl = num_jobs)
  
  attr(result, "dim") <- dim(list_of_job_args)
  if(is.null(old_nSimImai)){
    rm("nSimImai", envir=g_env)
  } else {
    g_env[["nSimImai"]] = old_nSimImai
  }
  return(result)
}

mediate_parallel.non_unix <-function(list_of_job_args, nSimImai=1000, num_jobs=getOption("mediate.jobs", parallel::detectCores() - 1)) {
  options(cl.cores = num_jobs)
  snow::setDefaultClusterOptions(type="SOCK")
  this.cluster <- snow::makeCluster(num_jobs)
  on.exit(snow::stopCluster(this.cluster))
  #make sure reverseC is loaded on the nodes
  if(pkgload::is_dev_package("reverseMA")){
    #we're in a dev environment, need to load with load_all
    snow::clusterCall(cl=this.cluster,function(){suppressMessages(library(devtools));suppressMessages(load_all())})
  } else {
    #we're being used from an installed copy of reverseC load package explicitly
    snow::clusterCall(cl=this.cluster,function(){suppressMessages(library(reverseMA))})
  }
  
  snow::clusterExport(cl=this.cluster,c("nSimImai"),envir=environment())
  
  result <- pbapply::pblapply(list_of_job_args, simulate_and_mediate, cl=this.cluster)
  
  dim(result) = dim(list_of_job_args)
  return (result)
}

mediate_parallel <- function(list_of_job_args, nSimImai=1000, num_jobs=getOption("mediate.jobs", parallel::detectCores() - 1)){
  pbapply::pboptions(type="timer", style=1)
  if(.Platform$OS.type == "unix") {
    result <- mediate_parallel.unix(list_of_job_args=list_of_job_args, nSimImai=nSimImai, num_jobs=num_jobs)
  } else {
    result <- mediate_parallel.non_unix(list_of_job_args=list_of_job_args, nSimImai=nSimImai, num_jobs=num_jobs)
  }
  return(result)
}