<!-- README.md is generated from README.Rmd. Please edit that file -->
functools
=========

[![Build Status](https://travis-ci.org/paulhendricks/functools.png?branch=master)](https://travis-ci.org/paulhendricks/functools)

functools is a utility-belt library for R that adds support to the usual higher order functional suspects (Map, Reduce, Filter, etc.) without extending any core R objects.

functools has three main goals:

-   goal 1

-   goal 2

-   goal 3

functools provides three main types of helper functions:

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

Examples
--------

``` r
library(functools)
1 + 1
#> [1] 2
```
