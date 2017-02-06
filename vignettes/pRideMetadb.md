# About pRideMetadb
A R-package for meta data query of [PRIDE](http://www.ebi.ac.uk/pride/archive/) database. It provides detail status of PRIDE database for R-user. many useful functions to query PRIDE database.

# Examples
## getPrideProject function

Load neccessary library and functions. [`pRide-api.R`](../R/pRide-api.R) contains all the major functions to retrieve required informations from PRIDE database. Additional helper functions are available in [`utils.R`](../R/utils.R) and [`zzz.R`](../R/zzz.R).
```{r}
# remove all existing variables from R-workspace
rm(list=ls())
# load httr package
library(httr)
# load pRideMetadb functions
source('./R/pRide-api.R')
source('./R/utils.R')
source('./R/zzz.R')
```