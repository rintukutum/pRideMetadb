# pRideMetadb
A R-package for meta data query of [PRIDE](http://www.ebi.ac.uk/pride/archive/) database.

## Introduction
Introduction to this R-package is available in [vignettes](../vignettes/pRideMetadb.md). 

## TODO list
- Create S3 functions using PRIDE API
- convert S3 to S4 Class to Query PRIDE database
    + [Project](http://www.ebi.ac.uk/pride/ws/archive/#!/project)
    + [Assay](http://www.ebi.ac.uk/pride/ws/archive/#!/assay)
    + [File](http://www.ebi.ac.uk/pride/ws/archive/#!/file)
    + [Protein](http://www.ebi.ac.uk/pride/ws/archive/#!/protein)
    + [Peptide](http://www.ebi.ac.uk/pride/ws/archive/#!/peptide)
- Create a SQLite3 database

## DONE
- S3 functions available
    +  [getPrideProject](./R/pRide-api.R)
    +  [getProjectList](./R/pRide-api.R)
    +  [getProjectCount](./R/pRide-api.R)
    +  [getAllPrideProject](./R/pRide-api.R)
