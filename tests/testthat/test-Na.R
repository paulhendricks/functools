library(functools)
context("Na()")

test_that("Na() returns NA", {
  expect_equal(Na(), NA)
})
