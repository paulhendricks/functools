#' Wrapper for sapply function.
#'
#' Wrapper for \code{\link[base]{sapply}}.
#'
#' @param f A function to be applied.
#' @param x A vector.
#' @param simplify Logical or character string; should the result be simplified to a vector, matrix or higher dimensional array if possible? For sapply it must be named and not abbreviated. The default value, TRUE, returns a vector or matrix if appropriate, whereas if simplify = "array" the result may be an array of 'rank' (=length(dim(.))) one higher than the result of FUN(X[[i]]).
#' @param use_names Logical; if TRUE and if X is character, use X as names for the result unless it had names already. Since this argument follows ... its name cannot be abbreviated.
#' @param ... Optional arguments to f.
#' @family functionals
#' @seealso \code{\link[base]{sapply}} for code and documentation.
#' @export
Sapply <- function(f, x, ..., simplify = TRUE, use_names = TRUE) {
  return(sapply(X = x, FUN = f, ..., simplify = simplify, USE.NAMES = use_names))
}
