#' Compose multiple functions
#'
#' In infix and prefix forms.
#'
#' @param ... n functions to apply in order from right to left
#' @param f,g two functions to compose for the infix form
#'
#' @export
#' @examples
#' not_null <- `!` %O% is.null
#' not_null(4)
#' not_null(NULL)
#'
#' add1 <- function(x) x + 1
#' Compose(add1,add1)(8)
Compose <- function(...) {
  fs <- lapply(list(...), match.fun)
  n <- length(fs)

  last <- fs[[n]]
  rest <- fs[-n]

  function(...) {
    out <- last(...)
    for (f in rev(rest)) {
      out <- f(out)
    }
    out
  }
}

#' @rdname Compose
#' @export
#' @usage f \%O\% g
'%O%' <- function(f, g) {
  f <- match.fun(f)
  g <- match.fun(g)
  function(...) {
    f(g(...))
  }
}
