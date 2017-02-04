#-----------
# http://www.ebi.ac.uk/pride/ws/archive/#!/project/getProjectSummary
# Retrieve a detailed record of a specific project
getPrideProject <- function(pxd){
	# pxd = "PXD004083"
	# library('httr')
	link <- paste0('http://www.ebi.ac.uk:80/pride/ws/archive/project/',pxd)
	contentPRIDE <- GET(link)
	status <- contentPRIDE$status_code
	if(status == 200){
		# "OK"
		queryContent <- content(contentPRIDE)
		return(queryContent)
	}
	if(status == 401){
		cat("Unauthorized content requested!\n")
	}
	if(status == 403){
		cat("Forbidden content requested!\n")	
	}
	if(status == 404){
		cat("Content requested was not found!\n")	
	}

}