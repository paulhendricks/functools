library(functools)
context("Truthy()")

test_that("Truthy() returns TRUE if an object is 'true'", {
  expect_equal(Truthy(NULL), FALSE)
  expect_equal(Truthy(NA), FALSE)
  expect_warning(Truthy(Truthy), "is.na() applied to non-(list or vector) of type 'closure'", fixed = TRUE)
  expect_equal(Truthy(1), FALSE)
  expect_equal(Truthy(0), FALSE)
  expect_equal(Truthy(2.4), FALSE)
  expect_equal(Truthy("hello"), FALSE)
  expect_equal(Truthy(FALSE), FALSE)
  expect_equal(Truthy(TRUE), TRUE)
})
