#!/usr/bin/env Rscript
suppressMessages(require(getopt))
suppressMessages(require(tikzDevice))

#Column 3: Argument mask of the flag. An integer. Possible values: 
# 0=no argument, 1=required argument, 2=optional argument. 
optspec <- matrix(c('output-prefix', 'p', 2, "character"),ncol=4,byrow=T)

#parse the command line arguments
opt <- getopt(optspec)

prefix <- ifelse(!is.null(opt$"output-prefix"),opt$"output-prefix",'.')

this.testfile <- 'testUTF8.tex'

setopts <- function(){
		# This option mut be set for StanAlone mode to work correctly
	options( tikzLatexPackages = getOption('tikzXelatexPackages'))
	
}
x <- function(){
	
  n <- 10
  chars <- matrix(intToUtf8(seq(161,,1,10*n),multiple=T),n)

  plot(1:n,type='n',xlab='',ylab='',axes=F, main="UTF-8 Characters")
  for(i in 1:n)
    for(j in 1:n)
      text(i,j,chars[i,j])

}

setopts()

cat("  Running UTF-8 Test ... ")
t <- system.time(
{
	tikz(file.path(prefix,this.testfile),standAlone=T,width=5,height=5)
	x()
	dev.off()
})
cat("Done, took ",t[['elapsed']],"seconds.\n")

# Compile the resulting TeX file.
cat("Compiling UTF-8 Test ... ")
t <- system.time(
{
	silence <- system( paste('xelatex -output-directory', 
		prefix, this.testfile), intern = T)
})
cat("Done, took ",t[['elapsed']],"seconds.\n")
success <- file.copy(file.path(prefix,
				paste(strsplit(this.testfile,'\\.tex'),'pdf',sep='.')),'.',
				overwrite = T)
