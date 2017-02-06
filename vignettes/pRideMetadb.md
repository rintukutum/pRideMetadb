# About pRideMetadb
A R-package for meta data query of [PRIDE](http://www.ebi.ac.uk/pride/archive/) database. It provides detail status of PRIDE database for R-user. many useful functions to query PRIDE database.

# Examples
    ## getPrideProject function
```{r}
# remove all existing variables from R-workspace
rm(list=ls())
# load httr package
library(httr)
# load pRideMetadb functions
source('./R/pRide-api.R')
source('./R/zzz.R')
source('./R/utils.R')

```