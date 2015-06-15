library(functools)
context("False()")

test_that("False() returns FALSE", {
  expect_equal(False(), FALSE)
})
