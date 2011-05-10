#' Print tikzDevice output to a file or the screen
#' This function will print the TikZ code contained in an object of class 
#' 'tikz' either to a file or to the screen. 
#'
#' This function should be used with the \code{raw} option to \code{tikz()}. 
#' The default is to simply print the TikZ code to the file originally 
#' specified in the call to \code{tikz()}, reproducing the default behavior.
#'
#' @param x An object of class 'tikz'
#' @param filename The file to output TikZ code to, defaults to the \code{file} 
#'   argument of \code{tikz()}
#' @param raw If \code{TRUE}, print the raw TikZ code to the screen.
#'
#'
#' @return Nothing is returned
#'
#' @author Cameron Bracken \email{cameron.bracken@@gmail.com}
#'
#' @seealso \code{\link{tikz}}
#' @keywords character
#'
#' @examples
#'    # the following is equivalent to tikz(); plot(1); dev.off()
#'  tikz(raw=TRUE,object='p')
#'  plot(1)
#'  dev.off()
#'  print(p)
#'
#'   # This is eqivalent to tikz(console=TRUE); plot(1); dev.off()
#'  tikz(raw=TRUE,object='p')
#'  plot(1)
#'  dev.off()
#'  print(p,raw=TRUE)
#'
#' @export
print.tikz <- function(x, filename = x$filename, raw = FALSE){
  
  if(raw){
    cat(x$lines)
  }else{
    cat('Writing TikZ output to:', filename, '\n')
    cat(x$lines,file = filename)
  }
  
}
