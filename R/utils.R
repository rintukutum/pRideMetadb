content2df <- function(content.pride){
	df.pride <- data.frame(accession= content.pride$accession,
	species = pleural2single(content.pride$species),
	tissues = pleural2single(content.pride$tissues),
	title = content.pride$title,
	otherOmicsLink = content.pride$otherOmicsLink,
	numProteins = content.pride$numProteins,
	numPeptides = content.pride$numPeptides,
	numSpectra = content.pride$numSpectra,
	numUniquePeptides = content.pride$numUniquePeptides,
	numIdentifiedSpectra = content.pride$numIdentifiedSpectra,
	postTranslationalModNames = pleural2single(content.pride$ptmNames),
	#------
	publicationDate = content.pride$publicationDate,
	submissionType = content.pride$submissionType,
	numAssays = content.pride$numAssays,
	instrumentNames = pleural2single(content.pride$instrumentNames),
	projectTags = pleural2single(content.pride$projectTags),
	doi = null2na(content.pride$doi),
	#------
	# submitter details
	submitterName = formatSubmitter(content.pride$submitter),
	submitterEmail = content.pride$submitter$email,
	submitterAffiliation = content.pride$submitter$affiliation,
	submissionDate = content.pride$submissionDate,
	#------
	# lab head details
	labHeadName = formatLabHeads(content.pride$labHeads),
	labHeadEmail = content.pride$labHeads[[1]]$email,
	labHeadAffiliation = content.pride$labHeads[[1]]$affiliation,
	#------
	# experimental details
	reanalysis = null2na(content.pride$reanalysis),
	experimentTypes = pleural2single(content.pride$experimentTypes),
	quantificationMethods = pleural2single(content.pride$quantificationMethods),
	keywords = bindKeyWords(content.pride$keywords),
	sampleProcessingProtocol = content.pride$sampleProcessingProtocol,
	dataProcessingProtocol = content.pride$dataProcessingProtocol,
	#------
	# project descriptions
	projectDescription = content.pride$projectDescription,
	referencesDesc = content.pride$references[[1]]$desc,
	referencesIDs = pleural2single(content.pride$references[[1]][2]),
	stringsAsFactors = FALSE
	)
	return(df.pride)
}