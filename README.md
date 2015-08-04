<!-- README.md is generated from README.Rmd. Please edit that file -->
functools
=========

[![Build Status](https://travis-ci.org/paulhendricks/functools.png?branch=master)](https://travis-ci.org/paulhendricks/functools) [![Build status](https://ci.appveyor.com/api/projects/status/au9ww7v8mhgr59s8/branch/master?svg=true)](https://ci.appveyor.com/project/paulhendricks/functools/branch/master) [![codecov.io](http://codecov.io/github/paulhendricks/functools/coverage.svg?branch=master)](http://codecov.io/github/paulhendricks/functools?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/functools)](http://cran.r-project.org/package=functools) [![Downloads from the RStudio CRAN mirror](http://cranlogs.r-pkg.org/badges/functools)](http://cran.rstudio.com/package=functools) [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)

functools extends functional programming in R. It has four main goals:

-   Add support to the usual higher order functional suspects (`Filter`, `Map`, `Reduce`, etc.) with higher order functions such as `Compose`, `Memoise`, `Partial`, `Reject`, `Andify`, and `Orify`.

-   Provide wrappers around base R functionals such as `lapply` or `apply` so as to create a consistent API.

-   Implement common constants and functions such as `True` or `Identity` for point-free programming.

-   If possible, provide options for easy parallelization and write key pieces in C++ for blazing fast performance.

functools achieves these goals through three main types of function design patterns:

-   Closures (functions that take data and return functions)

-   Functionals (functions that take functions and return data)

-   Function Operators (functions that take functions and return functions)

You can install:

-   the latest released version from CRAN with

    ``` r
    install.packages("functools")
    ```

-   the latest development version from github with

    ``` r
    if (packageVersion("devtools") < 1.6) {
      install.packages("devtools")
    }
    devtools::install_github("paulhendricks/functools")
    ```

If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/paulhendricks/functools/issues).

Additional Support
==================

Compose
-------

``` r
is_not_null <- Compose(`!`, is.null)
is_not_null(TRUE)
is_not_null(FALSE)
is_not_null(2)
is_not_null(NULL)

rmse <- 
  sqrt %O% 
  mean %O% 
  {function(x) x * x} %O% 
  {function(actual, forecast) actual - forecast}

rmse(1:10, 10:1)
```
