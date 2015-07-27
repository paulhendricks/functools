#' Partial apply a function, filling in some arguments.
#'
#' Wrapper for \code{\link[pryr]{partial}}.
#'
#' @param ... Arguments to be passed to \code{\link[pryr]{partial}}.
#' @family function operators
#' @seealso \code{\link[pryr]{partial}} for code and documentation.
#' @export
Partial <- function(...) {
  if (!requireNamespace("pryr", quietly = TRUE)) {
    stop("pryr needed for this function to work. Please install it.",
         call. = FALSE)
  }
  return(pryr::partial(...))
}

