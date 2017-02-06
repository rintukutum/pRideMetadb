#-----------
# http://www.ebi.ac.uk/pride/ws/archive/#!/project/getProjectSummary
# Retrieve a detailed record of a specific project
getPrideProject <- function(pxd){
	# pxd = "PXD004083"
	# library('httr')
	link <- paste0('http://www.ebi.ac.uk:80/pride/ws/archive/project/',pxd)
	contentPRIDE <- GET(link)
	queryContent <- connectionStatus(contentPRIDE)
	return(queryContent)
}

getProjectList <- function(term = NULL,	# string
						   resultsPerPage = 100,	# integer
						   page = 0,	# integer
						   sort = NULL,	# string "score", "publication_date",
						   				# id, project_title
						   order = TRUE,	# string; sorting order asc (ascending) or desc(descending)
						   taxonID = NULL,	# array[string]; NCBI taxon ID, 9606 for human
						   ptmsFilter = NULL,	# array[string]; PTM annotation phosphorylation
						   tissueFilter = NULL,	# array[string]; tissue annotation, brain
						   diseaseFilter = NULL,	# array[string]; disease annotation
						   titleFilter = NULL,	# array[string]; the title for keywords, "stress"
						   instrumentFilter = NULL, # array[string]; instrument names or keywords 
						   experimentTypeFilter = NULL,	# array[string]; experiment type, shotgun
						   quantificationFilter = NULL,	# array[string]; quantification annotation, "label-free"
						   projectTagFilter = NULL	# array[string]; project tags, "Biomedical"
						   ){
	# term
	if(is.null(term)){
		term <- ""
	}

	if(isTRUE(order)){
		# descending order
		order <- "desc"
	}else{
		# ascending order
		order <- "asc"
	}
	if(resultsPerPage > 500){
		stop(cat(paste0('******************************************************************\n',
						'\tQuery of more than 500 results per page not allowed.\n',
						'\tPlease proide less than or equal to 500 results.\n',
						'******************************************************************\n')))
	}
	showResultsPerPage <- abs(as.integer(resultsPerPage))
	# base url
	# "http://www.ebi.ac.uk:80/pride/ws/archive/project/list?show=100&page=0&order=desc"
	link <- "http://www.ebi.ac.uk:80/pride/ws/archive/project/list?"
	queryLink <- paste0(link,
						'show=', resultsPerPage,
						'&',
						'page=', page,
						'&',
						'order=', order)
	projectList <- connectionStatus(GET(queryLink))[[1]]
	return(projectList)
}
#------------
# Projects available at PRIDE database
getProjectCount <- function(query = NULL,
							speciesFilter = NULL,
							ptmsFilter = NULL,
							tissueFilter = NULL,
							diseaseFilter = NULL,
							titleFilter = NULL,
							instrumentFilter = NULL,
							experimentTypeFilter = NULL,
							quantificationFilter = NULL,
							projectTagFilter = NULL){
	# base url 
	# http://www.ebi.ac.uk:80/pride/ws/archive/project/count
	baseURL <- "http://www.ebi.ac.uk:80/pride/ws/archive/project/count"
	count <- connectionStatus(GET(baseURL))
	return(count)
}
#------------
# Get all PRIDE projects with few informations
# This doesn't  give complete information per 
# project 
#------------
getAllPrideProject <- function(resultsPerPage = 100){
	count <- getProjectCount()
	nIter <- seq(1, count, resultsPerPage)[-1]
	#-----
	# pages to traverse
	nPages <- length(nIter)
	projectPerPage <- list()
	# page starts from 0
	for(i in 0:nPages){
		projectList <- getProjectList(resultsPerPage = resultsPerPage,
									  page = i)
		cat(paste0('Page ', i, '\n'))
		# as i = 0
		# index should be 1 = i + 1
		projectPerPage[[i+1]] <- projectList
		cat(paste0('Number of results = ',length(projectList), '\n'))
		#-----
		# sleep for few seconds
		Sys.sleep(0.2)
	}
	allProjects <- c()
	for(i in 1:length(projectPerPage)){
		allProjects <- append(allProjects, projectPerPage[[i]])
	}
	return(allProjects)
}
#-----------
# Need to add a checker 
# for any new data is added to 
# PRIDE database
checkNewPrideEntry <- function(){
	count <- getProjectCount()

}
