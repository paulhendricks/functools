library(functools)
context("Testing Na() function")

test_that("Na() returns TRUE", {
  expect_equal(Na(), NA)
})
