library(functools)
context("Testing Truthy() function")

test_that("Truthy() returns TRUE if an object is 'true'", {
  expect_equal(Truthy(NULL), FALSE)
  expect_equal(Truthy(NA), FALSE)
  #   expect_equal(Truthy(Truthy), TRUE)
  expect_equal(Truthy(1), FALSE)
  expect_equal(Truthy(0), FALSE)
  expect_equal(Truthy(2.4), FALSE)
  expect_equal(Truthy("hello"), FALSE)
  expect_equal(Truthy(FALSE), FALSE)
  expect_equal(Truthy(TRUE), TRUE)
})
