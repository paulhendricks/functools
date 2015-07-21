<!-- README.md is generated from README.Rmd. Please edit that file -->
functools
=========

[![Build Status](https://travis-ci.org/paulhendricks/functools.png?branch=master)](https://travis-ci.org/paulhendricks/functools)

functools is an R package for extending functional programming in R. It has three main goals:

-   Add support to the usual higher order functional suspects (Map, Reduce, Filter, etc.) without extending any core R objects.

-   Provide blazing fast performance for in-memory data by writing key pieces in C++ and options for parallelization, where possible.

-   Use a consistent API to access different functionals in base R such as `lapply` or `apply`.

functools achieves these goals through three main types of function design patterns:

-   Closures (functions that take data and return functions)

-   Functionals (functions that take functions and return data)

-   Function Operators (functions that take functions and return functions)

You can install the latest development version from github with:

``` r
if (packageVersion("devtools") < 1.6) {
  install.packages("devtools")
}
devtools::install_github("paulhendricks/functools")
```

If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/paulhendricks/functools/issues).

Learning functools
------------------

To get started, read the notes below, then read the intro vignette: `vignette("introduction", package = "functools")`.
