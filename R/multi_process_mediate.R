
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
  #make sure reverseMA is loaded on the nodes
  if(pkgload::is_dev_package("reverseMA")){
    #we're in a dev environment, need to load with load_all
    snow::clusterCall(cl=this.cluster,function(){suppressMessages(library(devtools));suppressMessages(load_all())})
  } else {
    #we're being used from an installed copy of reverseMA load package explicitly
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