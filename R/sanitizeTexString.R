sanitizeTexString <- function(string, 
	strip = getOption('tikzSanitizeCharacters'),
	replacement = getOption('tikzReplacementCharacters')){
		
		  #separate the string into a vector of charaters
		explode <- strsplit(string,'')[[1]]
		
	    # Replace each matching character with its replacement characters
		for(i in 1:length(explode)){
			
			matches <- (explode[i] == strip)
			if(any(matches))
				explode[i] <- paste('{',replacement[which(matches)],'}',sep='')
				
		}
		  # stick the string back together
		return(paste(explode,collapse=''))
}