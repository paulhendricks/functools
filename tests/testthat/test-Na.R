library(functools)
context("Testing Na() function")

test_that("Na() returns NA", {
  expect_equal(Na(), NA)
})
