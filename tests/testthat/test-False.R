library(functools)
context("Testing False() function")

test_that("False() returns TRUE", {
  expect_equal(False(), FALSE)
})
