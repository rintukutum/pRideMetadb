pleural2single <- function(pleural){
	if(length(pleural) != 0){
		single <- paste(unlist(pleural), collapse=';')
	}else{
		single <- NA
	}
	return(single)	
}
bindKeyWords<- function(keywords){
	return(gsub(', ',';',keywords))
}
formatLabHeads <- function(labHeads){
	labHeadName <- paste(labHeads[[1]][c('title','firstName', 'lastName')], collapse = ' ')
	return(labHeadName)
}
formatSubmitter <- function(submitter){
	submitterName <- paste(submitter[c('title','firstName', 'lastName')], collapse = ' ')
	return(submitterName)
}
null2na <- function(x){
	if(is.null(x)){
		return(NA)
	}else{
		return(x)
	}
}