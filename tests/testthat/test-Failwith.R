library(functools)
context("Failwith()")

default_value <- 0

new_function <- function(x) {
  stop("Error!")
  return(x)
}

test_that("Failwith() returns a new function", {
  expect_is(new_function, "function")
})

new_function_with_default <- Failwith(default_value, new_function, silent = TRUE)
test_that("new_function() returns a default value", {
  expect_equal(new_function_with_default("a"), default_value)
  expect_equal(new_function_with_default(1), default_value)
  expect_equal(new_function_with_default(1.2), default_value)
  expect_equal(new_function_with_default(TRUE), default_value)
  expect_equal(new_function_with_default(NA), default_value)
  expect_equal(new_function_with_default(NULL), default_value)
})

new_function_with_default <- Failwith(default_value, new_function, silent = FALSE)
test_that("new_function_with_default() gives appropriate silent calls", {
#   expect_error(new_function_with_default("a"), ".+")

})
