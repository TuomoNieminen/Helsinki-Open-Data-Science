table0 <- function(data = NULL, ...) {
  eval(substitute(table(...)), 
       envir = data, enclos = parent.frame())
}