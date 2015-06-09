library(functools)
context("Testing False() function")

test_that("False() returns FALSE", {
  expect_equal(False(), FALSE)
})
