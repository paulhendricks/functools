#' Wrapper for vapply function.
#'
#' Wrapper for \code{\link[base]{vapply}}.
#'
#' @param f A function to be applied.
#' @param x A vector.
#' @param fun_value A (generalized) vector; a template for the return value from f.
#' @param ... Optional arguments to f.
#' @param use_names Logical; if TRUE and if X is character, use X as names for the result unless it had names already. Since this argument follows ... its name cannot be abbreviated.
#' @family functionals
#' @seealso \code{\link[base]{vapply}} for code and documentation.
#' @export
Vapply <- function(f, x, fun_value, ..., use_names = TRUE) {
  return(vapply(X = x, FUN = f, FUN.VALUE = fun_value, ..., USE.NAMES = use_names))
}
